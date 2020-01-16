import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './auth/services/auth.service';
import { Spinkit } from 'ng-http-loader';
import { CredentialsService } from './auth/services/credentials.service';

@Component({
  selector: 'll-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  public spinkit = Spinkit;
  isCollapsed = false;
  isAuthenticated$ = this.auth.isAuthenticated$;
  constructor(private auth: AuthService, private router: Router, private credentialsService: CredentialsService) {}
  ngOnInit() {}
  logout() {
    this.auth.logout();
    this.router.navigateByUrl('/login');
    this.credentialsService.setCredentials(null);
  }
}
