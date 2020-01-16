import { Routes } from '@angular/router';
import { Shell } from '../../../shell/shell.service';
import { ScheduleComponent } from '../schedule.component';
import { ListScheduleComponent } from '../pages/list-schedule/list-schedule.component';
import { AddScheduleComponent } from '../pages/add-schedule/add-schedule.component';


export const routes: Routes = [
  Shell.childRoutes([
    {
      path: 'danh-sach-lich-chieu', component: ScheduleComponent,
      children: [
        { path: '', component: ListScheduleComponent },
        { path: 'them-moi/:id', component: AddScheduleComponent }
      ]
    }
  ])
];
