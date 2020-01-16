import { Schedule } from './../../../../core/services/category.service';
import { Component, OnInit } from '@angular/core';
import { Observable, BehaviorSubject } from 'rxjs';
import { CategoryService, Movies } from '../../../../core/services/category.service';
import { NzModalService, NzMessageService } from 'ng-zorro-antd';
import { switchMapTo } from 'rxjs/operators';

@Component({
  selector: 'll-list-schedule',
  templateUrl: './list-schedule.component.html',
  styleUrls: ['./list-schedule.component.scss']
})
export class ListScheduleComponent implements OnInit {
  schedule$: Observable<Schedule[]>;
  event$ = new BehaviorSubject(true);
  constructor(private categoryService: CategoryService,
    private modalService: NzModalService,
    private message: NzMessageService) {}

  ngOnInit() {
    this.schedule$ = this.event$.pipe(
      switchMapTo(this.categoryService.getListSchedule({"offset": 0, "limit": 1000}))
    );
  }

  onDelete(id: number): void {
    console.log(id);
    this.modalService.confirm({
      nzTitle: 'Bạn có chắc chắn muốn xóa lịch này?',
      nzContent: '<b style="color: red;">Some descriptions</b>',
      nzOkText: 'Yes',
      nzOkType: 'danger',
      nzOnOk: () => {
        this.categoryService.deleteSchedule(id).subscribe((res: any) => {
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
