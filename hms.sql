-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2024 at 10:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `B_ID` int(11) NOT NULL,
  `Amount` decimal(10,0) DEFAULT NULL,
  `P_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`B_ID`, `Amount`, `P_ID`) VALUES
(1, 500, 1),
(2, 750, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `E_id` int(11) DEFAULT NULL,
  `P_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `E_id`, `P_ID`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `E_ID` int(11) NOT NULL,
  `Mob_No` varchar(15) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Pin_no` int(11) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Salary` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`E_ID`, `Mob_No`, `Name`, `State`, `City`, `Pin_no`, `Sex`, `Salary`) VALUES
(1, '123456789', 'Alice Johnson', 'California', 'Los Angeles', 90001, 'MALE', 75000.00),
(2, '987654321', 'Bob Smith', ' New York', ' New York City', 10001, 'MALE', 80000.00);

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurse_id` int(11) NOT NULL,
  `E_ID` int(11) DEFAULT NULL,
  `P_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurse_id`, `E_ID`, `P_ID`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `P_ID` int(11) NOT NULL,
  `Mob_No` varchar(15) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` date NOT NULL,
  `blood_group` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`P_ID`, `Mob_No`, `Name`, `Sex`, `age`, `dob`, `blood_group`) VALUES
(1, '1234567890', 'John Doe', ' MALE', 30, '0000-00-00', 'O+'),
(2, '987654321', 'Jane Roe', 'FEMALE', 25, '0000-00-00', 'A-');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `R_id` int(11) NOT NULL,
  `E_ID` int(11) DEFAULT NULL,
  `record_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`R_id`, `E_ID`, `record_no`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `record_no` int(11) NOT NULL,
  `app_no` int(11) DEFAULT NULL,
  `P_ID` int(11) DEFAULT NULL,
  `R_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`record_no`, `app_no`, `P_ID`, `R_ID`) VALUES
(1, 1001, 1, 101),
(2, 1002, 2, 102);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `R_ID` int(11) NOT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Availability` varchar(100) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `P_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`R_ID`, `Type`, `Availability`, `Capacity`, `P_ID`) VALUES
(101, ' Single', 'Available', 1, 1),
(102, ' Double', 'Occupied', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `test_report`
--

CREATE TABLE `test_report` (
  `R_ID` int(11) NOT NULL,
  `Result` text DEFAULT NULL,
  `Test_type` varchar(100) DEFAULT NULL,
  `P_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_report`
--

INSERT INTO `test_report` (`R_ID`, `Result`, `Test_type`, `P_ID`) VALUES
(1, ' Normal', 'Blood Test', 1),
(2, 'High', 'Cholesterol Test', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`B_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `E_id` (`E_id`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`E_ID`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurse_id`),
  ADD KEY `E_ID` (`E_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`P_ID`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`R_id`),
  ADD KEY `E_ID` (`E_ID`),
  ADD KEY `record_no` (`record_no`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`record_no`),
  ADD KEY `P_ID` (`P_ID`),
  ADD KEY `R_ID` (`R_ID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `test_report`
--
ALTER TABLE `test_report`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`E_id`) REFERENCES `employee` (`E_ID`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`E_ID`) REFERENCES `employee` (`E_ID`),
  ADD CONSTRAINT `nurse_ibfk_2` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`);

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`E_ID`) REFERENCES `employee` (`E_ID`),
  ADD CONSTRAINT `receptionist_ibfk_2` FOREIGN KEY (`record_no`) REFERENCES `records` (`record_no`);

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`),
  ADD CONSTRAINT `records_ibfk_2` FOREIGN KEY (`R_ID`) REFERENCES `rooms` (`R_ID`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`);

--
-- Constraints for table `test_report`
--
ALTER TABLE `test_report`
  ADD CONSTRAINT `test_report_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
