import { Routes } from '@angular/router';
import { Shell } from '../../../shell/shell.service';
import { TicketComponent } from '../ticket.component';
import { ListTicketComponent } from '../pages/list-ticket/list-ticket.component';
import { AddTicketComponent } from '../pages/add-ticket/add-ticket.component';


export const routes: Routes = [
  Shell.childRoutes([
    {
      path: 'danh-sach-ve', component: TicketComponent,
      children: [
        { path: '', component: ListTicketComponent },
        { path: 'them-moi/:id', component: AddTicketComponent }
      ]
    }
  ])
];
