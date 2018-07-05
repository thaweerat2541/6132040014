-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2018 at 10:54 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- โครงสร้างตาราง `{prefix}_01work`
--

CREATE TABLE `{prefix}_01work` (
  `id` int(2) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `{prefix}_01work`
--

INSERT INTO `{prefix}_01work` (`id`, `title`, `description`, `fname`) VALUES
(1, 'การเขียนเว็บไซต์', 'ให้นักเรียนนักศึกษาดูจากตัวอย่างที่อาจารย์สอนให้เป็นแบบอย่างในการทำงานต่อไป', 'อ.คำภี');


--
-- โครงสร้างตาราง `{prefix}_member`
--
CREATE TABLE `{prefix}_member` (
  `id_member` int(2) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับ',
  `lname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อ',
  `fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'นามสกุล',
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'อีเมล',
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เบอร์โทร',
  `address` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'ที่อยู่',
  `uname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อผู้ใช้',
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสผ่าน',
  `typeid` int(3) NOT NULL COMMENT 'รหัสประเภท',
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางสมาชิก';


--
-- โครงสร้างตาราง `{prefix}_type`
--
CREATE TABLE `{prefix}_type` (
  `id_type` int(3) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภท',
  `typename` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ประเภทสินค้า',
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางประเภท';


--
-- โครงสร้างตาราง `{prefix}_product`
--
CREATE TABLE `{prefix}_product` (
  `id_product` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า',
  `proname` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อสินค้า',
  `detail` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'รายละเอียด',
  `price` float NOT NULL COMMENT 'ราคา',
  `bal` int(10) NOT NULL COMMENT 'จำนวนคงเหลือ',
  `id_type` int(3) NOT NULL COMMENT 'รหัสประเภท',
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางสินค้า';


--
-- โครงสร้างตาราง `{prefix}_basket`
--
CREATE TABLE `{prefix}_basket` (
  `id_order` int(10) NOT NULL AUTO_INCREMENT COMMENT 'เลขที่สั่งซื้อ',
  `basdate` date NOT NULL DEFAULT '0000-00-00' COMMENT 'วันที่',
  `id_member` int(20) NOT NULL COMMENT 'ผู้สั่ง',
  `proid` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสสินค้า',
  `amount` int(10) NOT NULL COMMENT 'จํานวน',
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'สถานะการสั่ง',
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางตะกร้า';


--
-- โครงสร้างตาราง `{prefix}_payment`
--
CREATE TABLE `{prefix}_payment` (
  `id_payment` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับ',
  `paydate` date NOT NULL COMMENT 'วันที่',
  `paytime` time NOT NULL COMMENT 'เวลา',
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ช่องทางการชำระ',
  `total` float NOT NULL COMMENT 'ยอดชำระ',
  `id_member` int(20) NOT NULL COMMENT 'ผู้ชำระ',
  PRIMARY KEY (`id_payment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางการชำระเงิน';


--
-- โครงสร้างตาราง `{prefix}_question`
--
CREATE TABLE `{prefix}_question` (
  `id_question` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับคำถาม',
  `qdate` date NOT NULL COMMENT 'วันที่',
  `q` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'คำถาม',
  `id_member` int(20) NOT NULL COMMENT 'ผู้ถาม',
  PRIMARY KEY (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางคำถาม';


--
-- โครงสร้างตาราง `{prefix}_answer`
--
CREATE TABLE `{prefix}_answer` (
  `id_answer` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ลําดับความคิด',
  `adate` date NOT NULL COMMENT 'วันที่',
  `a` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ความคิดเห็น',
  `id_member` int(2) NOT NULL COMMENT 'ผู้ตอบ',
  `id_question` int(10) NOT NULL COMMENT 'ลําดับคําถาม',
  PRIMARY KEY (`id_answer`),
  KEY `id_member` (`id_member`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางคำตอบ';


#-------------------------------------------------



