import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// const routes: Routes = [
//   {
//     path: '', pathMatch: 'full', redirectTo: '/home',
//     data: { breadcrumb: 'Home' }
//   },
//   {
//     path: 'home',
//     data: { breadcrumb: 'Home' },
//     loadChildren: () =>
//       import('./home/home.module').then(m => m.HomeModule)
//   },
//   {
//     path: 'admin',
//     data: { breadcrumb: 'Admin' },
//     canActivate: [AuthenticatedGuard],
//     loadChildren: () =>
//       import('./admin/admin.module').then(m => m.AdminModule)
//   },
//   {
//     path: 'contacts',
//     canActivate: [AuthenticatedGuard],
//     data: { breadcrumb: 'Contacts' },
//     loadChildren: () =>
//       import('./contacts/contacts.module').then(m => m.ContactsModule)
//   },
//   {
//     path: '**',
//     redirectTo: '/home'
//   }
// ];
const routes: Routes = [
  // Fallback when no prior route is matched
  { path: '**', redirectTo: '', pathMatch: 'full' }
];


@NgModule({
  imports: [RouterModule.forRoot(routes, { scrollPositionRestoration: 'enabled' })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
