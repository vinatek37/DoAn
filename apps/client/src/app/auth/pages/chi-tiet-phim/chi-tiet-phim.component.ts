import { OnInit, Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CategoryService, Seats } from '../../../core/services/category.service';
import { DomSanitizer, SafeStyle } from '@angular/platform-browser';
import { Observable } from 'rxjs';
import { NzMessageService } from 'ng-zorro-antd';
import { CredentialsService } from '../../services/credentials.service';
import { addDays, distanceInWords } from 'date-fns';

@Component({
  selector: 'll-chi-tiet-phim',
  templateUrl: './chi-tiet-phim.component.html',
  styleUrls: ['./chi-tiet-phim.component.scss']
})
export class ChiTietPhimComponent implements OnInit {
  movieDetail: any;
  lstSchedule = [];
  lstSeatPick: number[] = [];
  sumMoney = 0;
  isVisibleTicket = false;
  isVisibleResult = false;
  scheduleId = 0;
  lstResult: any = [];
  seats$: Observable<Seats[]>;
  data = [
    {
      author: 'Hà thương',
      avatar: 'https://i.pinimg.com/236x/f9/a7/0c/f9a70c6b9f9c9a86a7132108f6a27e0b.jpg',
      content:
        'Mắt biếc dù vẫn còn một vài hạt sạn, song không thể phủ nhận đây là một tác phẩm điện ảnh tốt. Bộ phim hiện đang được công chiếu tại Touch Cinema.',
      datetime: distanceInWords(new Date(), addDays(new Date(), 1))
    },
    {
      author: 'Nguyễn Ngọc Ngạn',
      avatar: 'https://i.pinimg.com/236x/c1/ee/03/c1ee0328bf1304b3d4ce12d074fc85e6.jpg',
      content:
        'Yêu một cách dại khờ, đó là Hà Lan. Biết rõ Dũng là gã chẳng ra gì, lăng nhăng nhưng vẫn yêu, vẫn tha thứ nhiều lần. Ở cái tuổi 17, trao thân cho người chẳng xứng đáng, để rồi mang thai và làm mẹ đơn thân. Một cô gái dám yêu và biết yêu, nhưng lại có một mối tình buồn bởi vì đã chọn sai người.',
      datetime: distanceInWords(new Date(), addDays(new Date(), 2))
    },
    {
      author: 'Dương quá',
      avatar: 'https://i.pinimg.com/236x/ab/17/83/ab17830ba124f867700904af2745c3be.jpg',
      content:
        'xem phim viễn tưởng ít thôi, thực tế chút, liệu cm đủ tỉnh táo để nhận ra và dũng cảm trước bao con người dưới trướng của bà HH mà cứ trách công chúa?',
      datetime: distanceInWords(new Date(), addDays(new Date(), 3))
    }

    //
  ];
  public backgroundImg: SafeStyle;
  formatOne = (percent: number) => `${percent / 10}`;
  constructor(private route: ActivatedRoute,
    private categoryService: CategoryService,
    private credentialsService: CredentialsService,
    private sanitizer: DomSanitizer,
    private message: NzMessageService) { }

  ngOnInit(): void {
    this.categoryService.getDetailMoviesById(Number(this.route.snapshot.params['moviesId'])).subscribe((res: any) => {
      console.log(res);
      this.movieDetail = res;
      this.backgroundImg = this.sanitizer.bypassSecurityTrustStyle('url(' + this.movieDetail.thumbImage + ')');
      this.categoryService.getScheduleMoviesById(Number(this.route.snapshot.params['moviesId'])).subscribe((resp: any) => {
        console.log(resp)
        this.lstSchedule = resp;
      })
    })
  }
  showBooking(item: any): void {
    if(this.credentialsService.isAuthenticated()) {
      this.sumMoney = 0;
      this.lstSeatPick.length = 0;
      console.log(item);
      if (item) {
        this.seats$ = this.categoryService.getListGhe(item.roomId, item.id);
        this.scheduleId = item.id;
      }
      this.isVisibleTicket = true;
    } else {
      this.message.create('error', 'Vui lòng đăng nhập để mua vé!');
      this.categoryService.isShowLogin.next(true);
    }
  }
  booking(): void {
    if (this.lstSeatPick.length > 0) {
      const user = this.credentialsService.credentials;
      // 7 2
      const obj = {
        "emptySeatId": this.lstSeatPick,
        "price": this.sumMoney,
        "schudeleId": this.scheduleId,
        "staffId": 1,
        "userId": user.id
      }
      this.categoryService.ticketBooking(obj).subscribe((response: any) => {
        if (response && response.result === 200) {
          this.message.create('success', 'Đặt vé thành công!');
          this.isVisibleTicket = false;
          this.isVisibleResult = true;
          this.lstResult = response.obj;
        } else {
          this.message.create('error', response.mess);
        }
      })
    } else {
      this.message.create('error', 'Vui lòng chọn vé!');
    }
  }
  cancelBooking(): void {
    this.isVisibleTicket = false;
    this.lstSeatPick.length = 0;
  }
  log(value: number[]): void {
    console.log(value);
    this.lstSeatPick = value;
    this.sumMoney = this.lstSeatPick.length * 50000
  }


  handleOk(): void {

  }

  handleCancel(): void {
    this.isVisibleResult = false;
  }
}
