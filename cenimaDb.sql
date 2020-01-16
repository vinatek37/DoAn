/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.8-MariaDB : Database - cenima
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cenima` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cenima`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`) values 
(1,'Hành động'),
(2,'Tâm lý'),
(3,'Tình cảm'),
(4,'Cổ trang'),
(5,'Kinh dị'),
(6,'Phiêu lưu, thần thoại');

/*Table structure for table `event_adv` */

DROP TABLE IF EXISTS `event_adv`;

CREATE TABLE `event_adv` (
  `movie_id` int(11) NOT NULL,
  `image_banner` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `event_adv_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `event_adv` */

insert  into `event_adv`(`movie_id`,`image_banner`) values 
(2,'https://s3img.vcdn.vn/123phim/2019/11/charlie-s-15749707889583.jpg'),
(3,'https://s3img.vcdn.vn/123phim/2019/11/knives-out-15750112434746.jpg'),
(4,'https://s3img.vcdn.vn/123phim/2019/11/khun-15736347918272.jpg'),
(7,'https://s3img.vcdn.vn/123phim/2019/12/ccee-15764920842490.jpg'),
(11,'https://s3img.vcdn.vn/123phim/2019/12/fvf-15756028253149.jpg'),
(18,'https://s3img.vcdn.vn/123phim/2019/12/ke-du-hanh-15761286853539.jpg');

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `release_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_date` timestamp NULL DEFAULT current_timestamp(),
  `directors` varchar(200) DEFAULT NULL,
  `cast` varchar(200) DEFAULT NULL,
  `about` varchar(500) DEFAULT NULL,
  `nation` varchar(200) DEFAULT NULL,
  `thumb_image` varchar(200) DEFAULT NULL,
  `url_trailler` varchar(200) DEFAULT NULL,
  `url_full` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `movie` */

insert  into `movie`(`id`,`category_id`,`name`,`language`,`duration`,`release_date`,`end_date`,`directors`,`cast`,`about`,`nation`,`thumb_image`,`url_trailler`,`url_full`,`age`) values 
(1,2,'Anh trai yêu quái','Tiếng Việt',106,'2019-12-05 01:32:09','2020-11-16 08:05:34','Vũ Ngọc Phượng','Kiều Minh Tuấn, Isaac, Diệu Nhi, Phi Phụng','Nội dung phim kể về Lâm và Phong, hai anh em cùng cha khác mẹ. Do bị chấn thương trong lúc thi đấu Judo nên Lâm bị mất thị giác. Lúc này Phong ở trong tù nên đã tranh thủ cơ hội xin ân xá để về chăm sóc em trai. Những mâu thuẫn và tình huống hài hước đã xảy ra khi hai người sống chung một nhà.','Việt Nam','https://s3img.vcdn.vn/mobile/123phim/2019/10/anh-trai-yeu-quai-dear-devil-brother-c13-15723265880488_215x318.jpg','https://www.youtube.com/embed/mXfLnR-cmp0?autoplay=1','https://youtu.be/mXfLnR-cmp0',13),
(2,1,'Cuộc Đua Lịch Sử - Ford v Ferrari','Tiếng Anh với phụ đề tiếng Việt',155,'2019-12-05 01:27:05','2020-11-16 08:05:34','James Mangold','Christian Bale, Matt Damon','Sự trợ lại của hai ngôi sao Christian Bale và Matt Damon trong dự án thú vị mới của đạo diễn James Mangold (đạo diễn của LOGAN). Phim lấy bối cảnh đường đua Le Mans 1966, kể về cuộc cạnh tranh gắt gao giữa hai hãng xe hàng đầu thế giới. Trước sự thống trị của Ferrari, hãng Ford quyết định chiêu mộ nhóm kỹ sư do huyền thoại Carroll Shelby (Damon) đứng đầu, cùng tay đua kiệt xuất Ken Miles (Bale) để chế tạo ra một mẫu xe đua mang tính cách mạng nhằm đánh bại đối thủ Ferrari.','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/11/cuoc-dua-lich-su-ford-v-ferrari-15729246407428_215x318.jpg','https://www.youtube.com/embed/zyYgDtY2AMY?autoplay=1','https://www.youtube.com/watch?v=zyYgDtY2AMY&feature=youtu.be',16),
(3,1,'Kẻ Đâm Lén - Knives Out','Tiếng Anh với phụ đề tiếng Việt',135,'2019-12-05 01:32:09','2020-11-16 08:05:34','Rian Johnson','Michael Shannon, Toni Collette, Chris Evans, Daniel Craig','Nhân dịp sinh nhật lần thứ 85 của mình, tiểu thuyết gia trinh thám nổi tiếng Harlan Thombrey đã tổ chức một buổi tiệc với đông đủ các thành viên trong gia đình. Tuy nhiên, ông Harlan bất ngờ qua đời ngay trong ngày hôm đấy. Thám tử Benoit Blanc được cử đến để điều tra vụ án và tất cả mọi người trong gia đình đều trở thành nghi phạm. Vậy trong ngôi nhà nhiều thế hệ này, ai mới chính là ‘Kẻ Đâm Lén’?','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/11/ke-dam-len-knives-out-c13-15734466941223_215x318.jpg','https://www.youtube.com/embed/PdHlnVZV6Gc?autoplay=1','https://www.youtube.com/watch?v=PdHlnVZV6Gc&feature=youtu.be',16),
(4,6,'Nữ Hoàng Băng Giá 2 - Frozen II','Tiếng Anh với phụ đề tiếng Việt',103,'2019-12-05 01:35:12','2020-11-16 08:05:34','Jennifer Lee, Chris Buck','Alan Tudyk, Jonathan Groff, Kristen Bell, Idina Menzel','Cùng dấn thân vào một cuộc phiêu lưu xa xôi thú vị, hai chị em Anna và Elsa đi đến chốn rừng sâu để tìm kiếm sự thật về bí ẩn cổ xưa của vương quốc mình. Tất cả những gì Anna & Elsa biết về bản thân, lịch sử và gia đình của họ đều bị thử thách khi họ bị cuốn vào một chuyến đi đầy quả cảm đến với vùng đất phía bắc bí ẩn ngoài Arendelle được báo trước.','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/11/nu-hoang-bang-gia-2-frozen-2-15737068618020_215x318.jpg','https://www.youtube.com/embed/5tDRh-68TvY?autoplay=1','https://www.youtube.com/watch?v=5tDRh-68TvY&feature=youtu.be',0),
(6,1,'21 Cây Cầu - 21 Bridges','Tiếng Anh với phụ đề tiếng Việt',99,'2019-12-05 01:58:49','2020-11-16 08:05:34','Brian Kirk','J.K. Simmons, Sienna Miller, Chadwick Boseman','Sau một loạt cái chết bí ẩn của các cảnh sát tại New York bị giết chết bí ẩn, thanh tra Andre Davis điều tra và phát hiện ra âm mưu khủng khiếp của một băng đảng khát máu. Để bắt được chúng, Andre Davis đã khẩn cầu chính quyền đóng cửa toàn bộ 21 cây cầu, khiến cả hòn đảo Manhattan nội bất xuất ngoại bất nhập.','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/11/21-cay-cau-21-bridges-15731184904702_215x318.jpg','https://www.youtube.com/embed/mzb-ZO0YdcQ?autoplay=1','https://www.youtube.com/watch?v=mzb-ZO0YdcQ&feature=youtu.be',18),
(7,2,'Chị chị em em','Tiếng Việt',104,'2019-12-16 10:06:59','2020-11-16 08:05:34','Kathy Uyên','Kathy Uyên, Lãnh Thanh, Chi Pu, Thanh Hằng','Chị Chị Em Em là một bộ phim tâm lý - giật gân khai thác câu chuyện yêu - hận - tình thù bí ẩn và lôi cuốn xoay quanh hai người phụ nữ xinh đẹp - Thiên Kim và Bảo Nhi. Chạm mặt nhau trong một trò chơi mà chỉ có một người được thắng, khi hạnh phúc của tổ ấm nhỏ sắp bị bão tố cuốn phăng, liệu ai sẽ quyết liệt đấu tranh giành lấy điều mình muốn và ai sẽ cam chịu để giữ lấy sự ấm êm? Và rồi tại những phút giây cuối cùng khi tưởng chừng như mọi việc đã ngã ngũ, một cú lừa bất ngờ bỗng được tạo nên… t','Việt Nam','https://s3img.vcdn.vn/mobile/123phim/2019/11/chi-chi-em-em-sister-sister-c18-15747394235000_215x318.jpg','https://www.youtube.com/embed/0lA5BJuiVGU?autoplay=1','https://www.youtube.com/watch?v=0lA5BJuiVGU&feature=youtu.be',18),
(8,1,'Mắt biếc','Tiếng Việt',117,'2019-12-16 10:10:20','2020-11-16 08:05:34','Victor Vũ','Khánh Vân, Trần Phong, Trúc Anh, Trần Nghĩa, Victor Vũ','Mắt biếc xoay quanh mối tình đơn phương của Ngạn với Hà Lan, cô bạn gái có cặp mắt hút hồn nhưng cá tính bướng bỉnh. Một chuyện tình nhiều cung bậc, từ ngộ nghĩnh trẻ con, rồi tình yêu thuở học trò trong sáng, trải qua bao biến cố, trở thành một cuộc “đuổi hình bắt bóng” buồn da diết nhưng không nguôi hi vọng. Câu chuyện càng trở nên éo le hơn khi Trà Long - con gái của Hà Lan, lớn lên lại nhen nhóm một tình yêu như thế với Ngạn…','Việt Nam','https://s3img.vcdn.vn/mobile/123phim/2019/11/mat-biec-15749107627211_215x318.jpg','https://www.youtube.com/embed/KSFS0OfIK2c?autoplay=1','https://www.youtube.com/watch?v=KSFS0OfIK2c&feature=youtu.be',16),
(9,1,'Những Thiên Thần của Charlie','Tiếng Anh với phụ đề tiếng Việt',118,'2019-12-06 02:18:27','2020-11-16 08:05:34','Elizabeth Banks','Naomi Scott, Naomi Watts, Kristen Stewart, Elizabeth Banks','Elizabeth Banks sẽ chỉ huy thế hệ tiếp theo của các Thiên Thần: Kristen Stewart, Naomi Scott, và Ella Balinska - để làm việc cho Charles Townsend bí ẩn. Những Thiên Thần của Charlie luôn sở hữu các kỹ năng điều tra và giữ bảo mật cho những khách hàng tư nhân; và Townsend đã mở rộng chi nhánh ra quốc tế với đội ngũ “nữ chiến binh” thông minh, gan dạ, được đào tạo bài bản bởi nhiều huấn luyện viên chuyên nghiệp trên toàn cầu. Khi được cảnh báo về một công nghệ có nguy cơ đe doạ đến toàn nhân loại,','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/08/nhung-thien-than-cua-charlie-charlie-s-angels-15668240510626_215x318.jpg','https://www.youtube.com/embed/yecv7dLVkYk?autoplay=1','https://www.youtube.com/watch?v=yecv7dLVkYk&feature=youtu.be',16),
(10,2,'Vùng Đất Thây Ma: Cú Bắn Đúp','Tiếng Anh với phụ đề tiếng Việt',95,'2019-12-06 02:18:27','2020-11-16 08:05:34','Ruben Fleischer','Abigail Breslin, Jesse Eisenberg, Woody Harrelson, Gemma Atkinson','Sau 10 năm dài đẵng đằng, Zombieland 2 đã chính thức trở lại với mốc thời gian 10 năm tương tự ngoài thực tế. Double Tap tiếp tục xoay quanh nhóm nhân vật chính lầy lội gồm: Columbus  - thanh niên mọt sách nhút nhát luôn trung thành theo bộ nguyên tắc sinh tồn do cậu đề ra, gã “Sát thủ Zombie” Tallahassee cao ngạo bị nghiện món bánh Twinkie cùng hai chị em lừa lọc Wichita - Little Rock. Nhằm tìm kiếm các tập thể người vẫn còn sống sót, bọn họ đã quyết định “đi phượt” tới trung tâm hành chính của','Mỹ','https://s3img.vcdn.vn/123phim/2019/11/terminator-dark-fate-phim-hanh-dong-nghet-tho-toi-muc-can-thuoc-tro-tim-15726001287898.jpg','https://www.youtube.com/embed/K1-11dWJocM?autoplay=1','https://www.youtube.com/watch?time_continue=4&v=ZlW9yhUKlkQ',15),
(11,2,'Kẻ du hành trên mây','Tiếng Anh với phụ đề tiếng Việt',103,'2019-12-16 10:15:46','2020-11-16 08:05:34','Tom Harper','Himesh Patel, Eddie Redmayne, Felicity Jones','Dựa trên nhiều sự kiện có thật, KẺ DU HÀNH TRÊN MÂY khắc họa chuyến hành trình trên khinh khí cầu vươn tới độ cao kỷ lục chưa ai từng đạt được của nhà khoa học James Glaisher, thuộc viện Khoa học Hoàng Gia Anh cùng người cộng sự Amelia Wren - nữ phi công điều khiển khinh khí cầu chuyên nghiệp hiếm hoi của Vương quốc Anh Thế kỷ 19. Với James Glaisher, chân lý của anh là khoa học, vươn tới được những đám mây xa xăm kia, anh có thể thay đổi cuộc sống của hàng triệu người. Còn với Amelia, bầu trời','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/11/ke-du-hanh-tren-may-the-aeronauts-c13-15748399290832_215x318.jpg','https://www.youtube.com/embed/sgIzJneqsBY?autoplay=1','https://youtu.be/sgIzJneqsBY',13),
(12,2,'Pháp Sư Mù: Ai Chết Giơ Tay','Tiếng Việt',120,'2019-12-06 02:18:25','2020-11-16 08:05:34','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','https://s3img.vcdn.vn/123phim/2019/11/terminator-dark-fate-phim-hanh-dong-nghet-tho-toi-muc-can-thuoc-tro-tim-15726001287898.jpg','https://www.youtube.com/embed/K1-11dWJocM?autoplay=1','https://youtu.be/t7srZZh9lxY',18),
(13,2,'Pháp Sư Mù: Ai Chết Giơ Tay','Tiếng Việt',120,'2019-12-06 02:18:25','2020-11-16 08:05:34','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','https://s3img.vcdn.vn/123phim/2019/11/terminator-dark-fate-phim-hanh-dong-nghet-tho-toi-muc-can-thuoc-tro-tim-15726001287898.jpg','https://www.youtube.com/embed/K1-11dWJocM?autoplay=1','https://youtu.be/t7srZZh9lxY',18),
(14,2,'Pháp Sư Mù: Ai Chết Giơ Tay','Tiếng Việt',120,'2019-12-06 02:18:25','2020-11-16 08:05:34','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','https://s3img.vcdn.vn/123phim/2019/11/terminator-dark-fate-phim-hanh-dong-nghet-tho-toi-muc-can-thuoc-tro-tim-15726001287898.jpg','https://www.youtube.com/embed/K1-11dWJocM?autoplay=1','https://youtu.be/t7srZZh9lxY',18),
(18,2,'Tom và jerry','Tiếng Việt',129,'2019-12-16 09:16:37',NULL,'Kim Jin','Tom, Jerry','Hoạt Hình','Việt Nam',NULL,NULL,NULL,16);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(5000) DEFAULT NULL,
  `move_id` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `type` int(1) DEFAULT 1 COMMENT '1 = Khuyen mai. 2 = Review. 3 = TinTuc24h',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`image`,`move_id`,`create_at`,`type`) values 
