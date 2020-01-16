/*
SQLyog Ultimate v13.1.1 (64 bit)
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
(1,'https://s3img.vcdn.vn/123phim/2019/11/addams-15725963833749.jpg'),
(2,'https://s3img.vcdn.vn/123phim/2019/11/3d-15728436812590.jpg'),
(3,'https://s3img.vcdn.vn/123phim/2019/11/addams-15725963833749.jpg'),
(8,'https://s3img.vcdn.vn/123phim/2019/11/3d-15728436812590.jpg'),
(9,'https://s3img.vcdn.vn/123phim/2019/11/termi-15725978655542.jpg'),
(10,'https://s3img.vcdn.vn/123phim/2019/11/3d-15728436812590.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `movie` */

insert  into `movie`(`id`,`category_id`,`name`,`language`,`duration`,`release_date`,`end_date`,`directors`,`cast`,`about`,`nation`,`thumb_image`,`url_trailler`,`url_full`,`age`) values 
(1,6,'Tiên Hắc Ám 2 - Maleficent: Mistress of Evil','Tiếng Anh với phụ đề tiếng Việt',125,'2019-11-16 16:31:28','2019-11-16 22:05:34','Joachim Rønning','Angelina Jolie, Elle Fanning, Michelle Pfeiffer, Ed Skrein, Chiwetel Ejiofor','Thời gian trôi qua thật bình yên với Maleficent và Aurora. Mặc dù mối quan hệ của cả hai được tạo dựng từ những tổn thương, thù hận rồi sau đó mới đến tình yêu thương nhưng cuối cùng thì nó cũng đã đơm hoa kết trái. Tuy vậy, xung đột giữa hai giới: loài người và tiên tộc vẫn vẫn luôn hiện hữu. Cuộc hôn nhân vốn bị trì hoãn giữa Aurora và Hoàng tử Phillips chính là cầu nối gắn kết Vương quốc Ulstead và nước láng giềng Moors lại với','Mỹ','https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/m/a/maleficent_official_poster.jpg','https://www.youtube.com/watch?v=-Ci96IlKIlQ','https://www.youtube.com/watch?v=-Ci96IlKIlQ',NULL),
(2,1,'Kẻ Huỷ Diệt: Vận Mệnh Đen Tối - Terminator: Dark Fate','Tiếng Anh với phụ đề tiếng Việt',128,'2019-11-15 16:33:39','2019-11-16 22:05:34','Tim Miller','Linda Hamilton, Arnold Schwarzenegger','Terminator: Dark Fate hứa hẹn là phần phim chắc chắn sẽ khiến các fan hâm mộ thỏa mãn bởi những pha hành động cực kỳ chất lượng. Cùng với đó, sự trở lại của đạo diễn James Cameron, Linda Hamilton và Arnold Schwarzenegge càng đem đến nhiều hơn sự kích thích và phấn khích. ​​​​​​​','Nga','https://s3img.vcdn.vn/123phim/2019/11/terminator-dark-fate-phim-hanh-dong-nghet-tho-toi-muc-can-thuoc-tro-tim-15726001287898.jpg','https://www.youtube.com/watch?v=Zw7z6O9JeYE','https://www.youtube.com/watch?v=Zw7z6O9JeYE',NULL),
(3,2,'Búp Bê Ký Ức: Violet Evergarden','Tiếng Việt',92,'2019-11-15 16:34:21','2019-11-16 22:05:34','Haruka Fujita, Taichi Ishidate','Haruka Fujita, Taichi Ishidate','Hãng hoạt hình Kyoto Animation của \"Dáng Hình Thanh Âm /A Silent Voice\" chính thức trở lại! Kyoto Animation - một trong những xưởng sản xuất phim hoạt hình anime nổi tiếng nhất Nhật Bản sẽ trở lại với phiên bản điện ảnh của loạt anime đình đám Violet Evergarden với phần phim mang tên \"Búp Bê Ký Ức Violet Evergarden/Violet Evergarden – Eternity and The Auto Memory Doll\" hứa hẹn sẽ lấy đi nhiều nước mắt của khán giả. \"Búp Bê Ký Ức Violet Evergarden\" lấ','Nhật Bản','https://s3img.vcdn.vn/mobile/123phim/2019/10/bup-be-ky-uc-violet-evergarden-15717167680013_215x318.jpg','https://www.youtube.com/watch?time_continue=52&v=RFMbFJDY_jo','https://www.youtube.com/watch?time_continue=52&v=RFMbFJDY_jo',NULL),
(4,3,'Vượt Biển - Across The Waters','Tiếng Anh với phụ đề tiếng Việt',94,'2019-11-05 16:37:31','2019-11-16 22:05:34','Nicolo Donato','Nicolo Donato','Arne Itkin, một nhạc công guitar chuyên chơi nhạc jazz dường như miễn nhiễm với tất cả các biến động khốc liệt của cuộc chiến tranh do chính phủ Đan Mạch chọn phương thức quan hệ hòa hảo với nước Đức Phát xít.','Nga','ttps://s3img.vcdn.vn/mobile/123phim/2019/10/vuot-bien-across-the-waters-15716534850780_215x318.jpg','https://www.youtube.com/watch?v=i7dygX_AJ3I','https://www.youtube.com/watch?v=i7dygX_AJ3I',NULL),
(6,2,'Đồi Địa Đàng - Paradise Hills','Tiếng Anh với phụ đề tiếng Việt',120,'2019-11-02 16:39:03','2019-11-16 22:05:34','Alice Waddington','Eiza González, Emma Roberts','Uma thức giấc trên một hòn đảo gọi là ĐỒI ĐỊA ĐÀNG được tạo ra để quản lý và giáo dục những cô gái không đứng đắn. Dẫn dắt bởi Duchess, hòn đảo tạo ra một cuộc sống trong mơ cho những bệnh nhân của nó. Tuy nhiên, phía sau những câu chuyện thần tiên là những bí mật được thiêu dệt sau mỗi giấc ngủ của các cô gái.','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/10/doi-dia-dang-paradise-hills-15712872831946_215x318.jpg','https://www.youtube.com/watch?v=6qmUlruSLGY','https://www.youtube.com/watch?v=6qmUlruSLGY',NULL),
(7,1,'Salma Và Điều Ước Nhiệm Màu - Salma\'s Big Wish','Tiếng Anh với phụ đề tiếng Việt',110,'2019-11-20 13:51:07','2019-11-16 22:05:34','Carlos Gutiérrez Medrano',NULL,'Tại thị trấn Santa Clara của Mexico, Salma là một đứa trẻ mồ côi 16 tuổi chưa bao giờ được gặp cha mẹ ruột. Câu chuyện duy nhất cô bé được nghe kể là họ đã bỏ rơi cô. Salma dành phần lớn cuộc đời của mình để tìm kiếm manh mối về danh tính của cha mẹ và nơi ở của họ. Cho đến một ngày, cô phát hiện ra một cuốn sách đặc biệt chứa đựng những câu chuyện về Santa Clara và lịch sử dân tộc. Lấy cảm hứng từ cuốn sách đặc biệt này, Salma bắt đầu cuộc phiêu lưu với hai anh em nuôi dũng cảm và tốt bụng của ','Mexico','https://s3img.vcdn.vn/mobile/123phim/2019/10/salma-va-dieu-uoc-nhiem-mau-salma-s-big-wish-15716598136414_215x318.jpg','https://www.youtube.com/watch?v=9MaJHwrBhms','https://www.youtube.com/watch?v=9MaJHwrBhms',NULL),
(8,1,'Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','Tiếng Anh với phụ đề tiếng Việt',120,'2019-11-20 13:50:20','2019-11-16 22:05:34','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.\r\n','Việt Nam','https://s3img.vcdn.vn/mobile/123phim/2019/10/phap-su-mu-ai-chet-gio-tay-blind-shaman-c18-15725111042745_215x318.jpg','https://www.youtube.com/watch?time_continue=116&v=t7srZZh9lxY','https://www.youtube.com/watch?time_continue=116&v=t7srZZh9lxY',NULL),
(9,1,'Kim Ji-young 1982)','Hàn Quốc với phụ đề tiếng Việt',129,'2019-11-20 14:14:34','2019-11-16 22:05:34','Kim Do-Young','Kim Do-Young','Kim Ji-young - một phụ nữ bình thường đang trải qua tháng ngày làm vợ, làm mẹ. Những câu chuyện đời thường tưởng chừng ai cũng biết, cho đến một ngày Ji-young nhận ra những điều kỳ lạ. Dường như cô đang là \"nơi tạm trú\" cho những người phụ nữ rất gắn bó với cuộc đời mình.','Hàn Quốc','https://s3img.vcdn.vn/mobile/123phim/2019/10/kim-ji-young-1982-15716550697543_215x318.jpg','https://www.youtube.com/watch?v=52dn-wClkz0','https://www.youtube.com/watch?v=52dn-wClkz0',NULL),
(10,2,'Vùng Đất Thây Ma: Cú Bắn Đúp - Zombieland: Double Tap','Tiếng Anh với phụ đề tiếng Việt',95,'2019-11-20 17:45:09','2019-11-16 22:05:34','Ruben Fleischer','Abigail Breslin, Jesse Eisenberg, Woody Harrelson, Gemma Atkinson','Sau 10 năm dài đẵng đằng, Zombieland 2 đã chính thức trở lại với mốc thời gian 10 năm tương tự ngoài thực tế. Double Tap tiếp tục xoay quanh nhóm nhân vật chính lầy lội gồm: Columbus  - thanh niên mọt sách nhút nhát luôn trung thành theo bộ nguyên tắc sinh tồn do cậu đề ra, gã “Sát thủ Zombie” Tallahassee cao ngạo bị nghiện món bánh Twinkie cùng hai chị em lừa lọc Wichita - Little Rock. Nhằm tìm kiếm các tập thể người vẫn còn sống sót, bọn họ đã quyết định “đi phượt” tới trung tâm hành chính của','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/09/vung-dat-thay-ma-cu-ban-dup-zombieland-double-tap-c18-15692329823044_215x318.jpg','https://www.youtube.com/watch?time_continue=4&v=ZlW9yhUKlkQ','https://www.youtube.com/watch?time_continue=4&v=ZlW9yhUKlkQ',NULL),
(11,2,'Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','Tiếng Việt',120,'2019-11-20 00:00:00','2019-12-20 00:00:00','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','nullfilm_image_1573986772994.jpg','https://youtu.be/t7srZZh9lxY','https://youtu.be/t7srZZh9lxY',18),
(12,2,'Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','Tiếng Việt',120,'2019-11-20 00:00:00','2019-12-20 00:00:00','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','nullfilm_image_1573986840058.jpg','https://youtu.be/t7srZZh9lxY','https://youtu.be/t7srZZh9lxY',18),
(13,2,'Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','Tiếng Việt',120,'2019-11-20 00:00:00','2019-12-20 00:00:00','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','E:/Project/my_cenima/TestPrivate/BK/api-server/images/film_image_1573986876329.jpg','https://youtu.be/t7srZZh9lxY','https://youtu.be/t7srZZh9lxY',18),
(14,2,'Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','Tiếng Việt',120,'2019-11-20 00:00:00','2019-12-20 00:00:00','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','E:/Project/my_cenima/TestPrivate/BK/api-server/images/film_image_1573986915318.jpg','https://youtu.be/t7srZZh9lxY','https://youtu.be/t7srZZh9lxY',18),
(18,2,'Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','Tiếng Việt',120,'2019-11-20 00:00:00','2019-12-20 00:00:00','Huỳnh Lập, Lý Minh Thắng','string','string','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','E:/Project/my_cenima/TestPrivate/BK/api-server/images/film_image_1573987059948.jpg','https://youtu.be/t7srZZh9lxY','https://youtu.be/t7srZZh9lxY',14),
(19,2,'Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','Tiếng Việt',120,'2019-11-20 00:00:00','2019-12-20 00:00:00','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.','Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','E:/Project/my_cenima/TestPrivate/BK/api-server/images/film_image_1573987060702.jpg','https://youtu.be/t7srZZh9lxY','https://youtu.be/t7srZZh9lxY',18);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `move_id` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `type` int(1) DEFAULT 1 COMMENT '1 = Khuyen mai. 2 = Review. 3 = TinTuc24h',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`image`,`move_id`,`create_at`,`type`) values 
(1,'Siêu phẩm hoạt hình Trung Quốc - Na Tra: Ma Đồng Giáng Thế chính thức đổ bộ phòng chiếu Vi','Từ đầu tháng 8 năm nay, giới mộ điệu đã xôn xao về một hiện tượng điện ảnh chưa từng có trong lịch sử. Bộ phim hoạt hình Na Tra: Ma Đồng Giáng Thế -câu chuyện cải biên đầy phá cách về một nhân vật đặc trưng trong văn hóa Trung Quốc đã tạo nên một cơn sốt tại phòng vé nội địa đồng thời nhận được vô số lời khen từ khán giả cũng như các nhà phê bình.\r\nPhim lần lượt xô đổ hàng loạt kỷ lục doanh thu khủng nhất Trung Quốc như Phim hoạt hình Trung Quốc có doanh thu cao nhất mọi thời đại, Phim hoạt hình có doanh thu tại một thị trường cao nhất thế giới,... Tính đến hết ngày 31.08, Na Tra: Ma Đồng Giáng Thế đã chạm mốc doanh thu 4,655 tỷ NDT (hơn 15 nghìn tỷ đồng), trở thành Phim điện ảnh doanh thu cao nhất năm 2019 tại Trung Quốc, đồng thời soán ngôi bom tấn Chiến Lang 2 của đạo diễn Ngô Kinh để trở thành tác phẩm có doanh thu cao thứ hai lịch sử điện ảnh nước này (chỉ xếp sau Lưu Lạc Địa Cầu).\r\nTrailer chính thức của phim.\r\nTác phẩm hoạt hình làm nên kỳ tích này xoay quanh Na Tra - nhân vật thần thoại vốn đã rất quen thuộc với khán giả Trung Quốc và cả châu Á. Chuyện kể rằng thuở hồng hoang, tinh hoa đất trời hội tụ thành một viên ngọc chứa đựng năng lượng khổng lồ. Nguyên Thủy Thiên Tôn đã phân tách viên ngọc này thành 1 viên Linh Châu và 1 viên Ma Hoàn.\r\nViên Linh Châu sẽ đầu thai thành một anh hùng cứu thế, phò trợ nhà Chu. Trong khi đó, Ma Hoàn sẽ tạo ra một Ma Vương tàn sát thiên hạ. Viên Ma Hoàn sinh ra Na Tra - con trai vị tướng biên ải Lý Tịnh, còn Linh Châu sinh ra Ngao Bính - Tam thái tử gánh trọng trách phục hưng long tộc của Đông Hải Long Vương.\r\nPhim sẽ tập trung vào quan hệ của Na Tra và Ngạo Bính.\r\nĐể ngăn chặn thảm họa khi Ma Hoàn chuyển thế, Nguyên Thủy Thiên Tôn đã hạ chú để sau 3 năm, Ma Vương cũng tức là Na Tra sẽ bị sấm chớp của thiên kiếp tiêu diệt. Na Tra - đứa trẻ yêu ma bị làng tộc ghét bỏ sẽ phải đơn độc đối đầu với thiên mệnh để thoát khỏi án tử trớ trêu.\r\nTrong Na Tra: Ma Đồng Giáng Thế, khán giả sẽ được gặp lại những nhân vật quen thuộc khác trong Phong Thần Diễn Nghĩa như vợ chồng Lý Tịnh - Ân Thị, Ngao Bính, Thân Công Báo, Thái Ất Chân Nhân,…\r\nSư phụ của Na Tra - Thái Ất Chân Nhân và phản diện Thân Công Báo - Sư phụ của Ngao Bính trong phiên bản này.\r\nTrong truyền thuyết Trung Quốc cũng như đa số xuất phẩm điện ảnh từng ra mắt, Na Tra thường được miêu tả có dung mạo khôi ngô, tuấn tú. Tay phải Na Tra cầm Hỏa Tiêm Thương, tay trái cầm Càn Khôn Khuyên, vai đeo dải lụa Hỗn Thiên Lăng, chân đi bánh xe Phong Hoả Luân, từ khi nhỏ tuổi đã mang thần sắc phi phàm của một vị thiên tướng.\r\nNhưng Na Tra: Ma Đồng Giáng Thế lại mang tới một hình tượng Na Tra hoàn toàn khác biệt. Cậu bé sinh ra từ viên Ma Hoàn lần này có đôi mắt thâm quầng và dáng vẻ ngỗ nghịch bất trị, được nhận xét là Na Tra xấu xí nhất lịch sử.','https://i.ytimg.com/vi/oJEwLXhPY7Y/maxresdefault.jpg',1,'2019-11-15 16:19:23',3),
(2,'4 sự khác biệt thú vị giữa bản điện ảnh và nguyên tác gốc của Doctor Sleep','Nhắc đến những tác phẩm kinh dị đầu thập niên 80, không ai là không nghĩ ngay đến tuyệt phẩm kinh dị The Shining do Stanley Kubrick làm đạo diễn. Dù được đánh giá là một trong những bộ phim kinh dị xuất sắc nhưng tác phẩm lại bị cha đẻ nguyên tác, \"ông hoàng kinh dị\" Stephen King chê bai thậm tệ vì đã thay đổi quá nhiều tình tiết, khiến tinh thần chính của câu chuyện cũng bị bóp méo.\r\nCho đến năm nay, khi Doctor Sleep (tựa Việt: Doctor Sleep: Ký Ức Kinh Hoàng) ra mắt, tác phẩm đã được Stephen King đón nhận một cách nồng nhiệt. Phần phim tiếp nối bản 1980, cũng vừa là chuyển thể điện ảnh cho hậu truyện The Shining, ngoài viễ đã xuất sắc trung thành sát sao với chất liệu nền tảng, lại còn sở hữu những yếu tố hấp dẫn thu hút khán giả hiện đại.\r\n\r\nTuy nhiên, việc chuyển tải toàn bộ tiểu thuyết thành một tác phẩm điện ảnh dài hơn 150 phút là điều không hề dễ dàng nên thay đổi là điều không thể tránh khỏi. Vậy làm thế nào, để đạo diễn Mike Flanagan vừa thành công chuyển thể, vừa thoải mái phát triển mà lại còn để tri ân The Shining của Stanley Kubrick, cùng điểm qua những thay đổi \"nhè nhẹ\" giữa bản điện ảnh và nguyên tác gốc của Doctor Sleep.\r\n\r\nDanny Torrance - Abra Stone: Ruột thịt trong truyện, người dưng trên phim\r\n\r\nTrong nguyên tác, có một phân đoạn nhân vật Danny đi tìm bà ngoại của Abra và phát hiện rằng mẹ của Abra là con ngoài giá thú của cha anh - Jack Torrance và cũng là em gái cùng cha khác mẹ của Danny. Điều này đồng nghĩa với việc Dan và Abra là thực sự là hai cậu - cháu ruột thịt.\r\nĐến khi lên màn ảnh rộng, chi tiết này không được nhắc đến. Song, Abra thường gọi Dan bằng một danh xưng thân mật là “chú Dan”, như để gợi nhắc đến người xem về mối quan hệ của cả hai trong tiểu thuyết.\r\n\r\nLý do hội True Knot săn lùng cô bé Abra\r\n\r\nTừ truyện lên màn ảnh, phe phản diện là những kẻ trở nên trường sinh nhờ hút sinh khí từ những đứa trẻ “dị biệt” có khả năng shining, “thấu thị” giống mình.\r\n\r\nTrong tiểu thuyết, chúng đã gặp xui khi hút sự sống của một nạn nhân mang căn bệnh hiểm nghèo. Kết quả là cả bọn đều bị nhiễm bệnh và thủ lĩnh Rose the Hat cho rằng sinh khí từ cô bé Abra đủ mạnh mẽ để chữa lành cho cả nhóm True Knot.\r\nBản điện ảnh thì chi tiết này đã được loại bỏ hoàn toàn để giúp mạch phim đỡ rối. Thay vào đó, Rose the Hat (do Rebecca Ferguson thủ vai) nhận thấy rằng năng lượng, sự sống của cô bé Abra quá mạnh mẽ, một ngày nào đó sẽ vượt qua cả ả. Khi sự ghen tức cũng như bản năng sinh tồn trỗi dậy, lũ dị nhân độc ác quyết tâm săn lùng cô bé trước khi quá trễ. \r\n\r\nKhác biệt về bối cảnh\r\n\r\nTheo tiểu thuyết của \"ông hoàng kinh dị\", khách sạn Overlook - nơi diễn ra sự kiện The Shining nay đã không còn nữa, mà thay vào đó là địa điểm cắm trại của True Knot. Vì thế nếu như trong phim chúng phải lái xe qua những đường đèo hiểm trở và xa xăm để đụng mặt hai nhân vật chính, thì ở bản gốc, chúng chiến đấu trên chính “sân nhà” của mình.\r\nCòn phiên bản năm 1980, khách sạn chỉ bị chôn vùi trong bão tuyết mà thôi. Việc để khách sạn Overlook tiếp tục được tồn tại trong bản phim vừa là sự kết nối với tác phẩm của đạo diễn Stanley Kubrick, cũng là một cách tri ân của Mike Flanagan dành cho bậc tiền bối. Cũng từ đây, fan của The Shining có dịp hồi tưởng hành lang ô vuông đỏ, góc đèn chùm tự bật sáng và quầy bar nơi người pha chế rượu thoắt ẩn thoắt hiện. Những “gương mặt thân quen” của khách sạn cũng có dịp trở lại, hù dọa kẻ ngoại đạo như Rose the Hat một phen ra trò.\r\n\r\nThay đổi ở đoạn kết\r\n\r\nBản tiểu thuyết hậu truyện đã dành nhiều thời gian để Dan tha thứ cho người cha quá cố của mình. Trong The Shining, Jack Torrance hóa điên mà cầm rìu rượt đuổi vợ con. Thì trong truyện Doctor Sleep, chính linh hồn ông đã trở về giúp cậu con trai nay đã lớn khôn chống lại những kẻ thù mới. Ở bản truyện, Jack đã có dịp mỉm cười từ biệt Danny.\r\n\r\nĐến phiên bản điện ảnh, nhân vật Jack Torrance tuy có xuất hiện, nhưng lại trở thành nỗi ám ảnh mà Danny phải vượt qua. Thay vào đó, những người giúp anh lại chính là các hồn ma khách sạn, từ ma nữ khỏa thân trong bồn tắm, vị quản gia trầm lặng, cho đến cặp đôi song sinh,... Rose the Hat đã quá ngu muội khi quyết định mở những “chiếc hộp chứa ma quỷ” trong đầu Danny.\r\nĐồng thời nếu đoạn kết của bản điện ảnh, khi Danny quyết định hy sinh trong lò hơi nước, thì ở nguyên tác, Danny có một cái kết viên mãn, sống khỏe mạnh, cai hẳn được rượu và kịp đến dự buổi tiệc sinh nhật 15 tuổi của Abra Stone.\r\n\r\nChính cái kết của Mike Flanagan đã khiến Doctor Sleep: Ký Ức Kinh Hoàng được đánh giá cao. Trong phim The Shining, khách sạn Overlook bị chôn vùi trong bão tuyết và trong tác phẩm năm 2019, Danny quyết định thiêu rụi cả khách sạn, thanh tẩy nó. Hai bộ phim, hai cái kết của băng và lửa mang ý nghĩa sự kết thúc và khởi đầu.\r\nNhìn chung, phiên bản điện ảnh do Mike Flanagan cầm trịch đã hài hòa giữa chất liệu nguyên bản, đồng thời cũng khéo léo chiều chuộng fan của The Shining ngày trước. Một trong những giá trị nhân văn lớn nhất của phim vẫn là việc Danny vượt qua những cơn ác mộng trong quá khứ để trưởng thành và trở thành một con người tốt đẹp hơn.\r\n\r\nXét về phương diện giải trí, đây vẫn là một tác phẩm điện ảnh hoàn toàn thỏa mãn được kỳ vọng của đại chúng, xứng đáng là “người cầm đuốc” thừa hưởng cơn sốt thành công từ hai phần phim kinh dị It - cũng là một bộ phim chuyển thể từ \"ông hoàng kinh dị\" Stephen King.','https://s3img.vcdn.vn/123phim/2019/11/4-su-khac-biet-thu-vi-giua-ban-dien-anh-va-nguyen-tac-goc-cua-',2,'2019-11-16 16:20:40',1),
(3,'Đầu năm 2020, Ju-On sẵn sàng chào đón bạn tại phòng chiếu Việt','Ra mắt từ năm 2002, Ju-On nhanh chóng trở thành một trong những loạt phim kinh dị Nhật Bản ghê rợn nhất mọi thời đại. Trải qua 5 phần phim Nhật và 3 phần phim Mỹ, thì vào đầu năm 2020, khán giả sẽ tiếp tục được hù doạ bởi một phiên bản The Grudge hoàn toàn mới, ghê rợn hơn, hồi hộp hơn. Sau 11 năm vắng bóng trên màn ảnh rộng, thương hiệu này đã trở lại và tiếp tục nhiệm vụ, gieo rắc nỗi kinh hoàng cho khán giả trên toàn thế giới.\r\nLời nguyền ghê rợn bậc nhất màn ảnh rộng\r\n\r\nThe Grudge lấy ý tưởng từ truyền thuyết dân gian Nhật Bản nổi tiếng về linh hồn báo thù. Một lời nguyền đáng sợ sẽ ra đời khi một ai đó chết trong cơn thịnh nộ hay nỗi oán hận không dứt. Bất kỳ người nào gặp phải hay bước vào nơi thế lực ma quái này ám sẽ nhận phải cái chết kinh hoàng.\r\n\r\nTừ đó, lời nguyền sẽ lặp đi lặp lại, truyền từ nạn nhân này sang nạn nhân khác và tạo thành chuỗi kinh hoàng không bao giờ dứt.\r\nTrong phần phim năm 2004, bà nội trợ Kayako ở Tokyo đã phải lòng một giảng viên đại học và viết vào trong nhật ký. Người chồng Takeo phát hiện ra và nghi ngờ vợ ngoại tình nên đã giết cô cùng đứa con trai Toshio và con mèo Mar một cách tàn bạo. Từ đó, linh hồn của Kayako và Toshio ám lấy căn nhà và giết bất kỳ ai vô tình bước chân vào đây. Phiên bản The Grudge (2020) sẽ tiếp tục lấy bối cảnh song song với các sự kiện trong phần phim cùng tên.\r\n\r\nTrailer ám ảnh với những hình ảnh rùng rợn\r\n\r\nTrailer đầu tiên dài hơn 2 phút đã đủ khiến khán giả phải “sởn tóc gáy”. Nhận được thông báo từ chàng nhân viên môi giới nhà đất Peter Spencer (John Cho), nữ thám tử Muldoon (Andrea Riseborough) phát hiện ra một vụ án mạng kinh hoàng trong căn nhà hoang. Tuy nhiên, những người đồng nghiệp của cô chưa bao giờ dám bước chân vào đó vì cảm giác sợ hãi đến kỳ lạ.\r\nChưa dừng lại ở đó, họ dần chứng kiến thêm nhiều vụ giết người ghê rợn có liên quan đến ngôi nhà bí ẩn kia. Ngay khi bước chân vào căn nhà cũng là lúc Muldoon nhận ra bản thân đã trúng phải lời nguyền chết chóc dù cô trốn chạy đến đâu đi chăng nữa.\r\n\r\nTừ đây, cả trailer đã “chiêu đãi” khán giả hàng loạt cảnh hù dọa đứng tim với tạo hình con ma đáng sợ với mái tóc rũ rượi, gương mặt cứng đờ vì kinh hãi và cơ thể méo mó, bò sát trên mặt đất hay vách tường.\r\nPhần âm thanh chói tai với tiếng kim đồng hồ tíc tắc như cái chết đang cận kề hay tiếng kêu răng rắc đến ám ảnh đặc trưng của thương hiệu sẽ làm những ai yếu bóng vía khó ngủ.\r\n\r\nVới sự trở lại của Sam Raimi trong vai trò sản xuất cùng đạo diễn trẻ Nicolas Pesce và hàng loạt ngôi sao gắn với dòng phim kinh dị như Andrea Riseborough, John Cho và Lin Shaye, The Grudge chắc chắn sẽ là phim kinh dị đáng sợ bậc nhất vào đầu năm 2020.','https://s3img.vcdn.vn/123phim/2019/10/dau-nam-2020-ju-on-san-sang-chao-don-ban-tai-phong-chieu-viet-',3,'2019-11-17 16:22:13',2),
(4,'Sau 10 ngày khởi chiếu, Joker đã thu về gần 60 tỷ đồng','Joker là phim điện ảnh đầu tiên lấy hình tượng nhân vật phản diện Joker làm trung tâm, cũng là tác phẩm đầu tiên khán giả biết đến nguồn gốc của gã hề (theo cách riêng của đạo diễn Todd Phillips). Chính vì thế, bộ phim đã thu hút sự tò mò của khán giả đại chúng từ những ngày đầu tiên thông báo dự án.\r\nVới sự đầu tư tâm huyết, nhạc phim xuất sắc, góc quay tuyệt vời kết hợp với màn diễn xuất đỉnh cao của Joaquin Phoenix, Joker đã chiến thắng ở hạng mục Phim hay nhất tại Liên hoan phim Venice 2019, mang về giải thưởng Sư tử vàng và hứa hẹn là một trong những ứng cử viên sáng giá trên đường đua đến Oscar 2020. Cũng chính vậy, sức hút và thành tích doanh thu ấn tượng của phim không phải là điều gì khó hiểu.\r\nRa mắt chính thức từ 04.10, tổng doanh thu toàn cầu tính đến thời điểm hiện tại đã cán mốc 543,9 triệu USD, vượt qua con số 519,9 triệu USD của How to Train Your Dragon: The Hidden World và nằm trong Top 10 bộ phim ăn khách nhất 2019. Với ngân sách chỉ vỏn vẹn 55 triệu USD, Joker quả thực là một chiến thắng đáng tự hào của hãng phim Warner Bros. cũng như nhà DC trong năm 2019 này.\r\nTại thị trường nội địa Bắc Mỹ, phim vẫn đang càn quét phòng vé, giữ vững ngôi vương với doanh thu đạt 192,7 triệu USD. Và dù không được chiếu tại thị trường Trung Quốc, doanh thu quốc tế của Joker cũng đã lên tới 351,2 triệu USD. Dẫn đầu là Hàn Quốc với 16,2 triệu USD, theo sau là thị trường Anh với 15,5 triệu USD và Mexico với 13,5 triệu USD.\r\nTại Việt Nam, dù đã bước sang đến tuần thứ 2 nhưng Joker hiện vẫn xuất sắc giữ vững vị trí số một bảng xếp hạng doanh thu phòng vé. Phim đã ghi nhận 800.000 lượt khán giả ra rạp. Tổng doanh thu đã đạt khoảng 60 tỷ đồng.\r\nJoker hiện vẫn đang được chiếu tại các cụm rạp trên toàn quốc.','https://s3img.vcdn.vn/123phim/2019/10/c1d4543e2eba337fb48b6bde4d55ec47.jpg',1,'2019-11-17 16:23:14',1);

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
('3ddec6284aa23ba6d8f4a5accf90f431','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�[�xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$290db5f4-3e08-4e1a-b829-f05b0778cd67sq\0~\0	w\0\0�[�xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$1e78e327-42ae-4d33-8f0c-2426c370f48f','a1a65ec3086e05ad16aae26e4e9c0340','09737979441','onevinmec_dev1','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0onevinmec_dev1sr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\009737979441xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.UserMxܖe�C�\0L\0activet\0Ljava/lang/Integer;L\0blockq\0~\04L\0\ncreated_att\0Ljava/util/Date;L\0default_pidq\0~\0L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04L\0stateq\0~\04L\0\nupdated_atq\0~\05xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sq\0~\07\0\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0t\01pt\0vietthai1108@gmail.comt\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\009737979441q\0~\0:q\0~\09sq\0~\0;w\0\0n�x\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','4affb808002bdb2501bb17e5eaea2707',NULL),
('bd610ca49a1c49dfcf449cddd7d0ff0a','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�[kxsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$5a9e404e-1566-4dfe-86fc-6a2ef6310ad0sq\0~\0	w\0\0�[axsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$fd88e34a-b26c-4a09-851c-602ba42624eb','a36783d6ca5be122ec51911416d9ee35','0973797944','cleint_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	cleint_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0\n0973797944xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0pt\0vietthai1108@gmail.ct\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0973797944sq\0~\07\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','73f3df2f123b643f30e4a44b83daa2fd',NULL),
('e0ad9c533d4ca9d18728bc837fc916ab','��\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$��\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z���\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0�[�xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valueq\0~\0xpt\0$a6b95cdf-90de-4ff5-b499-2aacdfb8e119sq\0~\0	w\0\0�[�xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExt\0bearert\0$29bf91e1-9a5d-4c0f-b6ba-306c52edeb27','b311afebaf00de71e5721eb57e1fdee8','09737979441','cleint_id','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	cleint_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\009737979441xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.UserMxܖe�C�\0L\0activet\0Ljava/lang/Integer;L\0blockq\0~\04L\0\ncreated_att\0Ljava/util/Date;L\0default_pidq\0~\0L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04L\0stateq\0~\04L\0\nupdated_atq\0~\05xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sq\0~\07\0\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0t\01pt\0vietthai1108@gmail.comt\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\009737979441q\0~\0:q\0~\09sq\0~\0;w\0\0n�x\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0','6a56b465bb715ac9ed515e576e1f1f0a',NULL);

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
('cleint_id','$2a$10$7YFcYdwIpLMTPguAjfWVoOXnupV98DcVvi.1/NpHChYWbtS4ABKI.',NULL,'READ,WRITE',99999999,99999999,NULL,'password,authorization_code,refresh_token,implicit',NULL,NULL,NULL);

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
('73f3df2f123b643f30e4a44b83daa2fd','��\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/�Gc��ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens�\ncT�^\0L\0valuet\0Ljava/lang/String;xpt\0$5a9e404e-1566-4dfe-86fc-6a2ef6310ad0sr\0java.util.Datehj�KYt\0\0xpw\0\0�[ax','��\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1��\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0��^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_PATIENTxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	cleint_idsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0usernamet\0\n0973797944xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet�l�Z��*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0READt\0WRITExsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0.sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0x\0psr\0!com.oauth2.model.CustomUserDetail�3g;��g\0L\0isEmailLogint\0Ljava/lang/Boolean;xr\0com.oauth2.model.User��O��I�7\0L\0activet\0Ljava/lang/Integer;L\0\ncreated_att\0Ljava/util/Date;L\0idq\0~\04L\0mailq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0phoneq\0~\0L\0roleq\0~\04xpsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0sr\0java.sql.Timestamp&��S�e\0I\0nanosxr\0java.util.Datehj�KYt\0\0xpw\0\0n�x\0\0\0\0pt\0vietthai1108@gmail.ct\0Tháit\0<$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2t\0\n0973797944sq\0~\07\0\0\0\0sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0');

