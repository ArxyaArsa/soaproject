USE [SmartHomeLocalDb];
GO

INSERT INTO [Device] 
	([Name],[DateOfReg],[URL]) VALUES
	('TestFan', GETUTCDATE(), '192.168.6.11'),
	('TestTempSensor', GETUTCDATE(), '192.168.6.12');

INSERT INTO [Action]
	([DeviceId],[CommandId],[Description]) VALUES
	((SELECT [Id] FROM [Device] WHERE [Name] = 'TestFan'),
		(SELECT [Id] FROM [Command] WHERE [Code] = 'turnon'),
		NULL),
	((SELECT [Id] FROM [Device] WHERE [Name] = 'TestFan'),
		(SELECT [Id] FROM [Command] WHERE [Code] = 'turnoff'),
		NULL),
	((SELECT [Id] FROM [Device] WHERE [Name] = 'TestFan'),
		(SELECT [Id] FROM [Command] WHERE [Code] = 'command01'),
		'Speed the fan up'),
	((SELECT [Id] FROM [Device] WHERE [Name] = 'TestFan'),
		(SELECT [Id] FROM [Command] WHERE [Code] = 'command02'),
		'Slow the fan down'),
	((SELECT [Id] FROM [Device] WHERE [Name] = 'TestTempSensor'),
		(SELECT [Id] FROM [Command] WHERE [Code] = 'turnon'),
		NULL),
	((SELECT [Id] FROM [Device] WHERE [Name] = 'TestTempSensor'),
		(SELECT [Id] FROM [Command] WHERE [Code] = 'turnoff'),
		NULL),
	((SELECT [Id] FROM [Device] WHERE [Name] = 'TestTempSensor'),
		(SELECT [Id] FROM [Command] WHERE [Code] = 'startsensor'),
		NULL),
	((SELECT [Id] FROM [Device] WHERE [Name] = 'TestTempSensor'),
		(SELECT [Id] FROM [Command] WHERE [Code] = 'command01'),
		NULL);