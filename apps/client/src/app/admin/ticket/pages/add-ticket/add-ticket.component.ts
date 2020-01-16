import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Observable } from 'rxjs';
import { CategoryService, Movies } from '../../../../core/services/category.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UploadFile, NzMessageService } from 'ng-zorro-antd';
import * as _ from 'lodash';
import { Router, ActivatedRoute } from '@angular/router';
import { FileModel } from 'apps/client/src/app/core/models/FileModel';

@Component({
  selector: 'll-add-ticket',
  templateUrl: './add-ticket.component.html',
  styleUrls: ['./add-ticket.component.scss']
})
export class AddTicketComponent implements OnInit {
  @ViewChild('inputFile', { static: false }) inputFile: ElementRef;
  validateForm: FormGroup;
  previewImage: string | undefined = '';
  previewVisible = false;
  fileBase64 = '';
  styleDate = {
    width: '100%',
    maxWidth: '100%'
  }

  selectedValue = '1';
  imgURLPreview: any;

  constructor(private categoryService: CategoryService,
    private fb: FormBuilder,
    private message: NzMessageService,
    private router: Router,
    private route: ActivatedRoute) {
  }

  ngOnInit() {
    this.validateForm = this.fb.group({
      id: [''],
      name: ['', [Validators.required]],
      categoryId: ['', [Validators.required]],
      language: ['', [Validators.required]],
      duration: ['', [Validators.required]],
      directors: ['', [Validators.required]],
      cast: ['', [Validators.required]],
      nation: ['', [Validators.required]],
      urlTrailler: [''],
      urlFull: [''],
      age: ['', [Validators.required]],
      about: ['', [Validators.required]],
      releaseDate: ['', [Validators.required]],
      thumbImageStringBase64: ['']
    });
    if (this.route.snapshot.params['id'] !== 0) {
      this.categoryService.getDetailMoviesById(Number(this.route.snapshot.params['id'])).subscribe((response: any) => {
        if (response) {
          console.log(response);
          this.validateForm.patchValue(response);
          this.selectedValue = response.categoryId + '';
        }
      })
    }
    // getDetailMoviesById
  }

  openFileChooser() {
    setTimeout(() => {
      this.inputFile.nativeElement.click();
    });
  }


  submitForm(value: any): void {
    // tslint:disable-next-line: forin
    for (const key in this.validateForm.controls) {
      this.validateForm.controls[key].markAsDirty();
      this.validateForm.controls[key].updateValueAndValidity();
    }
    value.thumbImageStringBase64 = this.fileBase64;
    value.releaseDate = new Date(value.releaseDate).getTime();
    if (Number(this.route.snapshot.params['id']) !== 0) {
      console.log(value)
      // updateMovie
      this.categoryService.updateMovie(value).subscribe((res: any) => {
        if (res && res.result === 200 && res.obj) {
          this.message.create('success', 'Cập nhật công');
          this.router.navigate(['/danh-sach-ve']);
        } else {
          this.message.create('error', 'Xảy ra lỗi: ' + res.mess);
        }
      })
    } else {
      if (this.fileBase64 === null || this.fileBase64 === '') {
        this.message.create('error', 'Thiếu ảnh');
        return;
      }
      this.categoryService.createMovie(value).subscribe((response: any) => {
        console.log(response);
        if (response && response.result === 200 && response.obj) {
          this.message.create('success', 'Thành công');
          this.router.navigate(['/danh-sach-ve']);
        } else {
          this.message.create('error', 'Xảy ra lỗi: ' + response.mess);
        }
      })
    }
  }


  onOk(result: Date): void {
    console.log('onOk', result.getTime());
  }

  resetForm(e: MouseEvent): void {
    e.preventDefault();
    this.validateForm.reset();
    // tslint:disable-next-line: forin
    for (const key in this.validateForm.controls) {
      this.validateForm.controls[key].markAsPristine();
      this.validateForm.controls[key].updateValueAndValidity();
    }
  }

}
