import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
import { TokenInterceptor } from './interceptors/token.interceptor';
import { VNDPipe } from './pipe/vnd.pipe';
import { AuthenticatedGuard } from '../auth/guards/authenticated.guard';
import { CredentialsService } from '../auth/services/credentials.service';
import { TypeNewPipe } from './pipe/typenew.pipe';
import { SafeUrlPipe } from './pipe/safeurl.pipe';

@NgModule({
  declarations: [VNDPipe, TypeNewPipe, SafeUrlPipe],
  imports: [CommonModule, HttpClientModule],
  providers: [AuthenticatedGuard,CredentialsService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true
    }
  ],
  exports: [VNDPipe,TypeNewPipe, SafeUrlPipe]
})
export class CoreModule {}