(1,'Siêu phẩm hoạt hình Trung Quốc - Na Tra: Ma Đồng Giáng Thế chính thức đổ bộ phòng chiếu Vi','Từ đầu tháng 8 năm nay, giới mộ điệu đã xôn xao về một hiện tượng điện ảnh chưa từng có trong lịch sử. Bộ phim hoạt hình Na Tra: Ma Đồng Giáng Thế -câu chuyện cải biên đầy phá cách về một nhân vật đặc trưng trong văn hóa Trung Quốc đã tạo nên một cơn sốt tại phòng vé nội địa đồng thời nhận được vô số lời khen từ khán giả cũng như các nhà phê bình.\r\nPhim lần lượt xô đổ hàng loạt kỷ lục doanh thu khủng nhất Trung Quốc như Phim hoạt hình Trung Quốc có doanh thu cao nhất mọi thời đại, Phim hoạt hình có doanh thu tại một thị trường cao nhất thế giới,... Tính đến hết ngày 31.08, Na Tra: Ma Đồng Giáng Thế đã chạm mốc doanh thu 4,655 tỷ NDT (hơn 15 nghìn tỷ đồng), trở thành Phim điện ảnh doanh thu cao nhất năm 2019 tại Trung Quốc, đồng thời soán ngôi bom tấn Chiến Lang 2 của đạo diễn Ngô Kinh để trở thành tác phẩm có doanh thu cao thứ hai lịch sử điện ảnh nước này (chỉ xếp sau Lưu Lạc Địa Cầu).\r\nTrailer chính thức của phim.\r\nTác phẩm hoạt hình làm nên kỳ tích này xoay quanh Na Tra - nhân vật thần thoại vốn đã rất quen thuộc với khán giả Trung Quốc và cả châu Á. Chuyện kể rằng thuở hồng hoang, tinh hoa đất trời hội tụ thành một viên ngọc chứa đựng năng lượng khổng lồ. Nguyên Thủy Thiên Tôn đã phân tách viên ngọc này thành 1 viên Linh Châu và 1 viên Ma Hoàn.\r\nViên Linh Châu sẽ đầu thai thành một anh hùng cứu thế, phò trợ nhà Chu. Trong khi đó, Ma Hoàn sẽ tạo ra một Ma Vương tàn sát thiên hạ. Viên Ma Hoàn sinh ra Na Tra - con trai vị tướng biên ải Lý Tịnh, còn Linh Châu sinh ra Ngao Bính - Tam thái tử gánh trọng trách phục hưng long tộc của Đông Hải Long Vương.\r\nPhim sẽ tập trung vào quan hệ của Na Tra và Ngạo Bính.\r\nĐể ngăn chặn thảm họa khi Ma Hoàn chuyển thế, Nguyên Thủy Thiên Tôn đã hạ chú để sau 3 năm, Ma Vương cũng tức là Na Tra sẽ bị sấm chớp của thiên kiếp tiêu diệt. Na Tra - đứa trẻ yêu ma bị làng tộc ghét bỏ sẽ phải đơn độc đối đầu với thiên mệnh để thoát khỏi án tử trớ trêu.\r\nTrong Na Tra: Ma Đồng Giáng Thế, khán giả sẽ được gặp lại những nhân vật quen thuộc khác trong Phong Thần Diễn Nghĩa như vợ chồng Lý Tịnh - Ân Thị, Ngao Bính, Thân Công Báo, Thái Ất Chân Nhân,…\r\nSư phụ của Na Tra - Thái Ất Chân Nhân và phản diện Thân Công Báo - Sư phụ của Ngao Bính trong phiên bản này.\r\nTrong truyền thuyết Trung Quốc cũng như đa số xuất phẩm điện ảnh từng ra mắt, Na Tra thường được miêu tả có dung mạo khôi ngô, tuấn tú. Tay phải Na Tra cầm Hỏa Tiêm Thương, tay trái cầm Càn Khôn Khuyên, vai đeo dải lụa Hỗn Thiên Lăng, chân đi bánh xe Phong Hoả Luân, từ khi nhỏ tuổi đã mang thần sắc phi phàm của một vị thiên tướng.\r\nNhưng Na Tra: Ma Đồng Giáng Thế lại mang tới một hình tượng Na Tra hoàn toàn khác biệt. Cậu bé sinh ra từ viên Ma Hoàn lần này có đôi mắt thâm quầng và dáng vẻ ngỗ nghịch bất trị, được nhận xét là Na Tra xấu xí nhất lịch sử.','https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',1,'2019-11-15 08:19:23',3),
(2,'4 sự khác biệt thú vị giữa bản điện ảnh và nguyên tác gốc của Doctor Sleep','Nhắc đến những tác phẩm kinh dị đầu thập niên 80, không ai là không nghĩ ngay đến tuyệt phẩm kinh dị The Shining do Stanley Kubrick làm đạo diễn. Dù được đánh giá là một trong những bộ phim kinh dị xuất sắc nhưng tác phẩm lại bị cha đẻ nguyên tác, \"ông hoàng kinh dị\" Stephen King chê bai thậm tệ vì đã thay đổi quá nhiều tình tiết, khiến tinh thần chính của câu chuyện cũng bị bóp méo.\r\nCho đến năm nay, khi Doctor Sleep (tựa Việt: Doctor Sleep: Ký Ức Kinh Hoàng) ra mắt, tác phẩm đã được Stephen King đón nhận một cách nồng nhiệt. Phần phim tiếp nối bản 1980, cũng vừa là chuyển thể điện ảnh cho hậu truyện The Shining, ngoài viễ đã xuất sắc trung thành sát sao với chất liệu nền tảng, lại còn sở hữu những yếu tố hấp dẫn thu hút khán giả hiện đại.\r\n\r\nTuy nhiên, việc chuyển tải toàn bộ tiểu thuyết thành một tác phẩm điện ảnh dài hơn 150 phút là điều không hề dễ dàng nên thay đổi là điều không thể tránh khỏi. Vậy làm thế nào, để đạo diễn Mike Flanagan vừa thành công chuyển thể, vừa thoải mái phát triển mà lại còn để tri ân The Shining của Stanley Kubrick, cùng điểm qua những thay đổi \"nhè nhẹ\" giữa bản điện ảnh và nguyên tác gốc của Doctor Sleep.\r\n\r\nDanny Torrance - Abra Stone: Ruột thịt trong truyện, người dưng trên phim\r\n\r\nTrong nguyên tác, có một phân đoạn nhân vật Danny đi tìm bà ngoại của Abra và phát hiện rằng mẹ của Abra là con ngoài giá thú của cha anh - Jack Torrance và cũng là em gái cùng cha khác mẹ của Danny. Điều này đồng nghĩa với việc Dan và Abra là thực sự là hai cậu - cháu ruột thịt.\r\nĐến khi lên màn ảnh rộng, chi tiết này không được nhắc đến. Song, Abra thường gọi Dan bằng một danh xưng thân mật là “chú Dan”, như để gợi nhắc đến người xem về mối quan hệ của cả hai trong tiểu thuyết.\r\n\r\nLý do hội True Knot săn lùng cô bé Abra\r\n\r\nTừ truyện lên màn ảnh, phe phản diện là những kẻ trở nên trường sinh nhờ hút sinh khí từ những đứa trẻ “dị biệt” có khả năng shining, “thấu thị” giống mình.\r\n\r\nTrong tiểu thuyết, chúng đã gặp xui khi hút sự sống của một nạn nhân mang căn bệnh hiểm nghèo. Kết quả là cả bọn đều bị nhiễm bệnh và thủ lĩnh Rose the Hat cho rằng sinh khí từ cô bé Abra đủ mạnh mẽ để chữa lành cho cả nhóm True Knot.\r\nBản điện ảnh thì chi tiết này đã được loại bỏ hoàn toàn để giúp mạch phim đỡ rối. Thay vào đó, Rose the Hat (do Rebecca Ferguson thủ vai) nhận thấy rằng năng lượng, sự sống của cô bé Abra quá mạnh mẽ, một ngày nào đó sẽ vượt qua cả ả. Khi sự ghen tức cũng như bản năng sinh tồn trỗi dậy, lũ dị nhân độc ác quyết tâm săn lùng cô bé trước khi quá trễ. \r\n\r\nKhác biệt về bối cảnh\r\n\r\nTheo tiểu thuyết của \"ông hoàng kinh dị\", khách sạn Overlook - nơi diễn ra sự kiện The Shining nay đã không còn nữa, mà thay vào đó là địa điểm cắm trại của True Knot. Vì thế nếu như trong phim chúng phải lái xe qua những đường đèo hiểm trở và xa xăm để đụng mặt hai nhân vật chính, thì ở bản gốc, chúng chiến đấu trên chính “sân nhà” của mình.\r\nCòn phiên bản năm 1980, khách sạn chỉ bị chôn vùi trong bão tuyết mà thôi. Việc để khách sạn Overlook tiếp tục được tồn tại trong bản phim vừa là sự kết nối với tác phẩm của đạo diễn Stanley Kubrick, cũng là một cách tri ân của Mike Flanagan dành cho bậc tiền bối. Cũng từ đây, fan của The Shining có dịp hồi tưởng hành lang ô vuông đỏ, góc đèn chùm tự bật sáng và quầy bar nơi người pha chế rượu thoắt ẩn thoắt hiện. Những “gương mặt thân quen” của khách sạn cũng có dịp trở lại, hù dọa kẻ ngoại đạo như Rose the Hat một phen ra trò.\r\n\r\nThay đổi ở đoạn kết\r\n\r\nBản tiểu thuyết hậu truyện đã dành nhiều thời gian để Dan tha thứ cho người cha quá cố của mình. Trong The Shining, Jack Torrance hóa điên mà cầm rìu rượt đuổi vợ con. Thì trong truyện Doctor Sleep, chính linh hồn ông đã trở về giúp cậu con trai nay đã lớn khôn chống lại những kẻ thù mới. Ở bản truyện, Jack đã có dịp mỉm cười từ biệt Danny.\r\n\r\nĐến phiên bản điện ảnh, nhân vật Jack Torrance tuy có xuất hiện, nhưng lại trở thành nỗi ám ảnh mà Danny phải vượt qua. Thay vào đó, những người giúp anh lại chính là các hồn ma khách sạn, từ ma nữ khỏa thân trong bồn tắm, vị quản gia trầm lặng, cho đến cặp đôi song sinh,... Rose the Hat đã quá ngu muội khi quyết định mở những “chiếc hộp chứa ma quỷ” trong đầu Danny.\r\nĐồng thời nếu đoạn kết của bản điện ảnh, khi Danny quyết định hy sinh trong lò hơi nước, thì ở nguyên tác, Danny có một cái kết viên mãn, sống khỏe mạnh, cai hẳn được rượu và kịp đến dự buổi tiệc sinh nhật 15 tuổi của Abra Stone.\r\n\r\nChính cái kết của Mike Flanagan đã khiến Doctor Sleep: Ký Ức Kinh Hoàng được đánh giá cao. Trong phim The Shining, khách sạn Overlook bị chôn vùi trong bão tuyết và trong tác phẩm năm 2019, Danny quyết định thiêu rụi cả khách sạn, thanh tẩy nó. Hai bộ phim, hai cái kết của băng và lửa mang ý nghĩa sự kết thúc và khởi đầu.\r\nNhìn chung, phiên bản điện ảnh do Mike Flanagan cầm trịch đã hài hòa giữa chất liệu nguyên bản, đồng thời cũng khéo léo chiều chuộng fan của The Shining ngày trước. Một trong những giá trị nhân văn lớn nhất của phim vẫn là việc Danny vượt qua những cơn ác mộng trong quá khứ để trưởng thành và trở thành một con người tốt đẹp hơn.\r\n\r\nXét về phương diện giải trí, đây vẫn là một tác phẩm điện ảnh hoàn toàn thỏa mãn được kỳ vọng của đại chúng, xứng đáng là “người cầm đuốc” thừa hưởng cơn sốt thành công từ hai phần phim kinh dị It - cũng là một bộ phim chuyển thể từ \"ông hoàng kinh dị\" Stephen King.','https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',2,'2019-11-16 08:20:40',1),
(3,'Đầu năm 2020, Ju-On sẵn sàng chào đón bạn tại phòng chiếu Việt','Ra mắt từ năm 2002, Ju-On nhanh chóng trở thành một trong những loạt phim kinh dị Nhật Bản ghê rợn nhất mọi thời đại. Trải qua 5 phần phim Nhật và 3 phần phim Mỹ, thì vào đầu năm 2020, khán giả sẽ tiếp tục được hù doạ bởi một phiên bản The Grudge hoàn toàn mới, ghê rợn hơn, hồi hộp hơn. Sau 11 năm vắng bóng trên màn ảnh rộng, thương hiệu này đã trở lại và tiếp tục nhiệm vụ, gieo rắc nỗi kinh hoàng cho khán giả trên toàn thế giới.\r\nLời nguyền ghê rợn bậc nhất màn ảnh rộng\r\n\r\nThe Grudge lấy ý tưởng từ truyền thuyết dân gian Nhật Bản nổi tiếng về linh hồn báo thù. Một lời nguyền đáng sợ sẽ ra đời khi một ai đó chết trong cơn thịnh nộ hay nỗi oán hận không dứt. Bất kỳ người nào gặp phải hay bước vào nơi thế lực ma quái này ám sẽ nhận phải cái chết kinh hoàng.\r\n\r\nTừ đó, lời nguyền sẽ lặp đi lặp lại, truyền từ nạn nhân này sang nạn nhân khác và tạo thành chuỗi kinh hoàng không bao giờ dứt.\r\nTrong phần phim năm 2004, bà nội trợ Kayako ở Tokyo đã phải lòng một giảng viên đại học và viết vào trong nhật ký. Người chồng Takeo phát hiện ra và nghi ngờ vợ ngoại tình nên đã giết cô cùng đứa con trai Toshio và con mèo Mar một cách tàn bạo. Từ đó, linh hồn của Kayako và Toshio ám lấy căn nhà và giết bất kỳ ai vô tình bước chân vào đây. Phiên bản The Grudge (2020) sẽ tiếp tục lấy bối cảnh song song với các sự kiện trong phần phim cùng tên.\r\n\r\nTrailer ám ảnh với những hình ảnh rùng rợn\r\n\r\nTrailer đầu tiên dài hơn 2 phút đã đủ khiến khán giả phải “sởn tóc gáy”. Nhận được thông báo từ chàng nhân viên môi giới nhà đất Peter Spencer (John Cho), nữ thám tử Muldoon (Andrea Riseborough) phát hiện ra một vụ án mạng kinh hoàng trong căn nhà hoang. Tuy nhiên, những người đồng nghiệp của cô chưa bao giờ dám bước chân vào đó vì cảm giác sợ hãi đến kỳ lạ.\r\nChưa dừng lại ở đó, họ dần chứng kiến thêm nhiều vụ giết người ghê rợn có liên quan đến ngôi nhà bí ẩn kia. Ngay khi bước chân vào căn nhà cũng là lúc Muldoon nhận ra bản thân đã trúng phải lời nguyền chết chóc dù cô trốn chạy đến đâu đi chăng nữa.\r\n\r\nTừ đây, cả trailer đã “chiêu đãi” khán giả hàng loạt cảnh hù dọa đứng tim với tạo hình con ma đáng sợ với mái tóc rũ rượi, gương mặt cứng đờ vì kinh hãi và cơ thể méo mó, bò sát trên mặt đất hay vách tường.\r\nPhần âm thanh chói tai với tiếng kim đồng hồ tíc tắc như cái chết đang cận kề hay tiếng kêu răng rắc đến ám ảnh đặc trưng của thương hiệu sẽ làm những ai yếu bóng vía khó ngủ.\r\n\r\nVới sự trở lại của Sam Raimi trong vai trò sản xuất cùng đạo diễn trẻ Nicolas Pesce và hàng loạt ngôi sao gắn với dòng phim kinh dị như Andrea Riseborough, John Cho và Lin Shaye, The Grudge chắc chắn sẽ là phim kinh dị đáng sợ bậc nhất vào đầu năm 2020.','https://galaxycine.vn/media/2019/10/17/mv5bmgqxnzmwmtutywm5zc00ngjjlwewzdytmde3odu3mza3mdkxxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1571300074870.jpg',3,'2019-11-17 08:22:13',2),
(4,'Sau 10 ngày khởi chiếu, Joker đã thu về gần 60 tỷ đồng','Joker là phim điện ảnh đầu tiên lấy hình tượng nhân vật phản diện Joker làm trung tâm, cũng là tác phẩm đầu tiên khán giả biết đến nguồn gốc của gã hề (theo cách riêng của đạo diễn Todd Phillips). Chính vì thế, bộ phim đã thu hút sự tò mò của khán giả đại chúng từ những ngày đầu tiên thông báo dự án.\r\nVới sự đầu tư tâm huyết, nhạc phim xuất sắc, góc quay tuyệt vời kết hợp với màn diễn xuất đỉnh cao của Joaquin Phoenix, Joker đã chiến thắng ở hạng mục Phim hay nhất tại Liên hoan phim Venice 2019, mang về giải thưởng Sư tử vàng và hứa hẹn là một trong những ứng cử viên sáng giá trên đường đua đến Oscar 2020. Cũng chính vậy, sức hút và thành tích doanh thu ấn tượng của phim không phải là điều gì khó hiểu.\r\nRa mắt chính thức từ 04.10, tổng doanh thu toàn cầu tính đến thời điểm hiện tại đã cán mốc 543,9 triệu USD, vượt qua con số 519,9 triệu USD của How to Train Your Dragon: The Hidden World và nằm trong Top 10 bộ phim ăn khách nhất 2019. Với ngân sách chỉ vỏn vẹn 55 triệu USD, Joker quả thực là một chiến thắng đáng tự hào của hãng phim Warner Bros. cũng như nhà DC trong năm 2019 này.\r\nTại thị trường nội địa Bắc Mỹ, phim vẫn đang càn quét phòng vé, giữ vững ngôi vương với doanh thu đạt 192,7 triệu USD. Và dù không được chiếu tại thị trường Trung Quốc, doanh thu quốc tế của Joker cũng đã lên tới 351,2 triệu USD. Dẫn đầu là Hàn Quốc với 16,2 triệu USD, theo sau là thị trường Anh với 15,5 triệu USD và Mexico với 13,5 triệu USD.\r\nTại Việt Nam, dù đã bước sang đến tuần thứ 2 nhưng Joker hiện vẫn xuất sắc giữ vững vị trí số một bảng xếp hạng doanh thu phòng vé. Phim đã ghi nhận 800.000 lượt khán giả ra rạp. Tổng doanh thu đã đạt khoảng 60 tỷ đồng.\r\nJoker hiện vẫn đang được chiếu tại các cụm rạp trên toàn quốc.','https://galaxycine.vn/media/2019/11/14/450x300-chi-chi-em-em-222_1573701637354.jpg',1,'2019-11-23 08:23:14',1),
(5,'Xem Phim Thong Thả - Rôm Rả Nhận Sừng','Rủ rê hội chị em đến Galaxy Cinema để nhận quà và chính thức hóa thân thành Tiên Hắc Ám quý phái cool ngầu hết nấc','https://galaxycine.vn/media/2019/10/17/300x450_1571284868886.jpg',3,'2019-11-17 08:23:14',5),
(6,'Bình tĩnh tự tin','Rủ rê hội chị em đến Galaxy Cinema để nhận quà và chính thức hóa thân thành Tiên Hắc Ám quý phái cool ngầu hết nấc','https://galaxycine.vn/media/2019/9/30/300x450_1569837068015.jpg',3,'2019-11-17 08:23:14',5),
(7,'Xem Phim Thong Thả - Rôm Rả Nhận Sừng','Rủ rê hội chị em đến Galaxy Cinema để nhận quà và chính thức hóa thân thành Tiên Hắc Ám quý phái cool ngầu hết nấc','https://galaxycine.vn/media/2019/9/30/300x450-1560498889489-1569464458710_1569829520993.jpg',3,'2019-11-17 08:23:14',5),
(8,'Xem Phim Thong Thả - Rôm Rả Nhận Sừng','Rủ rê hội chị em đến Galaxy Cinema để nhận quà và chính thức hóa thân thành Tiên Hắc Ám quý phái cool ngầu hết nấc','https://galaxycine.vn/media/2019/10/7/300x450_1570435292622.jpg',3,'2019-11-24 08:23:14',5),
(9,'Siêu phẩm hoạt hình ','Từ đầu tháng 8 năm nay, giới mộ điệu đã xôn xao về một hiện tượng điện ảnh chưa từng có trong lịch sử. Bộ phim hoạt hình Na Tra: Ma Đồng Giáng Thế -câu chuyện cải biên đầy phá cách về một nhân vật đặc trưng trong văn hóa Trung Quốc đã tạo nên một cơn sốt tại phòng vé nội địa đồng thời nhận được vô số lời khen từ khán giả cũng như các nhà phê bình.','https://galaxycine.vn/media/2019/11/8/phimhanhdong2_1573187058757.jpeg',1,'2019-11-17 08:23:14',1),
(10,'Đầu năm 2020, Ju-On sẵn sàng chào đón bạn tại phòng chiếu Việt','Ra mắt từ năm 2002, Ju-On nhanh chóng trở thành một trong những loạt phim kinh dị Nhật Bản ghê rợn nhất mọi thời đại. Trải qua 5 phần phim Nhật và 3 phần phim Mỹ, thì vào đầu năm 2020, khán giả sẽ tiếp tục được hù doạ bởi một phiên bản The Grudge hoàn toàn mới, ghê rợn hơn, hồi hộp hơn. Sau 11 năm vắng bóng trên màn ảnh rộng, thương hiệu này đã trở lại và tiếp tục nhiệm vụ, gieo rắc nỗi kinh hoàng cho khán giả trên toàn thế giới.','https://galaxycine.vn/media/2019/10/29/mv5bogfkm2fhmtutowmxoc00ntfiltgwntaty2e0ytzhngi1zdllxkeyxkfqcgdeqxvynjq4ode4mzq--v1-_1572338954424.jpg',2,'2019-11-17 08:23:14',1),
(11,'Sau 10 ngày khởi chiếu, Joker đã thu về gần 60 tỷ đồng','Joker là phim điện ảnh đầu tiên lấy hình tượng nhân vật phản diện Joker làm trung tâm, cũng là tác phẩm đầu tiên khán giả biết đến nguồn gốc của gã hề (theo cách riêng của đạo diễn Todd Phillips). Chính vì thế, bộ phim đã thu hút sự tò mò của khán giả đại chúng từ những ngày đầu tiên thông báo dự án.','https://galaxycine.vn/media/2019/9/24/450x300-review-ffff_1569310536248.jpg',1,'2019-11-17 08:23:14',2),
(12,'Sau 10 ngày khởi chiếu, Joker đã thu về gần 60 tỷ đồng','Joker là phim điện ảnh đầu tiên lấy hình tượng nhân vật phản diện Joker làm trung tâm, cũng là tác phẩm đầu tiên khán giả biết đến nguồn gốc của gã hề (theo cách riêng của đạo diễn Todd Phillips). Chính vì thế, bộ phim đã thu hút sự tò mò của khán giả đại chúng từ những ngày đầu tiên thông báo dự án.','https://galaxycine.vn/media/2019/10/4/mv5bmtm2mzvhmzytnwi3zs00ngiwltlhnmetmdhhntfinwqxn2ywxkeyxkfqcgdeqxvynjuwntu1ndu--v1-sx1777-cr0-0-1777-999-al-_1570172537138.jpg',2,'2019-11-17 08:23:14',2),
(13,'4 sự khác biệt thú vị giữa bản điện ảnh và nguyên tác gốc của Doctor Sleep','Nhắc đến những tác phẩm kinh dị đầu thập niên 80, không ai là không nghĩ ngay đến tuyệt phẩm kinh dị The Shining do Stanley Kubrick làm đạo diễn. Dù được đánh giá là một trong những bộ phim kinh dị xuất sắc nhưng tác phẩm lại bị cha đẻ nguyên tác, \"ông hoàng kinh dị\" Stephen King chê bai thậm tệ vì đã thay đổi quá nhiều tình tiết, khiến tinh thần chính của câu chuyện cũng bị bóp méo.','https://galaxycine.vn/media/2019/10/10/thatsontamlinh4_1570685304411.jpg',2,'2019-11-17 08:23:14',2);

