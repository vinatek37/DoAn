import { CoreModule } from './../../core/core.module';
import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { routes } from './constants/routes';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { TicketComponent } from './ticket.component';
import { ListTicketComponent } from './pages/list-ticket/list-ticket.component';
import { AddTicketComponent } from './pages/add-ticket/add-ticket.component';

@NgModule({
  declarations: [TicketComponent, ListTicketComponent, AddTicketComponent],
  imports: [CommonModule, CoreModule, NgZorroAntdModule, NzCardModule, NzCarouselModule, FormsModule, ReactiveFormsModule, RouterModule.forChild(routes)]
})
export class TicketModule { }