/*Table structure for table `rate` */

DROP TABLE IF EXISTS `rate`;

CREATE TABLE `rate` (
  `move_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rate` */

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
(1,'Phòng 1',30,NULL),
(2,'Phòng 2',50,NULL),
(3,'Phòng 3',60,NULL);

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`movie_id`,`room_id`,`start_time`,`end_time`) values 
(1,1,1,'2019-11-18 23:17:47','2019-11-16 23:17:53'),
(2,2,2,'2019-11-18 08:18:14','2019-11-17 09:18:14'),
(3,2,3,'2019-11-18 08:18:14','2019-11-17 09:18:14'),
(4,1,1,'2019-11-18 10:18:14','2019-11-17 12:18:14'),
(5,1,1,'2019-11-18 13:18:14','2019-11-17 15:18:14'),
(6,1,2,'2019-11-19 15:07:26','2019-11-19 15:07:26'),
(7,1,1,'2019-11-20 15:07:42','2019-11-20 17:07:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`,`schedule_id`,`seat_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `seat_id` (`seat_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `ticket` */

insert  into `ticket`(`id`,`code`,`schedule_id`,`staff_id`,`user_id`,`price`,`seat_id`) values 
(10,'_20191117_4NJGN_1_1',1,0,0,0,1),
(11,'_20191117_IGXEF_1_2',1,0,0,0,2),
(12,'_20191117_6VVBR_1_3',1,0,0,0,3),
(13,'_20191117_PVKQF_1_4',1,0,0,0,4),
(14,'_20191117_6SOFZ_1_5',1,0,0,0,5),
(15,'_20191117_6YKYE_1_6',1,0,0,0,6);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`phone`,`mail`,`password`,`active`,`role`,`created_at`,`updated_at`,`name`,`wallet`) values 
(1,'0973797944','thai1108@gmail.com','$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2',1,0,'2019-10-28 20:21:35','2019-10-28 20:21:35','Thái',NULL),
(2,'admin','admin@gmail.com','$2a$10$z0dvAtnWtq2WVcsvybr6K.XsFMRFjmCnlRkK8b4NKLCdIJ3Ug5oyq',1,1,'2019-10-28 15:18:26','2019-10-28 15:18:26','Admin',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
