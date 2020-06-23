-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.13-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- cyberdata için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `cyberdata` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `cyberdata`;

-- tablo yapısı dökülüyor cyberdata.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.country
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ulke` varchar(50) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.extra
CREATE TABLE IF NOT EXISTS `extra` (
  `Game_id` int(11) DEFAULT NULL,
  `game_puan` int(11) DEFAULT NULL,
  `game_sure` int(11) DEFAULT NULL,
  `ulke_id` int(11) unsigned DEFAULT NULL,
  KEY `FK_extra_game` (`Game_id`),
  KEY `FK_extra_country` (`ulke_id`),
  CONSTRAINT `FK_extra_country` FOREIGN KEY (`ulke_id`) REFERENCES `country` (`id`),
  CONSTRAINT `FK_extra_game` FOREIGN KEY (`Game_id`) REFERENCES `game` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.game
CREATE TABLE IF NOT EXISTS `game` (
  `game_id` int(11) NOT NULL,
  `tmp_name` int(11) DEFAULT NULL,
  `description` blob DEFAULT NULL,
  `yıl` varchar(50) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT current_timestamp(),
  `dil_id` int(11) DEFAULT NULL,
  `gamelib_id` int(11) DEFAULT NULL,
  `gamedev_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `gamelib_id` (`gamelib_id`),
  KEY `gamedev_id` (`gamedev_id`),
  KEY `FK_game_language` (`dil_id`),
  CONSTRAINT `FK_game_gamelib` FOREIGN KEY (`gamelib_id`) REFERENCES `gamelib` (`gamelib_id`),
  CONSTRAINT `FK_game_language` FOREIGN KEY (`dil_id`) REFERENCES `language` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.gamedev
CREATE TABLE IF NOT EXISTS `gamedev` (
  `id` int(11) NOT NULL,
  `name` int(11) DEFAULT NULL,
  `last_name` int(11) DEFAULT NULL,
  `yas` int(11) DEFAULT NULL,
  `ulke_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_gamedev_country` (`ulke_id`),
  CONSTRAINT `FK_gamedev_country` FOREIGN KEY (`ulke_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.gamelib
CREATE TABLE IF NOT EXISTS `gamelib` (
  `gamelib_id` int(11) NOT NULL,
  `gamelib_name` varchar(50) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`gamelib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.game_document
CREATE TABLE IF NOT EXISTS `game_document` (
  `file_id` int(11) unsigned NOT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_path` varchar(50) DEFAULT NULL,
  `file_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`file_type`)),
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.kullanici_game_tablo
CREATE TABLE IF NOT EXISTS `kullanici_game_tablo` (
  `kullanici_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  KEY `kullanici_id` (`kullanici_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `FK_kullanici_game_tablo_game` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`),
  CONSTRAINT `FK_kullanici_game_tablo_uyelik_yapan` FOREIGN KEY (`kullanici_id`) REFERENCES `uyelik_yapan` (`kullanici_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.language
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.print_document
CREATE TABLE IF NOT EXISTS `print_document` (
  `id` int(11) NOT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `file_path` varchar(50) DEFAULT NULL,
  `file_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`file_type`)),
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.uyelik_yapan
CREATE TABLE IF NOT EXISTS `uyelik_yapan` (
  `kullanici_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kullanici_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor cyberdata.uyelik_yapan_bilgileri
CREATE TABLE IF NOT EXISTS `uyelik_yapan_bilgileri` (
  `id` int(11) NOT NULL,
  `tel_no` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  `resim_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Veri çıktısı seçilmemişti

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
