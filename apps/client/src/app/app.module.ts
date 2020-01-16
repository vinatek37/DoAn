import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { NgZorroAntdModule, NZ_I18N, en_US } from 'ng-zorro-antd';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { registerLocaleData } from '@angular/common';
import en from '@angular/common/locales/en';
import { AppRoutingModule } from './app-routing.module';
import { IconsProviderModule } from './icons-provider.module';
import { CoreModule } from './core/core.module';
import { NgHttpLoaderModule } from 'ng-http-loader';
import { AuthModule } from './auth/auth.module';
import { ShellModule } from './shell/shell.module';
import { SliderModule } from './admin/slider/slider.module';
import { ContactsModule } from './contacts/contacts.module';
import { MoviesModule } from './admin/movies/movies.module';
import { NewsModule } from './admin/news/news.module';
import { ScheduleModule } from './admin/schedule/schedule.module';
import { TicketModule } from './admin/ticket/ticket.module';

registerLocaleData(en);

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    NgZorroAntdModule,
    ReactiveFormsModule,
    ShellModule,
    SliderModule,
    MoviesModule,
    NewsModule,
    ContactsModule,
    ScheduleModule,
    TicketModule,
    HttpClientModule,
    BrowserAnimationsModule,
    IconsProviderModule,
    CoreModule,
    AuthModule,
    NgHttpLoaderModule.forRoot(),
    // should be end of other route module
    AppRoutingModule
  ],
  providers: [
    { provide: NZ_I18N, useValue: en_US }],
  bootstrap: [AppComponent]
})
export class AppModule {}
