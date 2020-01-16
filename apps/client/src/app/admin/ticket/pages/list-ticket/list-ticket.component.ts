import { Component, OnInit } from '@angular/core';
import { Observable, BehaviorSubject } from 'rxjs';
import { CategoryService, Movies, Ticket } from '../../../../core/services/category.service';
import { NzModalService, NzMessageService } from 'ng-zorro-antd';
import { switchMapTo, map } from 'rxjs/operators';

@Component({
  selector: 'll-list-ticket',
  templateUrl: './list-ticket.component.html',
  styleUrls: ['./list-ticket.component.scss']
})
export class ListTicketComponent implements OnInit {
  listTicket = [];
  listSave = [];
  listTicketClone: any = [];
  constructor(private categoryService: CategoryService,
    private modalService: NzModalService,
    private message: NzMessageService) { }

  ngOnInit() {
    this.refetchData();
  }
  onOnConfirmState(id: number): void {
    console.log(id);
    this.modalService.confirm({
      nzTitle: 'Xác nhận vé này đã giao cho khách?',
      nzContent: '<b style="color: red;">Thao tác này chỉ thực hiện 1 lần</b>',
      nzOkText: 'Yes',
      nzOkType: 'danger',
      nzOnOk: () => {
        this.categoryService.updateTicket(id).subscribe((res: any) => {
          console.log(res);
          if (res && res.result === 200) {
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
  showMessError(): void {
    this.message.create('warning', 'Vé này đã được giao cho khách');
  }
  refetchData() {
    this.categoryService.adminGetListTicket().subscribe((resp: any) => {
      console.log(resp)
      this.listTicket = resp;
      this.listSave = [...resp];
      this.listTicketClone = [...resp];
    })
  }
  onChange(result): void {
    if (result.length === 0) {
      this.listTicket = this.listSave;
    }
    console.log(result);
  }

  onOk(result: Date): void {
    console.log('onOk', result);
    const newArr = [];
    this.listTicketClone.map((y: any) => {
      if ((new Date(y.startTime).getTime()) <= result[1].getTime() && (new Date(y.startTime).getTime()) >= result[0].getTime()) {
        newArr.push(y);
      }
    })
    this.listTicket = newArr;
  }
}
