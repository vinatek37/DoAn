import * as express from 'express';
import { Request, Response } from 'express';

import { APIError } from '../models/api-response';
import { isAuthorized } from '../middleware';

export const router = express.Router();

const user = {
  email: 'test@test.com',
  password: '12345678',
  username: 'usertest',
  usertype: 1
};

router.get('/', (req: Request, res: Response) => {
  res.send({ message: 'Welcome to api!' });
});
// Dang nhap
router.post('/login', (req: Request, res: Response) => {
  const { email, password } = req.body;
  console.log(JSON.stringify(req.body));
  if (email === user.email && password === user.password) {
    return res.json({
      token: 'TEST_TOKEN' + Date.now(),
      usertype: user.usertype
    });
  }
  res.status(401).json({
    code: 401,
    message: 'login failed!'
  } as APIError);
});
// Lay thong tin nguoi dung
router.get('/user', isAuthorized, (req: Request, res: Response) => {
  return res
    .header({
      'x-token': 'TEST_TOKEN' + Date.now()
    })
    .json({
      username: user.username,
      usertype: user.usertype
    });
});

router.get('/contacts', isAuthorized, (req: Request, res: Response) => {
  return res
    .header({
      'x-token': 'TEST_TOKEN' + Date.now()
    })
    .json([
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      },
      {
        type: 'phone',
        value: '0123456789',
        name: 'Thương xinh gái ok',
        address: 'Thành phố Vinh Nghệ An'
      }
    ]);
});
// Lấy danh sách trailler trượt trượt
router.get('/carousels', (req: Request, res: Response) => {
  return res.json([
    {
      id: 1,
      image:
        'https://s3img.vcdn.vn/123phim/2019/10/khung-hinh-15699048110729.jpg',
      title: 'Hoàng',
      linkTrailer: 'https://www.youtube.com/embed/K1-11dWJocM?autoplay=1'
    },
    {
      id: 2,
      image: 'https://s3img.vcdn.vn/123phim/2019/09/ca-map-15695574190123.jpg',
      title: 'Đẹp',
      linkTrailer: 'https://www.youtube.com/embed/GFG0pFXP3bk?autoplay=1'
    },
    {
      id: 3,
      image:
        'https://s3img.vcdn.vn/123phim/2019/09/the-beatles-15695575011462.jpg',
      title: 'Trai',
      linkTrailer: 'https://www.youtube.com/embed/c24T0xJz4iU?autoplay=1'
    },
    {
      id: 4,
      image:
        'https://s3img.vcdn.vn/123phim/2019/10/xin-chao-15699048584747.jpg',
      title: 'Hihi',
      linkTrailer: 'https://www.youtube.com/embed/ye6eWjyVjoo?autoplay=1'
    },
    {
      id: 1,
      image:
        'https://s3img.vcdn.vn/123phim/2019/09/na-traaaaaaaaaaaa-15695574430908.jpg',
      title: 'Thương xinh gái ok',
      linkTrailer: 'https://www.youtube.com/embed/HlLXm5TFI6s?autoplay=1'
    }
  ]);
});
// Lấy danh sách phim
router.get('/listmovies', (req: Request, res: Response) => {
  return res.json([
    {
      id: 1,
      image:
        'https://www.galaxycine.vn/media/2019/10/31/450x300_1572489577169.png',
      longtime: 120,
      name: 'Kẻ hủy diệt: Vận Mệnh Đen Tối'
    },
    {
      id: 2,
      image:
        'https://www.galaxycine.vn/media/2019/10/25/450x300-bkt_1571973931859.jpg',
      longtime: 130,
      name: 'Bắc kim thang'
    },
    {
      id: 3,
      image:
        'https://www.galaxycine.vn/media/2019/9/11/450x300-thay-ma_1568191342198.jpg',
      longtime: 140,
      name: 'Vùng đất thây ma - Cú Bắn Đúp'
    },
    {
      id: 4,
      image:
        'https://www.galaxycine.vn/media/2019/7/22/maleficent6_1563766474305.jpg',
      longtime: 160,
      name: 'Tiên hắc ám 2'
    },
    {
      id: 5,
      image:
        'https://www.galaxycine.vn/media/2019/10/23/450x300_1571819448192.png',
      longtime: 170,
      name: 'Kim Ji Young 1982'
    },
    {
      id: 6,
      image: 'https://www.galaxycine.vn/media/2019/10/23/450_1571823207209.png',
      longtime: 190,
      name: 'Búp Bê Ký Ức: Violet Evergarden'
    },
    {
      id: 7,
      image:
        'https://www.galaxycine.vn/media/2019/9/13/450x300_1568347550951.png',
      longtime: 110,
      name: 'Pháp Sư Mù: Ai Chết Giơ tay'
    },
    {
      id: 8,
      image:
        'https://www.galaxycine.vn/media/2019/10/24/450x300_1571883677518.png',
      longtime: 100,
      name: 'Khun Phaen Huyền Thoại Bắt Đầu'
    }
  ]);
});
// Lấy danh sách bình luận phim
router.get('/listComments', (req: Request, res: Response) => {
  return res.json([
    {
      id: 1,
      images:
        'https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',
      title: '[Preview] Frozen 1: Đại Náo Phòng Vé, Tiến Thẳng Oscar?',
      descriptions:
        'Trở lại sau sáu năm, Disney lần nữa quyết tâm tạo nên cơn bão tuyết chấn động toàn cầu!',
      fullDes: 'Test'
    },
    {
      id: 2,
      images:
        'https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',
      title: '[Preview] Frozen 2: Đại Náo Phòng Vé, Tiến Thẳng Oscar?',
      descriptions:
        'Trở lại sau sáu năm, Disney lần nữa quyết tâm tạo nên cơn bão tuyết chấn động toàn cầu!',
      fullDes: 'Test'
    },
    {
      id: 3,
      images:
        'https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',
      title: '[Preview] Frozen 3: Đại Náo Phòng Vé, Tiến Thẳng Oscar?',
      descriptions:
        'Trở lại sau sáu năm, Disney lần nữa quyết tâm tạo nên cơn bão tuyết chấn động toàn cầu!',
      fullDes: 'Test'
    }
  ]);
});
// Lấy danh sách block điện ảnh
router.get('/listBlockMovies', (req: Request, res: Response) => {
  return res.json([
    {
      id: 1,
      images:
        'https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',
      title: '[Preview] Frozen 1: Đại Náo Phòng Vé, Tiến Thẳng Oscar?',
      descriptions:
        'Trở lại sau sáu năm, Disney lần nữa quyết tâm tạo nên cơn bão tuyết chấn động toàn cầu!',
      fullDes: 'Test'
    },
    {
      id: 2,
      images:
        'https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',
      title: '[Preview] Frozen 2: Đại Náo Phòng Vé, Tiến Thẳng Oscar?',
      descriptions:
        'Trở lại sau sáu năm, Disney lần nữa quyết tâm tạo nên cơn bão tuyết chấn động toàn cầu!',
      fullDes: 'Test'
    },
    {
      id: 3,
      images:
        'https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',
      title: '[Preview] Frozen 3: Đại Náo Phòng Vé, Tiến Thẳng Oscar?',
      descriptions:
        'Trở lại sau sáu năm, Disney lần nữa quyết tâm tạo nên cơn bão tuyết chấn động toàn cầu!',
      fullDes: 'Test'
    }
  ]);
});
// Lấy danh sách khuyến mãi
router.get('/listPromotions', (req: Request, res: Response) => {
  return res.json([
    {
      id: 1,
      images:
        'https://galaxycine.vn/media/2019/10/17/300x450_1571284868886.jpg',
      title: 'Xem Phim Thong Thả - Rôm Rả Nhận Sừng',
      descriptions:
        'Rủ rê hội chị em đến Galaxy Cinema để nhận quà và chính thức hóa thân thành Tiên Hắc Ám quý phái cool ngầu hết nấc'
    },
    {
      id: 2,
      images: 'https://galaxycine.vn/media/2019/9/30/300x450_1569837068015.jpg',
      title: 'Xem Phim Thong Thả - Rôm Rả Nhận Sừng',
      descriptions:
        'Rủ rê hội chị em đến Galaxy Cinema để nhận quà và chính thức hóa thân thành Tiên Hắc Ám quý phái cool ngầu hết nấc'
    },
    {
      id: 3,
      images:
        'https://galaxycine.vn/media/2019/9/30/300x450-1560498889489-1569464458710_1569829520993.jpg',
      title: 'Xem Phim Thong Thả - Rôm Rả Nhận Sừng',
      descriptions:
        'Rủ rê hội chị em đến Galaxy Cinema để nhận quà và chính thức hóa thân thành Tiên Hắc Ám quý phái cool ngầu hết nấc'
    },
    {
      id: 4,
      images: 'https://galaxycine.vn/media/2019/10/7/300x450_1570435292622.jpg',
      title: 'Xem Phim Thong Thả - Rôm Rả Nhận Sừng',
      descriptions:
        'Rủ rê hội chị em đến Galaxy Cinema để nhận quà và chính thức hóa thân thành Tiên Hắc Ám quý phái cool ngầu hết nấc'
    }
  ]);
});
// Lấy chi tiết phim theo id của nó
router.get('/getMoviesDetail', (req: Request, res: Response) => {
  const { id, title } = req.query;
  console.log(id, title);
  return res.json({
    id: 1,
    image:
      'https://www.galaxycine.vn/media/2019/10/31/450x300_1572489577169.png',
    longtime: 120,
    name: 'Kẻ hủy diệt: Vận Mệnh Đen Tối',
    star: 4.5,
    rating: 8.8
  });
});
