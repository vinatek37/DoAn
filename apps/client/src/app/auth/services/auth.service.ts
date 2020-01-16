import { Injectable } from '@angular/core';
import { Observable, BehaviorSubject } from 'rxjs';
import { tap } from 'rxjs/operators';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { BASE_API_URL, environment } from '@env/environment';
import { HTTPStatusCode } from '../../core/models/http-status-code';

interface LoginRequest {
  email: string;
  password: string;
}

interface LoginResponse {
  access_token: string;
  token_type: string,
  refresh_token: string,
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private _isAuthenticated$ = new BehaviorSubject<boolean>(false);
  private _accountInfo$ = new BehaviorSubject<object>({});
  public isAuthenticated$ = this._isAuthenticated$.asObservable();
  public accountInfo$ = this._accountInfo$.asObservable();
  accessToken = '';

  constructor(private http: HttpClient) {
    const token = localStorage.getItem('accessToken');
    this.accessToken = token;
    if (token) {
      this._isAuthenticated$.next(true);
      this.http.get(`${environment.api.apiBaseUrl}/account/profile`, {
        headers: {
          NotAttachToken: 'Y',
          NotHandleAuthFail: 'Y',
          Authorization: 'Bearer' + token
        }
      }).subscribe({
        next: (v: any) => {
          this._accountInfo$.next(v.obj);
          console.log(v);
        },
        error: (e) => {
          if (e.status === HTTPStatusCode.UnAuthorized) {
            this.logout();
          }
        }
      });
    }
  }

  login(loginReq: LoginRequest): Observable<object> {
    const endpointUrl = environment.api.authBaseUrl;
    const config = environment.api;
    const body = new HttpParams()
      .set('client_id', config.clientId)
      .set('client_secret', config.clientSecret)
      .set('grant_type', 'password')
      .set('username', loginReq.email)
      .set('password', loginReq.password);
    const options = {
      headers: new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded')
    };
    return this.http
      .post(endpointUrl, body, {
        headers: {
          NotAttachToken: 'Y',
          NotHandleAuthFail: 'Y'
        }
      })
      .pipe(
        tap((res: LoginResponse) => {
          console.log(res);
          this.storeCredentials(res.access_token);
          // this.http.get(`${environment.api.apiBaseUrl}/account/profile`, {
          //   headers: {
          //     NotAttachToken: 'Y',
          //     NotHandleAuthFail: 'Y',
          //     Authorization: 'Bearer' + res.access_token
          //   }
          // }).subscribe({
          //   next: (v: any) => {
          //     this._accountInfo$.next(v.obj);
          //     localStorage.setItem('currentUser', JSON.stringify(v.obj));
          //     console.log(v);
          //   },
          //   error: (e) => {
          //     if (e.status === HTTPStatusCode.UnAuthorized) {
          //       this.logout();
          //     }
          //   }
          // });
        })
      );
  }

  logout() {
    this.storeCredentials('', 'rm');
    this._isAuthenticated$.next(false);
  }

  storeCredentials(token = '', addOrRemove: 'add' | 'rm' = 'add', emit = true) {
    this.accessToken = token;
    if (emit) {
      this._isAuthenticated$.next(!!token);
    }
    if (addOrRemove === 'add') {
      localStorage.setItem('accessToken', token);
    } else {
      localStorage.clear();
    }
  }
}
