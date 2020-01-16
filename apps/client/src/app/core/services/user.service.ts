import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BASE_API_URL, environment } from '@env/environment';
import { Observable, Subject } from 'rxjs';
import { map } from 'rxjs/operators';
import { CredentialsService } from '../../auth/services/credentials.service';

export interface User {
  username: string;
  usertype: number;
}
export interface UserInfo {
  email: string;
  name: string;
  password: string;
  phone: string;
}

@Injectable({
  providedIn: 'root'
})
export class UserService {
  public userInfoChange: Subject<any> = new Subject();
  prefixUrl = environment.api.apiBaseUrl;
  constructor(private http: HttpClient, private credentialsService: CredentialsService) {

  }
  // api/account/profile
  getCurrentUser(): Observable<User> {
    const token = localStorage.getItem('accessToken');
    console.log(token);
    return this.http.get<User>(`${this.prefixUrl}/account/profile`, {
      headers: {
        NotAttachToken: 'Y',
        NotHandleAuthFail: 'Y',
        Authorization: 'Bearer' + token
      }
    }).pipe(map((x: any) => {
      console.log(x);
      this.userInfoChange.next(x.obj);
      this.credentialsService.setCredentials(x.obj);
      // localStorage.setItem('credentials', JSON.stringify(x.obj));
      return x.obj
    }));
  }
  registerUser(info: UserInfo): Observable<any> {
    return this.http.post(`${this.prefixUrl}/account/account-regiter`, info, {
      headers: {
        NotAttachToken: 'Y',
        NotHandleAuthFail: 'Y'
      }
    });
  }
}
