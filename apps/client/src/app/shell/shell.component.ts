
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { AuthService } from '../auth/services/auth.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { CredentialsService } from '../auth/services/credentials.service';

@Component({
  selector: 'll-shell',
  templateUrl: './shell.component.html',
  styleUrls: ['./shell.component.scss']
})
export class ShellComponent implements OnInit {
  isCollapsed = false;
  isAuthenticated$ = this.auth.isAuthenticated$;
  constructor(private auth: AuthService, private router: Router,  private credentialsService: CredentialsService) { }
  ngOnInit() { }
  logout() {
    this.auth.logout();
    this.credentialsService.setCredentials();
    this.router.navigateByUrl('/login');
  }
}
