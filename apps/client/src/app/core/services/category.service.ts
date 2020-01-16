import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BASE_API_URL, environment } from '@env/environment';
import { Observable, Subject } from 'rxjs';
import { map } from 'rxjs/operators';

export interface Carousels {
  id: number;
  name: string;
  thumbImage: string;
  urlTrailler: string;
  imageSlide: string;
}
export interface Movies {
  id: number;
  thumbImage: string;
  duration: number;
  name: string;
  language: string;

}
export interface Schedule {
  id: number;
  movieId: number;
  roomId: number;
  startTime: any;
  endTime: any;
  movie: MovieDetail;
}
export interface Ticket {
  id: number;
  price: number;
  startTime: any;
  movieName: string;
  duration: number;
  roomName: string;
  seatName: string;
  movieId: number;
  state: boolean;
}
export interface MovieDetail {
  id: number;
  image: string;
  longtime: number;
  name: string;
  star: number;
  rating: number;
}
export interface CommentMovies {
  id: number;
  title: string;
  content: number;
  fullDes: string;
  image: string;
  type: number;
}
export interface BlockMovies {
  id: number;
  title: string;
  content: number;
  fullDes: string;
  image: string;
  type: number;
}
export interface Promotions {
  id: number;
  image: string;
  title: string;
  content: string;
  type: number;
  descriptions: string;
}
export interface Seats {
  seatId: number;
  roomId: number;
  name: string;
  price: number;
  isEmpty: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  public isShowLogin: Subject<boolean> = new Subject();
  constructor(private http: HttpClient) { }
  prefixUrl = environment.api.apiBaseUrl;
  getCarousels(): Observable<Carousels[]> {
    return this.http.get<Carousels[]>(`${this.prefixUrl}/event/list`, {
      headers: {
        NotAttachToken: 'Y',
        NotHandleAuthFail: 'Y'
      }
    }).pipe(map((x: any) => x.obj));
  }

