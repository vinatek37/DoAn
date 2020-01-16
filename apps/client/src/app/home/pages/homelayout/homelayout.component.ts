import { Component, OnInit } from '@angular/core';
import {
  ContactsService,
  Contacts
} from '../../../core/services/contacts.service';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

@Component({
  selector: 'll-homelayout',
  templateUrl: './homelayout.component.html',
  styleUrls: ['./homelayout.component.scss']
})
export class HomelayoutComponent implements OnInit {
  contacts$: Observable<Contacts[]>;
  constructor(
    private contactsService: ContactsService
  ) {}

  ngOnInit() {
    this.contacts$ = this.contactsService.getContacts();
  }
}
