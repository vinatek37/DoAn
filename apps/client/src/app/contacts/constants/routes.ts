import { Shell } from './../../shell/shell.service';
import { Routes } from '@angular/router';
import { ContactsComponent } from '../pages/contacts/contacts.component';

export const routes: Routes = [
  Shell.childRoutes([
    { path: '', redirectTo: '/contacts', pathMatch: 'full' },
    { path: 'contacts', component: ContactsComponent, }
  ])
];
