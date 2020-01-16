import { Routes } from '@angular/router';
import { HomelayoutComponent } from '../pages/homelayout/homelayout.component';

export const routes: Routes = [
  {
    path: '',
    component: HomelayoutComponent,
    data: {
      breadcrumb: 'Home'
    }
  }
];
