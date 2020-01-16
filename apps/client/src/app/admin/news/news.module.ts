import { AddNewsComponent } from './pages/addnews/addnews.component';
import { ListNewsComponent } from './pages/listnews/listnews.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { routes } from './constants/routes';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { NewsComponent } from './news.component';
import { CoreModule } from '../../core/core.module';

@NgModule({
  declarations: [NewsComponent, ListNewsComponent, AddNewsComponent],
  imports: [CommonModule, CoreModule, FormsModule, ReactiveFormsModule, NgZorroAntdModule, NzCardModule, NzCarouselModule, RouterModule.forChild(routes)]
})
export class NewsModule { }
