import { Routes } from '@angular/router';
import { LoginComponent } from '../pages/login/login.component';
import { TrangChuComponent } from '../pages/trang-chu/trang-chu.component';
import { ChiTietPhimComponent } from '../pages/chi-tiet-phim/chi-tiet-phim.component';

export const routes: Routes = [
  {
    path: 'login',
    component: LoginComponent,
    data: {
      breadcrumb: 'Login'
    },
    children: [
      {
        path: '',
        component: TrangChuComponent
      },
      {
        path: ':moviesId',
        children: [
          {
            path: 'chi-tiet',
            component: ChiTietPhimComponent
          }
        ]
      }
    ]
  }
];
