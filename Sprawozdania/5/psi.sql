-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2025 at 09:43 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psi`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `awaria`
--

CREATE TABLE `awaria` (
  `id` int(11) NOT NULL,
  `dataZgloszenia` date DEFAULT NULL,
  `opis` varchar(300) DEFAULT NULL,
  `id_kierowcy` int(11) NOT NULL,
  `id_pojazdu_zastepczego` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `numerKontaFirmowego` varchar(50) NOT NULL,
  `waluta` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czesci_zamienne`
--

CREATE TABLE `czesci_zamienne` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) DEFAULT NULL,
  `numerKatalogowy` varchar(100) DEFAULT NULL,
  `iloscNaMagazynie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dokumentprzewozowy`
--

CREATE TABLE `dokumentprzewozowy` (
  `id` int(11) NOT NULL,
  `numer` varchar(50) NOT NULL,
  `id_korespondencji` int(11) NOT NULL,
  `id_pracownika_obslugi_klienta` int(11) NOT NULL,
  `dataWystawienia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dyspozytor`
--

CREATE TABLE `dyspozytor` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `zmiana` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktura`
--

CREATE TABLE `faktura` (
  `id` int(11) NOT NULL,
  `numer` varchar(50) NOT NULL,
  `dataWystawienia` date NOT NULL,
  `kwota` double NOT NULL,
  `odbiorca` varchar(255) NOT NULL,
  `zlecenie` varchar(100) NOT NULL,
  `id_specjalisty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gotowka`
--

CREATE TABLE `gotowka` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `kwota` double NOT NULL,
  `waluta` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `handlowiec`
--

CREATE TABLE `handlowiec` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `historiaserwisowa`
--

CREATE TABLE `historiaserwisowa` (
  `id` int(11) NOT NULL,
  `pojazd` varchar(255) DEFAULT NULL,
  `naprawy` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kalkulacje`
--

CREATE TABLE `kalkulacje` (
  `id` int(11) NOT NULL,
  `id_raportu` int(11) NOT NULL,
  `netto` double NOT NULL,
  `podatek` double NOT NULL,
  `brutto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kartakredytowa`
--

CREATE TABLE `kartakredytowa` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `id_operatora_karty` int(11) NOT NULL,
  `numer` varchar(50) NOT NULL,
  `imieWlasciciela` varchar(100) NOT NULL,
  `dataWaznosci` date NOT NULL,
  `cvv` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kierowca`
--

CREATE TABLE `kierowca` (
  `id` int(11) NOT NULL,
  `imie` varchar(255) DEFAULT NULL,
  `nazwisko` varchar(255) DEFAULT NULL,
  `numerPrawaJazdy` varchar(50) DEFAULT NULL,
  `aktualnaTrasa` varchar(255) DEFAULT NULL,
  `id_pojazdu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kierownik_floty`
--

CREATE TABLE `kierownik_floty` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `flota_aktywna` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nazwa_typu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klientindywidualny`
--

CREATE TABLE `klientindywidualny` (
  `id` int(11) NOT NULL,
  `nazwa_typu` varchar(50) DEFAULT NULL,
  `pesel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kopiaraportu`
--

CREATE TABLE `kopiaraportu` (
  `id` int(11) NOT NULL,
  `id_raportu` int(11) NOT NULL,
  `dataKopii` date NOT NULL,
  `lokalizacjaPliku` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `korespondencja`
--

CREATE TABLE `korespondencja` (
  `id` int(11) NOT NULL,
  `typ` varchar(50) NOT NULL,
  `tresc` varchar(500) NOT NULL,
  `data` date NOT NULL,
  `id_klient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `korespondencjasms`
--

CREATE TABLE `korespondencjasms` (
  `id` int(11) NOT NULL,
  `numerTelefonu` varchar(20) NOT NULL,
  `tresc` text NOT NULL,
  `data` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `id_kierowcy` int(11) NOT NULL,
  `id_dyspozytora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiegowy`
--

CREATE TABLE `ksiegowy` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `magazyn`
--

CREATE TABLE `magazyn` (
  `id` int(11) NOT NULL,
  `lokalizacja` varchar(255) NOT NULL,
  `pojemnosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `magazynier`
--

CREATE TABLE `magazynier` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) DEFAULT NULL,
  `nazwisko` varchar(100) DEFAULT NULL,
  `id_magazynu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `marketingowiec`
--

CREATE TABLE `marketingowiec` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mechanik`
--

CREATE TABLE `mechanik` (
  `id` int(11) NOT NULL,
  `id_warsztatu` int(11) NOT NULL,
  `imie` varchar(255) DEFAULT NULL,
  `nazwisko` varchar(255) DEFAULT NULL,
  `specjalizacja` varchar(255) DEFAULT NULL,
  `dostepnosc` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `metodaplatnosci`
--

CREATE TABLE `metodaplatnosci` (
  `id` int(11) NOT NULL,
  `nazwa_metody` varchar(50) NOT NULL,
  `opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `operatorkartplatniczych`
--

CREATE TABLE `operatorkartplatniczych` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `typyKart` varchar(255) NOT NULL,
  `statusSystemu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `operatorsystemu`
--

CREATE TABLE `operatorsystemu` (
  `id` int(11) NOT NULL,
  `uprawnienia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pojazd`
--

CREATE TABLE `pojazd` (
  `id` int(11) NOT NULL,
  `numerRejestracyjny` varchar(50) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `pojemnoscLadunkowa` double DEFAULT NULL,
  `stanTechniczny` varchar(100) DEFAULT NULL,
  `markaPojazdu` varchar(100) DEFAULT NULL,
  `modelPojazdu` varchar(100) DEFAULT NULL,
  `id_serwisu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pojazdzastepczy`
--

CREATE TABLE `pojazdzastepczy` (
  `id` int(11) NOT NULL,
  `numerRejestracyjny` varchar(50) DEFAULT NULL,
  `marka` varchar(100) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `dostepny` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `potwierdzenie`
--

CREATE TABLE `potwierdzenie` (
  `id` int(11) NOT NULL,
  `tresc` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `typ` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownikobslugiklienta`
--

CREATE TABLE `pracownikobslugiklienta` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedsiebiorstwo`
--

CREATE TABLE `przedsiebiorstwo` (
  `id` int(11) NOT NULL,
  `nazwa_typu` varchar(50) DEFAULT NULL,
  `nip` varchar(10) NOT NULL,
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przelew`
--

CREATE TABLE `przelew` (
  `id` int(11) NOT NULL,
  `id_banku` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `nadawca` varchar(255) NOT NULL,
  `odbiorca` varchar(255) NOT NULL,
  `kwota` double NOT NULL,
  `data` date NOT NULL,
  `tytul` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `raportpodatkowy`
--

CREATE TABLE `raportpodatkowy` (
  `id` int(11) NOT NULL,
  `okres` varchar(50) NOT NULL,
  `wartoscPodatku` double NOT NULL,
  `dataWygenerowania` date NOT NULL,
  `id_ksiegowego` int(11) NOT NULL,
  `id_urzedu_skarbowego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reklama`
--

CREATE TABLE `reklama` (
  `id` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `budzet` float NOT NULL,
  `dataPublikacji` date DEFAULT NULL,
  `id_klienta` int(11) DEFAULT NULL,
  `id_marketingowiec` int(11) DEFAULT NULL,
  `id_handlowca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reklamacja`
--

CREATE TABLE `reklamacja` (
  `id` int(11) NOT NULL,
  `id_zlecenia` int(11) NOT NULL,
  `numer` varchar(50) NOT NULL,
  `id_klient` varchar(255) NOT NULL,
  `powod` varchar(255) NOT NULL,
  `dataZgloszenia` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rozliczenietransakcji`
--

CREATE TABLE `rozliczenietransakcji` (
  `id` int(11) NOT NULL,
  `zlecenie` varchar(100) NOT NULL,
  `kwotaNetto` double NOT NULL,
  `data` date NOT NULL,
  `id_metody` int(11) NOT NULL,
  `id_faktury` int(11) NOT NULL,
  `id_potwierdzenia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `serwis_pojazdu`
--

CREATE TABLE `serwis_pojazdu` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `warsztat` varchar(100) DEFAULT NULL,
  `id_mechanika` int(11) NOT NULL,
  `id_czesci_zamiennej` int(11) NOT NULL,
  `id_historii_serwisowej` int(11) NOT NULL,
  `wykonaneCzynnosci` text DEFAULT NULL,
  `kierownik_floty_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `specjalistarozliczen`
--

CREATE TABLE `specjalistarozliczen` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `spedytor`
--

CREATE TABLE `spedytor` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) DEFAULT NULL,
  `nazwisko` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towar`
--

CREATE TABLE `towar` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) DEFAULT NULL,
  `waga` double DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `id_wlasciciela` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trasa`
--

CREATE TABLE `trasa` (
  `id` int(11) NOT NULL,
  `punktStartowy` varchar(255) DEFAULT NULL,
  `punktDocelowy` varchar(255) DEFAULT NULL,
  `dystans` double DEFAULT NULL,
  `przewidywanyCzas` double DEFAULT NULL,
  `id_trasy_alternatywnej` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trescireklamowe`
--

CREATE TABLE `trescireklamowe` (
  `id` int(11) NOT NULL,
  `id_reklamy` int(11) DEFAULT NULL,
  `naglowek` varchar(255) DEFAULT NULL,
  `tekst` text DEFAULT NULL,
  `zawartosc` text DEFAULT NULL,
  `mediaUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `umowa`
--

CREATE TABLE `umowa` (
  `id` int(11) NOT NULL,
  `id_korespondencji` int(11) NOT NULL,
  `id_pracownika_obslugi_klienta` int(11) NOT NULL,
  `numer` varchar(50) NOT NULL,
  `klient` varchar(255) NOT NULL,
  `dataZawarcia` date NOT NULL,
  `warunki` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `urzadskarbowy`
--

CREATE TABLE `urzadskarbowy` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `nip` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `aktywny` smallint(6) NOT NULL DEFAULT 1,
  `id_klienta` int(11) NOT NULL,
  `id_operatora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `warsztat`
--

CREATE TABLE `warsztat` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(100) DEFAULT NULL,
  `adres` varchar(100) DEFAULT NULL,
  `numer_telefonu` varchar(15) DEFAULT NULL,
  `dostepne_stanowiska` int(11) DEFAULT NULL,
  `obslugiwany_pojazd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wlasciciel`
--

CREATE TABLE `wlasciciel` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `dataUrodzenia` date NOT NULL,
  `pesel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wlascicieltowaru`
--

CREATE TABLE `wlascicieltowaru` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `kontakt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdarzeniadrogowe`
--

CREATE TABLE `zdarzeniadrogowe` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `opis` varchar(300) NOT NULL,
  `kierowca` varchar(100) NOT NULL,
  `lokalizacja` varchar(255) NOT NULL,
  `id_dyspozytora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zlecenie`
--

CREATE TABLE `zlecenie` (
  `id` int(11) NOT NULL,
  `numer` varchar(50) NOT NULL,
  `id_klienta` int(11) DEFAULT NULL,
  `towar` text DEFAULT NULL,
  `trasa` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `id_magazynier` int(11) DEFAULT NULL,
  `id_spedytor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zwroty`
--

CREATE TABLE `zwroty` (
  `id` int(11) NOT NULL,
  `powod` varchar(500) NOT NULL,
  `dataZwrotu` date NOT NULL,
  `id_korespondencji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `awaria`
--
ALTER TABLE `awaria`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `czesci_zamienne`
--
ALTER TABLE `czesci_zamienne`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `dokumentprzewozowy`
--
ALTER TABLE `dokumentprzewozowy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `dyspozytor`
--
ALTER TABLE `dyspozytor`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `faktura`
--
ALTER TABLE `faktura`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `gotowka`
--
ALTER TABLE `gotowka`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `handlowiec`
--
ALTER TABLE `handlowiec`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `historiaserwisowa`
--
ALTER TABLE `historiaserwisowa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kalkulacje`
--
ALTER TABLE `kalkulacje`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kartakredytowa`
--
ALTER TABLE `kartakredytowa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kierowca`
--
ALTER TABLE `kierowca`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kierownik_floty`
--
ALTER TABLE `kierownik_floty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klientindywidualny`
--
ALTER TABLE `klientindywidualny`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pesel` (`pesel`);

--
-- Indeksy dla tabeli `kopiaraportu`
--
ALTER TABLE `kopiaraportu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_raportu` (`id_raportu`);

--
-- Indeksy dla tabeli `korespondencja`
--
ALTER TABLE `korespondencja`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `korespondencjasms`
--
ALTER TABLE `korespondencjasms`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ksiegowy`
--
ALTER TABLE `ksiegowy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `magazyn`
--
ALTER TABLE `magazyn`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `magazynier`
--
ALTER TABLE `magazynier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_magazynu` (`id_magazynu`);

--
-- Indeksy dla tabeli `marketingowiec`
--
ALTER TABLE `marketingowiec`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `mechanik`
--
ALTER TABLE `mechanik`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `metodaplatnosci`
--
ALTER TABLE `metodaplatnosci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `operatorkartplatniczych`
--
ALTER TABLE `operatorkartplatniczych`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `operatorsystemu`
--
ALTER TABLE `operatorsystemu`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pojazd`
--
ALTER TABLE `pojazd`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pojazdzastepczy`
--
ALTER TABLE `pojazdzastepczy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `potwierdzenie`
--
ALTER TABLE `potwierdzenie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pracownikobslugiklienta`
--
ALTER TABLE `pracownikobslugiklienta`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `przedsiebiorstwo`
--
ALTER TABLE `przedsiebiorstwo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indeksy dla tabeli `przelew`
--
ALTER TABLE `przelew`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `raportpodatkowy`
--
ALTER TABLE `raportpodatkowy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ksiegowego` (`id_ksiegowego`),
  ADD KEY `id_urzedu_skarbowego` (`id_urzedu_skarbowego`);

--
-- Indeksy dla tabeli `reklama`
--
ALTER TABLE `reklama`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klienta` (`id_klienta`),
  ADD KEY `id_marketingowiec` (`id_marketingowiec`),
  ADD KEY `id_handlowca` (`id_handlowca`);

--
-- Indeksy dla tabeli `reklamacja`
--
ALTER TABLE `reklamacja`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rozliczenietransakcji`
--
ALTER TABLE `rozliczenietransakcji`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `serwis_pojazdu`
--
ALTER TABLE `serwis_pojazdu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mechanika` (`id_mechanika`),
  ADD KEY `kierownik_floty_id` (`kierownik_floty_id`);

--
-- Indeksy dla tabeli `specjalistarozliczen`
--
ALTER TABLE `specjalistarozliczen`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `spedytor`
--
ALTER TABLE `spedytor`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `towar`
--
ALTER TABLE `towar`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `trasa`
--
ALTER TABLE `trasa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `trescireklamowe`
--
ALTER TABLE `trescireklamowe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reklamy` (`id_reklamy`);

--
-- Indeksy dla tabeli `umowa`
--
ALTER TABLE `umowa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `urzadskarbowy`
--
ALTER TABLE `urzadskarbowy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `warsztat`
--
ALTER TABLE `warsztat`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wlasciciel`
--
ALTER TABLE `wlasciciel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pesel` (`pesel`);

--
-- Indeksy dla tabeli `wlascicieltowaru`
--
ALTER TABLE `wlascicieltowaru`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zdarzeniadrogowe`
--
ALTER TABLE `zdarzeniadrogowe`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zlecenie`
--
ALTER TABLE `zlecenie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numer` (`numer`),
  ADD KEY `id_klienta` (`id_klienta`),
  ADD KEY `id_magazynier` (`id_magazynier`),
  ADD KEY `id_spedytor` (`id_spedytor`);

--
-- Indeksy dla tabeli `zwroty`
--
ALTER TABLE `zwroty`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `awaria`
--
ALTER TABLE `awaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `czesci_zamienne`
--
ALTER TABLE `czesci_zamienne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dokumentprzewozowy`
--
ALTER TABLE `dokumentprzewozowy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dyspozytor`
--
ALTER TABLE `dyspozytor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faktura`
--
ALTER TABLE `faktura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gotowka`
--
ALTER TABLE `gotowka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `handlowiec`
--
ALTER TABLE `handlowiec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historiaserwisowa`
--
ALTER TABLE `historiaserwisowa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kalkulacje`
--
ALTER TABLE `kalkulacje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kartakredytowa`
--
ALTER TABLE `kartakredytowa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kierowca`
--
ALTER TABLE `kierowca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kierownik_floty`
--
ALTER TABLE `kierownik_floty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klient`
--
ALTER TABLE `klient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klientindywidualny`
--
ALTER TABLE `klientindywidualny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kopiaraportu`
--
ALTER TABLE `kopiaraportu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korespondencja`
--
ALTER TABLE `korespondencja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korespondencjasms`
--
ALTER TABLE `korespondencjasms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ksiegowy`
--
ALTER TABLE `ksiegowy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `magazyn`
--
ALTER TABLE `magazyn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `magazynier`
--
ALTER TABLE `magazynier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketingowiec`
--
ALTER TABLE `marketingowiec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mechanik`
--
ALTER TABLE `mechanik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metodaplatnosci`
--
ALTER TABLE `metodaplatnosci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operatorkartplatniczych`
--
ALTER TABLE `operatorkartplatniczych`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operatorsystemu`
--
ALTER TABLE `operatorsystemu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pojazd`
--
ALTER TABLE `pojazd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pojazdzastepczy`
--
ALTER TABLE `pojazdzastepczy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `potwierdzenie`
--
ALTER TABLE `potwierdzenie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pracownikobslugiklienta`
--
ALTER TABLE `pracownikobslugiklienta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `przedsiebiorstwo`
--
ALTER TABLE `przedsiebiorstwo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `przelew`
--
ALTER TABLE `przelew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raportpodatkowy`
--
ALTER TABLE `raportpodatkowy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reklama`
--
ALTER TABLE `reklama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reklamacja`
--
ALTER TABLE `reklamacja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rozliczenietransakcji`
--
ALTER TABLE `rozliczenietransakcji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serwis_pojazdu`
--
ALTER TABLE `serwis_pojazdu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specjalistarozliczen`
--
ALTER TABLE `specjalistarozliczen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spedytor`
--
ALTER TABLE `spedytor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `towar`
--
ALTER TABLE `towar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trasa`
--
ALTER TABLE `trasa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trescireklamowe`
--
ALTER TABLE `trescireklamowe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `umowa`
--
ALTER TABLE `umowa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `urzadskarbowy`
--
ALTER TABLE `urzadskarbowy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warsztat`
--
ALTER TABLE `warsztat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wlasciciel`
--
ALTER TABLE `wlasciciel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wlascicieltowaru`
--
ALTER TABLE `wlascicieltowaru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zdarzeniadrogowe`
--
ALTER TABLE `zdarzeniadrogowe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zlecenie`
--
ALTER TABLE `zlecenie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zwroty`
--
ALTER TABLE `zwroty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kopiaraportu`
--
ALTER TABLE `kopiaraportu`
  ADD CONSTRAINT `kopiaraportu_ibfk_1` FOREIGN KEY (`id_raportu`) REFERENCES `raportpodatkowy` (`id`);

--
-- Constraints for table `magazynier`
--
ALTER TABLE `magazynier`
  ADD CONSTRAINT `magazynier_ibfk_1` FOREIGN KEY (`id_magazynu`) REFERENCES `magazyn` (`id`);

--
-- Constraints for table `raportpodatkowy`
--
ALTER TABLE `raportpodatkowy`
  ADD CONSTRAINT `raportpodatkowy_ibfk_1` FOREIGN KEY (`id_ksiegowego`) REFERENCES `ksiegowy` (`id`),
  ADD CONSTRAINT `raportpodatkowy_ibfk_2` FOREIGN KEY (`id_urzedu_skarbowego`) REFERENCES `urzadskarbowy` (`id`);

--
-- Constraints for table `reklama`
--
ALTER TABLE `reklama`
  ADD CONSTRAINT `reklama_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klient` (`id`),
  ADD CONSTRAINT `reklama_ibfk_2` FOREIGN KEY (`id_marketingowiec`) REFERENCES `marketingowiec` (`id`),
  ADD CONSTRAINT `reklama_ibfk_3` FOREIGN KEY (`id_handlowca`) REFERENCES `handlowiec` (`id`);

--
-- Constraints for table `serwis_pojazdu`
--
ALTER TABLE `serwis_pojazdu`
  ADD CONSTRAINT `serwis_pojazdu_ibfk_1` FOREIGN KEY (`id_mechanika`) REFERENCES `mechanik` (`id`),
  ADD CONSTRAINT `serwis_pojazdu_ibfk_2` FOREIGN KEY (`kierownik_floty_id`) REFERENCES `kierownik_floty` (`id`);

--
-- Constraints for table `trescireklamowe`
--
ALTER TABLE `trescireklamowe`
  ADD CONSTRAINT `trescireklamowe_ibfk_1` FOREIGN KEY (`id_reklamy`) REFERENCES `reklama` (`id`);

--
-- Constraints for table `zlecenie`
--
ALTER TABLE `zlecenie`
  ADD CONSTRAINT `zlecenie_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klient` (`id`),
  ADD CONSTRAINT `zlecenie_ibfk_2` FOREIGN KEY (`id_magazynier`) REFERENCES `magazynier` (`id`),
  ADD CONSTRAINT `zlecenie_ibfk_3` FOREIGN KEY (`id_spedytor`) REFERENCES `spedytor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