/*Table structure for table `oauth_access_token` */

DROP TABLE IF EXISTS `oauth_access_token`;

CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob DEFAULT NULL,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` blob DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `clien_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`),
  KEY `authentication_id` (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_access_token` */

insert  into `oauth_access_token`(`token_id`,`token`,`authentication_id`,`user_name`,`client_id`,`authentication`,`refresh_token`,`clien_id`) values 
('f43382d75d25865e35e6a9966bd23ffd','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0��N�(xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$25284051-31bc-4569-9f04-fc8d4d04cae2sq\0~\0	w\0\0��N�<xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$3b3b245e-5809-465e-877c-f43737e49b17','0b85b9ff721c0c41888651fb2d3b774b','0966965543','client_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0\n0966965543xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n|��hx\0\0\0\0pt\0hoang@gmail.comt\0Nguyễn Văn Bt\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0966965543sq\0~\0;\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','afa7526ee50d7e19f87c0fe960f7cab0',NULL),
('a2de930cec438eac7b3bae3592ccfd19','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0��e#�xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$a391ed0a-9153-4c1c-b259-18e4bc9fa002sq\0~\0	w\0\0��e#xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$063e1f46-6eb4-43e0-8daf-5f409ca1faae','1653fc4576f83e22d8a33b2ea77938e5','0999888777','client_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0\n0999888777xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0ntx\0\0\0\0pt\0user01@gmail.comt\0Nguyễn Văn At\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0999888777sq\0~\07\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','10b4ca6ea20e492a2bad7af5db16ed61',NULL),
('d1a9c0caf179bbc0381d23b2293a7fa2','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�+�C\0xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$925fba62-d37f-493f-b8be-7830a22f454asq\0~\0	w\0\0�+�BGxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$42c49b92-a20a-44b8-ac08-13984dd9059f','250376fb770b55c1be0c4e9c8497c579','hathuong@gmail.com','client_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0hathuong@gmail.comxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n����x\0\0\0\0pt\0hathuong@gmail.comt\0thuongt\0<$2a$10$nDTD6PwgqS5tfN7VQBt3Guvt.NHnTImFjB4CE2PyYV8/QABHCKcsOt\0\n0967684296sq\0~\0;\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp','04269013770dde03a2a89f0f7e3cc0fd',NULL),
('4f236816d02aa7a0696db7204b13d966','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0��g$xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$eb86cf6b-9ea2-4323-a09c-ea9e4dd7ffc0sq\0~\0	w\0\0��g#ixsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$7714a1b7-288b-471a-beda-cd1d0ea69551','29409fc7a510d6fd779dfb16a51780f8','abc@test.com','client_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0abc@test.comxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�\"�\0x\0\0\0\0pt\0abc@test.comt\0Thuongt\0<$2a$10$aP5lbAfvnNJ12GmFctOn1uUQ28sm/HCEJ0iNrZSYjh5dBxnAFStR.t\0\n0966999999sq\0~\0;\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp','1d9c21bfce9eaf5f04d5ca3ae22ae27e',NULL),
('a43e8f6c866a173b992b5616ffd5754b','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�[1\"xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$5ab63cea-7413-4b2a-b0a2-b2fbe45cc3casq\0~\0	w\0\0�[1�xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$875a4005-4bd0-42cc-8628-1488e1193274','762a4abac583f262526c59a680683a15','test@test.com','client_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0\rtest@test.comxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0o� �x\0\0\0\0pt\0\rtest@test.comt\0testt\0<$2a$10$8AYYAoi49PgwTjlboYIwiuHi25lVftb17am51om5lUeNW2Fub4D6.t\0021sq\0~\0;\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp','9cf1f43ba5bd7935a8b49f046880a992',NULL),
('f40993ac2aee734800268e9b3d53f5c8','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0��!o�xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$3eab9447-cc0f-44c1-bbfc-77209cadcec3sq\0~\0	w\0\0��!n�xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$53a46cf9-783d-459c-b4ed-49e7621fcdd2','7fbabda88703ea7b1260f0d164d7805c','0973797944','client_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0\n0973797944xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0ntx\0\0\0\0pt\0thai1108@gmail.comt\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0973797944sq\0~\07\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','0b47a8b10e3f6bb50d0ee518c3209ce4',NULL),
('3ddec6284aa23ba6d8f4a5accf90f431','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�[�xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$290db5f4-3e08-4e1a-b829-f05b0778cd67sq\0~\0	w\0\0�[�xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$1e78e327-42ae-4d33-8f0c-2426c370f48f','a1a65ec3086e05ad16aae26e4e9c0340','09737979441','onevinmec_dev1','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0onevinmec_dev1sr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\009737979441xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.UserMxܖe�C�\0L\0activet\0Ljava/lang/Integer;L\0blockq\0~\04L\0\ncreated_att\0Ljava/util/Date;L\0default_pidq\0~\0L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04L\0stateq\0~\04L\0\nupdated_atq\0~\05xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sq\0~\07\0\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0t\01pt\0vietthai1108@gmail.comt\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\009737979441q\0~\0:q\0~\09sq\0~\0;w\0\0n�x\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','4affb808002bdb2501bb17e5eaea2707',NULL),
('bd610ca49a1c49dfcf449cddd7d0ff0a','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�[kxsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$5a9e404e-1566-4dfe-86fc-6a2ef6310ad0sq\0~\0	w\0\0�[axsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$fd88e34a-b26c-4a09-851c-602ba42624eb','a36783d6ca5be122ec51911416d9ee35','0973797944','cleint_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	cleint_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0\n0973797944xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0pt\0vietthai1108@gmail.ct\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0973797944sq\0~\07\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','73f3df2f123b643f30e4a44b83daa2fd',NULL),
('e0ad9c533d4ca9d18728bc837fc916ab','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�[�xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$a6b95cdf-90de-4ff5-b499-2aacdfb8e119sq\0~\0	w\0\0�[�xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$29bf91e1-9a5d-4c0f-b6ba-306c52edeb27','b311afebaf00de71e5721eb57e1fdee8','09737979441','cleint_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	cleint_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\009737979441xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.UserMxܖe�C�\0L\0activet\0Ljava/lang/Integer;L\0blockq\0~\04L\0\ncreated_att\0Ljava/util/Date;L\0default_pidq\0~\0L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04L\0stateq\0~\04L\0\nupdated_atq\0~\05xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sq\0~\07\0\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0t\01pt\0vietthai1108@gmail.comt\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\009737979441q\0~\0:q\0~\09sq\0~\0;w\0\0n�x\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','6a56b465bb715ac9ed515e576e1f1f0a',NULL),
('82235696f80fee125cbeda38488b4589','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�ǋ��xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$d3504293-2001-42a6-aab5-0e5b3e87abf5sq\0~\0	w\0\0�ǋ�5xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$d02a730d-202f-4e48-9206-67e14fe9406c','e61a619b57fde1f168aa95702a9615f5','admin','client_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n_7�x\0\0\0\0pt\0admint\0Admint\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0adminq\0~\0=sr\0java.lang.Boolean� r�՜��\0Z\0valuexp','aede3acc085829ab34722dd363fea5f0',NULL),
('cc6ac0a7ca8a59c78e27f910023f9af4','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�ǋM$xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$39824576-4739-43e1-b0ea-7f32493c9a22sq\0~\0	w\0\0�ǋLrxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$50173ccf-7d59-44ba-b824-b22c326eb317','ea7ff420090777dfe4be93b562e6cefe','admin@gmail.com','client_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0admin@gmail.comxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n_7�x\0\0\0\0pt\0admin@gmail.comt\0Admint\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0adminq\0~\09sr\0java.lang.Boolean� r�՜��\0Z\0valuexp','f3a75bf1105fcc967333e51269224201',NULL);

