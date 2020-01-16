import { Routes } from '@angular/router';
import { Shell } from '../../../shell/shell.service';
import { ListMoviesComponent } from '../pages/listmovies/listmovies.component';
import { MoviesComponent } from '../movies.component';
import { AddMovieComponent } from '../pages/addmovie/addmovie.component';


export const routes: Routes = [
  Shell.childRoutes([
    {
      path: 'danh-sach-phim', component: MoviesComponent,
      children: [
        { path: '', component: ListMoviesComponent },
        { path: 'them-moi/:id', component: AddMovieComponent }
      ]
    }
  ])
];
