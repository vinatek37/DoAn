import { NzCardModule } from 'ng-zorro-antd/card';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { ShellComponent } from './shell.component';
import { NgZorroAntdModule, NZ_I18N, en_US, NzCarouselModule } from 'ng-zorro-antd';
import { A11yModule } from '@angular/cdk/a11y';
import { BidiModule } from '@angular/cdk/bidi';
import { ObserversModule } from '@angular/cdk/observers';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { IconsProviderModule } from '../icons-provider.module';
import { HttpClientModule } from '@angular/common/http';
import { NzLayoutModule } from 'ng-zorro-antd/layout';

@NgModule({
  exports: [
    // CDK
    A11yModule,
    BidiModule,
    ObserversModule,
    NgZorroAntdModule,
    IconsProviderModule,
    NzCardModule,
    NzCarouselModule,
    NzLayoutModule
  ]
})
export class MaterialModule {}
@NgModule({
  imports: [
    CommonModule,
    MaterialModule,
    RouterModule,
    HttpClientModule,
    BrowserAnimationsModule
  ],
  declarations: [ShellComponent]
})
export class ShellModule {}
