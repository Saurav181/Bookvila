-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2020 at 10:41 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_isbn` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `book_title` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `book_author` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `book_image` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `book_descr` longtext COLLATE latin1_general_ci,
  `book_price` decimal(6,2) NOT NULL,
  `publisherid` int(10) UNSIGNED NOT NULL,
  `categoryid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_isbn`, `book_title`, `book_author`, `book_image`, `book_descr`, `book_price`, `publisherid`, `categoryid`) VALUES
('978-0-321-94786-4', 'C in depth', 'S.k Srivastava/Deepali Srivastava', 'c in depth.jpg', 'The Book explains each topic in depth without compromising the lucidity of the text and programs. .', '23.99', 12, 13),
('978-0-7303-1484-4', 'Introduction to Algorithm', 'Thomas H. Cormen', 'algo.png', 'he book covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers. Each chapter is relatively self-contained and can be used as a unit of study. The algorithms are described in English and in a pseudocode designed to be readable by anyone who has done a little programming.', '24.99', 13, 11),
('978-1-118-94924-5', 'Head First Python', 'Paul Berry', 'python.png', 'Head First Python is a complete learning experience for Python that helps you learn the language through a unique method that goes beyond syntax and how-to manuals, helping you understand how to be a great Python programmer.', '11.99', 7, 13),
('978-1-1180-2669-4', 'Java The Complete Reference, Seventh Edition', 'Herbert Schildt', 'java.jpg', 'The Complete Reference, Ninth Edition explains how to develop, compile, debug, and run Java programs. Bestselling programming author Herb Schildt covers the entire Javalanguage, including its syntax, keywords, and fundamental programming principles, as well as significant portions of the Java API library. JavaBeans, servlets, applets, and Swing are examined and real-world examples demonstrate Java in action. New Java SE 8 features such as lambda expressions, the stream library, and the default interface method are discussed in detail. This Oracle Press resource also offers a solid introduction to JavaFX.', '16.99', 14, 13),
('978-1-44937-019-0', 'Data Structures and Algorithms in Python', 'Michael T. Goodrich, Roberto Tamassia, Michael H. Goldwasser', 'python algo.jpg', 'Based on the authors market leading data structures books in Java and C++, this textbook offers a comprehensive, definitive introduction to data structures in Python by authoritative authors. Data Structures and Algorithms in Python is the first authoritative object-oriented book available for the Python data structures course. Designed to provide a comprehensive introduction to data structures and algorithms, including their design, analysis, and implementation, the text will maintain the same general structure as Data Structures and Algorithms in Java and Data Structures and Algorithms in C++.', '19.99', 15, 11),
('978-1-44937-075-6', 'HTML & CSS: Design and Build Web Sites', 'Jon Duckett', 'html.jpg', 'Every day, more and more people want to learn some HTML and CSS. Joining the professional web designers and programmers are new audiences who need to know a little bit of code at work (update a content management system or e-commerce store) and those who want to make their personal blogs more attractive. Many books teaching HTML and CSS are dry and only written for those who want to become programmers, which is why this book takes an entirely new approach.', '19.99', 15, 14),
('978-1-4571-0402-2', 'Fundamentals Of Web Development', 'Randy Connolly and Ricardo Hoar', 'web2jpg.jpg', 'Fundamentals of Web Development covers the broad range of topics required for modern web development (both client- and server-side) and is appropriate for students who have taken a CS1 course sequence.The book guides students through the creation of enterprise-quality websites using current development frameworks, its comprehensive coverage of a modern internet development platform includes HTML5, CSS3, Javascript, and the LAMP stack (that is, Linux, Apache, MySQL, and PHP).', '26.99', 16, 14),
('978-1-484216-40-8', 'Applied Artificial Intelligence', 'Mariya Yao, Adelyn Zhou, Marlene Jia', 'ai1.jpg', 'This memoir will chronicle the former First Ladys life from a childhood on the South Side of Chicago to her years as an executive balancing the demands of motherhood and work, as well as her time in the White House.\r\n\r\nIn a statement, she said: Writing Becoming has been a deeply personal experience. It has allowed me, for the very first time, the space to honestly reflect on the unexpected trajectory of my life.\r\n\r\nâ€œIn this book, I talk about my roots and how a little girl from the South Side of Chicago found her voice and developed the strength to use it to empower others. I hope my journey inspires readers to find the courage to become whoever they aspire to be. I cant wait to share my story.', '49.99', 17, 15);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `customerid` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customerid`, `date`) VALUES
(33, 9, '2020-06-15 01:24:34'),
(34, 9, '2020-06-15 02:11:17'),
(35, 8, '2020-06-15 03:07:27'),
(36, 8, '2020-06-16 05:04:39'),
(37, 8, '2020-06-16 05:05:32'),
(38, 9, '2020-06-16 05:06:18'),
(39, 9, '2020-06-16 05:07:17'),
(40, 9, '2020-06-16 05:08:11'),
(41, 9, '2020-06-16 05:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `id` int(10) NOT NULL,
  `cartid` int(10) UNSIGNED NOT NULL,
  `productid` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `cartitems`
--

INSERT INTO `cartitems` (`id`, `cartid`, `productid`, `quantity`) VALUES
(37, 33, '978-1-118-94924-5', 1),
(38, 33, '978-1-118-94924-5', 1),
(39, 35, '978-0-321-94786-4', 1),
(40, 35, '978-0-7303-1484-4', 1),
(41, 35, '978-1-118-94924-5', 1),
(42, 35, '978-0-7303-1484-4', 2),
(43, 33, '978-1-118-94924-5', 1),
(44, 33, '978-0-321-94786-4', 1),
(45, 33, '978-1-4571-0402-2', 1),
(46, 33, '978-0-7303-1484-4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(10) NOT NULL,
  `category_name` varchar(60) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `category_name`) VALUES
(11, 'Data Structure and algorithm'),
(13, 'Computer Languages'),
(14, 'Web Development'),
(15, 'Artificial Intelligence'),
(16, 'Hacking');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `address` varchar(120) NOT NULL,
  `city` varchar(40) NOT NULL,
  `zipcode` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `email`, `password`, `address`, `city`, `zipcode`) VALUES
(6, 'amir', 'hassankhani', 'amir@amir.com', '111', 'Poonak square', 'tehran', '1483834541'),
(7, 'khatere', 'Tajfar', 'tajfar@yahoo.com', '111', 'Sadeqie square - Ayatollah Kashani Street - North Sazman Barname - 8th Central Alley', 'Tehran', '1483834541'),
(8, 'Rishabh', 'pal', 'rishabhpal636@gmail.com', '123', '271 paschimabad', 'New Delhi', '110067'),
(9, 'himani', 'mogra', 'mograhimani@gmail.com', '123', 'scss', 'New Delhi', '110067');

-- --------------------------------------------------------

--
-- Table structure for table `expert`
--

CREATE TABLE `expert` (
  `name` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `pass` varchar(40) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `expert`
--

INSERT INTO `expert` (`name`, `pass`) VALUES
('expert', 'expert');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `name` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `pass` varchar(40) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`name`, `pass`) VALUES
('manager', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisherid` int(10) UNSIGNED NOT NULL,
  `publisher_name` varchar(60) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisherid`, `publisher_name`) VALUES
(7, 'OReilly Media'),
(12, 'BPB Publications'),
(13, 'MIT Press'),
(14, 'McGraw-Hill Education'),
(15, 'John Wiley & Sons, Incorporated'),
(16, 'Pearson'),
(18, 'Cambridge University Press'),
(19, 'Khanna Publishing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_isbn`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisherid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