/*Table structure for table `oauth_client_details` */

DROP TABLE IF EXISTS `oauth_client_details`;

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `web_server_redirect_uri` varchar(2048) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `resource_ids` varchar(1024) DEFAULT NULL,
  `authorized_grant_types` varchar(1024) DEFAULT NULL,
  `authorities` varchar(1024) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_client_details` */

insert  into `oauth_client_details`(`client_id`,`client_secret`,`web_server_redirect_uri`,`scope`,`access_token_validity`,`refresh_token_validity`,`resource_ids`,`authorized_grant_types`,`authorities`,`additional_information`,`autoapprove`) values 
('client_id','$2a$10$7YFcYdwIpLMTPguAjfWVoOXnupV98DcVvi.1/NpHChYWbtS4ABKI.',NULL,'READ,WRITE',99999999,99999999,NULL,'password,authorization_code,refresh_token,implicit',NULL,NULL,NULL);

/*Table structure for table `oauth_refresh_token` */

DROP TABLE IF EXISTS `oauth_refresh_token`;

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob DEFAULT NULL,
  `authentication` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_refresh_token` */

insert  into `oauth_refresh_token`(`token_id`,`token`,`authentication`) values 
('4affb808002bdb2501bb17e5eaea2707','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$290db5f4-3e08-4e1a-b829-f05b0778cd67sr\0java.util.Datehj�KYt\0\0xpw\0\0�[�x','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0onevinmec_dev1sr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\009737979441xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.UserMxܖe�C�\0L\0activet\0Ljava/lang/Integer;L\0blockq\0~\04L\0\ncreated_att\0Ljava/util/Date;L\0default_pidq\0~\0L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04L\0stateq\0~\04L\0\nupdated_atq\0~\05xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sq\0~\07\0\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0t\01pt\0vietthai1108@gmail.comt\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\009737979441q\0~\0:q\0~\09sq\0~\0;w\0\0n�x\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0'),
('6a56b465bb715ac9ed515e576e1f1f0a','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$a6b95cdf-90de-4ff5-b499-2aacdfb8e119sr\0java.util.Datehj�KYt\0\0xpw\0\0�[�x','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	cleint_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\009737979441xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.UserMxܖe�C�\0L\0activet\0Ljava/lang/Integer;L\0blockq\0~\04L\0\ncreated_att\0Ljava/util/Date;L\0default_pidq\0~\0L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04L\0stateq\0~\04L\0\nupdated_atq\0~\05xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sq\0~\07\0\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0t\01pt\0vietthai1108@gmail.comt\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\009737979441q\0~\0:q\0~\09sq\0~\0;w\0\0n�x\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0'),
('73f3df2f123b643f30e4a44b83daa2fd','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$5a9e404e-1566-4dfe-86fc-6a2ef6310ad0sr\0java.util.Datehj�KYt\0\0xpw\0\0�[ax','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	cleint_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0\n0973797944xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0pt\0vietthai1108@gmail.ct\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0973797944sq\0~\07\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0'),
('0b47a8b10e3f6bb50d0ee518c3209ce4','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$3eab9447-cc0f-44c1-bbfc-77209cadcec3sr\0java.util.Datehj�KYt\0\0xpw\0\0��!n�x','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0\n0973797944xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0ntx\0\0\0\0pt\0thai1108@gmail.comt\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0973797944sq\0~\07\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0'),
('afa7526ee50d7e19f87c0fe960f7cab0','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$25284051-31bc-4569-9f04-fc8d4d04cae2sr\0java.util.Datehj�KYt\0\0xpw\0\0��N�<x','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0\n0966965543xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n}�X�x\0\0\0\0pt\0hoang@gmail.comt\0Nguyễn Văn Bt\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0966965543sq\0~\0;\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0'),
('10b4ca6ea20e492a2bad7af5db16ed61','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$a391ed0a-9153-4c1c-b259-18e4bc9fa002sr\0java.util.Datehj�KYt\0\0xpw\0\0��e#x','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0\n0999888777xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0ntx\0\0\0\0pt\0user01@gmail.comt\0Nguyễn Văn At\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0999888777sq\0~\07\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0'),
('f3a75bf1105fcc967333e51269224201','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$39824576-4739-43e1-b0ea-7f32493c9a22sr\0java.util.Datehj�KYt\0\0xpw\0\0�ǋLrx','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0admin@gmail.comxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n_7�x\0\0\0\0pt\0admin@gmail.comt\0Admint\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0adminq\0~\09sr\0java.lang.Boolean� r�՜��\0Z\0valuexp'),
('aede3acc085829ab34722dd363fea5f0','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$d3504293-2001-42a6-aab5-0e5b3e87abf5sr\0java.util.Datehj�KYt\0\0xpw\0\0�ǋ�5x','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n_7�x\0\0\0\0pt\0admint\0Admint\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0adminq\0~\09sr\0java.lang.Boolean� r�՜��\0Z\0valuexp'),
('1d9c21bfce9eaf5f04d5ca3ae22ae27e','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$eb86cf6b-9ea2-4323-a09c-ea9e4dd7ffc0sr\0java.util.Datehj�KYt\0\0xpw\0\0��g#ix','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0abc@test.comxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n���x\0\0\0\0pt\0abc@test.comt\0Thuongt\0<$2a$10$aP5lbAfvnNJ12GmFctOn1uUQ28sm/HCEJ0iNrZSYjh5dBxnAFStR.t\0\n0966999999sq\0~\0;\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp'),
('04269013770dde03a2a89f0f7e3cc0fd','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$925fba62-d37f-493f-b8be-7830a22f454asr\0java.util.Datehj�KYt\0\0xpw\0\0�+�BGx','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0hathuong@gmail.comxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�^hx\0\0\0\0pt\0hathuong@gmail.comt\0thuongt\0<$2a$10$nDTD6PwgqS5tfN7VQBt3Guvt.NHnTImFjB4CE2PyYV8/QABHCKcsOt\0\n0967684296sq\0~\0;\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp'),
('9cf1f43ba5bd7935a8b49f046880a992','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$5ab63cea-7413-4b2a-b0a2-b2fbe45cc3casr\0java.util.Datehj�KYt\0\0xpw\0\0�[1�x','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	client_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	client_idt\0usernamet\0\rtest@test.comxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\00sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0\rclient_secretq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\08L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\08xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0o� �x\0\0\0\0pt\0\rtest@test.comt\0testt\0<$2a$10$8AYYAoi49PgwTjlboYIwiuHi25lVftb17am51om5lUeNW2Fub4D6.t\0021sq\0~\0;\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp');

