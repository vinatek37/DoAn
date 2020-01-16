import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { routes } from './constants/routes';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { ScheduleComponent } from './schedule.component';
import { ListScheduleComponent } from './pages/list-schedule/list-schedule.component';
import { AddScheduleComponent } from './pages/add-schedule/add-schedule.component';

@NgModule({
  declarations: [ScheduleComponent, ListScheduleComponent, AddScheduleComponent],
  imports: [CommonModule, NgZorroAntdModule, NzCardModule, NzCarouselModule, FormsModule, ReactiveFormsModule, RouterModule.forChild(routes)]
})
export class ScheduleModule { }
