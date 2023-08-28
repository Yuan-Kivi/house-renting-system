/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : house

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 11/06/2022 16:36:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `beUserId` int NOT NULL,
  `houseId` int NOT NULL,
  `cType` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `cDate` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` (`cId`, `userId`, `beUserId`, `houseId`, `cType`, `message`, `cDate`, `status`) VALUES (3, 4, 2, 4, 'repLandlord', 'This gay is a cheater', '2022-05-18', 1);
INSERT INTO `comment` (`cId`, `userId`, `beUserId`, `houseId`, `cType`, `message`, `cDate`, `status`) VALUES (4, 3, 4, 8, 'repHouse', 'Infomation is fake', '2022-05-18', 1);
INSERT INTO `comment` (`cId`, `userId`, `beUserId`, `houseId`, `cType`, `message`, `cDate`, `status`) VALUES (5, 3, 4, 8, 'repLandlord', 'This gay is a cheater', '2022-05-18', 1);
INSERT INTO `comment` (`cId`, `userId`, `beUserId`, `houseId`, `cType`, `message`, `cDate`, `status`) VALUES (6, 3, 4, 10, 'repLandlord', 'This gay is a cheater', '2022-05-18', 1);
INSERT INTO `comment` (`cId`, `userId`, `beUserId`, `houseId`, `cType`, `message`, `cDate`, `status`) VALUES (10, 3, 4, 10, 'repLandlord', 'sb', '2022-06-11', 1);
COMMIT;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `likeId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `houseId` int NOT NULL,
  PRIMARY KEY (`likeId`),
  UNIQUE KEY `index2` (`likeId`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of favorite
-- ----------------------------
BEGIN;
INSERT INTO `favorite` (`likeId`, `userId`, `houseId`) VALUES (40, 4, 6);
INSERT INTO `favorite` (`likeId`, `userId`, `houseId`) VALUES (42, 5, 13);
INSERT INTO `favorite` (`likeId`, `userId`, `houseId`) VALUES (43, 4, 15);
INSERT INTO `favorite` (`likeId`, `userId`, `houseId`) VALUES (44, 3, 17);
INSERT INTO `favorite` (`likeId`, `userId`, `houseId`) VALUES (45, 3, 13);
COMMIT;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `houseId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `introduction` varchar(1000) NOT NULL,
  `loc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `area` double(255,0) NOT NULL,
  `furniture` varchar(255) NOT NULL,
  `money` double(255,0) NOT NULL,
  `pubDate` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `around` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Bet one pays three|Bet one pays one',
  `houseType` varchar(255) NOT NULL DEFAULT 'Rent',
  `direction` varchar(255) NOT NULL DEFAULT 'East',
  `room` varchar(255) NOT NULL DEFAULT 'Three rooms',
  `status` varchar(255) NOT NULL DEFAULT 'agree',
  PRIMARY KEY (`houseId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of house
-- ----------------------------
BEGIN;
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (4, 2, 'Jack', 'the Statue of Liberty', 'Rongqiao Town (East District Phase I)', 29, 'washing machine television cooking stove exhaust hood bathtub ', 850, '2022-05-18', 'California.Ventura.District 1 (V)', 4, 'park supermarket cinema lake airport ', 'Bet one pays three', 'Rent', 'East', 'Three rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (5, 3, 'Simon', 'Nanshaomen subway entrance, Zhongmao Plaza, Honghui Hospital, only three people fully furnished', 'Rongqiao Town (East District Phase I) (Dazhai Road, High-tech Zone)', 29, 'washing machine television cooking stove exhaust hood bathtub ', 820, '2022-05-18', 'Texas.Austin.District 2 (A)', 10, 'subway park supermarket cinema ', 'Bet one pays three|Bet one pays one', 'Rent', 'West', 'Three rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (6, 3, 'Simon', 'Beiyuan Laiguangying Yingqiuyuan Hardcover and warm bedroom with balcony, large space, comfortable and good lighting', 'Yingqiu Garden (Chaoyang North Garden)', 19, 'refrigerator ', 2100, '2022-05-18', 'Pennsylvania.Pittsburgh.District 3 (P)', 9, 'subway park ', 'Bet one pays three|Bet one pays one', 'Rent', 'East', 'Three rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (7, 3, 'Simon', 'Line 16 Beibeiwang Station, Jasmine Garden Phase I, second bedroom, live with you, near Zhongguancun Baidu Software Park', 'Baiwang Jasmine Garden (Phase I) (Haidian Northwest Wang)', 20, 'television cabinet ', 2500, '2022-05-18', 'Texas.Houston.District 5 (H)', 6, 'subway park supermarket cinema ', 'Bet one pays three|Bet one pays one', 'Rent', 'East', 'Three rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (8, 4, 'Mendy', 'Red Mountain! Sold close to the guide price! After five years, the key is in hand! urgent! urgent! urgent', 'Oriental World Trade City', 60, 'refrigerator washing machine television cooking stove exhaust hood bathtub cabinet ', 2200, '2022-05-18', 'Florida.Miami.District 1 (M)', 8, 'subway park supermarket lake high-speed train airport landscape ', 'Bet one pays three|Bet one pays one', 'Rent', 'East', 'Three rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (9, 4, 'Mendy', 'v', 'Sands International (Qiantang Jinsha Lake)', 77, 'refrigerator washing machine television cooking stove exhaust hood bathtub cabinet ', 3050, '2022-05-18', 'New York.Buffalo.District 2 (BU)', 6, 'supermarket cinema lake high-speed train airport landscape ', 'Bet one pays one', 'Rent', 'East', 'Three rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (10, 4, 'Mendy', 'Fengrun home appliances are complete, convenient transportation, south-facing, fine decoration, ready-to-live', 'Fengrun Homestead (Xiaoshan Beigan)', 15, 'refrigerator cooking stove cabinet ', 1200, '2022-05-18', 'New York.Rochester.District 2 (R)', 11, 'subway park supermarket ', 'Bet one pays three|Bet one pays one', 'Rent', 'East', 'Three rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (15, 4, 'Mendy', '', 'Gold Floor Tong Road (Phase II)', 69, 'refrigerator washing machine television cooking stove ', 460, '2022-05-18', 'Florida.Miami.District 3 (M)', 15, 'cinema lake high-speed train airport ', 'Bet one pays three|Bet one pays one', 'Sell', 'South', 'Two rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (16, 4, 'Mendy', 'Subway entrance, two rooms and three balconies facing south, good lighting, Hongben is exempt from personal tax for five years, with Luowai', 'Tianyuexiang Garden', 64, 'refrigerator washing machine television cooking stove ', 375, '2022-05-18', 'California.Long Beach.District 1 (LB)', 1, 'subway park cinema ', 'Bet one pays three', 'Sell', 'South', 'Three rooms', 'reject');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (18, 3, 'Simon', '1', '1', 1, 'refrigerator television ', 1, '2022-05-18', 'New York.New York City.District 1 (NYC)', 5, 'lake high-speed train ', 'Bet one pays three|Bet one pays one', 'Sell', 'East', 'Four rooms', 'agree');
INSERT INTO `house` (`houseId`, `userId`, `username`, `introduction`, `loc`, `area`, `furniture`, `money`, `pubDate`, `address`, `views`, `around`, `pre`, `houseType`, `direction`, `room`, `status`) VALUES (25, 5, 'John', 'Line 6 near the subway station, super large three-bedroom, fully furnished and ready to move in', 'West Head New Village (Longhua Minzhi)', 120, 'refrigerator washing machine television cooking stove exhaust hood bathtub cabinet ', 4200, '2022-06-11', 'New York.New York City.District 4 (NYC)', 0, 'subway high-speed train airport ', 'Bet one pays three|Bet one pays one', 'Rent', 'East', 'Four rooms', 'agree');
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `houseId` int NOT NULL,
  `intro` varchar(255) NOT NULL,
  `mess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mDate` date NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (1, 3, 19, '1', 'Your post has been deleted', '2022-05-19', 1);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (2, 4, 10, '#', 'You are banned', '2022-05-19', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (3, 4, 16, 'Subway entrance, two rooms and three balconies facing south, good lighting, Hongben is exempt from personal tax for five years, with Luowai', 'Your post has been rejected', '2022-05-19', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (4, 4, 0, '#', 'You are normal', '2022-05-19', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (5, 3, 22, '1234', 'Your post has been agree', '2022-06-11', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (6, 3, 0, '#', 'You are banned', '2022-06-11', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (7, 3, 0, '#', 'You are normal', '2022-06-11', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (8, 5, 13, '#', 'You are banned', '2022-06-11', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (9, 5, 0, '#', 'You are normal', '2022-06-11', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (10, 5, 13, 'Line 6 near the subway station, super large three-bedroom, fully furnished and ready to move in', 'Your post has been deleted', '2022-06-11', 0);
INSERT INTO `message` (`mId`, `userId`, `houseId`, `intro`, `mess`, `mDate`, `status`) VALUES (11, 5, 25, 'Line 6 near the subway station, super large three-bedroom, fully furnished and ready to move in', 'Your post has been agree', '2022-06-11', 0);
COMMIT;

-- ----------------------------
-- Table structure for pic
-- ----------------------------
DROP TABLE IF EXISTS `pic`;
CREATE TABLE `pic` (
  `picId` int NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) NOT NULL,
  `houseId` int NOT NULL,
  PRIMARY KEY (`picId`),
  KEY `index1` (`houseId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of pic
-- ----------------------------
BEGIN;
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (2, 'http://localhost:8080/images/9f8907d0-5886-4dca-9d8a-fa151199a602bd081efb-3fb1-4ca6-addf-4c4018dae8d639a94736-c6db-4d78-af60-4361975f83447e_gFC2Ce04.jpg', 3);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (3, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1111%2F06041Q43S7%2F1P604143S7-9.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1644316528&t=b8f919e19c4868e50062b586da5cf41f', 3);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (5, 'http://localhost:8080/images/214bfc3e-1df7-4561-b939-e6a6428ed77cp1.jpg', 4);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (6, 'http://localhost:8080/images/86b10890-fdd8-4ca4-b8e5-aceb5015c621p2.jpg', 4);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (7, 'http://localhost:8080/images/85e9f3b4-9055-49b4-9480-a8126b323451p3.jpg', 4);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (8, 'http://localhost:8080/images/6db15da4-6ec6-4d77-910b-9489b9cb27dfp4.jpg', 5);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (9, 'http://localhost:8080/images/7f293a00-320a-44ff-90e2-eab65276a497p5.jpg', 5);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (10, 'http://localhost:8080/images/2bfe66b6-0fe6-48bc-817a-7a456fb96143p6.jpg', 5);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (11, 'http://localhost:8080/images/c9313613-c255-496b-92d0-f5f19799cabbp7.jpg', 6);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (12, 'http://localhost:8080/images/2f0320e1-d147-46c2-90e9-47679010d6edp8.jpg', 6);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (13, 'http://localhost:8080/images/6e381bdb-ed0e-4d5a-8640-03018d7b3f8bp9.jpg', 6);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (14, 'http://localhost:8080/images/8dbde8c3-7773-44ae-a388-3aa2907fe374p10.jpg', 7);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (15, 'http://localhost:8080/images/795ef71e-7922-40a6-a4d5-6f895762f07ep11.jpg', 7);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (16, 'http://localhost:8080/images/834be449-1df4-48ac-9b20-dad159ce16e6p12.jpg', 7);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (17, 'http://localhost:8080/images/70128ce6-c316-4656-98c5-840787025878p13.jpg', 8);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (18, 'http://localhost:8080/images/92473c62-7223-4a6b-9a3d-2b4785edf927p14.jpg', 8);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (19, 'http://localhost:8080/images/192c8312-e1f3-4751-8cfd-ddbd6cf6f048p15.jpg', 8);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (20, 'http://localhost:8080/images/ad93838a-40a8-45f9-bc74-e81005b7f352p16.jpg', 9);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (21, 'http://localhost:8080/images/dc5918fb-7c90-4a67-825c-941b7491c690p17.jpg', 9);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (22, 'http://localhost:8080/images/8134fe35-55e6-4bcf-9804-beafdfd1614cp18.jpg', 9);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (23, 'http://localhost:8080/images/65220b20-4335-48bf-b0cd-09c1d8201e84p19.jpg', 10);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (24, 'http://localhost:8080/images/fd943e25-9e36-4854-af06-e746aa290c02p20.jpg', 10);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (25, 'http://localhost:8080/images/f0c8d531-c2dd-402a-b76a-b32a8ec9cf9ap21.jpg', 10);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (26, 'http://localhost:8080/images/0a8285dd-ec1d-476d-9055-55141e91e95apty.jpg', 11);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (27, 'http://localhost:8080/images/85eb061b-6fd6-4634-b759-d16d43425e9apty.jpg', 12);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (28, 'http://localhost:8080/images/2e9ca8f9-db65-4ed3-87d5-186cbbd24006p1.jpg', 13);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (29, 'http://localhost:8080/images/e4644c8d-7b97-46c0-8e82-3c3be7fea85bp2.jpg', 13);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (30, 'http://localhost:8080/images/ed2ea683-bc0a-41c9-b7d9-15b02f9b0cb0p3.jpg', 13);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (31, 'http://localhost:8080/images/a0522b7a-86c4-4662-96ba-bc1af6a458cbp1.jpg', 14);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (32, 'http://localhost:8080/images/32e1a94c-4237-42e8-96d8-6b04122cb344p1.png', 15);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (33, 'http://localhost:8080/images/edd8c969-6777-4597-b03f-6932f376375ap2.png', 15);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (34, 'http://localhost:8080/images/aa9425e6-624e-4320-90b0-000d226e652cp3.jpg', 15);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (35, 'http://localhost:8080/images/c30ddc0e-3059-4dea-bde7-c93ae4684cf3p4.jpg', 16);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (36, 'http://localhost:8080/images/9968713f-68d3-48b0-97ad-feaf8e968275p5.jpg', 16);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (37, 'http://localhost:8080/images/cd231044-837e-41e0-9d5e-9b9ad10b78dfp6.jpg', 16);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (38, 'http://localhost:8080/images/4759bf2f-d85d-4a19-be24-224fdbc929b1p5.jpg', 17);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (39, 'http://localhost:8080/images/b22baab5-f04b-415f-951b-185a8ee50af4p6.jpg', 17);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (40, 'http://localhost:8080/images/889370e8-f35b-4993-8d07-0e832d08ba42p4.jpg', 18);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (41, 'http://localhost:8080/images/e7d4af38-e9e4-4b3d-8e3c-dfec6cd7f136p6.jpg', 18);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (42, 'http://localhost:8080/images/7dc052cb-2d1c-47c8-ac3d-e742e82345adp1.jpg', 19);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (43, 'http://localhost:8080/images/f2d5a253-f760-4207-925a-a634c8876db8p1.png', 19);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (44, 'http://localhost:8080/images/7d3e6cb6-67bf-4e07-b66c-d4d8a8a40b6dbear.jpeg', 20);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (45, 'http://localhost:8080/images/3a854c3b-8faa-47a3-8b0a-df0e6460f6cabear.jpeg', 21);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (46, 'http://localhost:8080/images/4a60b605-094c-4658-a3d3-f64c7be525b7bear.jpeg', 22);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (47, 'http://localhost:8080/images/0fdbb2a6-b1ab-40c5-9cbd-0f6f43d6a181cat.jpeg', 23);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (48, 'http://localhost:8080/images/617a05ca-c58c-443f-a9b7-b62a7a0d4d91dior.png', 24);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (49, 'http://localhost:8080/images/08a8a551-f27f-4b03-8aba-3bdb119b3170a0522b7a-86c4-4662-96ba-bc1af6a458cbp1.jpg', 25);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (50, 'http://localhost:8080/images/b9d901cf-9062-469b-9f87-7e101cefc3262e9ca8f9-db65-4ed3-87d5-186cbbd24006p1.jpg', 25);
INSERT INTO `pic` (`picId`, `url`, `houseId`) VALUES (51, 'http://localhost:8080/images/8c3e74c6-2c15-4a05-a78e-2546f3d48381e4644c8d-7b97-46c0-8e82-3c3be7fea85bp2.jpg', 25);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `usertype` int NOT NULL,
  `typename` varchar(255) NOT NULL,
  `cell` varchar(255) NOT NULL DEFAULT '123456789',
  `email` varchar(255) NOT NULL DEFAULT 'email',
  `status` varchar(255) NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`userId`, `username`, `password`, `avatar`, `usertype`, `typename`, `cell`, `email`, `status`) VALUES (1, 'Admin', '1234', 'http://localhost:8080/images/4074aa53-7fc4-4139-bc8c-712864e1368dpty.jpg', 0, 'administrator', '123456789', 'email', 'normal');
INSERT INTO `user` (`userId`, `username`, `password`, `avatar`, `usertype`, `typename`, `cell`, `email`, `status`) VALUES (2, 'Jack', 'fflpan', 'http://localhost:8080/images/bd081efb-3fb1-4ca6-addf-4c4018dae8d639a94736-c6db-4d78-af60-4361975f83447e_gFC2Ce04.jpg', 0, 'Personal', '123456789', 'email', 'normal');
INSERT INTO `user` (`userId`, `username`, `password`, `avatar`, `usertype`, `typename`, `cell`, `email`, `status`) VALUES (3, 'Simon', '12345', 'http://localhost:8080/images/7b1eac0f-c00a-4287-8f68-9f037f49e452d3faf441-1a01-4103-990d-2dbab528bac7ewE6HAJrwMQ.jpg', 1, 'Agency', '123456789', 'email', 'normal');
INSERT INTO `user` (`userId`, `username`, `password`, `avatar`, `usertype`, `typename`, `cell`, `email`, `status`) VALUES (4, 'Mendy', 'fflpan', 'http://localhost:8080/images/4074aa53-7fc4-4139-bc8c-712864e1368dpty.jpg', 0, 'Personal', '11111', '163@email.cn', 'normal');
INSERT INTO `user` (`userId`, `username`, `password`, `avatar`, `usertype`, `typename`, `cell`, `email`, `status`) VALUES (5, 'John', '4321', 'http://localhost:8080/images/b8fbd134-29e5-4201-900c-dee0c9ede13e39a94736-c6db-4d78-af60-4361975f83447e_gFC2Ce04.jpg', 0, 'Personal', '888888888', '1234123@qq.com', 'normal');
INSERT INTO `user` (`userId`, `username`, `password`, `avatar`, `usertype`, `typename`, `cell`, `email`, `status`) VALUES (6, 'William', '123456', 'http://localhost:8080/images/c3e1faa6-4c26-45cf-8598-c672494b50f6house.jpg', 0, 'Personal', '1523256242', 'email@email.cn', 'normal');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