/*Table structure for table `rate` */

DROP TABLE IF EXISTS `rate`;

CREATE TABLE `rate` (
  `move_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `star` int(11) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`move_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rate` */

insert  into `rate`(`move_id`,`user_id`,`star`,`comment`) values 
(1,1,NULL,NULL),
(2,7,NULL,NULL);

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`id`,`name`,`seats`,`notes`) values 
(1,'Phòng 01',30,NULL),
(2,'Phòng 02',50,NULL),
(3,'Phòng 03',60,NULL);

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`movie_id`,`room_id`,`start_time`,`end_time`) values 
(1,1,1,'2019-12-25 00:38:13','2019-11-26 09:17:53'),
(2,2,2,'2019-12-06 00:38:13','2019-11-27 19:18:14'),
(3,2,3,'2019-12-07 00:38:13','2019-11-16 19:18:14'),
(4,3,1,'2019-12-08 00:38:13','2019-11-16 22:18:14'),
(5,1,1,'2019-12-26 00:38:13','2019-11-17 01:18:14'),
(6,1,2,'2019-12-15 00:38:13','2019-11-19 01:07:26'),
(7,1,1,'2019-12-11 00:38:13','2019-11-20 03:07:45'),
(9,2,3,'2019-12-21 20:38:13',NULL),
(10,4,3,'2019-12-23 00:38:13',NULL),
(11,14,2,'2019-12-24 02:07:07',NULL),
(12,13,1,'2019-12-17 22:00:00',NULL),
(13,11,2,'2019-12-20 12:00:00',NULL),
(14,11,2,'2019-12-20 10:00:00',NULL);

/*Table structure for table `seats` */

DROP TABLE IF EXISTS `seats`;

CREATE TABLE `seats` (
  `seat_id` int(5) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `row` int(11) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `is_empty` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

/*Data for the table `seats` */

insert  into `seats`(`seat_id`,`room_id`,`name`,`row`,`area`,`type`,`price`,`is_empty`) values 
(1,1,'A1',1,NULL,'VIP',50000,1),
(2,1,'A2',1,NULL,'VIP',50000,1),
(3,1,'A3',1,NULL,'VIP',50000,1),
(4,1,'A4',1,NULL,'VIP',50000,1),
(5,1,'A5',1,NULL,'VIP',50000,1),
(6,1,'A6',1,NULL,'VIP',50000,1),
(7,1,'A7',1,NULL,'VIP',50000,1),
(8,1,'A8',1,NULL,'VIP',50000,1),
(9,1,'A9',1,NULL,'VIP',50000,1),
(10,1,'A10',1,NULL,'VIP',50000,1),
(11,1,'B2',2,NULL,'VIP',50000,1),
(12,1,'B2',2,NULL,'VIP',50000,1),
(13,1,'B3',2,NULL,'VIP',50000,1),
(14,1,'B4',2,NULL,'VIP',50000,1),
(15,1,'B5',2,NULL,'VIP',50000,1),
(16,1,'B6',2,NULL,'VIP',50000,1),
(17,1,'B7',2,NULL,'VIP',50000,1),
(18,1,'B8',2,NULL,'VIP',50000,1),
(19,1,'B9',2,NULL,'VIP',50000,1),
(20,1,'B10',2,NULL,'VIP',50000,1),
(21,1,'C1',3,NULL,'VIP',50000,1),
(22,1,'C2',3,NULL,'VIP',50000,1),
(23,1,'C3',3,NULL,'VIP',50000,1),
(24,1,'C4',3,NULL,'VIP',50000,1),
(25,1,'C5',3,NULL,'VIP',50000,1),
(26,1,'C6',3,NULL,'VIP',50000,1),
(27,1,'C7',3,NULL,'VIP',50000,1),
(28,1,'C8',3,NULL,'VIP',50000,1),
(29,1,'C9',3,NULL,'VIP',50000,1),
(30,1,'C10',3,NULL,'VIP',50000,1),
(31,2,'A1',1,NULL,'VIP',50000,1),
(32,2,'A2',1,NULL,'VIP',50000,1),
(33,2,'A3',1,NULL,'VIP',50000,1),
(34,2,'A4',1,NULL,'VIP',50000,1),
(35,2,'A5',1,NULL,'VIP',50000,1),
(36,2,'A6',1,NULL,'VIP',50000,1),
(37,2,'A7',1,NULL,'VIP',50000,1),
(38,2,'A8',1,NULL,'VIP',50000,1),
(39,2,'A9',1,NULL,'VIP',50000,1),
(40,2,'A10',1,NULL,'VIP',50000,1),
(41,2,'B1',2,NULL,'VIP',50000,1),
(42,2,'B2',2,NULL,'VIP',50000,1),
(43,2,'B3',2,NULL,'VIP',50000,1),
(44,2,'B4',2,NULL,'VIP',50000,1),
(45,2,'B5',2,NULL,'VIP',50000,1),
(46,2,'B6',2,NULL,'VIP',50000,1),
(47,2,'B7',2,NULL,'VIP',50000,1),
(48,2,'B8',2,NULL,'VIP',50000,1),
(49,2,'B9',2,NULL,'VIP',50000,1),
(50,2,'B10',2,NULL,'VIP',50000,1),
(51,2,'C1',3,NULL,'VIP',50000,1),
(52,2,'C2',3,NULL,'VIP',50000,1),
(53,2,'C3',3,NULL,'VIP',50000,1),
(54,2,'C4',3,NULL,'VIP',50000,1),
(55,2,'C5',3,NULL,'VIP',50000,1),
(56,2,'C6',3,NULL,'VIP',50000,1),
(57,2,'C7',3,NULL,'VIP',50000,1),
(58,2,'C8',3,NULL,'VIP',50000,1),
(59,2,'C9',3,NULL,'VIP',50000,1),
(60,2,'C10',3,NULL,'VIP',50000,1),
(61,2,'D1',4,NULL,'VIP',50000,1),
(62,2,'D2',4,NULL,'VIP',50000,1),
(63,2,'D3',4,NULL,'VIP',50000,1),
(64,2,'D4',4,NULL,'VIP',50000,1),
(65,2,'D5',4,NULL,'VIP',50000,1),
(66,2,'D6',4,NULL,'VIP',50000,1),
(67,2,'D7',4,NULL,'VIP',50000,1),
(68,2,'D8',4,NULL,'VIP',50000,1),
(69,2,'D9',4,NULL,'VIP',50000,1),
(70,2,'D10',4,NULL,'VIP',50000,1),
(71,2,'E1',5,NULL,'VIP',50000,1),
(72,2,'E2',5,NULL,'VIP',50000,1),
(73,2,'E3',5,NULL,'VIP',50000,1),
(74,2,'E4',5,NULL,'VIP',50000,1),
(75,2,'E5',5,NULL,'VIP',50000,1),
(76,2,'E6',5,NULL,'VIP',50000,1),
(77,2,'E7',5,NULL,'VIP',50000,1),
(78,2,'E8',5,NULL,'VIP',50000,1),
(79,2,'E9',5,NULL,'VIP',50000,1),
(80,2,'E10',5,NULL,'VIP',50000,1),
(81,3,'A1',1,NULL,'VIP',50000,1),
(82,3,'A2',1,NULL,'VIP',50000,1),
(83,3,'A3',1,NULL,'VIP',50000,1),
(84,3,'A4',1,NULL,'VIP',50000,1),
(85,3,'A5',1,NULL,'VIP',50000,1),
(86,3,'A6',1,NULL,'VIP',50000,1),
(87,3,'A7',1,NULL,'VIP',50000,1),
(88,3,'A8',1,NULL,'VIP',50000,1),
(89,3,'A9',1,NULL,'VIP',50000,1),
(90,3,'A10',1,NULL,'VIP',50000,1),
(91,3,'B1',2,NULL,'VIP',50000,1),
(92,3,'B2',2,NULL,'VIP',50000,1),
(93,3,'B3',2,NULL,'VIP',50000,1),
(94,3,'B4',2,NULL,'VIP',50000,1),
(95,3,'B5',2,NULL,'VIP',50000,1),
(96,3,'B6',2,NULL,'VIP',50000,1),
(97,3,'B7',2,NULL,'VIP',50000,1),
(98,3,'B8',2,NULL,'VIP',50000,1),
(99,3,'B9',2,NULL,'VIP',50000,1),
(100,3,'B10',2,NULL,'VIP',50000,1),
(101,3,'C1',3,NULL,'VIP',50000,1),
(102,3,'C2',3,NULL,'VIP',50000,1),
(103,3,'C3',3,NULL,'VIP',50000,1),
(104,3,'C4',3,NULL,'VIP',50000,1),
(105,3,'C5',3,NULL,'VIP',50000,1),
(106,3,'C6',3,NULL,'VIP',50000,1),
(107,3,'C7',3,NULL,'VIP',50000,1),
(108,3,'C8',3,NULL,'VIP',50000,1),
(109,3,'C9',3,NULL,'VIP',50000,1),
(110,3,'C10',3,NULL,'VIP',50000,1),
(111,3,'D1',4,NULL,'VIP',50000,1),
(112,3,'D2',4,NULL,'VIP',50000,1),
(113,3,'D3',4,NULL,'VIP',50000,1),
(114,3,'D4',4,NULL,'VIP',50000,1),
(115,3,'D5',4,NULL,'VIP',50000,1),
(116,3,'D6',4,NULL,'VIP',50000,1),
(117,3,'D7',4,NULL,'VIP',50000,1),
(118,3,'D8',4,NULL,'VIP',50000,1),
(119,3,'D9',4,NULL,'VIP',50000,1),
(120,3,'D10',4,NULL,'VIP',50000,1),
(121,3,'E1',5,NULL,'VIP',50000,1),
(122,3,'E2',5,NULL,'VIP',50000,1),
(123,3,'E3',5,NULL,'VIP',50000,1),
(124,3,'E4',5,NULL,'VIP',50000,1),
(125,3,'E5',5,NULL,'VIP',50000,1),
(126,3,'E6',5,NULL,'VIP',50000,1),
(127,3,'E7',5,NULL,'VIP',50000,1),
(128,3,'E8',5,NULL,'VIP',50000,1),
(129,3,'E9',5,NULL,'VIP',50000,1),
(130,3,'E10',5,NULL,'VIP',50000,1),
(131,3,'F1',6,NULL,'VIP',50000,1),
(132,3,'F2',6,NULL,'VIP',50000,1),
(133,3,'F3',6,NULL,'VIP',50000,1),
(134,3,'F5',6,NULL,'VIP',50000,1),
(135,3,'F5',6,NULL,'VIP',50000,1),
(136,3,'F6',6,NULL,'VIP',50000,1),
(137,3,'F7',6,NULL,'VIP',50000,1),
(138,3,'F8',6,NULL,'VIP',50000,1),
(139,3,'F9',6,NULL,'VIP',50000,1),
(140,3,'F10',6,NULL,'VIP',50000,1);

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `seat_id` int(11) NOT NULL,
  `state` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`,`schedule_id`,`seat_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `seat_id` (`seat_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

/*Data for the table `ticket` */

insert  into `ticket`(`id`,`code`,`schedule_id`,`staff_id`,`user_id`,`price`,`seat_id`,`state`) values 
(138,'20191218_XNABY_1',1,1,2,150000,2,0),
(139,'20191218_XNABY_1',1,1,2,150000,12,0),
(140,'20191218_XNABY_1',1,1,2,150000,22,0),
(141,'20191218_UL39L_1',1,1,2,150000,6,0),
(142,'20191218_UL39L_1',1,1,2,150000,16,0),
(143,'20191218_UL39L_1',1,1,2,150000,26,0),
(144,'20191218_HMWUQ_5',5,1,2,100000,6,0),
(145,'20191218_HMWUQ_5',5,1,2,100000,16,0),
(146,'20191218_BGCAJ_5',5,1,2,100000,8,0),
(147,'20191218_BGCAJ_5',5,1,2,100000,18,0),
(148,'20191218_BF6VU_5',5,1,2,150000,15,0),
(149,'20191218_BF6VU_5',5,1,2,150000,17,0),
(150,'20191218_BF6VU_5',5,1,2,150000,27,0),
(151,'20191218_I7GHS_5',5,1,2,50000,7,0),
(152,'20191218_GFZRR_5',5,1,2,50000,9,0),
(153,'20191218_G8DSW_5',5,1,2,50000,26,0),
(154,'20191218_2WZ0L_5',5,1,2,50000,28,0),
(155,'20191218_XNB5D_1',1,1,2,50000,10,0),
(156,'20191218_2VY6P_5',5,1,2,50000,3,0),
(157,'20191219_RWWWC_9',9,1,3,100000,81,0),
(158,'20191219_RWWWC_9',9,1,3,100000,82,0);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) DEFAULT NULL,
  `mail` varchar(20) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `role` int(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL,
  `wallet` int(30) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`phone`,`mail`,`password`,`active`,`role`,`created_at`,`updated_at`,`name`,`wallet`) values 
