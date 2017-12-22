/*
Created: 9/26/2017
Modified: 9/26/2017
Model: RE Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create schemas section -------------------------------------------------

CREATE SCHEMA [db_owner] AUTHORIZATION [db_owner]
go

CREATE SCHEMA [db_accessadmin] AUTHORIZATION [db_accessadmin]
go

CREATE SCHEMA [db_securityadmin] AUTHORIZATION [db_securityadmin]
go

CREATE SCHEMA [db_ddladmin] AUTHORIZATION [db_ddladmin]
go

CREATE SCHEMA [db_backupoperator] AUTHORIZATION [db_backupoperator]
go

CREATE SCHEMA [db_datareader] AUTHORIZATION [db_datareader]
go

CREATE SCHEMA [db_datawriter] AUTHORIZATION [db_datawriter]
go

CREATE SCHEMA [db_denydatareader] AUTHORIZATION [db_denydatareader]
go

CREATE SCHEMA [db_denydatawriter] AUTHORIZATION [db_denydatawriter]
go

-- Create tables section -------------------------------------------------

-- Table dbo.DimDate

CREATE TABLE [dbo].[DimDate]
(
 [DateSK] Int NOT NULL,
 [FullDateAK] Date NOT NULL,
 [DayNumberOfWeek] Int NOT NULL,
 [DayNameOfWeek] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DayNameOfWeekAbbr] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DayNumberOfMonth] Int NOT NULL,
 [DayNumberOfYear] Int NOT NULL,
 [WeekNumberOfYear] Int NOT NULL,
 [MonthName] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [MonthNameAbbr] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [MonthNumberOfYear] Int NOT NULL,
 [CalendarQuarter] Int NOT NULL,
 [CalendarYear] Int NOT NULL,
 [DI_Job_ID] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimDate

ALTER TABLE [dbo].[DimDate] ADD CONSTRAINT [PK__DimDate__A4262D752D603F5F] PRIMARY KEY ([DateSK])
 ON [PRIMARY]
go

-- Table dbo.DimEmployee

CREATE TABLE [dbo].[DimEmployee]
(
 [EmployeeSK] Int IDENTITY(1,1) NOT NULL,
 [BusinessEntityID] Int NOT NULL,
 [EmployeeNationalID] Nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [GeoSK] Int NULL,
 [SalesTerritorySK] Int NULL,
 [AddressLine1] Nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [AddressLine2] Nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [AddressTypeName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [FirstName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [LastName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [MiddleName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [NameStyle] Int NULL,
 [JobTitle] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [HireDate] Date NULL,
 [BirthDate] Date NULL,
 [LoginID] Nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [EmailAddress] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Phone] Nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [PhoneNumberType] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [MaritalStatus] Nchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [SalariedFlag] Int NULL,
 [Gender] Nchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [PayFrequency] Int NULL,
 [BaseRate] Numeric(15,2) NULL,
 [VacationHours] Int NULL,
 [SickLeaveHours] Int NULL,
 [CurrentFlag] Int NOT NULL,
 [DepartmentName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [StartDate] Date NULL,
 [EndDate] Date NULL,
 [DI_Job_ID] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimEmployee

CREATE INDEX [IX_Relationship6] ON [dbo].[DimEmployee] ([GeoSK])
go

CREATE INDEX [IX_Relationship16] ON [dbo].[DimEmployee] ([SalesTerritorySK])
go

-- Add keys for table dbo.DimEmployee

ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [PK__DimEmplo__7AD0D923EAC5DFD6] PRIMARY KEY ([EmployeeSK])
 ON [PRIMARY]
go

-- Table dbo.DimGeography

CREATE TABLE [dbo].[DimGeography]
(
 [GeoSK] Int IDENTITY(1,1) NOT NULL,
 [City] Nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [StateProvinceCode] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [StateProvinceName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [IsOnlyStateProvinceFlag] Int NULL,
 [CountryRegionCode] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [CountryRegionName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [PostalCode] Nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [SalesTerritorySK] Int NULL,
 [DI_Job_ID] Nvarchar(38) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimGeography

CREATE INDEX [IX_Relationship17] ON [dbo].[DimGeography] ([SalesTerritorySK])
go

-- Add keys for table dbo.DimGeography

ALTER TABLE [dbo].[DimGeography] ADD CONSTRAINT [PK__DimGeogr__EC407CA95FB20E72] PRIMARY KEY ([GeoSK])
 ON [PRIMARY]
go

-- Table dbo.DimProducts

CREATE TABLE [dbo].[DimProducts]
(
 [ProductSK] Int IDENTITY(1,1) NOT NULL,
 [ProductID] Int NOT NULL,
 [ProductNumber] Varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ProductName] Varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ProductSubcategoryID] Int NULL,
 [ProductSubcategoryName] Varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ProductCategoryID] Int NULL,
 [ProductCategoryName] Varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ProductModelID] Int NULL,
 [ModelName] Varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [FinishedGoodsFlag] Int NULL,
 [MakeFlag] Int NULL,
 [StandardCost] Numeric(15,2) NULL,
 [ListPrice] Numeric(15,2) NULL,
 [ProductLine] Char(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ProductClass] Char(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ProductStyle] Char(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [WeightUnitMeasureCode] Char(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [SizeUnitMeasureCode] Char(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ProductColor] Varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [SafetyStockLevel] Int NULL,
 [ReorderPoint] Int NULL,
 [ProductSize] Varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ProductWeight] Numeric(15,2) NULL,
 [DaysToManufacture] Int NULL,
 [SellStartDate] Date NULL,
 [SellEndDate] Date NULL,
 [DiscontinuedDate] Date NULL,
 [DI_Job_ID] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimProducts

ALTER TABLE [dbo].[DimProducts] ADD CONSTRAINT [PK__DimProdu__DEA44F35B635C9DC] PRIMARY KEY ([ProductSK])
 ON [PRIMARY]
go

-- Table dbo.DimProductVendor

CREATE TABLE [dbo].[DimProductVendor]
(
 [ProductVendorSK] Int IDENTITY(1,1) NOT NULL,
 [ProductSK] Int NULL,
 [VendorSK] Int NULL,
 [ProductID] Int NOT NULL,
 [VendorID] Int NOT NULL,
 [AverageLeadTime] Int NOT NULL,
 [StandardPrice] Numeric(15,2) NOT NULL,
 [LastReceiptCost] Numeric(15,2) NULL,
 [LastReceiptDate] Datetime NULL,
 [MinOrderQty] Int NOT NULL,
 [MaxOrderQty] Int NOT NULL,
 [OnOrderQty] Int NULL,
 [UnitMeasureCode] Nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Job_ID] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimProductVendor

CREATE INDEX [IX_Relationship14] ON [dbo].[DimProductVendor] ([ProductSK])
go

CREATE INDEX [IX_Relationship21] ON [dbo].[DimProductVendor] ([VendorSK])
go

-- Add keys for table dbo.DimProductVendor

ALTER TABLE [dbo].[DimProductVendor] ADD CONSTRAINT [PK__DimProdu__1AD02F9A0F62C2FE] PRIMARY KEY ([ProductVendorSK])
 ON [PRIMARY]
go

-- Table dbo.DimSalesTerritory

CREATE TABLE [dbo].[DimSalesTerritory]
(
 [SalesTerritorySK] Int IDENTITY(1,1) NOT NULL,
 [SalesTerritoryID] Int NULL,
 [SalesTerritoryName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [CountryRegionCode] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [SalesTerritoryGroup] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [DI_Job_ID] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimSalesTerritory

ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [PK__DimSales__332222058CCF244A] PRIMARY KEY ([SalesTerritorySK])
 ON [PRIMARY]
go

ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [UQ__DimSales__3327FF3115C7154F] UNIQUE ([SalesTerritoryID])
 ON [PRIMARY]
go

-- Table dbo.DimShipMethod

CREATE TABLE [dbo].[DimShipMethod]
(
 [ShipMethodSK] Int IDENTITY(1,1) NOT NULL,
 [ShipMethodID] Int NOT NULL,
 [ShipMethodName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [ShipBase] Numeric(15,2) NOT NULL,
 [ShipRate] Numeric(15,2) NOT NULL,
 [DI_Job_ID] Nvarchar(38) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table dbo.DimShipMethod

ALTER TABLE [dbo].[DimShipMethod] ADD CONSTRAINT [PK__DimShipM__7EA358D97A6FD3B8] PRIMARY KEY ([ShipMethodSK])
 ON [PRIMARY]
go

-- Table dbo.DimVendors

CREATE TABLE [dbo].[DimVendors]
(
 [VendorSK] Int IDENTITY(1,1) NOT NULL,
 [BusinessEntityID] Int NOT NULL,
 [AccountNumber] Varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [VendorName] Varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [CreditRating] Int NOT NULL,
 [PreferredVendorStatus] Varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [ActiveFlag] Varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [PurchasingWebServiceURL] Varchar(1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [AddressTypeName] Varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [AddressLine1] Varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [AddressLine2] Varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [GeoSK] Int NULL,
 [DI_Job_ID] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimVendors

CREATE INDEX [IX_Relationship7] ON [dbo].[DimVendors] ([GeoSK])
go

-- Add keys for table dbo.DimVendors

ALTER TABLE [dbo].[DimVendors] ADD CONSTRAINT [PK__DimVendo__FC87E8125D972DDC] PRIMARY KEY ([VendorSK])
 ON [PRIMARY]
go

-- Table dbo.FactPurchases

CREATE TABLE [dbo].[FactPurchases]
(
 [PurchaseSK] Int IDENTITY(1,1) NOT NULL,
 [PurchaseOrderID] Int NOT NULL,
 [PurchaseOrderDetailID] Int NOT NULL,
 [Status] Int NOT NULL,
 [EmployeeSK] Int NULL,
 [VendorSK] Int NULL,
 [ShipMethodSK] Int NULL,
 [OrderDate] Int NULL,
 [ShipDate] Int NULL,
 [ProductPurchasedSK] Int NOT NULL,
 [SubTotal] Numeric(15,2) NOT NULL,
 [TaxAmt] Numeric(15,2) NOT NULL,
 [Freight] Numeric(15,2) NOT NULL,
 [TotalDue] Numeric(15,2) NOT NULL,
 [DueDate] Int NULL,
 [OrderQty] Int NOT NULL,
 [UnitPrice] Numeric(15,2) NOT NULL,
 [LineTotal] Numeric(15,2) NOT NULL,
 [ReceivedQty] Int NOT NULL,
 [RejectedQty] Int NOT NULL,
 [StockedQty] Int NOT NULL,
 [DI_Job_ID] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.FactPurchases

CREATE INDEX [IX_Relationship5] ON [dbo].[FactPurchases] ([EmployeeSK])
go

CREATE INDEX [IX_Relationship15] ON [dbo].[FactPurchases] ([ProductPurchasedSK])
go

CREATE INDEX [IX_Relationship20] ON [dbo].[FactPurchases] ([ShipMethodSK])
go

CREATE INDEX [IX_Relationship23] ON [dbo].[FactPurchases] ([VendorSK])
go

CREATE INDEX [IX_Relationship25] ON [dbo].[FactPurchases] ([OrderDate])
go

CREATE INDEX [IX_Relationship26] ON [dbo].[FactPurchases] ([ShipDate])
go

CREATE INDEX [IX_Relationship27] ON [dbo].[FactPurchases] ([DueDate])
go

-- Add keys for table dbo.FactPurchases

ALTER TABLE [dbo].[FactPurchases] ADD CONSTRAINT [PK__FactPurc__6B364A485D98EC1F] PRIMARY KEY ([PurchaseSK])
 ON [PRIMARY]
go

-- Table dbo.DimVendorContacts

CREATE TABLE [dbo].[DimVendorContacts]
(
 [VendorContactsSK] Int IDENTITY(1,1) NOT NULL,
 [Person_BusinessEntityID] Int NOT NULL,
 [VendorSK] Int NOT NULL,
 [Vendor_BusinessEntityID] Int NOT NULL,
 [ContactType] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Title] Nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [FirstName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [MiddleName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [LastName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Suffix] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [PhoneNumber] Nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [PhoneNumberType] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [EmailAddress] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [DI_Job_ID] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DI_Create_Date] Datetime DEFAULT (getdate()) NOT NULL,
 [DI_Modified_Date] Datetime DEFAULT (getdate()) NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table dbo.DimVendorContacts

CREATE INDEX [IX_Relationship22] ON [dbo].[DimVendorContacts] ([VendorSK])
go

-- Add keys for table dbo.DimVendorContacts

ALTER TABLE [dbo].[DimVendorContacts] ADD CONSTRAINT [PK__DimVendo__F398A3E10B35C7F8] PRIMARY KEY ([VendorContactsSK])
 ON [PRIMARY]
go

ALTER TABLE [dbo].[DimVendorContacts] ADD CONSTRAINT [UQ__DimVendo__44E219A8373C36DD] UNIQUE ([Person_BusinessEntityID],[Vendor_BusinessEntityID])
 ON [PRIMARY]
go
-- Create relationships section ------------------------------------------------- 


ALTER TABLE [dbo].[FactPurchases] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([EmployeeSK]) REFERENCES [dbo].[DimEmployee] ([EmployeeSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([GeoSK]) REFERENCES [dbo].[DimGeography] ([GeoSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimVendors] ADD CONSTRAINT [Relationship7] FOREIGN KEY ([GeoSK]) REFERENCES [dbo].[DimGeography] ([GeoSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimProductVendor] ADD CONSTRAINT [Relationship14] FOREIGN KEY ([ProductSK]) REFERENCES [dbo].[DimProducts] ([ProductSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactPurchases] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([ProductPurchasedSK]) REFERENCES [dbo].[DimProducts] ([ProductSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([SalesTerritorySK]) REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritorySK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimGeography] ADD CONSTRAINT [Relationship17] FOREIGN KEY ([SalesTerritorySK]) REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritorySK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactPurchases] ADD CONSTRAINT [Relationship20] FOREIGN KEY ([ShipMethodSK]) REFERENCES [dbo].[DimShipMethod] ([ShipMethodSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimProductVendor] ADD CONSTRAINT [Relationship21] FOREIGN KEY ([VendorSK]) REFERENCES [dbo].[DimVendors] ([VendorSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactPurchases] ADD CONSTRAINT [Relationship23] FOREIGN KEY ([VendorSK]) REFERENCES [dbo].[DimVendors] ([VendorSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactPurchases] ADD CONSTRAINT [Relationship25] FOREIGN KEY ([OrderDate]) REFERENCES [dbo].[DimDate] ([DateSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactPurchases] ADD CONSTRAINT [Relationship26] FOREIGN KEY ([ShipDate]) REFERENCES [dbo].[DimDate] ([DateSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[FactPurchases] ADD CONSTRAINT [Relationship27] FOREIGN KEY ([DueDate]) REFERENCES [dbo].[DimDate] ([DateSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [dbo].[DimVendorContacts] ADD CONSTRAINT [Relationship28] FOREIGN KEY ([VendorSK]) REFERENCES [dbo].[DimVendors] ([VendorSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


-- Create roles section -------------------------------------------------

CREATE ROLE [db_accessadmin]
go
CREATE ROLE [db_backupoperator]
go
CREATE ROLE [db_datareader]
go
CREATE ROLE [db_datawriter]
go
CREATE ROLE [db_ddladmin]
go
CREATE ROLE [db_denydatareader]
go
CREATE ROLE [db_denydatawriter]
go
CREATE ROLE [db_owner]
go
CREATE ROLE [db_securityadmin]
go
CREATE ROLE [public]
go

-- Grant permissions section -------------------------------------------------

ALTER ROLE [db_owner] ADD MEMBER [dbo]
go

