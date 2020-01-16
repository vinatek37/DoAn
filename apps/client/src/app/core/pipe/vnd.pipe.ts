import { Pipe, PipeTransform } from '@angular/core';

@Pipe({ name: 'vndPipe' })
export class VNDPipe implements PipeTransform {
  transform(value: string): string {
    if (value && value !== null) {
      const newstr = value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.');
      return newstr;
    } else {
      return '';
    }
  }
}
