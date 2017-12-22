/*
Created: 9/24/2017
Modified: 9/24/2017
Model: MySQL 5.7
Database: MySQL 5.7
*/


-- Create tables section -------------------------------------------------

-- Table DimTrack

CREATE TABLE `DimTrack`
(
  `TrackID_SK` Int NOT NULL,
  `TrackId_NK` Int NOT NULL,
  `AlbumId` Int,
  `MediaTypeId` Int NOT NULL,
  `GenreId` Int,
  `ArtistID_SK` Int,
  `TrackName` Varchar(200) NOT NULL,
  `AlbumTitle` Varchar(160),
  `MediatypeName` Varchar(120),
  `GenreName` Varchar(120),
  `Composer` Varchar(220),
  `Milliseconds` Int NOT NULL,
  `Bytes` Int,
  `UnitPrice` Decimal(10,2) NOT NULL,
  `DW_JOB_ID` Varchar(20),
  `DW_Create_Date` Datetime,
  `DW_Modified_Date` Datetime
)
;

CREATE INDEX `IFK_TrackAlbumId` ON `DimTrack` (`AlbumId`)
;

CREATE INDEX `IFK_TrackGenreId` ON `DimTrack` (`GenreId`)
;

CREATE INDEX `IFK_TrackMediaTypeId` ON `DimTrack` (`MediaTypeId`)
;

CREATE INDEX `IX_ArtistID_SK` ON `DimTrack` (`ArtistID_SK`)
;

ALTER TABLE `DimTrack` ADD  PRIMARY KEY (`TrackID_SK`)
;

-- Table DimArtist

CREATE TABLE `DimArtist`
(
  `ArtistID_SK` Int NOT NULL,
  `ArtistId_AK` Int NOT NULL,
  `ArtistName` Varchar(120),
  `DW_Job_ID` Varchar(20),
  `DW_Create_Date` Datetime,
  `DW_Modeified_Date` Datetime
)
;

ALTER TABLE `DimArtist` ADD  PRIMARY KEY (`ArtistID_SK`)
;

-- Table DimPlaylist

CREATE TABLE `DimPlaylist`
(
  `PlaylistID_SK` Int NOT NULL,
  `PlaylistId_AK` Int NOT NULL,
  `TrackID_SK` Int,
  `PlaylistName` Varchar(120),
  `DW_Job_ID` Varchar(20),
  `DW_Create_Date` Datetime,
  `DW_Modified_Date` Datetime
)
;

CREATE INDEX `IX_Relationship3` ON `DimPlaylist` (`TrackID_SK`)
;

ALTER TABLE `DimPlaylist` ADD  PRIMARY KEY (`PlaylistID_SK`)
;

-- Table DimCustomer

CREATE TABLE `DimCustomer`
(
  `CustomerID_SK` Int NOT NULL,
  `CustomerId_AK` Int NOT NULL,
  `AddressID_SK` Int NOT NULL,
  `SupportRepId` Int,
  `FirstName` Varchar(40) NOT NULL,
  `LastName` Varchar(20) NOT NULL,
  `Company` Varchar(80),
  `Phone` Varchar(24),
  `Fax` Varchar(24),
  `Email` Varchar(60) NOT NULL,
  `DW_Job_ID` Varchar(20),
  `DW_Create_Date` Datetime,
  `DW_Modified_Date` Datetime
)
;

CREATE INDEX `IFK_CustomerSupportRepId` ON `DimCustomer` (`SupportRepId`)
;

CREATE INDEX `IX_Relationship16` ON `DimCustomer` (`AddressID_SK`)
;

ALTER TABLE `DimCustomer` ADD  PRIMARY KEY (`CustomerID_SK`)
;

-- Table DimEmployee

CREATE TABLE `DimEmployee`
(
  `EmployeeID_SK` Int NOT NULL,
  `EmployeeId_AK` Int NOT NULL,
  `AddressID_SK` Int,
  `LastName` Varchar(20) NOT NULL,
  `FirstName` Varchar(20) NOT NULL,
  `Title` Varchar(30),
  `ReportsTo` Int,
  `BirthDate` Int,
  `HireDate` Int,
  `Phone` Varchar(24),
  `Fax` Varchar(24),
  `Email` Varchar(60),
  `DW_Job_ID` Varchar(20),
  `DW_Create_Date` Datetime,
  `DW_Modified_Date` Datetime
)
;

CREATE INDEX `IFK_EmployeeReportsTo` ON `DimEmployee` (`ReportsTo`)
;

CREATE INDEX `IX_Relationship15` ON `DimEmployee` (`AddressID_SK`)
;

CREATE INDEX `IX_Relationship17` ON `DimEmployee` (`BirthDate`)
;

CREATE INDEX `IX_Relationship18` ON `DimEmployee` (`HireDate`)
;

ALTER TABLE `DimEmployee` ADD  PRIMARY KEY (`EmployeeID_SK`)
;

-- Table FactInvoice

