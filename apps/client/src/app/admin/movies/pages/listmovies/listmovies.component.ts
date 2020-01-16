import { Component, OnInit } from '@angular/core';
import { Observable, BehaviorSubject } from 'rxjs';
import { CategoryService, Movies } from '../../../../core/services/category.service';
import { NzModalService, NzMessageService } from 'ng-zorro-antd';
import { switchMapTo } from 'rxjs/operators';

@Component({
  selector: 'll-listmovies',
  templateUrl: './listmovies.component.html',
  styleUrls: ['./listmovies.component.scss']
})
export class ListMoviesComponent implements OnInit {
  movies$: Observable<Movies[]>;
  event$ = new BehaviorSubject(true);
  constructor(private categoryService: CategoryService,
    private modalService: NzModalService,
    private message: NzMessageService) {}

  ngOnInit() {
    this.movies$ = this.event$.pipe(
      switchMapTo(this.categoryService.getListMoviesAdmin())
    );
  }

  onDelete(id: number): void {
    console.log(id);
    this.modalService.confirm({
      nzTitle: 'Bạn có chắc chắn muốn xóa phim này?',
      nzContent: '<b style="color: red;">Some descriptions</b>',
      nzOkText: 'Ok xóa',
      nzOkType: 'danger',
      nzOnOk: () => {
        this.categoryService.deleteMovieById(id).subscribe((res: any) => {
          console.log(res);
          if(res && res.result === 200) {
            this.message.create('success', 'Thành công');
            this.refetchData();
          } else {
            this.message.create('error', 'Thất bại');
          }
        })
      },
      nzCancelText: 'Hủy bỏ',
      nzOnCancel: () => console.log('Cancel')
    });
  }
  refetchData() {
    this.event$.next(true);
  }
}
