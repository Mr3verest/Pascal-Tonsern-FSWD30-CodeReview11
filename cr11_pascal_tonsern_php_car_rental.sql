-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Feb 2018 um 16:59
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr11_pascal_tonsern_php_car_rental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `car_name` varchar(55) DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `car_type` varchar(100) NOT NULL,
  `fk_office_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `image_url`, `car_type`, `fk_office_id`, `latitude`, `longitude`) VALUES
(1, 'Nissan sporty 43', 'https://pictures.dealer.com/v/victorynissancjd/0040/686b4922b16ab62bb409b18f3a28318dx.jpg', 'sports car', 1, NULL, NULL),
(2, 'Nissan big', 'https://i.pinimg.com/736x/10/e2/0c/10e20c752fb5db843b58d11b2b2a4722.jpg', 'family suv', 1, NULL, NULL),
(3, 'Nissan Mini', 'http://fsv-image.autoc-one.jp/images/1243772/007_o.jpg', 'go-cart, non family', 1, '0.0000000', '0.0000000'),
(4, 'Nissan Bumblebee', 'http://www.nissan.co.jp/OPTIONAL-PARTS/OPCATALOGUE/IMAGES/img_juke.jpg', 'combi', 1, NULL, NULL),
(5, 'BMW - WMB 34', 'http://www.auto3matera.com/wp-content/themes/Auto3/timthumb.php?src=http://www.auto3matera.com/wp-content/uploads/2017/12/P1080870.jpg&h=230&w=310&zc=1', 'family car suv', 2, NULL, NULL),
(6, 'Nissan Racing', 'http://www.exedy.com.au/assets/img/sponsor-hm.jpg', 'racing car, illegal (in most districts)', 2, NULL, NULL),
(7, 'Nissan Ferrari', 'http://www.pro-composite.jp/wp/wp-content/uploads/2016/03/Aloof01-R-ver02_01-310x230.jpg', 'bachelor car', 2, NULL, NULL),
(8, 'Nissan Derp', 'http://www.krokowicz.com.pl/pub/otomoto_gallery/310x230/43150_dscn8503_34451.jpg', 'family derpy', 2, NULL, NULL),
(9, 'Nissan 0815', 'http://www.szdfnf.com/uploadfile/2013/0621/20130621044036677.jpg', 'standard', 3, NULL, NULL),
(10, '3rd- Party Car 1', 'https://file.kbb.com/kbb/vehicleimage/evoxseo/cp/l/11813/2017-honda-cr-v-front_11813_032_640x480_wa.png', 'family car, suv', 3, NULL, NULL),
(11, '3rd- Party Car 2', 'https://www.lincoln.com/cmslibs/content/dam/vdm_ford/live/en_us/lincoln/nameplate/mkx/2018/collections/adplanner/thumb_navigation_18mkx.jpg', 'family car', 4, NULL, NULL),
(12, 'Mercedes Something-class', 'http://st.motortrend.com/uploads/sites/5/2013/03/2014-Mercedes-Benz-CLA45-AMG-front-three-quarter11.jpg?interpolation=lanczos-none&fit=around|660:412', 'sports car, luxury', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `email` varchar(55) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`email`, `first_name`, `last_name`, `password`) VALUES
('123@gmail.com', 'Pas', 'Ton', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `offices`
--

CREATE TABLE `offices` (
  `office_id` int(11) NOT NULL,
  `office_name` varchar(100) DEFAULT NULL,
  `office_location` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `offices`
--

INSERT INTO `offices` (`office_id`, `office_name`, `office_location`, `latitude`, `longitude`) VALUES
(1, 'Main Office', 'Grillgasse 1,\r\n1110 Wien', '48.1718970', '16.4127190'),
(2, 'Cool Name Office', 'Hirschengasse 27,\r\n1060 Wien', '48.1952530', '16.3466190'),
(3, 'Office Numero Tres', 'Waldeckgasse 32,\r\n1180 Wien', '48.2367020', '16.3292030'),
(4, 'Unnecessary Office', 'Gestettengasse 27,\r\n1030 Wien', '48.1959560', '16.4059900');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `fk_email` varchar(100) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `orders`
--

INSERT INTO `orders` (`order_id`, `fk_email`, `fk_car_id`, `start_date`, `return_date`) VALUES
(4, '123@gmail.com', 1, '2018-02-05', '2018-02-14');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_office_id` (`fk_office_id`);

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indizes für die Tabelle `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`office_id`);

--
-- Indizes für die Tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_email` (`fk_email`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `offices`
--
ALTER TABLE `offices`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_office_id`) REFERENCES `offices` (`office_id`);

--
-- Constraints der Tabelle `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`fk_email`) REFERENCES `customers` (`email`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
