-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Jun 2018 um 10:19
-- Server Version: 5.6.21
-- PHP-Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `AuthorID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`AuthorID`, `FirstName`, `LastName`) VALUES
(1, 'Denis', 'Schuele'),
(2, 'Isabel', 'Westenberger');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `BookID` int(11) NOT NULL,
  `fk_OwnerID` int(11) NOT NULL,
  `fk_AuthorID` int(11) NOT NULL,
  `fk_GenreID` int(11) NOT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `Description` char(1) DEFAULT NULL,
  `Lang` varchar(20) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Pages` int(11) NOT NULL,
  `Fiction` tinyint(1) DEFAULT NULL,
  `Publisher` varchar(30) DEFAULT NULL,
  `Date_Published` date DEFAULT NULL,
  `Date_Accquired` date DEFAULT NULL,
  `Reading_Start` date DEFAULT NULL,
  `Reading_End` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`BookID`, `fk_OwnerID`, `fk_AuthorID`, `fk_GenreID`, `Title`, `Description`, `Lang`, `Price`, `Pages`, `Fiction`, `Publisher`, `Date_Published`, `Date_Accquired`, `Reading_Start`, `Reading_End`) VALUES
(1, 2, 1, 3, 'Odyssee', 'I', 'Deutsch', '50.00', 400, 0, 'Homer', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
(2, 1, 2, 4, 'Harry Potter und der Stein der', 'A', 'English', '31.99', 300, 1, 'J.K.Rolling', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `GenreID` int(11) NOT NULL,
  `Category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `genre`
--

INSERT INTO `genre` (`GenreID`, `Category`) VALUES
(1, 'Horror'),
(2, 'Romantic'),
(3, 'Fantasy'),
(4, 'Action'),
(5, 'Documentary'),
(6, 'Biography');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `owner`
--

CREATE TABLE IF NOT EXISTS `owner` (
  `OwnerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `owner`
--

INSERT INTO `owner` (`OwnerID`, `FirstName`, `LastName`) VALUES
(1, 'Dominic', 'Wieser'),
(2, 'Patrick', 'Klostermann');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
 ADD PRIMARY KEY (`AuthorID`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
 ADD PRIMARY KEY (`BookID`), ADD KEY `fk_OwnerID` (`fk_OwnerID`), ADD KEY `fk_AuthorID` (`fk_AuthorID`), ADD KEY `fk_GenreID` (`fk_GenreID`);

--
-- Indizes für die Tabelle `genre`
--
ALTER TABLE `genre`
 ADD PRIMARY KEY (`GenreID`);

--
-- Indizes für die Tabelle `owner`
--
ALTER TABLE `owner`
 ADD PRIMARY KEY (`OwnerID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_OwnerID`) REFERENCES `owner` (`OwnerID`),
ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_AuthorID`) REFERENCES `author` (`AuthorID`),
ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`fk_GenreID`) REFERENCES `genre` (`GenreID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