(1,'admin','admin','$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2',1,1,'2019-10-28 02:18:26','2019-10-28 02:18:26','Admin',0),
(2,'0966999999','abc@test.com','$2a$10$aP5lbAfvnNJ12GmFctOn1uUQ28sm/HCEJ0iNrZSYjh5dBxnAFStR.',1,0,'2019-11-24 10:18:56','2019-11-24 10:18:56','Thuong',0),
(3,'0967684296','hathuong@gmail.com','$2a$10$nDTD6PwgqS5tfN7VQBt3Guvt.NHnTImFjB4CE2PyYV8/QABHCKcsO',1,0,'2019-12-07 12:37:05','2019-12-07 12:37:05','thuong',0),
(11,'021','test@test.com','$2a$10$8AYYAoi49PgwTjlboYIwiuHi25lVftb17am51om5lUeNW2Fub4D6.',1,0,'2019-12-17 06:18:40','2019-12-17 06:18:40','test',0);

/* Trigger structure for table `seats` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `count_seat_in_room_inc` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'admin'@'%' */ /*!50003 TRIGGER `count_seat_in_room_inc` AFTER INSERT ON `seats` FOR EACH ROW BEGIN
	
	 UPDATE room
    SET room.`seats` = (room.`seats`+1)
    WHERE room.`id` = NEW.room_id;
	
    END */$$


