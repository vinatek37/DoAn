import { Pipe, PipeTransform } from '@angular/core';

@Pipe({ name: 'typeNewPipe' })
export class TypeNewPipe implements PipeTransform {
  transform(value: number): string {
    if (value) {
      switch (value) {
        case 1:
          return 'Bình luận phim'
          break;
        case 2:
          return 'Block điện ảnh'
          break;
        case 5:
          return 'Tin tức khuyến mãi'
          break;
        default:
          return ''
          break;
      }
    } else {
      return '';
    }
  }
}
