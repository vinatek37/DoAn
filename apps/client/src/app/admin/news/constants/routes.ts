import { AddNewsComponent } from './../pages/addnews/addnews.component';
import { ListNewsComponent } from './../pages/listnews/listnews.component';
import { NewsComponent } from './../news.component';
import { Routes } from '@angular/router';
import { Shell } from '../../../shell/shell.service';


export const routes: Routes = [
  Shell.childRoutes([
    {
      path: 'danh-sach-news', component: NewsComponent,
      children: [
        { path: '', component: ListNewsComponent },
        { path: 'them-moi/:id', component: AddNewsComponent }
      ]
    }
  ])
];