DELIMITER ;

/* Trigger structure for table `seats` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `count_seat_in_room_auto_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'admin'@'%' */ /*!50003 TRIGGER `count_seat_in_room_auto_update` AFTER UPDATE ON `seats` FOR EACH ROW BEGIN
	 UPDATE room
    SET room.`seats` = (room.`seats`-1)
    WHERE room.`id` = OLD.room_id;
	
 UPDATE
    room
  SET
    room.`seats` = (room.`seats` + 1)
  WHERE room.`id` = NEW.room_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `seats` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `count_seat_in_room_dec` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'admin'@'%' */ /*!50003 TRIGGER `count_seat_in_room_dec` AFTER DELETE ON `seats` FOR EACH ROW BEGIN
	 UPDATE room
    SET room.`seats` = (room.`seats`-1)
    WHERE room.`id` = OLD.room_id;
	
    END */$$


DELIMITER ;

/* Procedure structure for procedure `admin_get_all_ticket` */

/*!50003 DROP PROCEDURE IF EXISTS  `admin_get_all_ticket` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `admin_get_all_ticket`()
BEGIN
 SELECT
    tk.`code`,
    tk.`price`,
    sc.`start_time`,
    mv.`name` AS movie_name,
    mv.`duration`,
    r.`name` AS room_name,
    s.`name` AS seat_name,
    mv.`id` AS movie_id,
    tk.`state`,
    tk.`id`
  FROM
    ticket tk
    INNER JOIN `schedule` sc
      ON tk.`schedule_id` = sc.`id`
    INNER JOIN movie mv
      ON sc.`movie_id` = mv.`id`
    INNER JOIN room r
      ON sc.`room_id` = r.`id`
    INNER JOIN seats AS s
      ON tk.`seat_id` = s.`seat_id`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `admin_search_ticket` */

