-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 08 feb 2017 om 14:37
-- Serverversie: 10.1.19-MariaDB
-- PHP-versie: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rijschoolrocket`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `absenties`
--

CREATE TABLE `absenties` (
  `startdatum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `notities` text,
  `persoon_id` int(11) NOT NULL,
  `absentietype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `absentietype`
--

CREATE TABLE `absentietype` (
  `absentietype_id` int(11) NOT NULL,
  `absentietype` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `autorisaties`
--

CREATE TABLE `autorisaties` (
  `startdatum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `notitie` text,
  `rol_id` int(11) NOT NULL,
  `recht_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `autorisaties`
--

INSERT INTO `autorisaties` (`startdatum`, `einddatum`, `notitie`, `rol_id`, `recht_id`) VALUES
('2016-10-11', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `betalingen`
--

CREATE TABLE `betalingen` (
  `betaling_id` int(11) NOT NULL,
  `bankrekening` varchar(45) NOT NULL,
  `kas` int(1) NOT NULL,
  `bedrag` decimal(6,2) NOT NULL,
  `datum` date NOT NULL,
  `contract_id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `betalingen`
--

INSERT INTO `betalingen` (`betaling_id`, `bankrekening`, `kas`, `bedrag`, `datum`, `contract_id`, `persoon_id`) VALUES
(1, 'NL00INGB0001032757', 1, '50.00', '2017-01-11', 1, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `contracten`
--

CREATE TABLE `contracten` (
  `contractnr` int(11) NOT NULL,
  `datum` date NOT NULL,
  `notities` varchar(255) DEFAULT NULL,
  `lespakket_id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `contracten`
--

INSERT INTO `contracten` (`contractnr`, `datum`, `notities`, `lespakket_id`, `persoon_id`, `deleted`) VALUES
(1, '2017-01-11', 'gelukt', 1, 1, 1),
(5, '2017-01-23', 'dit is een motor contract', 2, 3, 1),
(6, '2017-01-25', 'vandaag', 2, 3, 0),
(7, '2017-01-30', 'voor gerard', 1, 11, 0),
(8, '2017-01-30', 'motor gerard', 2, 11, 0),
(9, '2017-01-30', 'cewvrfbtydtrgef', 3, 11, 0),
(10, '2017-01-30', 'voor arnie', 2, 10, 0),
(11, '2017-01-30', 'dit is een lespakket voor achmed', 2, 12, 0),
(12, '2017-01-31', 'hallo', 3, 3, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `documenten`
--

CREATE TABLE `documenten` (
  `document_id` int(11) NOT NULL,
  `document` varchar(255) NOT NULL,
  `locatie` varchar(255) NOT NULL,
  `mailbericht` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `feestdagen`
--

CREATE TABLE `feestdagen` (
  `datum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `feestdag` varchar(45) NOT NULL,
  `notitie` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `informatie`
--

CREATE TABLE `informatie` (
  `informatie_id` int(11) NOT NULL,
  `informatie` text NOT NULL,
  `startdatum` date NOT NULL,
  `eindatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `info_beheer`
--

CREATE TABLE `info_beheer` (
  `startdatum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `informatie_beheer` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leerlinginstructeur`
--

CREATE TABLE `leerlinginstructeur` (
  `leerlinginstructeur_id` int(11) NOT NULL,
  `startdatum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `notities` text,
  `contractnr` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lespakketten`
--

CREATE TABLE `lespakketten` (
  `lespakket_id` int(11) NOT NULL,
  `lespakket` varchar(45) NOT NULL,
  `lesaantal` int(11) NOT NULL,
  `actie` int(11) DEFAULT NULL,
  `lestype_id` int(11) NOT NULL,
  `lespakket_url` varchar(50) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `lespakketten`
--

INSERT INTO `lespakketten` (`lespakket_id`, `lespakket`, `lesaantal`, `actie`, `lestype_id`, `lespakket_url`, `deleted`) VALUES
(1, 'auto Winter aanbieding', 35, 1, 1, 'auto.jpg', 0),
(2, 'Zomer Motor Aanbieding', 10, 1, 2, 'motor.jpg', 0),
(3, 'Scooter snelcursus', 4, 1, 3, 'scooter.jpg', 0),
(4, 'Scooter swek', 4, 1, 3, NULL, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lesprijzen`
--

CREATE TABLE `lesprijzen` (
  `lesprijs_id` int(11) NOT NULL,
  `startdatum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `prijs` decimal(5,2) NOT NULL,
  `lespakket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `lesprijzen`
--

INSERT INTO `lesprijzen` (`lesprijs_id`, `startdatum`, `einddatum`, `prijs`, `lespakket_id`) VALUES
(1, '2017-01-02', '2017-01-23', '999.97', 1),
(2, '2017-01-08', NULL, '700.00', 2),
(3, '2017-01-01', NULL, '300.00', 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lessen`
--

CREATE TABLE `lessen` (
  `les_id` int(11) NOT NULL,
  `lesdatum` date NOT NULL,
  `starttijd` time NOT NULL,
  `eindtijd` time NOT NULL,
  `lesverslag` text,
  `ophaaladres` varchar(255) DEFAULT NULL,
  `instructeur` int(11) NOT NULL,
  `klant` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `kenteken` varchar(12) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `lessen`
--

INSERT INTO `lessen` (`les_id`, `lesdatum`, `starttijd`, `eindtijd`, `lesverslag`, `ophaaladres`, `instructeur`, `klant`, `contract_id`, `kenteken`, `active`) VALUES
(1, '2017-01-14', '08:17:32', '10:32:36', NULL, NULL, 2, 3, 1, 'DXL-10-L', 1),
(2, '2017-01-14', '08:17:32', '10:32:36', 'ewfrgtf', 'peiterWeg', 2, 3, 5, 'DXL-10-L', 0),
(3, '2017-01-31', '14:17:32', '15:32:36', 'jantje', 'jantje', 2, 3, 5, 'DXL-10-L', 1),
(4, '2017-01-14', '08:17:32', '10:32:36', 'ewfrgtf', 'peiterWeg', 2, 3, 6, 'DXL-10-L', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lestypes`
--

CREATE TABLE `lestypes` (
  `lestype_id` int(11) NOT NULL,
  `lestype` varchar(45) NOT NULL,
  `rijbewijs` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `lestypes`
--

INSERT INTO `lestypes` (`lestype_id`, `lestype`, `rijbewijs`) VALUES
(1, 'Auto', 'B'),
(2, 'Motor', 'A'),
(3, 'scooter', 'AM');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lesverrichtingen`
--

CREATE TABLE `lesverrichtingen` (
  `rijhandeling_id` int(11) NOT NULL,
  `les_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `licenties`
--

CREATE TABLE `licenties` (
  `licentie_id` int(11) NOT NULL,
  `startdatum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `instructeur_id` int(11) NOT NULL,
  `lestype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `mailberichten`
--

CREATE TABLE `mailberichten` (
  `mailberichten_id` int(11) NOT NULL,
  `verzenddatum` date NOT NULL,
  `onderwerp` varchar(255) NOT NULL,
  `mailbericht` text,
  `verzender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `mailontvangers`
--

CREATE TABLE `mailontvangers` (
  `ontvanger` int(11) NOT NULL,
  `mailbericht` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 2),
('2017_01_18_212015_add_deleted_to_users', 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderdelen`
--

CREATE TABLE `onderdelen` (
  `onderdeel_id` int(11) NOT NULL,
  `onderdeel` varchar(45) NOT NULL,
  `omschrijving` varchar(255) DEFAULT NULL,
  `lestype_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderdelenprijzen`
--

CREATE TABLE `onderdelenprijzen` (
  `onderdeel` varchar(45) NOT NULL,
  `omschrijving` varchar(255) DEFAULT NULL,
  `onderdeel_id` int(11) NOT NULL,
  `startdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderhoudsbeurten`
--

CREATE TABLE `onderhoudsbeurten` (
  `startdatum` date NOT NULL,
  `einddatum` date NOT NULL,
  `beurtnummer` int(11) NOT NULL,
  `arbeidsloon` decimal(8,2) NOT NULL,
  `km_stand` int(11) NOT NULL,
  `kenteken` varchar(12) NOT NULL,
  `garagist` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rechten`
--

CREATE TABLE `rechten` (
  `recht_id` int(11) NOT NULL,
  `rechten` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `rechten`
--

INSERT INTO `rechten` (`recht_id`, `rechten`) VALUES
(1, 'Klanten overzicht zien');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reperatiebonnen`
--

CREATE TABLE `reperatiebonnen` (
  `aantal` int(11) NOT NULL,
  `onderhoudsbeurtnummer` int(11) NOT NULL,
  `onderdeel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rijhandelingen`
--

CREATE TABLE `rijhandelingen` (
  `rijhandelingen_id` int(11) NOT NULL,
  `rijhandelingen` varchar(255) NOT NULL,
  `lestype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rollen`
--

CREATE TABLE `rollen` (
  `rol_id` int(11) NOT NULL,
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `rollen`
--

INSERT INTO `rollen` (`rol_id`, `rol`) VALUES
(1, 'Admin'),
(2, 'Instructeur'),
(3, 'Klant');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `roltoekenningen`
--

CREATE TABLE `roltoekenningen` (
  `roltoekenning_id` int(11) NOT NULL,
  `startdatum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `einddatum` date DEFAULT NULL,
  `persoon_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `roltoekenningen`
--

INSERT INTO `roltoekenningen` (`roltoekenning_id`, `startdatum`, `einddatum`, `persoon_id`, `rol_id`) VALUES
(16, '2017-01-25 10:51:47', NULL, 1, 1),
(17, '2017-01-25 10:51:47', NULL, 2, 2),
(22, '2017-01-25 10:52:13', NULL, 3, 3),
(27, '2017-01-04 00:00:00', '2017-01-31', 10, 3),
(28, '2017-01-30 19:19:21', NULL, 11, 3),
(29, '2017-01-30 23:29:17', NULL, 12, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `persoon_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tussenv` varchar(10) DEFAULT NULL,
  `achternaam` varchar(45) NOT NULL,
  `geboortedatum` date NOT NULL,
  `geslacht` varchar(1) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `huisnr` varchar(10) NOT NULL,
  `postcode` varchar(15) NOT NULL,
  `plaats` varchar(45) NOT NULL,
  `telefoon` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`persoon_id`, `name`, `tussenv`, `achternaam`, `geboortedatum`, `geslacht`, `adres`, `huisnr`, `postcode`, `plaats`, `telefoon`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'richie', '', 'tjin', '1998-06-30', 'M', 'archemerberg', '1', '3825RL', 'amersfoort', '0639204393', 'richietjin@gmail.com', '$2y$10$Z7/xyqJDvO3s42Adn9r68OS3sY74WExMiqwn844fVIH2atN5I7B3i', 'GuHfP3RZCn7tkWX0Z8PnGxrZuMYhuwstyBHNSjf0LRw2yIYEd45tjKRHkgmJ', '2017-01-11 07:41:34', '2017-02-06 04:32:16', 0),
(2, 'danielle', '', 'overweg', '1998-10-30', 'V', 'betsy perklaan', '7', '1187PL', 'amersfoort', '0639204393', 'instructeur@gmail.com', '$2y$10$Z7/xyqJDvO3s42Adn9r68OS3sY74WExMiqwn844fVIH2atN5I7B3i', 'vHUNLMyyFoj9Z14fNCnLIR8YwVpMkoX151gtu34q2DcaU0atMFIzkGnkeS8B', '2017-01-11 19:34:48', '2017-01-30 21:31:20', 0),
(3, 'henk', 'van', 'peter', '2994-01-12', 'M', 'peterstraat', '1', '3222AL', 'Leusden', '0639204393', 'henk@peter.nl', '$2y$10$zUEYFlC5QLeSYVs.EkEjkOORQ5H78wipEtK5Z1SqP.hlM3UVd8fZa', '4VVz4XEbhHrKygrIzwR3gZNw3v1mtsw8XCObgdsv3IFo73kdiivKDHgJEZxf', '2017-01-12 16:21:22', '2017-01-31 11:56:01', 0),
(4, 'viewer', '', 'jansen', '1995-12-12', 'M', 'bergweg', '30', '3422AL', 'amersfoort', '06293474329', 'sarah@sarah.nl', '$2y$10$EYNmkp1UuzFO1nvUnYKTLOwRp6orvH6zMPqsbE8Mbxfi76ax7M5hq', 'KlXx88FgFwMyIgqqM2FHRhu3i9lVzxu7ZF5ULFUxXpw7bgkJB7oIpRwUAQgI', '2017-01-12 16:52:08', '2017-01-25 09:15:29', 1),
(10, 'arnout', 'os', 'quint', '1997-10-10', 'V', 'zangvogelweg', '1', '3822VK', 'amersfoort', '06392049948', 'arnout@arnout.nl', '$2y$10$ccsFjdzPgYQ8pQZ9g.l9F.NXJFdwPP1HDYtvL0sl9p6n3Byn3FaOy', 'EQaLuTV6PmtoDJf6fuUm9fLfjF125T9CqN6bAC2FdWQtsonbnLwyNLyMpkE1', '2017-01-25 08:52:57', '2017-01-30 20:34:11', 0),
(11, 'gerard', '', 'haas', '1980-07-10', 'M', 'straatweg', '34', '2233CV', 'vianen', '06123456', 'gerard@gerard.nl', '$2y$10$78GMwoFaqVWHSBzdnEdjJ.o9/PoCF.8SWWowjf9ZwdcAiGMo4UiX.', 'slvyaFntaKmU2vAeL5lS4zkUBAACLAqLydJqTb2ZgQgTHpLmA7ElNQswNKuC', '2017-01-30 17:19:21', '2017-01-30 18:36:58', 0),
(12, 'achmed', '', 'bom', '1980-11-12', 'M', 'henkweg', '1', '2344DL', 'amersfoort', '06234567', 'achmed@bom.nl', '$2y$10$1JI8lTExKhSSEQ2juXVVsu8OzhM9QUSVmYlrwgo0kraCUjYA2TmTa', 'FXrRsfDfD2oac5bn3zvWD7tWw0x5oEQW5UV7iKSCi26vIZDkfsxquYopZOKf', '2017-01-30 21:29:17', '2017-01-30 21:31:06', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `voertuigen`
--

CREATE TABLE `voertuigen` (
  `kenteken` varchar(12) NOT NULL,
  `merk` varchar(45) NOT NULL,
  `aankoopdatum` date NOT NULL,
  `leverancier` int(11) NOT NULL,
  `voertuigtype_id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `voertuigen`
--

INSERT INTO `voertuigen` (`kenteken`, `merk`, `aankoopdatum`, `leverancier`, `voertuigtype_id`, `deleted`) VALUES
('DXL-10-L', 'audi', '2017-01-10', 0, 1, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `voertuiggebruikers`
--

CREATE TABLE `voertuiggebruikers` (
  `startdatum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `kenteken` varchar(12) NOT NULL,
  `persoon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `werkdagen`
--

CREATE TABLE `werkdagen` (
  `werkdag` int(11) NOT NULL,
  `startdatum` date NOT NULL,
  `einddatum` date DEFAULT NULL,
  `werknemer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `absenties`
--
ALTER TABLE `absenties`
  ADD PRIMARY KEY (`startdatum`,`persoon_id`,`absentietype_id`),
  ADD KEY `persoon_id` (`persoon_id`),
  ADD KEY `absentietype_id` (`absentietype_id`);

--
-- Indexen voor tabel `absentietype`
--
ALTER TABLE `absentietype`
  ADD PRIMARY KEY (`absentietype_id`);

--
-- Indexen voor tabel `autorisaties`
--
ALTER TABLE `autorisaties`
  ADD PRIMARY KEY (`startdatum`,`rol_id`,`recht_id`),
  ADD KEY `rol_id` (`rol_id`),
  ADD KEY `recht_id` (`recht_id`);

--
-- Indexen voor tabel `betalingen`
--
ALTER TABLE `betalingen`
  ADD PRIMARY KEY (`betaling_id`),
  ADD KEY `contractnummer` (`contract_id`),
  ADD KEY `persoon_id` (`persoon_id`);

--
-- Indexen voor tabel `contracten`
--
ALTER TABLE `contracten`
  ADD PRIMARY KEY (`contractnr`,`lespakket_id`,`persoon_id`),
  ADD KEY `lespakket_id` (`lespakket_id`),
  ADD KEY `persoon_id` (`persoon_id`),
  ADD KEY `lespakket_id_2` (`lespakket_id`,`persoon_id`);

--
-- Indexen voor tabel `documenten`
--
ALTER TABLE `documenten`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `mailbericht` (`mailbericht`);

--
-- Indexen voor tabel `feestdagen`
--
ALTER TABLE `feestdagen`
  ADD PRIMARY KEY (`datum`);

--
-- Indexen voor tabel `informatie`
--
ALTER TABLE `informatie`
  ADD PRIMARY KEY (`informatie_id`);

--
-- Indexen voor tabel `info_beheer`
--
ALTER TABLE `info_beheer`
  ADD PRIMARY KEY (`startdatum`,`informatie_beheer`,`rol_id`),
  ADD KEY `informatie_beheer` (`informatie_beheer`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indexen voor tabel `leerlinginstructeur`
--
ALTER TABLE `leerlinginstructeur`
  ADD PRIMARY KEY (`leerlinginstructeur_id`),
  ADD KEY `instructeur` (`persoon_id`),
  ADD KEY `leerlinginstructeur_id` (`leerlinginstructeur_id`,`contractnr`),
  ADD KEY `contractnr` (`contractnr`);

--
-- Indexen voor tabel `lespakketten`
--
ALTER TABLE `lespakketten`
  ADD PRIMARY KEY (`lespakket_id`),
  ADD KEY `lestype_id` (`lestype_id`);

--
-- Indexen voor tabel `lesprijzen`
--
ALTER TABLE `lesprijzen`
  ADD PRIMARY KEY (`lesprijs_id`,`startdatum`,`lespakket_id`),
  ADD UNIQUE KEY `lesprijs_id` (`lesprijs_id`),
  ADD KEY `lespakket_id` (`lespakket_id`);

--
-- Indexen voor tabel `lessen`
--
ALTER TABLE `lessen`
  ADD PRIMARY KEY (`les_id`),
  ADD KEY `instructeur` (`instructeur`),
  ADD KEY `klant` (`klant`),
  ADD KEY `contractnummer` (`contract_id`),
  ADD KEY `kenteken` (`kenteken`);

--
-- Indexen voor tabel `lestypes`
--
ALTER TABLE `lestypes`
  ADD PRIMARY KEY (`lestype_id`);

--
-- Indexen voor tabel `lesverrichtingen`
--
ALTER TABLE `lesverrichtingen`
  ADD PRIMARY KEY (`rijhandeling_id`,`les_id`),
  ADD KEY `les_id` (`les_id`);

--
-- Indexen voor tabel `licenties`
--
ALTER TABLE `licenties`
  ADD PRIMARY KEY (`licentie_id`,`instructeur_id`,`lestype_id`),
  ADD KEY `instructeur_id` (`instructeur_id`),
  ADD KEY `lestype_id` (`lestype_id`);

--
-- Indexen voor tabel `mailberichten`
--
ALTER TABLE `mailberichten`
  ADD PRIMARY KEY (`mailberichten_id`),
  ADD KEY `verzender` (`verzender`);

--
-- Indexen voor tabel `mailontvangers`
--
ALTER TABLE `mailontvangers`
  ADD PRIMARY KEY (`ontvanger`,`mailbericht`),
  ADD KEY `mailbericht` (`mailbericht`);

--
-- Indexen voor tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  ADD PRIMARY KEY (`onderdeel_id`),
  ADD KEY `lestype_id` (`lestype_id`);

--
-- Indexen voor tabel `onderdelenprijzen`
--
ALTER TABLE `onderdelenprijzen`
  ADD PRIMARY KEY (`onderdeel_id`,`startdatum`);

--
-- Indexen voor tabel `onderhoudsbeurten`
--
ALTER TABLE `onderhoudsbeurten`
  ADD PRIMARY KEY (`startdatum`,`kenteken`,`garagist`),
  ADD UNIQUE KEY `beurtnummer` (`beurtnummer`),
  ADD KEY `kenteken` (`kenteken`),
  ADD KEY `garagist` (`garagist`);

--
-- Indexen voor tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexen voor tabel `rechten`
--
ALTER TABLE `rechten`
  ADD PRIMARY KEY (`recht_id`);

--
-- Indexen voor tabel `reperatiebonnen`
--
ALTER TABLE `reperatiebonnen`
  ADD PRIMARY KEY (`onderhoudsbeurtnummer`,`onderdeel_id`),
  ADD KEY `onderhoudsbeurtnummer` (`onderhoudsbeurtnummer`),
  ADD KEY `onderdeel_id` (`onderdeel_id`);

--
-- Indexen voor tabel `rijhandelingen`
--
ALTER TABLE `rijhandelingen`
  ADD PRIMARY KEY (`rijhandelingen_id`),
  ADD KEY `lestype_id` (`lestype_id`);

--
-- Indexen voor tabel `rollen`
--
ALTER TABLE `rollen`
  ADD PRIMARY KEY (`rol_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indexen voor tabel `roltoekenningen`
--
ALTER TABLE `roltoekenningen`
  ADD PRIMARY KEY (`roltoekenning_id`,`persoon_id`,`rol_id`),
  ADD UNIQUE KEY `roltoekenning_id` (`roltoekenning_id`),
  ADD KEY `persoon_id` (`persoon_id`),
  ADD KEY `user_role_ibfk_1` (`rol_id`),
  ADD KEY `persoon_id_2` (`persoon_id`,`rol_id`),
  ADD KEY `persoon_id_3` (`persoon_id`,`rol_id`),
  ADD KEY `startdatum` (`startdatum`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`persoon_id`);

--
-- Indexen voor tabel `voertuigen`
--
ALTER TABLE `voertuigen`
  ADD PRIMARY KEY (`kenteken`),
  ADD UNIQUE KEY `leverancier_3` (`leverancier`),
  ADD KEY `lestype_id` (`voertuigtype_id`),
  ADD KEY `leverancier` (`leverancier`),
  ADD KEY `leverancier_2` (`leverancier`);

--
-- Indexen voor tabel `voertuiggebruikers`
--
ALTER TABLE `voertuiggebruikers`
  ADD PRIMARY KEY (`startdatum`,`kenteken`,`persoon_id`),
  ADD KEY `kenteken` (`kenteken`),
  ADD KEY `persoon_id` (`persoon_id`);

--
-- Indexen voor tabel `werkdagen`
--
ALTER TABLE `werkdagen`
  ADD PRIMARY KEY (`werkdag`,`startdatum`,`werknemer`),
  ADD KEY `werknemer` (`werknemer`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `absentietype`
--
ALTER TABLE `absentietype`
  MODIFY `absentietype_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `betalingen`
--
ALTER TABLE `betalingen`
  MODIFY `betaling_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `contracten`
--
ALTER TABLE `contracten`
  MODIFY `contractnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT voor een tabel `documenten`
--
ALTER TABLE `documenten`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `informatie`
--
ALTER TABLE `informatie`
  MODIFY `informatie_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `leerlinginstructeur`
--
ALTER TABLE `leerlinginstructeur`
  MODIFY `leerlinginstructeur_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `lespakketten`
--
ALTER TABLE `lespakketten`
  MODIFY `lespakket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT voor een tabel `lesprijzen`
--
ALTER TABLE `lesprijzen`
  MODIFY `lesprijs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT voor een tabel `lessen`
--
ALTER TABLE `lessen`
  MODIFY `les_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT voor een tabel `lestypes`
--
ALTER TABLE `lestypes`
  MODIFY `lestype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT voor een tabel `licenties`
--
ALTER TABLE `licenties`
  MODIFY `licentie_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `mailberichten`
--
ALTER TABLE `mailberichten`
  MODIFY `mailberichten_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  MODIFY `onderdeel_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `onderhoudsbeurten`
--
ALTER TABLE `onderhoudsbeurten`
  MODIFY `beurtnummer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `rechten`
--
ALTER TABLE `rechten`
  MODIFY `recht_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `reperatiebonnen`
--
ALTER TABLE `reperatiebonnen`
  MODIFY `onderhoudsbeurtnummer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `rijhandelingen`
--
ALTER TABLE `rijhandelingen`
  MODIFY `rijhandelingen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `rollen`
--
ALTER TABLE `rollen`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT voor een tabel `roltoekenningen`
--
ALTER TABLE `roltoekenningen`
  MODIFY `roltoekenning_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `persoon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `absenties`
--
ALTER TABLE `absenties`
  ADD CONSTRAINT `absenties_ibfk_1` FOREIGN KEY (`persoon_id`) REFERENCES `users` (`persoon_id`),
  ADD CONSTRAINT `absenties_ibfk_2` FOREIGN KEY (`absentietype_id`) REFERENCES `absentietype` (`absentietype_id`);

--
-- Beperkingen voor tabel `autorisaties`
--
ALTER TABLE `autorisaties`
  ADD CONSTRAINT `autorisaties_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rollen` (`rol_id`),
  ADD CONSTRAINT `autorisaties_ibfk_2` FOREIGN KEY (`recht_id`) REFERENCES `rechten` (`recht_id`);

--
-- Beperkingen voor tabel `betalingen`
--
ALTER TABLE `betalingen`
  ADD CONSTRAINT `betalingen_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `contracten` (`contractnr`),
  ADD CONSTRAINT `betalingen_ibfk_2` FOREIGN KEY (`persoon_id`) REFERENCES `users` (`persoon_id`);

--
-- Beperkingen voor tabel `contracten`
--
ALTER TABLE `contracten`
  ADD CONSTRAINT `contracten_ibfk_1` FOREIGN KEY (`lespakket_id`) REFERENCES `lespakketten` (`lespakket_id`),
  ADD CONSTRAINT `contracten_ibfk_2` FOREIGN KEY (`persoon_id`) REFERENCES `users` (`persoon_id`);

--
-- Beperkingen voor tabel `documenten`
--
ALTER TABLE `documenten`
  ADD CONSTRAINT `documenten_ibfk_1` FOREIGN KEY (`mailbericht`) REFERENCES `mailberichten` (`mailberichten_id`);

--
-- Beperkingen voor tabel `info_beheer`
--
ALTER TABLE `info_beheer`
  ADD CONSTRAINT `info_beheer_ibfk_1` FOREIGN KEY (`informatie_beheer`) REFERENCES `informatie` (`informatie_id`),
  ADD CONSTRAINT `info_beheer_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `rollen` (`rol_id`);

--
-- Beperkingen voor tabel `leerlinginstructeur`
--
ALTER TABLE `leerlinginstructeur`
  ADD CONSTRAINT `leerlinginstructeur_ibfk_2` FOREIGN KEY (`persoon_id`) REFERENCES `users` (`persoon_id`),
  ADD CONSTRAINT `leerlinginstructeur_ibfk_3` FOREIGN KEY (`contractnr`) REFERENCES `contracten` (`contractnr`);

--
-- Beperkingen voor tabel `lespakketten`
--
ALTER TABLE `lespakketten`
  ADD CONSTRAINT `lespakketten_ibfk_1` FOREIGN KEY (`lestype_id`) REFERENCES `lestypes` (`lestype_id`);

--
-- Beperkingen voor tabel `lesprijzen`
--
ALTER TABLE `lesprijzen`
  ADD CONSTRAINT `lesprijzen_ibfk_1` FOREIGN KEY (`lespakket_id`) REFERENCES `lespakketten` (`lespakket_id`);

--
-- Beperkingen voor tabel `lessen`
--
ALTER TABLE `lessen`
  ADD CONSTRAINT `lessen_ibfk_1` FOREIGN KEY (`instructeur`) REFERENCES `users` (`persoon_id`),
  ADD CONSTRAINT `lessen_ibfk_2` FOREIGN KEY (`klant`) REFERENCES `users` (`persoon_id`),
  ADD CONSTRAINT `lessen_ibfk_3` FOREIGN KEY (`contract_id`) REFERENCES `contracten` (`contractnr`),
  ADD CONSTRAINT `lessen_ibfk_4` FOREIGN KEY (`kenteken`) REFERENCES `voertuigen` (`kenteken`);

--
-- Beperkingen voor tabel `lesverrichtingen`
--
ALTER TABLE `lesverrichtingen`
  ADD CONSTRAINT `lesverrichtingen_ibfk_1` FOREIGN KEY (`rijhandeling_id`) REFERENCES `rijhandelingen` (`rijhandelingen_id`),
  ADD CONSTRAINT `lesverrichtingen_ibfk_2` FOREIGN KEY (`les_id`) REFERENCES `lessen` (`les_id`);

--
-- Beperkingen voor tabel `licenties`
--
ALTER TABLE `licenties`
  ADD CONSTRAINT `licenties_ibfk_1` FOREIGN KEY (`instructeur_id`) REFERENCES `users` (`persoon_id`),
  ADD CONSTRAINT `licenties_ibfk_2` FOREIGN KEY (`lestype_id`) REFERENCES `lestypes` (`lestype_id`);

--
-- Beperkingen voor tabel `mailberichten`
--
ALTER TABLE `mailberichten`
  ADD CONSTRAINT `mailberichten_ibfk_1` FOREIGN KEY (`verzender`) REFERENCES `leerlinginstructeur` (`contractnr`);

--
-- Beperkingen voor tabel `mailontvangers`
--
ALTER TABLE `mailontvangers`
  ADD CONSTRAINT `mailontvangers_ibfk_1` FOREIGN KEY (`ontvanger`) REFERENCES `users` (`persoon_id`),
  ADD CONSTRAINT `mailontvangers_ibfk_2` FOREIGN KEY (`mailbericht`) REFERENCES `mailberichten` (`mailberichten_id`);

--
-- Beperkingen voor tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  ADD CONSTRAINT `onderdelen_ibfk_1` FOREIGN KEY (`lestype_id`) REFERENCES `lestypes` (`lestype_id`);

--
-- Beperkingen voor tabel `onderdelenprijzen`
--
ALTER TABLE `onderdelenprijzen`
  ADD CONSTRAINT `onderdelenprijzen_ibfk_1` FOREIGN KEY (`onderdeel_id`) REFERENCES `onderdelen` (`onderdeel_id`);

--
-- Beperkingen voor tabel `onderhoudsbeurten`
--
ALTER TABLE `onderhoudsbeurten`
  ADD CONSTRAINT `onderhoudsbeurten_ibfk_1` FOREIGN KEY (`kenteken`) REFERENCES `voertuigen` (`kenteken`),
  ADD CONSTRAINT `onderhoudsbeurten_ibfk_2` FOREIGN KEY (`garagist`) REFERENCES `lessen` (`les_id`);

--
-- Beperkingen voor tabel `reperatiebonnen`
--
ALTER TABLE `reperatiebonnen`
  ADD CONSTRAINT `reperatiebonnen_ibfk_1` FOREIGN KEY (`onderhoudsbeurtnummer`) REFERENCES `onderhoudsbeurten` (`beurtnummer`),
  ADD CONSTRAINT `reperatiebonnen_ibfk_2` FOREIGN KEY (`onderdeel_id`) REFERENCES `onderdelen` (`onderdeel_id`);

--
-- Beperkingen voor tabel `rijhandelingen`
--
ALTER TABLE `rijhandelingen`
  ADD CONSTRAINT `rijhandelingen_ibfk_1` FOREIGN KEY (`lestype_id`) REFERENCES `lestypes` (`lestype_id`);

--
-- Beperkingen voor tabel `roltoekenningen`
--
ALTER TABLE `roltoekenningen`
  ADD CONSTRAINT `roltoekenningen_ibfk_2` FOREIGN KEY (`persoon_id`) REFERENCES `users` (`persoon_id`),
  ADD CONSTRAINT `roltoekenningen_ibfk_3` FOREIGN KEY (`rol_id`) REFERENCES `rollen` (`rol_id`);

--
-- Beperkingen voor tabel `voertuiggebruikers`
--
ALTER TABLE `voertuiggebruikers`
  ADD CONSTRAINT `voertuiggebruikers_ibfk_1` FOREIGN KEY (`kenteken`) REFERENCES `voertuigen` (`kenteken`),
  ADD CONSTRAINT `voertuiggebruikers_ibfk_2` FOREIGN KEY (`persoon_id`) REFERENCES `users` (`persoon_id`);

--
-- Beperkingen voor tabel `werkdagen`
--
ALTER TABLE `werkdagen`
  ADD CONSTRAINT `werkdagen_ibfk_1` FOREIGN KEY (`werknemer`) REFERENCES `users` (`persoon_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
