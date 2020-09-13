-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 09 Eyl 2020, 21:51:51
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
-- Tablo için tablo yapısı `tblUser`
--

CREATE TABLE `tblUser` (
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

--
-- Tablo döküm verisi `tblUser`
--

INSERT INTO `tblUser` (`UserID`, `UserFirstName`, `UserLastName`, `UserPassword`, `UserIdentityNo`, `UserEmail`, `UserPhone`, `InstitutionID`, `UserStatusID`) VALUES
(15, 'İsmet', 'Kizgin', 'password', 1, 'ismetkizgin@hotmail.com', '0533834430', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblUserStatus`
--

CREATE TABLE `tblUserStatus` (
  `UserStatusID` int NOT NULL,
  `UserStatusName` varchar(100) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `tblUserStatus`
--

INSERT INTO `tblUserStatus` (`UserStatusID`, `UserStatusName`) VALUES
(1, 'Root'),
(2, 'Admin'),
(3, 'User');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblUserStatusTransaction`
--

CREATE TABLE `tblUserStatusTransaction` (
  `UserStatusTransactionID` int NOT NULL,
  `UserStatusTransactionName` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `UserStatusID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `tblUserStatusTransaction`
--

INSERT INTO `tblUserStatusTransaction` (`UserStatusTransactionID`, `UserStatusTransactionName`, `UserStatusID`) VALUES
(1, 'account-delete', 1),
(2, 'sign-up', 1);

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `vwAuth`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `vwAuth` (
`UserStatusID` int
,`UserStatusName` varchar(100)
,`UserStatusTransactionID` int
,`UserStatusTransactionName` varchar(100)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı `vwAuth`
--
DROP TABLE IF EXISTS `vwAuth`;

CREATE VIEW `vwAuth`  AS  select `U`.`UserStatusID` AS `UserStatusID`,`U`.`UserStatusName` AS `UserStatusName`,`T`.`UserStatusTransactionID` AS `UserStatusTransactionID`,`T`.`UserStatusTransactionName` AS `UserStatusTransactionName` from (`tblUserStatus` `U` join `tblUserStatusTransaction` `T` on((`U`.`UserStatusID` = `T`.`UserStatusID`))) ;

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
  ADD PRIMARY KEY (`MartyrID`),
  ADD KEY `InstitutionID` (`InstitutionID`);

--
-- Tablo için indeksler `tblMartyrImage`
--
ALTER TABLE `tblMartyrImage`
  ADD PRIMARY KEY (`MartyrImageID`),
  ADD KEY `MartyrID` (`MartyrID`);

--
-- Tablo için indeksler `tblUser`
--
ALTER TABLE `tblUser`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserIdentityNo` (`UserIdentityNo`),
  ADD KEY `UserStatusID` (`UserStatusID`),
  ADD KEY `InstitutionID` (`InstitutionID`);

--
-- Tablo için indeksler `tblUserStatus`
--
ALTER TABLE `tblUserStatus`
  ADD PRIMARY KEY (`UserStatusID`);

--
-- Tablo için indeksler `tblUserStatusTransaction`
--
ALTER TABLE `tblUserStatusTransaction`
  ADD PRIMARY KEY (`UserStatusTransactionID`),
  ADD KEY `UserStatusID` (`UserStatusID`);

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
-- Tablo için AUTO_INCREMENT değeri `tblUser`
--
ALTER TABLE `tblUser`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `tblUserStatus`
--
ALTER TABLE `tblUserStatus`
  MODIFY `UserStatusID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tblUserStatusTransaction`
--
ALTER TABLE `tblUserStatusTransaction`
  MODIFY `UserStatusTransactionID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `tblInstitution`
--
ALTER TABLE `tblInstitution`
  ADD CONSTRAINT `tblInstitution_ibfk_1` FOREIGN KEY (`InstitutionID`) REFERENCES `tblUser` (`InstitutionID`);

--
-- Tablo kısıtlamaları `tblMartyr`
--
ALTER TABLE `tblMartyr`
  ADD CONSTRAINT `tblMartyr_ibfk_1` FOREIGN KEY (`InstitutionID`) REFERENCES `tblInstitution` (`InstitutionID`);

--
-- Tablo kısıtlamaları `tblMartyrImage`
--
ALTER TABLE `tblMartyrImage`
  ADD CONSTRAINT `tblMartyrImage_ibfk_1` FOREIGN KEY (`MartyrID`) REFERENCES `tblMartyr` (`MartyrID`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `tblUser`
--
ALTER TABLE `tblUser`
  ADD CONSTRAINT `tblUser_ibfk_1` FOREIGN KEY (`UserStatusID`) REFERENCES `tblUserStatus` (`UserStatusID`);

--
-- Tablo kısıtlamaları `tblUserStatusTransaction`
--
ALTER TABLE `tblUserStatusTransaction`
  ADD CONSTRAINT `tblUserStatusTransaction_ibfk_1` FOREIGN KEY (`UserStatusID`) REFERENCES `tblUserStatus` (`UserStatusID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
