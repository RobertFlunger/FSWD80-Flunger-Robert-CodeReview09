-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 08. Nov 2019 um 18:40
-- Server-Version: 10.4.8-MariaDB
-- PHP-Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_robert_flunger_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additionalcharges`
--

CREATE TABLE `additionalcharges` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `returnID` smallint(5) UNSIGNED NOT NULL,
  `chargeAmount` decimal(10,2) NOT NULL,
  `chargesPaid` bit(1) NOT NULL,
  `reason` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `additionalcharges`
--

INSERT INTO `additionalcharges` (`ID`, `returnID`, `chargeAmount`, `chargesPaid`, `reason`) VALUES
(3, 2, '100.60', b'1', 'returned too late'),
(4, 3, '1000.00', b'0', 'car return damaged');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `all cars with their manufacturer info`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `all cars with their manufacturer info` (
`licensePlate` varchar(20)
,`model` varchar(20)
,`name` char(25)
,`contactPerson` varchar(25)
,`phone` varchar(20)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `all customers who have not paid their invoice yet`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `all customers who have not paid their invoice yet` (
`lastName` varchar(20)
,`firstName` varchar(20)
,`ID` smallint(5) unsigned
,`invoice_date` date
,`totalCost` decimal(10,2) unsigned
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `licensePlate` varchar(20) NOT NULL,
  `manufacturerID` smallint(5) UNSIGNED NOT NULL,
  `model` varchar(20) NOT NULL,
  `available` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`licensePlate`, `manufacturerID`, `model`, `available`) VALUES
('AH0707', 5, 'Lorem5', b'1'),
('AH7474', 1, 'Mercedes A Class', b'1'),
('AJ1814', 2, 'VW Golf 8', b'1'),
('JQ2072', 3, 'Opel Astra', b'0'),
('ZA2470', 4, 'Ferrari 488', b'1');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `cars available atm`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `cars available atm` (
`licensePlate` varchar(20)
,`manufacturerID` smallint(5) unsigned
,`model` varchar(20)
,`available` bit(1)
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars_condition`
--

CREATE TABLE `cars_condition` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `licensePlate` varchar(20) NOT NULL,
  `totalKM` smallint(5) UNSIGNED NOT NULL,
  `lastMaintenance` date DEFAULT NULL,
  `boughtOn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cars_condition`
--

INSERT INTO `cars_condition` (`ID`, `licensePlate`, `totalKM`, `lastMaintenance`, `boughtOn`) VALUES
(1, 'AH7474', 500, '2019-08-10', '2017-01-03'),
(2, 'JQ2072', 1200, '2018-05-12', '2016-04-04'),
(3, 'AJ1814', 7070, '2019-03-04', '2014-06-03'),
(4, 'ZA2470', 797, '2018-10-10', '2018-01-04'),
(5, 'AH0707', 600, NULL, '2019-10-10');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_return`
--

CREATE TABLE `car_return` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `invoiceID` smallint(5) UNSIGNED NOT NULL,
  `returnLocation` char(100) NOT NULL,
  `returnDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car_return`
--

INSERT INTO `car_return` (`ID`, `invoiceID`, `returnLocation`, `returnDate`) VALUES
(1, 2, 'Schweglerstraße 3, 1150 Wien', '2019-10-25'),
(2, 3, 'Mariahilferstraße 50, 1060, Wien', '2019-11-20'),
(3, 5, 'LoremIpsum Street 60, 1010, Wien', '2019-11-10');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `contactID` smallint(5) UNSIGNED NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`ID`, `contactID`, `lastName`, `firstName`) VALUES
(1, 1, 'Müller', 'Beate'),
(2, 2, 'Flunger', 'Robert'),
(3, 3, 'Herbert', 'Wolfang'),
(4, 4, 'Doe', 'John'),
(5, 5, 'Ipsum', 'Lorem');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `customers facing additional charges`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `customers facing additional charges` (
`lastName` varchar(20)
,`firstName` varchar(20)
,`licensePlate` varchar(20)
,`chargeAmount` decimal(10,2)
,`reason` char(50)
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_contact`
--