  createSlider(obj: any): Observable<any> {
    return this.http
      .post(`${this.prefixUrl}/event/add`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }
  updateSlider(obj: any): Observable<any> {
    return this.http
      .put(`${this.prefixUrl}/event/update`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }
  deleteSlider(id: number): Observable<object> {
    const options = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
      }),
      body: {moveId: id},
    };
    return this.http
      .delete(`${this.prefixUrl}/event/delete`, options);
  }

  createNews(obj: any): Observable<any> {
    return this.http
      .post(`${this.prefixUrl}/news/add`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }
  getDetailNewsById(id: number): Observable<object> {
    return this.http
      .get(`${this.prefixUrl}/news/details?newsId=` + `${id}`, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      }).pipe(map((x: any) => x.obj));
  }
  updateNews(obj: any): Observable<any> {
    return this.http
      .put(`${this.prefixUrl}/news/update`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }
  deleteNews(id: number): Observable<object> {
    const options = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
      }),
      body: {id: id},
    };
    return this.http
      .delete(`${this.prefixUrl}/news/delete`, options);
  }

  // Lich chieu
  createSchedule(obj: any): Observable<any> {
    return this.http
      .post(`${this.prefixUrl}/schedule/add`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }
  getScheduleById(id: number): Observable<object> {
    return this.http
      .get(`${this.prefixUrl}/schedule/details?scheduleId=` + `${id}`, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      }).pipe(map((x: any) => x.obj));
  }
  updateSchedule(obj: any): Observable<any> {
    return this.http
      .put(`${this.prefixUrl}/schedule/update`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }
  deleteSchedule(id: number): Observable<object> {
    const options = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
      }),
      body: {id: id},
    };
    return this.http
      .delete(`${this.prefixUrl}/schedule/delete`, options);
  }

  getListSchedule(obj: any): Observable<Schedule[]> {
    return this.http.post(`${this.prefixUrl}/schedule/search`, obj, {
      headers: {
        NotHandleAuthFail: 'Y',
      }
    }).pipe(map((x: any) => x.obj));
  }

  // /movie/list-free-slide
  //  Danh sach phim chua co slider
  getListMovieNoslider(objsearch: any): Observable<Movies[]> {
    return this.http.post(`${this.prefixUrl}/movie/list-free-slide`, objsearch, {
      headers: {
        NotHandleAuthFail: 'Y'
      }
    }).pipe(map((x: any) => x.obj.data ));
  }

  getListMovies(): Observable<Movies[]> {
    return this.http.get<Movies[]>(`${this.prefixUrl}/movie/list-showing`, {
      headers: {
        NotAttachToken: 'Y',
        NotHandleAuthFail: 'Y'
      }
    }).pipe(map((x: any) => {
      return x.obj.slice(0, 8)
    }));
  }
  getListMoviesAdmin(): Observable<Movies[]> {
    return this.http.post<Movies[]>(`${this.prefixUrl}/movie/search`, {}, {
      headers: {
        NotHandleAuthFail: 'Y',
      }
    }).pipe(map((x: any) => x.obj));
  }
  getListComments(): Observable<CommentMovies[]> {
    return this.http.get<CommentMovies[]>(`${this.prefixUrl}/news/get-list`, {
      headers: {
        NotAttachToken: 'Y',
        NotHandleAuthFail: 'Y'
      }
    }).pipe(map((x: any) => x.obj));
  }
  getBlockMovies(): Observable<BlockMovies[]> {
    return this.http.get<BlockMovies[]>(`${this.prefixUrl}/news/get-list`, {
      headers: {
        NotAttachToken: 'Y',
        NotHandleAuthFail: 'Y'
      }
    }).pipe(map((x: any) => x.obj));
  }
  getPromotions(): Observable<Promotions[]> {
    return this.http.get<Promotions[]>(`${this.prefixUrl}/news/get-list`, {
      headers: {
        NotAttachToken: 'Y',
        NotHandleAuthFail: 'Y'
      }
    }).pipe(map((x: any) => x.obj));
  }
  // Lay chi tiet phim
  getDetailMoviesById(id: number): Observable<object> {
    return this.http
      .get<MovieDetail>(`${this.prefixUrl}/movie/details?movieId=` + `${id}`, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      }).pipe(map((x: any) => x.obj));
  }
  // Lay lich chieu
  getScheduleMoviesById(id: number): Observable<object> {
    return this.http
      .get<MovieDetail>(`${this.prefixUrl}/movie/schedule-by-movie-id?movieId=` + `${id}`, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      }).pipe(map((x: any) => x.obj));
  }
  getListGhe(roomdId: number, scheduleId: number): Observable<Seats[]> {
    return this.http
      .get<MovieDetail>(`${this.prefixUrl}/booking/seat?roomId=` + `${roomdId}&scheduleId=` + `${scheduleId}`, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      }).pipe(map((x: any) => x.obj));
  }
  // Dat ve
  ticketBooking(obj: any): Observable<any> {
    return this.http
      .post(`${this.prefixUrl}/booking/ticket-booking`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }

  adminGetListTicket(): Observable<Ticket[]> {
    return this.http.get(`${this.prefixUrl}/ticket/get-all`, {
      headers: {
        NotHandleAuthFail: 'Y',
      }
    }).pipe(map((x: any) => x.obj));
  }
  userGetListTicket(): Observable<Ticket[]> {
    return this.http.get(`${this.prefixUrl}/ticket/history`, {
      headers: {
        NotHandleAuthFail: 'Y',
      }
    }).pipe(map((x: any) => x.obj));
  }

  // Đổi trạng thái vé thành đã giao

  updateTicket(id: number): Observable<any> {
    return this.http
      .get(`${this.prefixUrl}/ticket/update?code=` + `${id}`, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }

  // Tao phim moi
  createMovie(obj: any): Observable<any> {
    return this.http
      .post(`${this.prefixUrl}/movie/add`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }
  // Cap nhat phim
  updateMovie(obj: any): Observable<any> {
    return this.http
      .put(`${this.prefixUrl}/movie/update`, obj, {
        headers: {
          NotHandleAuthFail: 'Y'
        }
      });
  }
  // Xoa phim theo id
  deleteMovieById(id: number): Observable<object> {
    const options = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
      }),
      body: {id: id},
    };
    return this.http
      .delete<MovieDetail>(`${this.prefixUrl}/movie/delete`, options);
  }
}
