# Web cinema


## Tài liệu hướng dẫn sử dụng

Sau khi clone project, truy cập dường dẫn doan/BK

Mở 3 project bằng IDE bất kì (Spring tool suite, NetBean, IntelliJ IDEA...)

Chạy project theo thứ tự utils-user-services ->>> oauth2server ->>> api-server

Lưu ý đảm bảo cơ sở dữ liệu đang online

Mở ứng dụng với editer/ide bất kì như VS Code, Webstorm...

Build ứng dụng: `npm install`

Chạy ứng dụng: `npm start`

Ứng dụng sẽ chạy mặc định ở http://localhost:4500/

Default User:

```ts
const user = {
  email: 'abc@test.com',
  password: '123456',
};

const useradmin = {
  email: 'admin',
  password: '123456',
};
```


## Further help

Tài liệu tham khảo: 
[Angular Documentation](https://angular.io/)
[Spring boot] (https://spring.io/)
[Nx Documentation](https://nx.dev/angular)