CREATE TABLE `customer_contact` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `address` char(50) NOT NULL,
  `phoneNr` char(20) NOT NULL,
  `email` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer_contact`
--

INSERT INTO `customer_contact` (`ID`, `address`, `phoneNr`, `email`) VALUES
(1, 'Schweglerstraße 10, 1150 Wien', '+43664210919', 'müller@gmx.com'),
(2, 'Ottakringer Straße 3, 1160 Wien', '+4366428089', 'robertfl@gmx.com'),
(3, 'Alser Straße 110, 1070 Wien', '+43699027072', 'herbert@aol.com'),
(4, 'Johnstraße 3, 1150 Wien', '+430170897', 'j.doe@hotmail.com'),
(5, 'Mariahilferstraße 150, 1060 Wien', '+432070470', 'lorem@ipsum.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `reservationID` smallint(5) UNSIGNED NOT NULL,
  `totalCost` decimal(10,2) UNSIGNED NOT NULL,
  `chargesPaid` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`ID`, `invoice_date`, `reservationID`, `totalCost`, `chargesPaid`) VALUES
(1, '2019-10-30', 1, '500.30', b'1'),
(2, '2019-10-19', 2, '1001.00', b'1'),
(3, '2019-09-19', 3, '703.33', b'1'),
(4, '2018-10-03', 4, '1177.77', b'1'),
(5, '2019-11-01', 5, '420.20', b'0');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `list of all customers, together with reservations`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `list of all customers, together with reservations` (
`lastName` varchar(20)
,`firstName` varchar(20)
,`licensePlate` varchar(20)
,`date_from` date
,`date_to` date
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`ID`, `name`, `address`, `phone`) VALUES
(1, 'Parkplatz', 'Schweglerstraße 10, 1150 Wien', '+017037808'),
(2, 'Tankstelle', 'Poststraße 3, 1050 Wien', '+012780781'),
(3, 'IKEA', 'Sverigestraße 1A, 1220 Wien', '+017170710'),
(4, 'Spar', 'Mariahilferstraße 55, 1060 Wien', '+132244224'),
(5, 'Merkur', 'Johnstraße 110, 1150 Wien', '+02202407');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manufacturer`
--

CREATE TABLE `manufacturer` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `contactID` smallint(5) UNSIGNED NOT NULL,
  `name` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `manufacturer`
--

INSERT INTO `manufacturer` (`ID`, `contactID`, `name`) VALUES
(1, 1, 'Mercedes'),
(2, 2, 'Volkswagen'),
(3, 3, 'Opel'),
(4, 4, 'Ferrari'),
(5, 5, 'LoremIpsum');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manufacturer_contact`
--

CREATE TABLE `manufacturer_contact` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `contactPerson` varchar(25) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `manufacturer_contact`
--

INSERT INTO `manufacturer_contact` (`ID`, `contactPerson`, `phone`, `email`) VALUES
(1, 'Hermann Maier', '+43664123456', 'maier@hotmail.com'),
(2, 'Matthias Müller', '+43664239119', 'mm@outlook.com'),
(3, 'Matt Miller', '+43211707', 'miller@opel.com'),
(4, 'Maria Marianne', '+019072097', 'maria@ferrari.com'),
(5, 'Heinz Heinzl', '+0189727247', 'hehe@ipsum.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `customerID` smallint(5) UNSIGNED NOT NULL,
  `licensePlate` varchar(20) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `locationID` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`ID`, `customerID`, `licensePlate`, `date_from`, `date_to`, `locationID`) VALUES
(1, 1, 'AH7474', '2019-11-01', '9999-01-01', 3),
(2, 2, 'AH0707', '2019-10-20', '2019-10-25', 4),
(3, 2, 'AJ1814', '2019-09-20', '2019-09-29', 4),
(4, 5, 'ZA2470', '2018-10-10', '9999-01-01', 1),
(5, 4, 'AH0707', '2019-11-05', '2019-11-08', 2);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `reserved cars in vienna 1150`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `reserved cars in vienna 1150` (
`licensePlate` varchar(20)
,`name` varchar(25)
,`address` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktur des Views `all cars with their manufacturer info`
--
DROP TABLE IF EXISTS `all cars with their manufacturer info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all cars with their manufacturer info`  AS  select `cars`.`licensePlate` AS `licensePlate`,`cars`.`model` AS `model`,`manufacturer`.`name` AS `name`,`manufacturer_contact`.`contactPerson` AS `contactPerson`,`manufacturer_contact`.`phone` AS `phone` from ((`cars` left join `manufacturer` on(`cars`.`manufacturerID` = `manufacturer`.`ID`)) left join `manufacturer_contact` on(`manufacturer`.`contactID` = `manufacturer_contact`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `all customers who have not paid their invoice yet`
--
DROP TABLE IF EXISTS `all customers who have not paid their invoice yet`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all customers who have not paid their invoice yet`  AS  select `customers`.`lastName` AS `lastName`,`customers`.`firstName` AS `firstName`,`reservation`.`ID` AS `ID`,`invoice`.`invoice_date` AS `invoice_date`,`invoice`.`totalCost` AS `totalCost` from ((`customers` join `reservation` on(`customers`.`ID` = `reservation`.`customerID`)) join `invoice` on(`reservation`.`ID` = `invoice`.`reservationID`)) where `invoice`.`chargesPaid` = 0 ;

