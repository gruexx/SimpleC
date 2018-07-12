-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: simplechange
-- ------------------------------------------------------
-- Server version	5.5.60-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `addressid` int(11) NOT NULL AUTO_INCREMENT,
  `userid_fk_address` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  `isdefult` int(11) NOT NULL DEFAULT '1',
  `phone` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `province` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `detiladdress` varchar(255) NOT NULL,
  PRIMARY KEY (`addressid`),
  KEY `userid_fk_address_idx` (`userid_fk_address`),
  CONSTRAINT `userid_fk_address` FOREIGN KEY (`userid_fk_address`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `income` double NOT NULL DEFAULT '0',
  `outcome` double NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `userId_fk_bill` int(11) NOT NULL,
  `chaoincome` int(11) NOT NULL DEFAULT '0',
  `chaooutcome` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billId`),
  KEY `userId_fk_bill_idx` (`userId_fk_bill`),
  CONSTRAINT `userId_fk_bill` FOREIGN KEY (`userId_fk_bill`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classify`
--

DROP TABLE IF EXISTS `classify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classify` (
  `classifyId` int(11) NOT NULL AUTO_INCREMENT,
  `classifyName` varchar(45) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`classifyId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classify`
--

LOCK TABLES `classify` WRITE;
/*!40000 ALTER TABLE `classify` DISABLE KEYS */;
INSERT INTO `classify` VALUES (1,'家用电器',1),(2,'手机数码',1),(3,'电脑办公',1),(4,'服装',1),(5,'运动',1),(6,'食品',1),(7,'美妆',1),(8,'图书',1),(9,'其他',1);
/*!40000 ALTER TABLE `classify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(45) DEFAULT NULL,
  `userId_fk_comment` int(11) NOT NULL,
  `goodsId_fk_comment` int(11) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  `time` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId_fk_comment_idx` (`userId_fk_comment`),
  KEY `goodsId_fk_comment_idx` (`goodsId_fk_comment`),
  CONSTRAINT `goodsId_fk_comment` FOREIGN KEY (`goodsId_fk_comment`) REFERENCES `goods` (`goodsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId_fk_comment` FOREIGN KEY (`userId_fk_comment`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goodsId` int(11) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(255) NOT NULL,
  `classifyId_fk_goods` int(11) NOT NULL,
  `userId_fk_goods` int(11) DEFAULT NULL,
  `goodsPrice` double NOT NULL,
  `goodsNumber` int(11) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL DEFAULT 'GoodsImage/tan90.jpg',
  `goodsInfo` varchar(255) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  `hasOrders` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goodsId`),
  KEY `classifyId_fk_idx` (`classifyId_fk_goods`),
  KEY `userId_fk_idx` (`userId_fk_goods`),
  CONSTRAINT `classifyId_fk` FOREIGN KEY (`classifyId_fk_goods`) REFERENCES `classify` (`classifyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId_fk` FOREIGN KEY (`userId_fk_goods`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'椰果布丁果冻',6,1,20.9,100,'myimages/snack/guodong.jpg','浓郁自然的水果味，Q弹爽口的滋味，\r\n尽在舌尖环绕，美味可口。',1,0),(2,'香辣味海带丝',6,1,11.9,100,'myimages/snack/haidaisi.jpg','将新鲜采摘的海带多次反复彻底清洗，自然风干晾晒，保障海带爽滑的口感，多种辛香料调味，浓郁鲜香清新。',1,0),(3,'香酥大麻花',6,1,16.9,100,'myimages/snack/mahua.jpg','运用压面技巧，使成品口感更佳，优质植物油炸制了，严格控制油炸时间。',1,0),(4,'香卤铁蛋',6,1,10.5,100,'myimages/snack/ludan.jpg','爽弹有嚼劲，营养美味，简单又好吃。精选卤香料，把控原料质量，营养美味，朴实的素食，卤制、烘烤工艺让卤汁入味更香浓。',1,0),(5,'烤面筋',6,1,15.9,100,'myimages/snack/mianjin.jpg','采用不膨胀工艺，并配合特色配方保证了大豆浓郁的清香，制作出的面筋嚼劲十足。',1,0),(6,'山楂糕',6,1,9.9,-8,'myimages/snack/shanzha.jpg','酸甜可口，甜而不腻。山楂和饴糖的结合，酸酸甜甜好味道。文火细工熬制，保留了山楂的营养。',1,0),(7,'棒棒糖',6,1,11.9,100,'myimages/snack/bangbangtang.jpg','将白砂糖融化熬制，将熬好的糖加入配料搅拌均匀，搅拌好的材料冷却成型即可。',1,0),(8,'大刀肉辣条',6,1,15.9,100,'myimages/snack/latiao.jpg','麻辣鲜香带有丝丝甜味，每一片都带有儿时的回味。',1,0),(9,'烘烤薯片',6,1,13.9,100,'myimages/snack/shupian.jpg','将多种原材料准确配比，充分搅拌均匀，搅拌充分后的材料过称后，烘烤成型，成型后的薯片喷油，冷却即可。',1,0),(10,'小土豆',6,1,15.9,100,'myimages/snack/tudou.jpg','粉粉的，糯糯的，辛香鲜辣爽口，各种滋味，体会一口一颗，好吃到停不下来。',1,0),(11,'Jordan 官方 AIR JORDAN XXXII LOW PF 男子篮球鞋 AH334',5,1,1399,100,'myimages/sports/1.jpg','自由跃动，轻盈支撑，回弹缓震',1,0),(12,'官网正品尤尼克斯羽毛球拍全碳素纤维YY超轻进攻型耐打男女单双拍',5,1,289,100,'myimages/sports/2.jpg','上市时间: 2016年夏季品牌: YONEX/尤尼克斯Yonex/尤尼克斯 拍系: Arcsaber弓剑系列Arcsaber弓剑系列 拍型: ARC/NR系列',1,0),(13,'阿迪达斯adidas FIFA 世界杯 Glider 足球 CE8096',5,1,199,100,'myimages/sports/3.jpg','足球',1,0),(14,'Speedo/速比涛 专业训练 游泳眼镜 大框可调节智能贴合男女款泳镜',5,1,199,100,'myimages/sports/4.jpg','大视野镜面   3D贴合感技术   防眩光镀膜镜片',1,0),(15,'哑铃男士健身家用20/30公斤特价亚玲锻炼器材可调节亚玲男一对',5,1,82,100,'myimages/sports/5.jpg','上市时间: 2018年春季 品牌: 安美特（运动户外）适用对象: 男按健身效果选择: 腰腹练习',1,0),(16,'李宁风衣男士2018新款篮球系列长袖防风服连帽外套梭织春季运动服',5,1,179,100,'myimages/sports/6.jpg','领型: 连帽衣 门襟: 拉链 材质: 涤纶 运动系列: 篮球系列',1,0),(17,'汉鼎矶钓竿碳素超硬特价海竿抛竿钓鱼竿矶杆渔具鱼竿短节矶竿套装',5,1,119,100,'myimages/sports/7.jpg','钓鱼',1,0),(18,'握力器男式专业练手力臂肌手劲锻炼康复训练手指力腕力健身握手器',5,1,15,100,'myimages/sports/8.jpg','握手器',1,0),(19,'Jeep/吉普夏男女情侣款户外速干短袖透气快干速干衣T恤翻领polo衫',5,1,161,100,'myimages/sports/9.jpg','主要功能: 透气 速干 运动户外项目: 郊游 野营 徒步 商品系列: 城市户外',1,0),(20,'联想拯救者 刃9000',3,1,9774,100,'myimages/computer/1.jpg','CPU系列：英特尔 酷睿i7 8代系列 核心/线程数：六核心/十二线程',1,0),(21,'华硕飞行堡垒S M80',3,1,6134,100,'myimages/computer/2.jpg','CPU系列：英特尔 酷睿i5 7代系列 核心/线程数：四核心/四线程',1,0),(22,'戴尔Vostro 成就 3650系列 微塔式机',3,1,5926,100,'myimages/computer/3.jpg','CPU系列：英特尔 酷睿i7 6代系列 核心/线程数：四核心/八线程',1,0),(23,'惠普光影精灵II 690-058CN',3,1,6654,100,'myimages/computer/4.jpg','CPU系列	英特尔 酷睿i5 8代系列 核心/线程数 六核心/六线程',1,0),(24,'Alienware Area-51(ALWA51D-7958S)',3,1,65500,100,'myimages/computer/5.jpg','CPU系列	英特尔 酷睿i9 X代系列 核心/线程数 十八核心/三十六线程',1,0),(25,'联想ThinkCentre M910t',3,1,5198,100,'myimages/computer/6.jpg','CPU系列	英特尔 酷睿i5 7代系列 核心/线程数 四核心/四线程',1,0),(26,'挖矿主机,Acute Angle PC',3,1,6645,100,'myimages/computer/7.jpg','CPU型号	Intel 赛扬四核 N3450 核心/线程数 四核心/四线程',1,0),(27,'联想拯救者 Y720',3,1,6758,100,'myimages/computer/8.jpg','CPU系列	英特尔 酷睿i5 7代系列 核心/线程数 四核心/四线程',1,0),(28,'Acer Predator Orion 5000',3,1,17700,100,'myimages/computer/9.jpg','CPU系列	英特尔 酷睿i7 8代系列 核心/线程数 六核心/十二线程',1,0),(29,'戴尔全新XPS特别版8930-D1AN9S',3,1,16600,100,'myimages/computer/10.jpg','CPU系列	英特尔 酷睿i7 8代系列 核心/线程数 六核心/十二线程',1,0),(30,'那不勒斯的萤火',8,1,33.2,100,'myimages/book/1.jpg','被誉为欧美文坛近十年来的“灯塔”巨作，跟《追风筝的人》《阿甘正传》一样震撼灵魂、给人力量',1,0),(31,'深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）',8,1,58.8,100,'myimages/book/2.jpg','本书第1版两年内印刷近10次，4家网上书店的评论近4?000条，98%以上的评论全部为5星级的好评，是整个Java图书领域公认的经典著作和超级畅销书，繁体版在台湾也十分受欢迎。第2版在第1版的基础上做',1,0),(32,'爱的流放地',8,1,40.8,100,'myimages/book/3.jpg','渡边淳一“终极之爱”惊世杰作，日本图书销量和电影票房超过《失乐园》！女人，一旦她的肉体开始奔跑便无法停止',1,0),(33,'本杰明·富兰克林自传 （完整版）（精装全2册）',8,1,76.6,100,'myimages/book/4.jpg','《独立宣言》起草人的励志人生，改变无数人命运的精神读本，美国开国元勋富兰克林的传奇一生，本套书首次公开了富兰克林后33年的重要历史事件，及其所遗留的未经出版的书信，亲笔手稿等珍贵资料',1,0),(34,'一瓣河川',8,1,45.9,100,'myimages/book/5.jpg','江南、严锋、六神磊磊、小椴、宝树、陈楸帆一致推荐，豆瓣阅读征文大赛武侠组首奖作品',1,0),(35,'Python网络爬虫从入门到实践',8,1,38.6,100,'myimages/book/6.jpg','本书将介绍如何使用Python编写网络爬虫程序获取互联网上的大数据',1,0),(36,'爱在原野尽头',8,1,25.5,100,'myimages/book/7.jpg','渡边淳一婚恋题材小说的“反思”之作，揭示现代人在钢筋水泥城市生活中的爱情困境',1,0),(37,'牧羊少年奇幻之旅(精)',8,1,29.9,100,'myimages/book/8.jpg','《牧羊少年奇幻之旅》是一部少年追求梦想的寓言故事',1,0),(38,'活着(2017年新版)',8,1,15.3,100,'myimages/book/9.jpg','《活着》是一部充满血泪的小说。余华通过一位中国农民的苦难生活 讲述了人如何去承受巨大的苦难',1,0),(39,'皮囊',8,1,21.8,100,'myimages/book/10.jpg','献给内心漂泊无依的你，关于亲人、关于故乡，真挚暖心',1,0),(40,'三星（SAMSUNG）UA65MUC30SJXXZ 65英寸 曲面 HDR 4K超高清 智',1,1,5988,133,'myimages/household/1.jpg','商品名称：三星UA55MUF70AJXXZ商品编号：7408721商品毛重：	22.0kg商品产地：中国大陆观看距离：3-3.5米分辨率：超高清电视 类型：人工智能电视，4K超清电视，HDR能效等级：',1,0),(41,'TCL 55V1 55英寸32核超高清 4K曲面HDR超薄金属智能电视机（枪色）',1,1,2587,100,'myimages/household/2.jpg','商品名称：TCL55V1商品编号：6349457商品毛重：18.8kg商品产地：中国大陆合约方案：腾讯视频合约观看距离：3-3.5米分辨率：超高清电视类型：超薄电视，4K超清电视，曲面电视，HDR能效',1,0),(42,'晶弘（KINGHOME）格力制造410升智能变频十字对开门冰箱 宽幅变温 格力晶弘 BCD',1,1,2749,100,'myimages/household/3.jpg','商品名称：晶弘BCD-410PQC/银拉丝商品编号：2968836商品毛重：106.0kg商品产地：中国大陆控温方式：电脑控温制冷方式：直冷能效等级：2级高度：180.1-190cm 面板颜色：金色',1,0),(43,'海尔（Haier）450升 风冷无霜对开门冰箱 纤薄机身 智能控制 低温净味 BCD-45',1,1,3299,97,'myimages/household/4.jpg','商品名称：晶弘BCD-410PQC/银拉丝商品编号：2968836商品毛重：106.0kg商品产地：中国大陆控温方式：电脑控温制冷方式：直冷能效等级：2级高度：180.1-190cm		面板颜色：金色',1,1),(44,'格力（GREE）正1.5匹 变频 品圆 冷暖 壁挂式空调 KFR-35GW/(35592)',1,1,3299,-7,'myimages/household/5.jpg','商品名称：格力KFR-35GW/35592FNhDa-A3商品编号：1993092商品毛重：13.5kg商品产地：中国大陆变频/定频：变频产品特色：静音空调冷暖类型：冷暖空调商品	匹数：1.5匹能效等',1,0),(45,'长虹 (CHANGHONG)CKR-D13 电热水龙头 快速热加热厨房小厨宝电热水器 数码',1,1,189,100,'myimages/household/6.jpg','商品名称：长虹CKR-D13商品编号：7422056商品毛重：1.13kg商品产地：中国大陆产品类型：电热水龙头控制方式：机械式加热类别：速热',1,0),(46,'小熊（Bear）煮蛋器 家用早餐机蒸蛋器自动断电微电脑预约定时双层可煮14个蛋 ZDQ-C',1,1,99,100,'myimages/household/7.jpg','商品名称：小熊ZDQ-C14A1商品编号：2908612商品毛重：1.25kg商品产地：广东顺德类别：煮蛋器煮蛋数量：10个以上层数：双层',1,0),(47,'美的（Midea）电饭煲 气动涡轮防溢 金属机身 圆灶釜内胆4L电饭锅MB-WFS4037',1,1,279,100,'myimages/household/8.jpg','商品名称：美的MB-WFS4037商品编号：1135611商品毛重：5.5kg商品产地：中国大陆预约定时：24小时预约功能：柴火饭，快速饭，杂粮饭，粥/汤容量：4L(3-5人)蒸	汽阀类别：气动涡轮类',1,0),(48,'飞利浦(PHILIPS)加湿器 上加水 纳米无雾恒湿 静音办公室卧室家用加湿 HU4803',1,1,489,100,'myimages/household/9.jpg','商品名称：飞利浦HU4803/00商品编号：729828商品毛重：3.95kg商品产地：中国适用面积：21-30㎡操作方式：其他类型：恒湿加湿型加水方式：普通加水加湿方式：无雾加湿容积：3L以下适用场',1,0),(49,'松下（Panasonic）电吹风机家用EH-NA30-R纳米水离子大功率恒温护发',1,1,399,100,'myimages/household/10.jpg','商品名称：松下EH-NA30-R商品编号：283715商品毛重：0.83kg商品产地：中国大陆功率：1500W~1999W功能：纳米水离子养发功能，手柄可折叠',1,0),(50,'iPhone X',2,1,8299,100,'myimages/phone/1.jpg','主屏幕尺寸（英寸）5.8英寸 数据传输接口  WIFI；蓝牙；WIFI热点 NFC/NFC模式  其他 耳机接口类型  Lightning 充电接口类型  Lightning',1,0),(51,'小米8',2,1,2699,100,'myimages/phone/10.jpg','主屏幕尺寸（英寸）6.21英寸 电池容量（mAh）3400mAh 电池是否可拆卸  否 闪充 支持 数据传输接口  NFC；蓝牙；OTG接口',1,0),(52,'OPPO R15',2,1,2699,100,'myimages/phone/2.jpg','主屏幕尺寸（英寸）6.28英寸 电池容量（mAh）3450mAh 电池是否可拆卸 否 闪充 支持 数据传输接口  WIFI；蓝牙；WIFI热点；OTG接口',1,0),(53,'VIVO X21',2,1,3598,100,'myimages/phone/3.jpg','主屏幕尺寸（英寸）6.28英寸 电池容量（mAh）3200mAh 电池是否可拆卸 否 闪充 支持 NFC/NFC模式 不支持',1,0),(54,'华为 Emily-AL00B',2,1,3788,100,'myimages/phone/4.jpg','主屏幕尺寸（英寸）5.8英寸 电池容量（mAh）3400mAh 电池容量（mAh）3400mAh 电池是否可拆卸  否 闪充 支持 数据传输接口  WIFI；NFC；蓝牙；WIFI热点；OTG接口',1,0),(55,'坚果R1',2,1,3499,100,'myimages/phone/5.jpg','主屏幕尺寸（英寸）6.17英寸 电池容量（mAh）3400mAh 电池容量（mAh）3400mAh 电池是否可拆卸  否 闪充 支持 数据传输接口  WIFI；NFC；蓝牙；WIFI热点；OTG接口',1,0),(56,'MEIZU 15',2,1,2499,100,'myimages/phone/6.jpg','主屏幕尺寸（英寸）5.7英寸 电池容量（mAh）3000mAh 电池是否可拆卸  否 快速充电  24W闪充 数据传输接口  WIFI热点；蓝牙',1,0),(57,'nubia Z17S（NX595J）',2,1,2499,-13,'myimages/phone/7.jpg','主屏幕尺寸（英寸）5.7英寸 电池容量（mAh）3100mAh 电池是否可拆卸  否 快速充电  26W闪充 闪充 支持 数据传输接口  NFC；蓝牙；OTG接口',1,0),(58,'荣耀10',2,1,2599,100,'myimages/phone/8.jpg','主屏幕尺寸（英寸）5.84英寸 电池容量（mAh）3400mAh 电池是否可拆卸  否 数据传输接口  WIFI；蓝牙',1,0),(59,'三星 SM-G9600/DS',2,1,6699,100,'myimages/phone/9.jpg','主屏幕尺寸（英寸）5.8英寸 电池容量（mAh）3000mAh 电池是否可拆卸  否 无线充电 支持 数据传输接口  WIFI；NFC；蓝牙；WIFI热点；OTG接口',1,0),(60,'一叶子面膜',7,1,99,100,'myimages/beauty/1.jpg','一叶子面膜美白淡斑补水保湿收缩毛孔提亮肤色专柜正品叶子学生女20片',1,0),(61,'恒久 forever 气垫',7,1,355,100,'myimages/beauty/2.jpg','Dior/迪奥2018限量版皮革气垫粉底液 恒久 forever 气垫',1,0),(62,'兰芝气垫',7,1,175,100,'myimages/beauty/3.jpg','免税店采购 兰芝气垫bb霜粉凝霜 滋润遮瑕 送替换装 包邮',1,0),(63,'悦诗风吟散粉',7,1,45,100,'myimages/beauty/4.jpg','韩国innisfree悦诗风吟散粉薄荷定妆粉持久控油蜜粉',1,0),(64,'百雀羚爽肤水',7,1,48,100,'myimages/beauty/5.jpg','正品百雀羚爽肤水女水嫩倍现精华水清爽补水保湿化妆水草本护肤品',1,0),(65,'韩束面霜',7,1,49.9,100,'myimages/beauty/6.jpg','韩束面霜女补水保湿紧致锁水润肤早晚红石榴滋养霜旗舰店官网正品',1,0),(66,'自然堂防晒霜',7,1,54,100,'myimages/beauty/7.jpg','自然堂防晒霜30+隔离美白女补水保湿户外超强面部正品专柜非喷雾',1,0),(67,'韩束面膜',7,1,109,100,'myimages/beauty/8.jpg','韩束玻尿酸面膜补水保湿提亮控油收缩毛孔官网旗舰店专柜正品',1,0),(68,'悦诗风吟洗面奶',7,1,54,100,'myimages/beauty/9.jpg','韩国正品innisfree男女学生洗面奶控油美白祛痘深层清洁毛孔补水',1,0),(69,'卡姿兰腮红',7,1,25,100,'myimages/beauty/10.jpg','卡姿兰腮红正品裸妆持久保湿提亮肤色晒红粉胭脂水粉防水化妆品',1,0),(70,'七匹狼 短袖T恤男 夏季男装商务休闲翻领纯色纯棉T恤 101(藏青) 170/88A/L',4,1,139,100,'myimages/clothes/1.jpg','品名：时尚多彩翻领T恤 面料成分：100%纯棉 商品系列：时尚休闲',1,0),(71,'七匹狼 休闲裤男 夏季男士商务绅士宽松直筒修身长裤免烫裤子男 001(黑色)',4,1,239,100,'myimages/clothes/2.jpg','裤型：修身裤 风格：商务休闲 适用场景：上班，旅游，居家',1,0),(72,'Baleno班尼路 纯棉休闲印花舒适短裤男 青年学生潮流五分裤男',4,1,119.9,100,'myimages/clothes/3.jpg','裤型：直筒裤 裤长：五分裤 主要材质：棉 适用场景：休闲\r\n\r\n版型：标准型 主要材质：棉 领型：棒球领 适用场景：休闲',1,0),(73,'Baleno/班尼路 针织飞行夹克外套男 春季帅气外套男 棒球服男潮韩',4,1,149,100,'myimages/clothes/4.jpg','版型：标准型 主要材质：棉 领型：棒球领 适用场景：休闲\r\n版型：标准型 主要材质：棉 领型：棒球领 适用场景：休闲',1,0),(74,'Baleno班尼路 新款格子休闲衬衫男 简约翻领透气短袖衬衣男夏装',4,1,89.9,100,'myimages/clothes/5.jpg','风格：商务休闲 厚度：常规 领型：方领 袖长：短袖 适用场景：休闲',1,0),(75,'班尼路/Baleno男装裤子 男士薄款牛仔裤2017新品青年修身长裤',4,1,107,100,'myimages/clothes/6.jpg','风格：欧美简约 厚度：薄款 流行元素：简约 适用场景：休闲 颜色：蓝色',1,0),(76,'Baleno/班尼路女装 纯棉水洗牛仔衬衫女 时尚刺绣女牛仔外套秋',4,1,89.9,100,'myimages/clothes/7.jpg','风格：简约 厚度：适中 领型：翻领 流行元素：绣花 衣长：中长款 袖长：长袖',1,0),(77,'baleno班尼路女装 五分袖条纹连身裙中长款体恤女新款休闲T恤裙',4,1,139.9,100,'myimages/clothes/8.jpg','腰型：松紧腰 风格：休闲 领型：圆领 图案：条纹 流行元素：条纹',1,0),(78,'Baleno/班尼路女装 休闲弹力牛仔裤 显瘦弹力直筒裤女长裤',4,1,179.9,100,'myimages/clothes/9.jpg','版型：直筒型 裤长：长裤 厚度：超薄 适用年龄：18-24周岁 腰型：高腰 弹力：超高弹力',1,0),(79,'Baleno班尼路女装 时尚破洞牛仔短裤女 显瘦不规则边短裤夏热裤',4,1,139.9,100,'myimages/clothes/11.jpg','版型：直筒型 裤长：热裤 厚度：超薄 适用年龄：18-24周岁 腰型：高腰 裤型：直筒裤',1,0),(80,'Baleno班尼路女装 短款轻薄纯色风衣 新款春装拉链口袋外套女',4,1,143,100,'myimages/clothes/10.jpg','组合规格：单件 版型：廓型 衣门襟：拉链 袖长：长袖 厚度：薄款 适用年龄：18-24周岁',1,0);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lottery_draw`
--

DROP TABLE IF EXISTS `lottery_draw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lottery_draw` (
  `lottery_drawid` int(11) NOT NULL AUTO_INCREMENT,
  `useridFklotter_draw` int(11) DEFAULT NULL,
  `lottery_drawdetils` varchar(255) DEFAULT NULL,
  `lottery_drawdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lottery_drawid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lottery_draw`
--

LOCK TABLES `lottery_draw` WRITE;
/*!40000 ALTER TABLE `lottery_draw` DISABLE KEYS */;
/*!40000 ALTER TABLE `lottery_draw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendname1` varchar(255) NOT NULL,
  `recivername2` varchar(255) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `flag` int(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId_fk_order` int(11) NOT NULL,
  `goodsId_fk_order` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `orderitemId_fk_order` int(11) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  `isOut` int(11) NOT NULL DEFAULT '0',
  `isReceive` int(11) NOT NULL DEFAULT '0',
  `isComment` int(11) DEFAULT '0',
  `company` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `orderitemId_fk_order_idx` (`orderitemId_fk_order`),
  CONSTRAINT `orderitemId_fk_order` FOREIGN KEY (`orderitemId_fk_order`) REFERENCES `orderitem` (`orderitemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `orderitemId` int(11) NOT NULL AUTO_INCREMENT,
  `addressId_fk_orderitemId` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `userId_fk_orderitem` int(11) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  `identifier` varchar(45) NOT NULL,
  `setoff` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderitemId`),
  KEY `userId_fk_orderitem_idx` (`userId_fk_orderitem`),
  KEY `addressId_fk_orderitemId_idx` (`addressId_fk_orderitemId`),
  CONSTRAINT `addressId_fk_orderitemId` FOREIGN KEY (`addressId_fk_orderitemId`) REFERENCES `address` (`addressid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId_fk_orderitem` FOREIGN KEY (`userId_fk_orderitem`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart`
--

DROP TABLE IF EXISTS `shopcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcart` (
  `shopcartId` int(11) NOT NULL AUTO_INCREMENT,
  `userId_fk_shopcart` int(11) NOT NULL,
  `goodsId_fk_shopcart` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '1',
  `isBuy` int(11) NOT NULL DEFAULT '1',
  `flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`shopcartId`),
  KEY `userId_fk_shopcart_idx` (`userId_fk_shopcart`),
  KEY `goodsId_fk_shopcart_idx` (`goodsId_fk_shopcart`),
  CONSTRAINT `goodsId_fk_shopcart` FOREIGN KEY (`goodsId_fk_shopcart`) REFERENCES `goods` (`goodsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId_fk_shopcart` FOREIGN KEY (`userId_fk_shopcart`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart`
--

LOCK TABLES `shopcart` WRITE;
/*!40000 ALTER TABLE `shopcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `userPassword` varchar(45) NOT NULL,
  `userEmail` varchar(45) DEFAULT NULL,
  `userChaoPoint` int(11) NOT NULL DEFAULT '0',
  `userRemainder` double NOT NULL DEFAULT '0',
  `Administrator` int(11) NOT NULL DEFAULT '0',
  `userPhone` varchar(45) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'UserImage/sc.png',
  `isActive` int(11) NOT NULL DEFAULT '0',
  `flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`),
  UNIQUE KEY `userPhone_UNIQUE` (`userPhone`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'zhouxiaoyu','MXCUqywYRy4=','1119864054@qq.com',1000000,1000000,0,'','UserImage/ef266c958d014dddb3c782330e0131d6.jpg',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-12 23:09:34
