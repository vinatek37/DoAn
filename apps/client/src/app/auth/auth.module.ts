import { ScrollToModule } from '@nicky-lenaers/ngx-scroll-to';
import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzMessageModule } from 'ng-zorro-antd/message';
import { NzModalModule } from 'ng-zorro-antd/modal';
import { routes } from './constants/routes';
import { LoginComponent } from './pages/login/login.component';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { NzLayoutModule } from 'ng-zorro-antd/layout';
import { NzMenuModule } from 'ng-zorro-antd/menu';
import { NzRateModule } from 'ng-zorro-antd/rate';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NzTabsModule } from 'ng-zorro-antd/tabs';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzCheckboxModule } from 'ng-zorro-antd/checkbox';
import { NzAffixModule } from 'ng-zorro-antd/affix';
import { NzAvatarModule } from 'ng-zorro-antd/avatar';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzProgressModule } from 'ng-zorro-antd/progress';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { ChiTietPhimComponent } from './pages/chi-tiet-phim/chi-tiet-phim.component';
import { TrangChuComponent } from './pages/trang-chu/trang-chu.component';
import { CoreModule } from '../core/core.module';

@NgModule({
  declarations: [LoginComponent, ChiTietPhimComponent, TrangChuComponent],
  imports: [
    CommonModule,
    CoreModule,
    FormsModule,
    ReactiveFormsModule,
    NzLayoutModule,
    NzButtonModule,
    NgZorroAntdModule,
    NzFormModule,
    NzIconModule,
    NzCheckboxModule,
    NzTabsModule,
    NzProgressModule,
    NzDropDownModule,
    NzAffixModule,
    NzRateModule,
    NzAvatarModule,
    NzInputModule,
    NzModalModule,
    NzMessageModule,
    NzCardModule,
    NzMenuModule,
    ScrollToModule.forRoot(),
    NzCarouselModule,
    RouterModule.forChild(routes)
  ]
})
export class AuthModule {}
