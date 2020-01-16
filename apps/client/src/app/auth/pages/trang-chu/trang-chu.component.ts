import { OnInit, Component, ViewChild, ElementRef } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Observable } from 'rxjs';
import { Carousels, Movies, CommentMovies, BlockMovies, Promotions, CategoryService } from '../../../core/services/category.service';
import { SafeResourceUrl, DomSanitizer } from '@angular/platform-browser';
import { AuthService } from '../../services/auth.service';
import { Router, ActivatedRoute } from '@angular/router';
import { NzMessageService } from 'ng-zorro-antd';
import { first, finalize } from 'rxjs/operators';

@Component({
  selector: 'll-trang-chu',
  templateUrl: './trang-chu.component.html',
  styleUrls: ['./trang-chu.component.scss']
})
export class TrangChuComponent implements OnInit {
  @ViewChild('imageCarousel', {static: false}) private imageCarousel: ElementRef;

  array = [1, 2, 3, 4];
  isVisible = false;
  titleModal= '';
  lstInfo = [];
  carousels$: Observable<Carousels[]>;
  movies$: Observable<Movies[]>;
  commentMovies$: Observable<CommentMovies[]>;
  blockMovies$: Observable<BlockMovies[]>;
  // promotions$: Observable<Promotions[]>;
  status = '';
  safeSrc: SafeResourceUrl;


  constructor(
    private router: Router,
    private categoryService: CategoryService,
    private sanitizer: DomSanitizer
  ) {}

  ngOnInit() {
    this.carousels$ = this.categoryService.getCarousels();
    this.movies$ = this.categoryService.getListMovies();
    this.commentMovies$ = this.categoryService.getListComments();
    this.blockMovies$ = this.categoryService.getBlockMovies();
    this.categoryService.getPromotions().subscribe((x: any) => {
      x.forEach(element => {
        if(element.type === 5) {
          this.lstInfo.push(element);
        }
      });
      // this.lstInfo = x.find(c => 5 === c.type);
      console.log(this.lstInfo )
    });

  }

  showModal(link: string, title: string): void {
    console.log(link);
    this.safeSrc =  this.sanitizer.bypassSecurityTrustResourceUrl(link);
    this.titleModal = title;
    this.isVisible = true;
  }
  showTrailer(id: number): void {
    console.log(id)
  }
  navigateMuave(id: number): void {
    this.router.navigate(['/login', id, 'chi-tiet']);
  }
  onCarousel(obj: any, direction: string) {
    const carousel: any = this.imageCarousel;
    console.log('onCarousel', carousel.pre);
    // carousel.pre();
    switch (direction) {
      case 'left':
        carousel.pre();
      break;
      case 'right':
        carousel.next();
      break;
    }
  }

  handleOk(): void {
    this.isVisible = false;
  }

  handleCancel(): void {

    this.isVisible = false;
  }






}
