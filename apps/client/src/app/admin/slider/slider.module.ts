import { CoreModule } from './../../core/core.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { routes } from './constants/routes';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { ListSliderComponent } from './pages/list-slider/list-slider.component';
import { AddSliderComponent } from './pages/add-slider/add-slider.component';
import { SliderComponent } from './slider.component';

@NgModule({
  declarations: [SliderComponent, ListSliderComponent, AddSliderComponent],
  imports: [CommonModule, FormsModule, CoreModule, ReactiveFormsModule, NgZorroAntdModule, NzCardModule, NzCarouselModule, RouterModule.forChild(routes)]
})
export class SliderModule { }
