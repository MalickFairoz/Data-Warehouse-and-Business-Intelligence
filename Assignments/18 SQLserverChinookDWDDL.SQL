/*
Created: 9/24/2017
Modified: 9/24/2017
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table dbo.DimTrack

CREATE TABLE [dbo].[DimTrack]
(
 [TrackID_SK] Int IDENTITY(1,1) NOT NULL,
 [TrackId_NK] Int NOT NULL,
 [AlbumId] Int NULL,
 [MediaTypeId] Int NOT NULL,
 [GenreId] Int NULL,
 [ArtistID_SK] Int NULL,
 [TrackName] Nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [AlbumTitle] Nvarchar(160) NULL,
 [MediatypeName] Nvarchar(120) NULL,
 [GenreName] Nvarchar(120) NULL,
 [Composer] Nvarchar(220) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Milliseconds] Int NOT NULL,
 [Bytes] Int NULL,
 [UnitPrice] Numeric(10,2) NOT NULL,
 [DW_JOB_ID] Varchar(20) NULL,
 [DW_Create_Date] Datetime NULL,
 [DW_Modified_Date] Datetime NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimTrack

CREATE INDEX [IFK_TrackAlbumId] ON [dbo].[DimTrack] ([AlbumId])
 ON [PRIMARY]
go

CREATE INDEX [IFK_TrackGenreId] ON [dbo].[DimTrack] ([GenreId])
 ON [PRIMARY]
go

CREATE INDEX [IFK_TrackMediaTypeId] ON [dbo].[DimTrack] ([MediaTypeId])
 ON [PRIMARY]
go

CREATE INDEX [IX_ArtistID_SK] ON [dbo].[DimTrack] ([ArtistID_SK])
go

-- Add keys for table dbo.DimTrack

ALTER TABLE [dbo].[DimTrack] ADD CONSTRAINT [PK_Track] PRIMARY KEY ([TrackID_SK])
 ON [PRIMARY]
go

-- Table dbo.DimArtist

CREATE TABLE [dbo].[DimArtist]
(
 [ArtistID_SK] Int IDENTITY(1,1) NOT NULL,
 [ArtistId_AK] Int NOT NULL,
 [ArtistName] Nvarchar(120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [DW_Job_ID] Varchar(20) NULL,
 [DW_Create_Date] Datetime NULL,
 [DW_Modeified_Date] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimArtist

ALTER TABLE [dbo].[DimArtist] ADD CONSTRAINT [PK_Artist] PRIMARY KEY ([ArtistID_SK])
 ON [PRIMARY]
go

-- Table dbo.DimPlaylist

CREATE TABLE [dbo].[DimPlaylist]
(
 [PlaylistID_SK] Int IDENTITY(1,1) NOT NULL,
 [PlaylistId_AK] Int NOT NULL,
 [TrackID_SK] Int NULL,
 [PlaylistName] Nvarchar(120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [DW_Job_ID] Varchar(20) NULL,
 [DW_Create_Date] Datetime NULL,
 [DW_Modified_Date] Datetime NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimPlaylist

CREATE INDEX [IX_Relationship3] ON [dbo].[DimPlaylist] ([TrackID_SK])
go

-- Add keys for table dbo.DimPlaylist

ALTER TABLE [dbo].[DimPlaylist] ADD CONSTRAINT [PK_Playlist] PRIMARY KEY ([PlaylistID_SK])
 ON [PRIMARY]
go

-- Table dbo.DimCustomer

CREATE TABLE [dbo].[DimCustomer]
(
 [CustomerID_SK] Int IDENTITY(1,1) NOT NULL,
 [CustomerId_AK] Int NOT NULL,
 [AddressID_SK] Int NOT NULL,
 [SupportRepId] Int NULL,
 [FirstName] Nvarchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [LastName] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Company] Nvarchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Phone] Nvarchar(24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Fax] Nvarchar(24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Email] Nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DW_Job_ID] Varchar(20) NULL,
 [DW_Create_Date] Datetime NULL,
 [DW_Modified_Date] Datetime NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimCustomer

CREATE INDEX [IFK_CustomerSupportRepId] ON [dbo].[DimCustomer] ([SupportRepId])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship16] ON [dbo].[DimCustomer] ([AddressID_SK])
go

-- Add keys for table dbo.DimCustomer

ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY ([CustomerID_SK])
 ON [PRIMARY]
go

-- Table dbo.DimEmployee

CREATE TABLE [dbo].[DimEmployee]
(
 [EmployeeID_SK] Int IDENTITY(1,1) NOT NULL,
 [EmployeeId_AK] Int NOT NULL,
 [AddressID_SK] Int NULL,
 [LastName] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [FirstName] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Title] Nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ReportsTo] Int NULL,
 [BirthDate] Int NULL,
 [HireDate] Int NULL,
 [Phone] Nvarchar(24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Fax] Nvarchar(24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Email] Nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [DW_Job_ID] Varchar(20) NULL,
 [DW_Create_Date] Datetime NULL,
 [DW_Modified_Date] Datetime NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimEmployee

CREATE INDEX [IFK_EmployeeReportsTo] ON [dbo].[DimEmployee] ([ReportsTo])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship15] ON [dbo].[DimEmployee] ([AddressID_SK])
go

CREATE INDEX [IX_Relationship17] ON [dbo].[DimEmployee] ([BirthDate])
go

CREATE INDEX [IX_Relationship18] ON [dbo].[DimEmployee] ([HireDate])
go

-- Add keys for table dbo.DimEmployee

ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [PK_Employee] PRIMARY KEY ([EmployeeID_SK])
 ON [PRIMARY]
go

-- Table dbo.FactInvoice

CREATE TABLE [dbo].[FactInvoice]
(
 [TrackID_SK] Int NOT NULL,
 [CustomerID_SK] Int NOT NULL,
 [InvoiceDateID_SK] Int NOT NULL,
 [AddressID_SK] Int NOT NULL,
 [InvoiceId_NK] Int NOT NULL,
 [InvoiceLineID_NK] Int NULL,
 [UnitPrice] Numeric(10,2) NULL,
 [Quantity] Int NULL,
 [TotalSales] Numeric(10,2) NOT NULL,
 [DW_Job_ID] Varchar(20) NULL,
 [DW_Create_Date] Datetime NULL,
 [DW_Modified_Date] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.FactInvoice

ALTER TABLE [dbo].[FactInvoice] ADD CONSTRAINT [PK_Invoice] PRIMARY KEY ([TrackID_SK],[AddressID_SK],[InvoiceDateID_SK],[CustomerID_SK])
 ON [PRIMARY]
go

-- Table dbo.DimGeography

CREATE TABLE [dbo].[DimGeography]
(
 [AddressID_SK] Int NOT NULL,
 [City] Nvarchar(40) NULL,
 [StreetAddress] Nvarchar(70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [State] Nvarchar(40) NULL,
 [PostalCode] Nvarchar(10) NULL,
 [Country] Nvarchar(40) NULL,
 [DW_Job_ID] Varchar(20) NULL,
 [DW_Create_Date] Datetime NULL,
 [DW_Modified_Date] Datetime NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimGeography

ALTER TABLE [dbo].[DimGeography] ADD CONSTRAINT [PK_Geography] PRIMARY KEY ([AddressID_SK])
 ON [PRIMARY]
go

-- Table dbo.DimDate

CREATE TABLE [dbo].[DimDate]
(
 [DateKey_SK] Int IDENTITY(1,1) NOT NULL,
 [FullDateAlternateKey] Date NOT NULL,
 [DayNumberOfWeek] Tinyint NOT NULL,
 [EnglishDayNameOfWeek] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [SpanishDayNameOfWeek] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [FrenchDayNameOfWeek] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DayNumberOfMonth] Tinyint NOT NULL,
 [DayNumberOfYear] Smallint NOT NULL,
 [WeekNumberOfYear] Tinyint NOT NULL,
 [EnglishMonthName] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [SpanishMonthName] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [FrenchMonthName] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [MonthNumberOfYear] Tinyint NOT NULL,
 [CalendarQuarter] Tinyint NOT NULL,
 [CalendarYear] Smallint NOT NULL,
 [CalendarSemester] Tinyint NOT NULL,
 [FiscalQuarter] Tinyint NOT NULL,
 [FiscalYear] Smallint NOT NULL,
 [FiscalSemester] Tinyint NOT NULL,
 [DW_Job_ID] Varchar(20) NULL,
 [DW_Create_Date] Datetime NULL,
 [DW_Modified_Date] Datetime NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimDate

CREATE UNIQUE INDEX [AK_DimDate_FullDateAlternateKey] ON [dbo].[DimDate] ([FullDateAlternateKey])
 ON [PRIMARY]
go

-- Add keys for table dbo.DimDate

ALTER TABLE [dbo].[DimDate] ADD CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY ([DateKey_SK])
 ON [PRIMARY]
go
-- Create relationships section ------------------------------------------------- 


ALTER TABLE [dbo].[DimTrack] ADD CONSTRAINT [RIArtistID_SK] FOREIGN KEY ([ArtistID_SK]) REFERENCES [dbo].[DimArtist] ([ArtistID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimPlaylist] ADD CONSTRAINT [RI1TrackID_SK] FOREIGN KEY ([TrackID_SK]) REFERENCES [dbo].[DimTrack] ([TrackID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [RI1EmployeeID_SK] FOREIGN KEY ([SupportRepId]) REFERENCES [dbo].[DimEmployee] ([EmployeeID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactInvoice] ADD CONSTRAINT [RIAddressID_SK] FOREIGN KEY ([AddressID_SK]) REFERENCES [dbo].[DimGeography] ([AddressID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactInvoice] ADD CONSTRAINT [RIInvoiceDate] FOREIGN KEY ([InvoiceDateID_SK]) REFERENCES [dbo].[DimDate] ([DateKey_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactInvoice] ADD CONSTRAINT [RI2TrackID_SK] FOREIGN KEY ([TrackID_SK]) REFERENCES [dbo].[DimTrack] ([TrackID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactInvoice] ADD CONSTRAINT [RICustomerID_SK] FOREIGN KEY ([CustomerID_SK]) REFERENCES [dbo].[DimCustomer] ([CustomerID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [RI2AddressID_SK] FOREIGN KEY ([AddressID_SK]) REFERENCES [dbo].[DimGeography] ([AddressID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [RI3AddressID_SK] FOREIGN KEY ([AddressID_SK]) REFERENCES [dbo].[DimGeography] ([AddressID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [RIBirthDate] FOREIGN KEY ([BirthDate]) REFERENCES [dbo].[DimDate] ([DateKey_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [RIHireDate] FOREIGN KEY ([HireDate]) REFERENCES [dbo].[DimDate] ([DateKey_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [RIReport] FOREIGN KEY ([ReportsTo]) REFERENCES [dbo].[DimEmployee] ([EmployeeID_SK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