/*!50003 DROP PROCEDURE IF EXISTS  `admin_search_ticket` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `admin_search_ticket`(IN code_input varchar(255))
BEGIN
  SELECT
    tk.`code`,
    tk.`price`,
    sc.`start_time`,
    mv.`name` AS movie_name,
    mv.`duration`,
    r.`name` AS room_name,
    s.`name` AS seat_name,
    mv.`id` AS movie_id,
    tk.`state`,
    tk.`id`
  FROM
    ticket tk
    INNER JOIN `schedule` sc
      ON tk.`schedule_id` = sc.`id`
    INNER JOIN movie mv
      ON sc.`movie_id` = mv.`id`
    INNER JOIN room r
      ON sc.`room_id` = r.`id`
    INNER JOIN seats AS s
      ON tk.`seat_id` = s.`seat_id`
  WHERE tk.code like code_input;
END */$$
DELIMITER ;

/* Procedure structure for procedure `user_get_ticket_history` */

/*!50003 DROP PROCEDURE IF EXISTS  `user_get_ticket_history` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `user_get_ticket_history`(IN user_id_input int)
BEGIN
  SELECT
    tk.`code`,
    tk.`price`,
    sc.`start_time`,
    mv.`name` AS movie_name,
    mv.`duration`,
    r.`name` AS room_name,
    s.`name` AS seat_name,
    mv.`id` AS movie_id,
    tk.`state`,
    tk.`id`
  FROM
    ticket tk
    INNER JOIN `schedule` sc
      ON tk.`schedule_id` = sc.`id`
    INNER JOIN movie mv
      ON sc.`movie_id` = mv.`id`
    INNER JOIN room r
      ON sc.`room_id` = r.`id`
    INNER JOIN seats AS s
      ON tk.`seat_id` = s.`seat_id`
  WHERE tk.user_id = user_id_input;
  END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
