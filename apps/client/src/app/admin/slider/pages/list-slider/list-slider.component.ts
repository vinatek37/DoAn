import { NzModalService, NzMessageService } from 'ng-zorro-antd';
import { CategoryService, Carousels } from './../../../../core/services/category.service';
import { Component, OnInit } from '@angular/core';
import { Observable, BehaviorSubject } from 'rxjs';
import { switchMapTo } from 'rxjs/operators';

@Component({
  selector: 'll-list-slider',
  templateUrl: './list-slider.component.html',
  styleUrls: ['./list-slider.component.scss']
})
export class ListSliderComponent implements OnInit {

  carousels$: Observable<Carousels[]>;
  event$ = new BehaviorSubject(true);
  constructor(private categoryService: CategoryService,
    private modalService: NzModalService,
    private message: NzMessageService) {}

  ngOnInit() {

    this.carousels$ = this.event$.pipe(
      switchMapTo(this.categoryService.getCarousels())
    );
  }
  onDelete(id: number): void {
    console.log(id);
    this.modalService.confirm({
      nzTitle: 'Bạn có chắc chắn muốn xóa phim này?',
      nzContent: '<b style="color: red;">Some descriptions</b>',
      nzOkText: 'Yes',
      nzOkType: 'danger',
      nzOnOk: () => {
        this.categoryService.deleteSlider(id).subscribe((res: any) => {
          console.log(res);
          if(res && res.result === 200) {
            this.message.create('success', 'Thành công');
            this.refetchData();
          } else {
            this.message.create('error', 'Thất bại');
          }
        })
      },
      nzCancelText: 'No',
      nzOnCancel: () => console.log('Cancel')
    });
  }
  refetchData() {
    this.event$.next(true);
  }
}
