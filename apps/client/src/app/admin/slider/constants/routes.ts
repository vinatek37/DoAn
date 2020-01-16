import { Routes } from '@angular/router';
import { Shell } from '../../../shell/shell.service';
import { SliderComponent } from '../slider.component';
import { ListSliderComponent } from '../pages/list-slider/list-slider.component';
import { AddSliderComponent } from '../pages/add-slider/add-slider.component';


export const routes: Routes = [
  Shell.childRoutes([
    {
      path: 'danh-sach-slider', component: SliderComponent,
      children: [
        { path: '', component: ListSliderComponent },
        { path: 'them-moi/:id', component: AddSliderComponent }
      ]
    }
  ])
];
