-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2024 at 01:33 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klubpilkarski`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mecze`
--

CREATE TABLE `mecze` (
  `id_meczu` int(11) NOT NULL,
  `data_meczu` date DEFAULT NULL,
  `przeciwnik` varchar(50) DEFAULT NULL,
  `wynik` varchar(10) DEFAULT NULL,
  `miejsce` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mecze`
--

INSERT INTO `mecze` (`id_meczu`, `data_meczu`, `przeciwnik`, `wynik`, `miejsce`) VALUES
(1, '2023-05-05', 'Drużyna A', '2:1', 'Dom'),
(2, '2023-05-12', 'Drużyna B', '1:3', 'Wyjazd'),
(3, '2023-05-19', 'Drużyna C', '0:0', 'Dom'),
(4, '2023-05-26', 'Drużyna D', '4:2', 'Wyjazd');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trenerzy`
--

CREATE TABLE `trenerzy` (
  `id_trenera` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `data_zatrudnienia` date DEFAULT NULL,
  `specjalizacja` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trenerzy`
--

INSERT INTO `trenerzy` (`id_trenera`, `imie`, `nazwisko`, `data_zatrudnienia`, `specjalizacja`) VALUES
(1, 'Jan', 'Kowalski', '2020-03-15', 'Trener główny'),
(2, 'Marek', 'Wiśniewski', '2021-07-01', 'Trener bramkarzy'),
(3, 'Anna', 'Nowak', '2022-01-10', 'Trener przygotowania fizycznego');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawodnicy`
--

CREATE TABLE `zawodnicy` (
  `id_zawodnika` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `pozycja` varchar(50) DEFAULT NULL,
  `wiek` int(11) DEFAULT NULL,
  `id_trenera` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zawodnicy`
--

INSERT INTO `zawodnicy` (`id_zawodnika`, `imie`, `nazwisko`, `pozycja`, `wiek`, `id_trenera`) VALUES
(1, 'Tomasz', 'Zieliński', 'Napastnik', 25, 1),
(2, 'Piotr', 'Nowicki', 'Obrońca', 28, 1),
(3, 'Adam', 'Kruk', 'Bramkarz', 30, 2),
(4, 'Krzysztof', 'Wiatr', 'Pomocnik', 22, 1),
(5, 'Michał', 'Jankowski', 'Napastnik', 26, 1),
(6, 'Paweł', 'Kowal', 'Obrońca', 24, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `mecze`
--
ALTER TABLE `mecze`
  ADD PRIMARY KEY (`id_meczu`);

--
-- Indeksy dla tabeli `trenerzy`
--
ALTER TABLE `trenerzy`
  ADD PRIMARY KEY (`id_trenera`);

--
-- Indeksy dla tabeli `zawodnicy`
--
ALTER TABLE `zawodnicy`
  ADD PRIMARY KEY (`id_zawodnika`),
  ADD KEY `id_trenera` (`id_trenera`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mecze`
--
ALTER TABLE `mecze`
  MODIFY `id_meczu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trenerzy`
--
ALTER TABLE `trenerzy`
  MODIFY `id_trenera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zawodnicy`
--
ALTER TABLE `zawodnicy`
  MODIFY `id_zawodnika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zawodnicy`
--
ALTER TABLE `zawodnicy`
  ADD CONSTRAINT `zawodnicy_ibfk_1` FOREIGN KEY (`id_trenera`) REFERENCES `trenerzy` (`id_trenera`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
