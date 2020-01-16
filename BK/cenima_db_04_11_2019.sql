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
  `movie_id` int(11) DEFAULT NULL,
  `image_banner` varchar(200) DEFAULT NULL,
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `event_adv_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `event_adv` */

insert  into `event_adv`(`movie_id`,`image_banner`) values 
(2,'https://s3img.vcdn.vn/123phim/2019/11/3d-15728436812590.jpg'),
(9,'https://s3img.vcdn.vn/123phim/2019/11/termi-15725978655542.jpg'),
(8,'https://s3img.vcdn.vn/123phim/2019/11/3d-15728436812590.jpg'),
(10,'https://s3img.vcdn.vn/123phim/2019/11/3d-15728436812590.jpg'),
(3,'https://s3img.vcdn.vn/123phim/2019/11/addams-15725963833749.jpg'),
(4,'E:/Project/my_cenima/TestPrivate/BK/api-server/images/4_silde.jpg');

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `release_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `directors` varchar(200) DEFAULT NULL,
  `cast` varchar(200) DEFAULT NULL,
  `about` varchar(500) DEFAULT NULL,
  `nation` varchar(200) DEFAULT NULL,
  `thumb_image` varchar(200) DEFAULT NULL,
  `url_trailler` varchar(200) DEFAULT NULL,
  `url_full` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `movie` */