CREATE TABLE `FactInvoice`
(
  `TrackID_SK` Int NOT NULL,
  `CustomerID_SK` Int NOT NULL,
  `InvoiceDateID_SK` Int NOT NULL,
  `AddressID_SK` Int NOT NULL,
  `InvoiceId_NK` Int NOT NULL,
  `InvoiceLineID_NK` Int,
  `UnitPrice` Decimal(10,2),
  `Quantity` Int,
  `TotalSales` Decimal(10,2) NOT NULL,
  `DW_Job_ID` Varchar(20),
  `DW_Create_Date` Datetime,
  `DW_Modified_Date` Datetime
)
;

ALTER TABLE `FactInvoice` ADD  PRIMARY KEY (`TrackID_SK`,`AddressID_SK`,`InvoiceDateID_SK`,`CustomerID_SK`)
;

-- Table DimGeography

CREATE TABLE `DimGeography`
(
  `AddressID_SK` Int NOT NULL,
  `City` Varchar(40),
  `StreetAddress` Varchar(70),
  `State` Varchar(40),
  `PostalCode` Varchar(10),
  `Country` Varchar(40),
  `DW_Job_ID` Varchar(20),
  `DW_Create_Date` Datetime,
  `DW_Modified_Date` Datetime
)
;

ALTER TABLE `DimGeography` ADD  PRIMARY KEY (`AddressID_SK`)
;

-- Table DimDate

CREATE TABLE `DimDate`
(
  `DateKey_SK` Int NOT NULL,
  `FullDateAlternateKey` Date NOT NULL,
  `DayNumberOfWeek` Smallint NOT NULL,
  `EnglishDayNameOfWeek` Varchar(10) NOT NULL,
  `SpanishDayNameOfWeek` Varchar(10) NOT NULL,
  `FrenchDayNameOfWeek` Varchar(10) NOT NULL,
  `DayNumberOfMonth` Smallint NOT NULL,
  `DayNumberOfYear` Smallint NOT NULL,
  `WeekNumberOfYear` Smallint NOT NULL,
  `EnglishMonthName` Varchar(10) NOT NULL,
  `SpanishMonthName` Varchar(10) NOT NULL,
  `FrenchMonthName` Varchar(10) NOT NULL,
  `MonthNumberOfYear` Smallint NOT NULL,
  `CalendarQuarter` Smallint NOT NULL,
  `CalendarYear` Smallint NOT NULL,
  `CalendarSemester` Smallint NOT NULL,
  `FiscalQuarter` Smallint NOT NULL,
  `FiscalYear` Smallint NOT NULL,
  `FiscalSemester` Smallint NOT NULL,
  `DW_Job_ID` Varchar(20),
  `DW_Create_Date` Datetime,
  `DW_Modified_Date` Datetime
)
;

CREATE UNIQUE INDEX `AK_DimDate_FullDateAlternateKey` ON `DimDate` (`FullDateAlternateKey`)
;

ALTER TABLE `DimDate` ADD  PRIMARY KEY (`DateKey_SK`)
;
-- Create relationships section ------------------------------------------------- 


ALTER TABLE `DimTrack` ADD CONSTRAINT `RIArtistID_SK` FOREIGN KEY (`ArtistID_SK`) REFERENCES `DimArtist` (`ArtistID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DimPlaylist` ADD CONSTRAINT `RI1TrackID_SK` FOREIGN KEY (`TrackID_SK`) REFERENCES `DimTrack` (`TrackID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FactInvoice` ADD CONSTRAINT `RICustomerID_SK` FOREIGN KEY (`CustomerID_SK`) REFERENCES `DimCustomer` (`CustomerID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FactInvoice` ADD CONSTRAINT `RI2TrackID_SK` FOREIGN KEY (`TrackID_SK`) REFERENCES `DimTrack` (`TrackID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FactInvoice` ADD CONSTRAINT `RIInvoiceDate` FOREIGN KEY (`InvoiceDateID_SK`) REFERENCES `DimDate` (`DateKey_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DimCustomer` ADD CONSTRAINT `RI3AddressID_SK` FOREIGN KEY (`AddressID_SK`) REFERENCES `DimGeography` (`AddressID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FactInvoice` ADD CONSTRAINT `RIAddressID_SK` FOREIGN KEY (`AddressID_SK`) REFERENCES `DimGeography` (`AddressID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DimEmployee` ADD CONSTRAINT `RI2AddressID_SK` FOREIGN KEY (`AddressID_SK`) REFERENCES `DimGeography` (`AddressID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DimEmployee` ADD CONSTRAINT `RIHireDate` FOREIGN KEY (`HireDate`) REFERENCES `DimDate` (`DateKey_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DimEmployee` ADD CONSTRAINT `RIBirthDate` FOREIGN KEY (`BirthDate`) REFERENCES `DimDate` (`DateKey_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DimEmployee` ADD CONSTRAINT `RIReport` FOREIGN KEY (`ReportsTo`) REFERENCES `DimEmployee` (`EmployeeID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DimCustomer` ADD CONSTRAINT `RI1EmployeeID_SK` FOREIGN KEY (`SupportRepId`) REFERENCES `DimEmployee` (`EmployeeID_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;


