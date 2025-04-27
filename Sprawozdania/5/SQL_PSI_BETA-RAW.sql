CREATE DATABASE PSI;
USE PSI;

CREATE TABLE WARSZTAT(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(100),
    adres VARCHAR(100),
    numer_telefonu VARCHAR(15),
    dostepne_stanowiska INT,
    obslugiwany_pojazd INT
);

CREATE TABLE KIEROWNIK_FLOTY (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    flota_aktywna SMALLINT
);

CREATE TABLE MECHANIK (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_warsztatu INT NOT NULL,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    specjalizacja VARCHAR(255),
    dostepnosc SMALLINT
);

CREATE TABLE CZESCI_ZAMIENNE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(255),
    numerKatalogowy VARCHAR(100),
    iloscNaMagazynie INT
);

CREATE TABLE HistoriaSerwisowa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pojazd VARCHAR(255),
    naprawy VARCHAR(500)
);

CREATE TABLE SERWIS_POJAZDU (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    opis TEXT,
    warsztat VARCHAR(100),
    id_mechanika INT NOT NULL,
    id_czesci_zamiennej INT NOT NULL,
    id_historii_serwisowej INT NOT NULL,
    wykonaneCzynnosci TEXT,
    kierownik_floty_id INT,
    FOREIGN KEY (id_mechanika) REFERENCES MECHANIK(id),
    FOREIGN KEY (kierownik_floty_id) REFERENCES KIEROWNIK_FLOTY(id)
);

CREATE TABLE Awaria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dataZgloszenia DATE,
    opis VARCHAR(300),
    id_kierowcy INT NOT NULL,
    id_pojazdu_zastepczego INT NOT NULL,
    status VARCHAR(100)
);

CREATE TABLE Towar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(255),
    waga DOUBLE,
    typ VARCHAR(100),
    id_wlasciciela INT
);

CREATE TABLE Trasa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    punktStartowy VARCHAR(255),
    punktDocelowy VARCHAR(255),
    dystans DOUBLE,
    przewidywanyCzas DOUBLE,
    id_trasy_alternatywnej INT NOT NULL
);

CREATE TABLE Pojazd (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numerRejestracyjny VARCHAR(50),
    typ VARCHAR(100),
    pojemnoscLadunkowa DOUBLE,
    stanTechniczny VARCHAR(100),
    markaPojazdu VARCHAR(100),
    modelPojazdu VARCHAR(100),
    id_serwisu INT NOT NULL
);

CREATE TABLE Kierowca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    numerPrawaJazdy VARCHAR(50),
    aktualnaTrasa VARCHAR(255),
    id_pojazdu INT NOT NULL
);

CREATE TABLE PojazdZastepczy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numerRejestracyjny VARCHAR(50),
    marka VARCHAR(100),
    typ VARCHAR(100),
    dostepny SMALLINT
);

CREATE TABLE Magazyn (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lokalizacja VARCHAR(255) NOT NULL,
    pojemnosc INT NOT NULL
);

CREATE TABLE Magazynier (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100),
    nazwisko VARCHAR(100),
    id_magazynu INT,
    FOREIGN KEY (id_magazynu) REFERENCES Magazyn(id)
);

CREATE TABLE Spedytor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100),
    nazwisko VARCHAR(100)
);

CREATE TABLE Uzytkownik (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(100) NOT NULL,
    haslo VARCHAR(255) NOT NULL,
    aktywny SMALLINT NOT NULL DEFAULT TRUE,
    id_klienta INT NOT NULL,
    id_operatora INT NOT NULL
);

CREATE TABLE Klient (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    nazwa_typu VARCHAR(50)
);

CREATE TABLE Zlecenie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numer VARCHAR(50) UNIQUE NOT NULL,
    id_klienta INT,
    towar TEXT,
    trasa TEXT,
    status VARCHAR(50),
    id_magazynier INT,
    id_spedytor INT,
    FOREIGN KEY (id_klienta) REFERENCES Klient(id),
    FOREIGN KEY (id_magazynier) REFERENCES Magazynier(id),
    FOREIGN KEY (id_spedytor) REFERENCES Spedytor(id)
);

CREATE TABLE OperatorSystemu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uprawnienia INT NOT NULL
);

CREATE TABLE KlientIndywidualny (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_typu VARCHAR(50),
    pesel BIGINT UNIQUE NOT NULL
);

CREATE TABLE Przedsiebiorstwo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_typu VARCHAR(50),
    nip VARCHAR(10) UNIQUE NOT NULL,
    nazwa VARCHAR(255) NOT NULL
);

CREATE TABLE Marketingowiec (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL
);

CREATE TABLE Handlowiec (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL
);

CREATE TABLE Reklama (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tytul VARCHAR(255) NOT NULL,
    budzet FLOAT NOT NULL,
    dataPublikacji DATE,
    id_klienta INT,
    id_marketingowiec INT,
    id_handlowca INT,
    FOREIGN KEY (id_klienta) REFERENCES Klient(id),
    FOREIGN KEY (id_marketingowiec) REFERENCES Marketingowiec(id),
    FOREIGN KEY (id_handlowca) REFERENCES Handlowiec(id)
);

CREATE TABLE TresciReklamowe (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_reklamy INT,
    naglowek VARCHAR(255),
    tekst TEXT,
    zawartosc TEXT,
    mediaUrl VARCHAR(255),
    FOREIGN KEY (id_reklamy) REFERENCES Reklama(id)
);

CREATE TABLE KorespondencjaSMS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numerTelefonu VARCHAR(20) NOT NULL,
    tresc TEXT NOT NULL,
    data DATE NOT NULL,
    status VARCHAR(50),
    id_kierowcy INT NOT NULL,
    id_dyspozytora INT NOT NULL
);

