INSERT INTO [User] ([Username], [Password], [Role], [Mail], [Phone]) VALUES
	('admin', 'admin', 'admin', 'admin@smarthome.com', '+38169666555'),
	('worker1', 'worker', 'worker', 'worker@smarthome.com', '+38169666556'),
	('worker2', 'worker', 'worker', 'worker@smarthome.com', '+38169666557'),
	('customerSrb', 'customer', 'customer', 'customerSrb@gmail.com', '+38163666555'),
	('customerUsa', 'customer', 'customer', 'customerUsa@gmail.com', '+35556439656');

INSERT INTO [House] ([Ip], [Port], [DbName], [Name], [Address], [Contact], [UserId], [CityId], [StateId]) VALUES
	('192.168.5.11', '9333', 'SmartHomeLocalDb', 'House in BG', 'Svetog Save 39', '', 
		(SELECT [Id] FROM [User] WHERE [Username] = 'customerSrb'),
		(SELECT [Id] FROM [City] WHERE [Name] = 'Belgrade'),
		(SELECT [StateId] FROM [City] WHERE [Name] = 'Belgrade')),
	('192.168.5.12', '9333', 'SmartHomeLocalDb', 'House in Nis', 'Studenicka 58', '', 
		(SELECT [Id] FROM [User] WHERE [Username] = 'customerSrb'),
		(SELECT [Id] FROM [City] WHERE [Name] = 'Nis'),
		(SELECT [StateId] FROM [City] WHERE [Name] = 'Nis')),
	('192.168.5.13', '9333', 'SmartHomeLocalDb', 'House in Chicago', 'Jackson Blvd #350', '', 
		(SELECT [Id] FROM [User] WHERE [Username] = 'customerUsa'),
		(SELECT [Id] FROM [City] WHERE [Name] = 'Chicago'),
		(SELECT [StateId] FROM [City] WHERE [Name] = 'Chicago')),
	('192.168.5.14', '9333', 'SmartHomeLocalDb', 'House in Florida', '2314 Main St,', '', 
		(SELECT [Id] FROM [User] WHERE [Username] = 'customerUsa'),
		(SELECT [Id] FROM [City] WHERE [Name] = 'Florida'),
		(SELECT [StateId] FROM [City] WHERE [Name] = 'Florida')),
	('192.168.5.15', '9333', 'SmartHomeLocalDb', 'House in Miami', '13th street #656', '', 
		(SELECT [Id] FROM [User] WHERE [Username] = 'customerUsa'),
		(SELECT [Id] FROM [City] WHERE [Name] = 'Miami Beach'),
		(SELECT [StateId] FROM [City] WHERE [Name] = 'Miami Beach'));