insert  into `movie`(`id`,`category_id`,`name`,`language`,`duration`,`release_date`,`directors`,`cast`,`about`,`nation`,`thumb_image`,`url_trailler`,`url_full`) values 
(1,6,'Tiên Hắc Ám 2 - Maleficent: Mistress of Evil','Tiếng Anh với phụ đề tiếng Việt',125,'2019-11-02 16:31:28','Joachim Rønning','Angelina Jolie, Elle Fanning, Michelle Pfeiffer, Ed Skrein, Chiwetel Ejiofor','Thời gian trôi qua thật bình yên với Maleficent và Aurora. Mặc dù mối quan hệ của cả hai được tạo dựng từ những tổn thương, thù hận rồi sau đó mới đến tình yêu thương nhưng cuối cùng thì nó cũng đã đơm hoa kết trái. Tuy vậy, xung đột giữa hai giới: loài người và tiên tộc vẫn vẫn luôn hiện hữu. Cuộc hôn nhân vốn bị trì hoãn giữa Aurora và Hoàng tử Phillips chính là cầu nối gắn kết Vương quốc Ulstead và nước láng giềng Moors lại với','Mỹ','https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/m/a/maleficent_official_poster.jpg','https://www.youtube.com/watch?v=-Ci96IlKIlQ','https://www.youtube.com/watch?v=-Ci96IlKIlQ'),
(2,1,'Kẻ Huỷ Diệt: Vận Mệnh Đen Tối - Terminator: Dark Fate','Tiếng Anh với phụ đề tiếng Việt',128,'2019-11-02 16:33:39','Tim Miller','Linda Hamilton, Arnold Schwarzenegger','Terminator: Dark Fate hứa hẹn là phần phim chắc chắn sẽ khiến các fan hâm mộ thỏa mãn bởi những pha hành động cực kỳ chất lượng. Cùng với đó, sự trở lại của đạo diễn James Cameron, Linda Hamilton và Arnold Schwarzenegge càng đem đến nhiều hơn sự kích thích và phấn khích. ​​​​​​​','Nga','https://s3img.vcdn.vn/123phim/2019/11/terminator-dark-fate-phim-hanh-dong-nghet-tho-toi-muc-can-thuoc-tro-tim-15726001287898.jpg','https://www.youtube.com/watch?v=Zw7z6O9JeYE','https://www.youtube.com/watch?v=Zw7z6O9JeYE'),
(3,2,'Búp Bê Ký Ức: Violet Evergarden','Tiếng Việt',92,'2019-11-01 16:34:21','Haruka Fujita, Taichi Ishidate','Haruka Fujita, Taichi Ishidate','Hãng hoạt hình Kyoto Animation của \"Dáng Hình Thanh Âm /A Silent Voice\" chính thức trở lại! Kyoto Animation - một trong những xưởng sản xuất phim hoạt hình anime nổi tiếng nhất Nhật Bản sẽ trở lại với phiên bản điện ảnh của loạt anime đình đám Violet Evergarden với phần phim mang tên \"Búp Bê Ký Ức Violet Evergarden/Violet Evergarden – Eternity and The Auto Memory Doll\" hứa hẹn sẽ lấy đi nhiều nước mắt của khán giả. \"Búp Bê Ký Ức Violet Evergarden\" lấ','Nhật Bản','https://s3img.vcdn.vn/mobile/123phim/2019/10/bup-be-ky-uc-violet-evergarden-15717167680013_215x318.jpg','https://www.youtube.com/watch?time_continue=52&v=RFMbFJDY_jo','https://www.youtube.com/watch?time_continue=52&v=RFMbFJDY_jo'),
(4,3,'Vượt Biển - Across The Waters','Tiếng Anh với phụ đề tiếng Việt',94,'2019-11-02 16:37:31','Nicolo Donato','Nicolo Donato','Arne Itkin, một nhạc công guitar chuyên chơi nhạc jazz dường như miễn nhiễm với tất cả các biến động khốc liệt của cuộc chiến tranh do chính phủ Đan Mạch chọn phương thức quan hệ hòa hảo với nước Đức Phát xít.','Nga','ttps://s3img.vcdn.vn/mobile/123phim/2019/10/vuot-bien-across-the-waters-15716534850780_215x318.jpg','https://www.youtube.com/watch?v=i7dygX_AJ3I','https://www.youtube.com/watch?v=i7dygX_AJ3I'),
(6,2,'Đồi Địa Đàng - Paradise Hills','Tiếng Anh với phụ đề tiếng Việt',120,'2019-11-02 16:39:03','Alice Waddington','Eiza González, Emma Roberts','Uma thức giấc trên một hòn đảo gọi là ĐỒI ĐỊA ĐÀNG được tạo ra để quản lý và giáo dục những cô gái không đứng đắn. Dẫn dắt bởi Duchess, hòn đảo tạo ra một cuộc sống trong mơ cho những bệnh nhân của nó. Tuy nhiên, phía sau những câu chuyện thần tiên là những bí mật được thiêu dệt sau mỗi giấc ngủ của các cô gái.','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/10/doi-dia-dang-paradise-hills-15712872831946_215x318.jpg','https://www.youtube.com/watch?v=6qmUlruSLGY','https://www.youtube.com/watch?v=6qmUlruSLGY'),
(7,1,'Salma Và Điều Ước Nhiệm Màu - Salma\'s Big Wish','Tiếng Anh với phụ đề tiếng Việt',110,'2019-11-04 13:51:07','Carlos Gutiérrez Medrano',NULL,'Tại thị trấn Santa Clara của Mexico, Salma là một đứa trẻ mồ côi 16 tuổi chưa bao giờ được gặp cha mẹ ruột. Câu chuyện duy nhất cô bé được nghe kể là họ đã bỏ rơi cô. Salma dành phần lớn cuộc đời của mình để tìm kiếm manh mối về danh tính của cha mẹ và nơi ở của họ. Cho đến một ngày, cô phát hiện ra một cuốn sách đặc biệt chứa đựng những câu chuyện về Santa Clara và lịch sử dân tộc. Lấy cảm hứng từ cuốn sách đặc biệt này, Salma bắt đầu cuộc phiêu lưu với hai anh em nuôi dũng cảm và tốt bụng của ','Mexico','https://s3img.vcdn.vn/mobile/123phim/2019/10/salma-va-dieu-uoc-nhiem-mau-salma-s-big-wish-15716598136414_215x318.jpg','https://www.youtube.com/watch?v=9MaJHwrBhms','https://www.youtube.com/watch?v=9MaJHwrBhms'),
(8,1,'Pháp Sư Mù: Ai Chết Giơ Tay - Blind Shaman','Tiếng Anh với phụ đề tiếng Việt',120,'2019-11-04 13:50:20','Huỳnh Lập, Lý Minh Thắng','Phương Thanh, Hạnh Thảo, Quang Trung, Việt Hương, Đại Nghĩa, NSND Trần Ngọc Giàu, Huỳnh Lập','Sau thành công vang dội của 8 tập phim web-drama \"Ai Chết Giơ Tay\", Huỳnh Lập thừa thắng xông lên với dự án điện ảnh \"Pháp Sư Mù\", phiên bản điện ảnh phần tiếp theo của \"Ai Chết Giơ Tay\" nhưng hoàn toàn độc lập, giúp những khán giả chưa được thưởng thức 8 tập web-drama vẫn dễ dàng tiếp nhận.\r\n','Việt Nam','https://s3img.vcdn.vn/mobile/123phim/2019/10/phap-su-mu-ai-chet-gio-tay-blind-shaman-c18-15725111042745_215x318.jpg','https://www.youtube.com/watch?time_continue=116&v=t7srZZh9lxY','https://www.youtube.com/watch?time_continue=116&v=t7srZZh9lxY'),
(9,1,'Kim Ji-young 1982)','Hàn Quốc với phụ đề tiếng Việt',129,'2019-11-04 14:14:34','Kim Do-Young','Kim Do-Young','Kim Ji-young - một phụ nữ bình thường đang trải qua tháng ngày làm vợ, làm mẹ. Những câu chuyện đời thường tưởng chừng ai cũng biết, cho đến một ngày Ji-young nhận ra những điều kỳ lạ. Dường như cô đang là \"nơi tạm trú\" cho những người phụ nữ rất gắn bó với cuộc đời mình.','Hàn Quốc','https://s3img.vcdn.vn/mobile/123phim/2019/10/kim-ji-young-1982-15716550697543_215x318.jpg','https://www.youtube.com/watch?v=52dn-wClkz0','https://www.youtube.com/watch?v=52dn-wClkz0'),
(10,2,'Vùng Đất Thây Ma: Cú Bắn Đúp - Zombieland: Double Tap','Tiếng Anh với phụ đề tiếng Việt',95,'2019-11-04 14:19:02','Ruben Fleischer','Abigail Breslin, Jesse Eisenberg, Woody Harrelson, Gemma Atkinson','Sau 10 năm dài đẵng đằng, Zombieland 2 đã chính thức trở lại với mốc thời gian 10 năm tương tự ngoài thực tế. Double Tap tiếp tục xoay quanh nhóm nhân vật chính lầy lội gồm: Columbus  - thanh niên mọt sách nhút nhát luôn trung thành theo bộ nguyên tắc sinh tồn do cậu đề ra, gã “Sát thủ Zombie” Tallahassee cao ngạo bị nghiện món bánh Twinkie cùng hai chị em lừa lọc Wichita - Little Rock. Nhằm tìm kiếm các tập thể người vẫn còn sống sót, bọn họ đã quyết định “đi phượt” tới trung tâm hành chính của','Mỹ','https://s3img.vcdn.vn/mobile/123phim/2019/09/vung-dat-thay-ma-cu-ban-dup-zombieland-double-tap-c18-15692329823044_215x318.jpg','https://www.youtube.com/watch?time_continue=4&v=ZlW9yhUKlkQ','https://www.youtube.com/watch?time_continue=4&v=ZlW9yhUKlkQ');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `move_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `room` */

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

/*Table structure for table `seats` */

DROP TABLE IF EXISTS `seats`;

CREATE TABLE `seats` (
  `seat_id` varchar(5) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `row` int(11) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seats` */

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ticket` */

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
(1,'0973797944','vietthai1108@gmail.c','$2a$10$z9AczFw.MqbQ3bneMOBxQ.w.SNdYXi0LTRaNy0FybKyNj2u1PvfD2',1,0,'2019-10-28 20:21:35','2019-10-28 20:21:35','Thái',NULL),
(2,'string','string','$2a$10$z0dvAtnWtq2WVcsvybr6K.XsFMRFjmCnlRkK8b4NKLCdIJ3Ug5oyq',1,2,'2019-10-28 15:18:26','2019-10-28 15:18:26','string',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
