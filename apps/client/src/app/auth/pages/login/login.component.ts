import { CategoryService } from './../../../core/services/category.service';
import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormControl, ValidationErrors } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NzMessageService } from 'ng-zorro-antd/message';
import { finalize, first } from 'rxjs/operators';
import { AuthService } from '../../services/auth.service';
import { Observable, Observer } from 'rxjs';
import { UserService } from '../../../core/services/user.service';
import { CredentialsService } from '../../services/credentials.service';
import { NzModalService } from 'ng-zorro-antd';

@Component({
  selector: 'll-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  isVisibleLogin = false;
  isVisibleDescription = false;
  isVisibleRegister = false;
  visibleChitiet = false;
  currentAccount: any;
  listVe: any = [];
  nameCurrent = '';
  loginForm: FormGroup;
  validateForm: FormGroup;
  // isAuthenticated$: Observable<Carousels[]>;
  isAuthenticated$ = this.auth.isAuthenticated$;
  submited = false;
  loading = false;
  constructor(private fb: FormBuilder,
    private auth: AuthService,
    private userService: UserService,
    private router: Router,
    private credentialsService: CredentialsService,
    private categoryServce: CategoryService,
    private activatedRoute: ActivatedRoute,
    private message: NzMessageService,
    private modalService: NzModalService) {

    this.validateForm = this.fb.group({
      name: ['', [Validators.required]],
      phone: ['', [Validators.required]],
      email: ['', [Validators.email, Validators.required]],
      password: ['', [Validators.required]],
      confirm: ['', [this.confirmValidator]],
    });
  }
  ngOnInit(): void {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });
    this.nameCurrent = this.credentialsService.username;
    this.userService.userInfoChange.subscribe((resp: any) => {
      if (resp) {
        this.nameCurrent = resp.name;
      }
    });
    this.categoryServce.isShowLogin.subscribe(res => {
      this.isVisibleLogin = true;
      this.loginForm.reset();
      Object.keys(this.loginForm.controls).forEach(element => {
        this.loginForm.controls[element].markAsPristine();
        this.loginForm.controls[element].updateValueAndValidity();
      });
    })
    this.auth.isAuthenticated$.pipe(first()).subscribe(isAuthenticated => {
      if (!isAuthenticated) {
        this.nameCurrent = '';
      }
    });
    this.currentAccount = {}
  }

  validateConfirmPassword(): void {
    setTimeout(() => this.validateForm.controls.confirm.updateValueAndValidity());
  }


  close(): void {
    this.visibleChitiet = false;
  }
  confirmValidator = (control: FormControl): { [s: string]: boolean } => {
    if (!control.value) {
      return { error: true, required: true };
    } else if (control.value !== this.validateForm.controls.password.value) {
      return { confirm: true, error: true };
    }
    return {};
  };
  showLoginform(): void {
    this.isVisibleLogin = true;
  }
  showModalChiTiet(): void {
    this.currentAccount = this.credentialsService.credentials;
    console.log(this.currentAccount);
    if(this.listVe && this.listVe.length === 0) {
      this.categoryServce.userGetListTicket().subscribe((res: any) => {
        if(res) {
          this.listVe = res;
          console.log(res);
          this.visibleChitiet = true;
        }
      })
    } else {
      this.visibleChitiet = true;
    }

  }
  showRegisterForm(): void {
    this.isVisibleRegister = true;
  }
  handleCancelLogin(): void {
    this.isVisibleLogin = false;
  }
  register(): void {
    const { value, valid } = this.validateForm;
    // tslint:disable-next-line: forin
    for (const key in this.validateForm.controls) {
      this.validateForm.controls[key].markAsDirty();
      this.validateForm.controls[key].updateValueAndValidity();
    }
    console.log(value)
    if (valid) {
      this.userService.registerUser(value).subscribe((response: any) => {
        if (response && response.result === 200) {
          this.validateForm.reset();
          // tslint:disable-next-line: forin
          for (const key in this.validateForm.controls) {
            this.validateForm.controls[key].markAsPristine();
            this.validateForm.controls[key].updateValueAndValidity();
          }
          this.isVisibleRegister = false;
          this.message.create('success', 'Đăng ký thành công!');
        } else {
          this.message.create('error', response.mess);
        }
      });
    }

  }
  cancelRegister(): void {
    this.isVisibleRegister = false;
    this.validateForm.reset();
    // tslint:disable-next-line: forin
    for (const key in this.validateForm.controls) {
      this.validateForm.controls[key].markAsPristine();
      this.validateForm.controls[key].updateValueAndValidity();
    }
  }

  login() {
    const { value, valid } = this.loginForm;
    this.submited = true;
    if (valid) {
      const returnUrl =
        this.activatedRoute.snapshot.queryParamMap.get('returnUrl') ||
        '/danh-sach-slider';
      this.loading = true;
      this.auth
        .login(value)
        .pipe(finalize(() => (this.loading = false)))
        .subscribe({
          next: v => {
            console.log(v)
            this.userService.getCurrentUser().subscribe((response: any) => {
              console.log(response)
              this.message.create('success', 'Đăng nhập thành công!');
              this.isVisibleLogin = false;
              if (response && response.role === 1) {
                console.log('OK')
                this.router.navigate(['/danh-sach-slider'], { replaceUrl: true });
              } else {
                // this.router.navigateByUrl('/');
              }
            });
          },
          error: e => {
            this.message.create('error', 'Đăng nhập thất bại!');
          }
        });
    }
  }
  get emailCtrl() {
    return this.loginForm.get('email');
  }
  get passwordCtrl() {
    return this.loginForm.get('password');
  }

  getControlValidateStatus(control: string) {
    if (!(this.submited || this.loginForm.get(control).touched)) {
      return null;
    }
    return this.loginForm.get(control).valid ? 'success' : 'error';
  }
  logout(): void {
    this.auth.logout();
    this.credentialsService.setCredentials();
    this.nameCurrent = '';
    console.log('OK')
  }
}
