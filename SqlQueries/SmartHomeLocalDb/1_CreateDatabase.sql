CREATE DATABASE [SmartHomeLocalDb];
GO

USE [SmartHomeLocalDb];
GO

CREATE TABLE [Device] (
	[Id] int IDENTITY(1,1) PRIMARY KEY,
	[Name]	nvarchar(255) NOT NULL,
	[DateOfReg] datetime NOT NULL,
	[URL] nvarchar(255) NOT NULL
);

CREATE TABLE [Command] (
	[Id] int IDENTITY(1,1) PRIMARY KEY,
	[Code]	nvarchar(255) NOT NULL,
	[Description] nvarchar(255) NOT NULL
);

CREATE TABLE [Action] (
	[Id] int IDENTITY(1,1) PRIMARY KEY,
	[CommandId]	int NOT NULL,
	[DeviceId] int NOT NULL,
	[Description] nvarchar(255),
	FOREIGN KEY ([CommandId]) REFERENCES [Command]([Id]),
	FOREIGN KEY ([DeviceId]) REFERENCES [Device]([Id])
);

CREATE TABLE [Job] (
	[Id] int IDENTITY(1,1) PRIMARY KEY,
	[ActionId]	int NOT NULL,
	[Time] datetime,
	[RepeatTimeMinutes] int,
	[RepeatTimeSeconds] int,
	[IsSensor] bit NOT NULL DEFAULT 0,
	FOREIGN KEY ([ActionId]) REFERENCES [Action]([Id])
);

CREATE TABLE [ReturnLog] (
	[Id] int IDENTITY(1,1) PRIMARY KEY,
	[Time] datetime NOT NULL,
	[Value] nvarchar(255) NOT NULL,
	[ValueType] nvarchar(255) NOT NULL,
	[JobId] int NOT NULL,
	FOREIGN KEY ([JobId]) REFERENCES [Job]([Id])
);
