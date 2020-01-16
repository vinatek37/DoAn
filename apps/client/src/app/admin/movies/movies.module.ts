import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { routes } from './constants/routes';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { ListMoviesComponent } from './pages/listmovies/listmovies.component';
import { MoviesComponent } from './movies.component';
import { AddMovieComponent } from './pages/addmovie/addmovie.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';

@NgModule({
  declarations: [ListMoviesComponent, MoviesComponent, AddMovieComponent],
  imports: [CommonModule, NgZorroAntdModule, NzCardModule, NzCarouselModule, FormsModule, ReactiveFormsModule, RouterModule.forChild(routes)]
})
export class MoviesModule { }
