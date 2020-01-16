import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Observable } from 'rxjs';
import { CategoryService, Movies } from '../../../../core/services/category.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UploadFile, NzMessageService } from 'ng-zorro-antd';
import * as _ from 'lodash';
import { Router, ActivatedRoute } from '@angular/router';
import { FileModel } from 'apps/client/src/app/core/models/FileModel';

@Component({
  selector: 'll-add-schedule',
  templateUrl: './add-schedule.component.html',
  styleUrls: ['./add-schedule.component.scss']
})
export class AddScheduleComponent implements OnInit {
  @ViewChild('inputFile', { static: false }) inputFile: ElementRef;
  validateForm: FormGroup;
  previewImage: string | undefined = '';
  previewVisible = false;
  listFirm$: Observable<Movies[]>;
  fileBase64 = '';
  styleDate = {
    width: '100%',
    maxWidth: '100%'
  }
  currentValue = '1';
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
      movieId: ['', [Validators.required]],
      roomId: ['', [Validators.required]],
      startTime: ['', [Validators.required]],
    });
    this.listFirm$ = this.categoryService.getListMoviesAdmin();
    if (this.route.snapshot.params['id'] !== 0) {
      this.categoryService.getScheduleById(Number(this.route.snapshot.params['id'])).subscribe((response: any) => {
        if (response) {
          console.log(response);
          this.validateForm.patchValue(response);
          this.selectedValue = response.roomId + '';
          this.currentValue = response.movieId;
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
    value.startTime = new Date(value.startTime).getTime();
    if (Number(this.route.snapshot.params['id']) !== 0) {
      console.log(value)
      // updateMovie
      this.categoryService.updateSchedule(value).subscribe((res: any) => {
        if (res && res.result === 200 && res.obj) {
          this.message.create('success', 'Cập nhật thành công');
          this.router.navigate(['/danh-sach-lich-chieu']);
        } else {
          this.message.create('error', 'Xảy ra lỗi: ' + res.mess);
        }
      })
    } else {
      this.categoryService.createSchedule(value).subscribe((response: any) => {
        console.log(response);
        if (response && response.result === 200 && response.obj) {
          this.message.create('success', 'Thành công');
          this.router.navigate(['/danh-sach-lich-chieu']);
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

  // handlePreview = (file: UploadFile) => {
  //   console.log(file);
  //   this.previewImage = file.url || file.thumbUrl;
  //   this.previewVisible = true;
  // };
}
