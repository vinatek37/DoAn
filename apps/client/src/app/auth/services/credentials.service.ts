import { Injectable } from '@angular/core';

export interface Credentials {
  // Customize received credentials here
  id: number;
  role: number;
  name: string
}

const credentialsKey = 'credentials';

/**
 * Provides storage for authentication credentials.
 * The Credentials interface should be replaced with proper implementation.
 */
@Injectable()
export class CredentialsService {
  private _credentials: Credentials | null = null;

  constructor() {
    const savedCredentials = localStorage.getItem(credentialsKey);
    if (savedCredentials) {
      this._credentials = JSON.parse(savedCredentials);
    }
  }

  isAuthenticated(): boolean {
    return !!this.credentials;
  }

  get credentials(): Credentials | null {
    return this._credentials;
  }

  get username() {
    if (this.isAuthenticated()) {
      return this._credentials.name;
    }
    return null;
  }

  get role() {
    if (this.isAuthenticated()) {
      return this._credentials.role;
    }
    return null;
  }



  setCredentials(credentials?: Credentials) {
    this._credentials = credentials || null;
    if (credentials) {
      const storage = localStorage;
      storage.setItem(credentialsKey, JSON.stringify(credentials));
    } else {
      localStorage.removeItem(credentialsKey);
    }
  }
}
