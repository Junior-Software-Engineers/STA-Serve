-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 10 Ağu 2020, 19:59:41
-- Sunucu sürümü: 8.0.21-0ubuntu0.20.04.4
-- PHP Sürümü: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `sta_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblInstitution`
--

CREATE TABLE `tblInstitution` (
  `InstitutionID` int NOT NULL,
  `InstitutionName` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `InstitutionCity` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `InstitutionDistrict` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `InstitutionEmail` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `InstitutionPhone` varchar(25) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblMartyr`
--

CREATE TABLE `tblMartyr` (
  `MartyrID` int NOT NULL,
  `MartyrFirstName` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `MartyrLastName` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `MartyrDateOfBrith` date NOT NULL,
  `MartyrDateOfDeath` date NOT NULL,
  `RankID` int NOT NULL,
  `MartyrCity` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `MartyrDistrict` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `MartyrPlaceOfDeath` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `MartyrContent` text COLLATE utf8_turkish_ci NOT NULL,
  `MartyrImagePath` text COLLATE utf8_turkish_ci NOT NULL,
  `InstitutionID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblMartyrImage`
--

CREATE TABLE `tblMartyrImage` (
  `MartyrImageID` int NOT NULL,
  `MartyrImagePath` int NOT NULL,
  `MartyrID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblsUser`
--

CREATE TABLE `tblsUser` (
  `UserID` int NOT NULL,
  `UserFirstName` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `UserLastName` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `UserPassword` varchar(99) COLLATE utf8_turkish_ci NOT NULL,
  `UserIdentityNo` bigint NOT NULL,
  `UserEmail` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `UserPhone` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `InstitutionID` int NOT NULL,
  `UserStatusID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblUserStatus`
--

CREATE TABLE `tblUserStatus` (
  `UserStatusID` int NOT NULL,
  `UserStatusName` varchar(100) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `tblInstitution`
--
ALTER TABLE `tblInstitution`
  ADD PRIMARY KEY (`InstitutionID`);

--
-- Tablo için indeksler `tblMartyr`
--
ALTER TABLE `tblMartyr`
  ADD PRIMARY KEY (`MartyrID`);

--
-- Tablo için indeksler `tblMartyrImage`
--
ALTER TABLE `tblMartyrImage`
  ADD PRIMARY KEY (`MartyrImageID`);

--
-- Tablo için indeksler `tblsUser`
--
ALTER TABLE `tblsUser`
  ADD PRIMARY KEY (`UserID`);

--
-- Tablo için indeksler `tblUserStatus`
--
ALTER TABLE `tblUserStatus`
  ADD PRIMARY KEY (`UserStatusID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `tblInstitution`
--
ALTER TABLE `tblInstitution`
  MODIFY `InstitutionID` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `tblMartyr`
--
ALTER TABLE `tblMartyr`
  MODIFY `MartyrID` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `tblMartyrImage`
--
ALTER TABLE `tblMartyrImage`
  MODIFY `MartyrImageID` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `tblsUser`
--
ALTER TABLE `tblsUser`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `tblUserStatus`
--
ALTER TABLE `tblUserStatus`
  MODIFY `UserStatusID` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;