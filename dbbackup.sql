-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 11 maj 2015 kl 09:50
-- Serverversion: 5.6.20
-- PHP-version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `portfolio`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`category_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `colour` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `image`
--

CREATE TABLE IF NOT EXISTS `image` (
`image_id` int(11) NOT NULL,
  `src` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `pcrelation`
--

CREATE TABLE IF NOT EXISTS `pcrelation` (
  `project_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `pirelation`
--

CREATE TABLE IF NOT EXISTS `pirelation` (
  `project_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `project`
--

CREATE TABLE IF NOT EXISTS `project` (
`project_id` int(11) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `link_site` varchar(100) DEFAULT NULL,
  `link_github` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumpning av Data i tabell `project`
--

INSERT INTO `project` (`project_id`, `project_name`, `description`, `link_site`, `link_github`) VALUES
(1, 'Google', 'A massive search engine', 'www.google.com', 'code.google.com'),
(2, 'Yahoo Search', 'A big search engine', 'www.yahoo.com', 'www.github.com'),
(3, 'Bing Search', 'A failed search engine', 'www.bing.com', 'www.github.com'),
(4, 'Reddit', 'A cool ass site for everything and everyone', 'www.reddit.com', 'www.github.com');

-- --------------------------------------------------------

--
-- Tabellstruktur `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `pass` char(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`category_id`);

--
-- Index för tabell `image`
--
ALTER TABLE `image`
 ADD PRIMARY KEY (`image_id`);

--
-- Index för tabell `pcrelation`
--
ALTER TABLE `pcrelation`
 ADD PRIMARY KEY (`project_id`,`category_id`), ADD KEY `category_id` (`category_id`);

--
-- Index för tabell `pirelation`
--
ALTER TABLE `pirelation`
 ADD PRIMARY KEY (`project_id`,`image_id`), ADD KEY `image_id` (`image_id`);

--
-- Index för tabell `project`
--
ALTER TABLE `project`
 ADD PRIMARY KEY (`project_id`);

--
-- Index för tabell `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `category`
--
ALTER TABLE `category`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `image`
--
ALTER TABLE `image`
MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `project`
--
ALTER TABLE `project`
MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT för tabell `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `pcrelation`
--
ALTER TABLE `pcrelation`
ADD CONSTRAINT `pcrelation_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
ADD CONSTRAINT `pcrelation_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Restriktioner för tabell `pirelation`
--
ALTER TABLE `pirelation`
ADD CONSTRAINT `pirelation_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
ADD CONSTRAINT `pirelation_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