-- --------------------------------------------------------

--
-- Struktur des Views `cars available atm`
--
DROP TABLE IF EXISTS `cars available atm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cars available atm`  AS  select `cars`.`licensePlate` AS `licensePlate`,`cars`.`manufacturerID` AS `manufacturerID`,`cars`.`model` AS `model`,`cars`.`available` AS `available` from `cars` where `cars`.`available` = 1 ;

-- --------------------------------------------------------

--
-- Struktur des Views `customers facing additional charges`
--
DROP TABLE IF EXISTS `customers facing additional charges`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customers facing additional charges`  AS  select `customers`.`lastName` AS `lastName`,`customers`.`firstName` AS `firstName`,`reservation`.`licensePlate` AS `licensePlate`,`additionalcharges`.`chargeAmount` AS `chargeAmount`,`additionalcharges`.`reason` AS `reason` from ((((`customers` join `reservation` on(`customers`.`ID` = `reservation`.`customerID`)) join `invoice` on(`reservation`.`ID` = `invoice`.`reservationID`)) join `car_return` on(`invoice`.`ID` = `car_return`.`invoiceID`)) join `additionalcharges` on(`car_return`.`ID` = `additionalcharges`.`returnID`)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `list of all customers, together with reservations`
--
DROP TABLE IF EXISTS `list of all customers, together with reservations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list of all customers, together with reservations`  AS  select `customers`.`lastName` AS `lastName`,`customers`.`firstName` AS `firstName`,`reservation`.`licensePlate` AS `licensePlate`,`reservation`.`date_from` AS `date_from`,`reservation`.`date_to` AS `date_to` from (`customers` left join `reservation` on(`customers`.`ID` = `reservation`.`customerID`)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `reserved cars in vienna 1150`
--
DROP TABLE IF EXISTS `reserved cars in vienna 1150`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reserved cars in vienna 1150`  AS  select `reservation`.`licensePlate` AS `licensePlate`,`locations`.`name` AS `name`,`locations`.`address` AS `address` from (`reservation` join `locations` on(`reservation`.`locationID` = `locations`.`ID`)) where `locations`.`address` like '%1150%' ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additionalcharges`
--
ALTER TABLE `additionalcharges`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `returnID` (`returnID`);

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`licensePlate`),
  ADD KEY `manufacturerID` (`manufacturerID`);

--
-- Indizes für die Tabelle `cars_condition`
--
ALTER TABLE `cars_condition`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `licensePlate` (`licensePlate`);

--
-- Indizes für die Tabelle `car_return`
--
ALTER TABLE `car_return`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `invoiceID` (`invoiceID`);

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `contactID` (`contactID`);

--
-- Indizes für die Tabelle `customer_contact`
--
ALTER TABLE `customer_contact`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `reservationID` (`reservationID`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `contactID` (`contactID`);

--
-- Indizes für die Tabelle `manufacturer_contact`
--
ALTER TABLE `manufacturer_contact`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `licensePlate` (`licensePlate`),
  ADD KEY `locationID` (`locationID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `additionalcharges`
--
ALTER TABLE `additionalcharges`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `cars_condition`
--
ALTER TABLE `cars_condition`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `car_return`
--
ALTER TABLE `car_return`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `customer_contact`
--
ALTER TABLE `customer_contact`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `locations`
--
ALTER TABLE `locations`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT für Tabelle `manufacturer_contact`
--
ALTER TABLE `manufacturer_contact`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additionalcharges`
--
ALTER TABLE `additionalcharges`
  ADD CONSTRAINT `additionalcharges_ibfk_1` FOREIGN KEY (`returnID`) REFERENCES `car_return` (`ID`);

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`ID`);

--
-- Constraints der Tabelle `cars_condition`
--
ALTER TABLE `cars_condition`
  ADD CONSTRAINT `cars_condition_ibfk_1` FOREIGN KEY (`licensePlate`) REFERENCES `cars` (`licensePlate`);

--
-- Constraints der Tabelle `car_return`
--
ALTER TABLE `car_return`
  ADD CONSTRAINT `car_return_ibfk_1` FOREIGN KEY (`invoiceID`) REFERENCES `invoice` (`ID`);

--
-- Constraints der Tabelle `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`contactID`) REFERENCES `customer_contact` (`ID`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`ID`);

--
-- Constraints der Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD CONSTRAINT `manufacturer_ibfk_1` FOREIGN KEY (`contactID`) REFERENCES `manufacturer_contact` (`ID`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`ID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`licensePlate`) REFERENCES `cars` (`licensePlate`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`locationID`) REFERENCES `locations` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
