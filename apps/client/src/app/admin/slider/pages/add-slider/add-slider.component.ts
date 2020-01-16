
import { CategoryService, Movies } from './../../../../core/services/category.service';
import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NzMessageService } from 'ng-zorro-antd';
import { Router, ActivatedRoute } from '@angular/router';
import * as _ from 'lodash';
import { FileModel } from 'apps/client/src/app/core/models/FileModel';
import { Observable } from 'rxjs';

@Component({
  selector: 'll-add-slider',
  templateUrl: './add-slider.component.html',
  styleUrls: ['./add-slider.component.scss']
})
export class AddSliderComponent implements OnInit {
  @ViewChild('inputFile', { static: false }) inputFile: ElementRef;
  validateForm: FormGroup;
  previewImage: string | undefined = '';
  listFirm$: Observable<Movies[]>;
  detailFirm$: Observable<any>;
  previewVisible = false;
  fileBase64 = '';
  stateAdd = false;
  imgURLPreview: any;
  currentValue = 0;
  constructor(private categoryService: CategoryService,
    private fb: FormBuilder,
    private message: NzMessageService,
    private router: Router,
    private route: ActivatedRoute) {
  }

  ngOnInit() {
    this.validateForm = this.fb.group({
      moveId: ['', [Validators.required]],
      imageBase64: ['']
    });
    if (Number(this.route.snapshot.params['id']) !== 0) {
      this.detailFirm$ = this.categoryService.getDetailMoviesById(Number(this.route.snapshot.params['id']))
      this.stateAdd = false;
      this.currentValue = Number(this.route.snapshot.params['id'])
    } else {
      this.listFirm$ = this.categoryService.getListMovieNoslider({ 'offset': 0, 'limit': 100 });
      this.stateAdd = true;
    }
    console.log(this.stateAdd);
  }
  openFileChooser() {
    setTimeout(() => {
      this.inputFile.nativeElement.click();
    });
  }

  onFileSelected(inputFileChangeEvent) {
    this.readFile(inputFileChangeEvent, (file: any, fileBase64: any, fileName: string, fileSize: number, fileType: string) => {
      const abc = new FileModel(file, fileBase64, fileName, fileSize, fileType);
      this.fileBase64 = abc.fileBase64.replace(/^data\:([^\;]+)\;base64,/gmi, '');
      console.log(this.fileBase64)
      this.inputFile.nativeElement.value = '';
    });
  }

  submitForm(value: any): void {
    // tslint:disable-next-line: forin
    for (const key in this.validateForm.controls) {
      this.validateForm.controls[key].markAsDirty();
      this.validateForm.controls[key].updateValueAndValidity();
    }
    value.imageBase64 = this.fileBase64;
    if (this.fileBase64 === null || this.fileBase64 === '') {
      this.message.create('error', 'Thiếu ảnh');
      return;
    }
    if (Number(this.route.snapshot.params['id']) !== 0) {
      console.log(value)
      value.moveId = this.route.snapshot.params['id'];
      this.categoryService.updateSlider(value).subscribe((res: any) => {
        if (res && res.result === 200) {
          this.message.create('success', 'Cập nhật thành công');
          this.router.navigate(['/danh-sach-slider']);
        } else {
          this.message.create('error', 'Xảy ra lỗi: ' + res.mess);
        }
      })
    } else {
      console.log(value);
      this.categoryService.createSlider(value).subscribe((response: any) => {
        console.log(response);
        if (response && response.result === 200 && response.obj) {
          this.message.create('success', 'Thành công');
          this.router.navigate(['/danh-sach-slider']);
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

  readFile(inputFileChangeEvent: any, onRead: (file: any, fileBase64: any, fileName: string, fileSize: number, fileType: string) => void) {
    if (!_.isEmpty(inputFileChangeEvent.target.files)) {
      for (const file of inputFileChangeEvent.target.files) {
        const reader = new FileReader();
        reader.onload = (loadEvent) => {
          this.imgURLPreview = reader.result;
          onRead(file, loadEvent.target['result'], file.name, file.size, file.type);
        };
        reader.readAsDataURL(file);
      }
    }
  }
}
