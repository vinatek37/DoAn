import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { NzTableModule } from 'ng-zorro-antd/table';
import { routes } from './constants/routes';
import { HomelayoutComponent } from './pages/homelayout/homelayout.component';

@NgModule({
  declarations: [HomelayoutComponent],
  imports: [CommonModule, NzTableModule, RouterModule.forChild(routes)]
})
export class HomeModule {}