CREATE TABLE Dyspozytor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL,
    zmiana VARCHAR(50) NOT NULL
);

CREATE TABLE ZdarzeniaDrogowe (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    opis VARCHAR(300) NOT NULL,
    kierowca VARCHAR(100) NOT NULL,
    lokalizacja VARCHAR(255) NOT NULL,
    id_dyspozytora INT NOT NULL
);

CREATE TABLE Korespondencja (
    id INT AUTO_INCREMENT PRIMARY KEY,
    typ VARCHAR(50) NOT NULL,
    tresc VARCHAR(500) NOT NULL,
    data DATE NOT NULL,
    id_klient INT NOT NULL
);

CREATE TABLE PracownikObslugiKlienta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL
);

CREATE TABLE Umowa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_korespondencji INT NOT NULL,
    id_pracownika_obslugi_klienta INT NOT NULL,
    numer VARCHAR(50) NOT NULL,
    klient VARCHAR(255) NOT NULL,
    dataZawarcia DATE NOT NULL,
    warunki VARCHAR(500)
);

CREATE TABLE DokumentPrzewozowy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numer VARCHAR(50) NOT NULL,
    id_korespondencji INT NOT NULL,
    id_pracownika_obslugi_klienta INT NOT NULL,
    dataWystawienia DATE NOT NULL
);

CREATE TABLE Zwroty (
    id INT AUTO_INCREMENT PRIMARY KEY,
    powod VARCHAR(500) NOT NULL,
    dataZwrotu DATE NOT NULL,
    id_korespondencji INT NOT NULL
);

CREATE TABLE Ksiegowy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL
);

CREATE TABLE UrzadSkarbowy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(255) NOT NULL,
    adres VARCHAR(255) NOT NULL,
    nip VARCHAR(10) NOT NULL
);

CREATE TABLE Kalkulacje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_raportu INT NOT NULL,
    netto DOUBLE NOT NULL,
    podatek DOUBLE NOT NULL,
    brutto DOUBLE NOT NULL
);

CREATE TABLE RaportPodatkowy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    okres VARCHAR(50) NOT NULL,
    wartoscPodatku DOUBLE NOT NULL,
    dataWygenerowania DATE NOT NULL,
    id_ksiegowego INT NOT NULL,
    id_urzedu_skarbowego INT NOT NULL,
    FOREIGN KEY (id_ksiegowego) REFERENCES Ksiegowy(id),
    FOREIGN KEY (id_urzedu_skarbowego) REFERENCES UrzadSkarbowy(id)
);

CREATE TABLE KopiaRaportu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_raportu INT NOT NULL,
    dataKopii DATE NOT NULL,
    lokalizacjaPliku VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_raportu) REFERENCES RaportPodatkowy(id)
);

CREATE TABLE WlascicielTowaru (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL,
    kontakt VARCHAR(255) NOT NULL
);

CREATE TABLE Bank (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(255) NOT NULL,
    numerKontaFirmowego VARCHAR(50) NOT NULL,
    waluta VARCHAR(10) NOT NULL
);

CREATE TABLE OperatorKartPlatniczych (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(255) NOT NULL,
    typyKart VARCHAR(255) NOT NULL,
    statusSystemu VARCHAR(50) NOT NULL
);

CREATE TABLE Gotowka (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(50),
    kwota DOUBLE NOT NULL,
    waluta VARCHAR(10) NOT NULL
);

CREATE TABLE Przelew (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_banku INT NOT NULL,
    nazwa VARCHAR(50),
    nadawca VARCHAR(255) NOT NULL,
    odbiorca VARCHAR(255) NOT NULL,
    kwota DOUBLE NOT NULL,
    data DATE NOT NULL,
    tytul VARCHAR(255)
);

CREATE TABLE KartaKredytowa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(50),
    id_operatora_karty INT NOT NULL,
    numer VARCHAR(50) NOT NULL,
    imieWlasciciela VARCHAR(100) NOT NULL,
    dataWaznosci DATE NOT NULL,
    cvv VARCHAR(10) NOT NULL
);

CREATE TABLE MetodaPlatnosci (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_metody VARCHAR(50) NOT NULL,
    opis VARCHAR(255)
);

CREATE TABLE RozliczenieTransakcji (
    id INT AUTO_INCREMENT PRIMARY KEY,
    zlecenie VARCHAR(100) NOT NULL,
    kwotaNetto DOUBLE NOT NULL,
    data DATE NOT NULL,
    id_metody INT NOT NULL,
    id_faktury INT NOT NULL,
    id_potwierdzenia INT NOT NULL
);

CREATE TABLE Faktura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numer VARCHAR(50) NOT NULL,
    dataWystawienia DATE NOT NULL,
    kwota DOUBLE NOT NULL,
    odbiorca VARCHAR(255) NOT NULL,
    zlecenie VARCHAR(100) NOT NULL,
    id_specjalisty INT NOT NULL
);

CREATE TABLE SpecjalistaRozliczen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL
);

CREATE TABLE Potwierdzenie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tresc VARCHAR(255) NOT NULL,
    data DATE NOT NULL,
    typ VARCHAR(50) NOT NULL
);

CREATE TABLE Reklamacja (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_zlecenia INT NOT NULL,
    numer VARCHAR(50) NOT NULL,
    id_klient VARCHAR(255) NOT NULL,
    powod VARCHAR(255) NOT NULL,
    dataZgloszenia DATE NOT NULL,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE Wlasciciel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL,
    dataUrodzenia DATE NOT NULL,
    pesel BIGINT UNIQUE NOT NULL
);
