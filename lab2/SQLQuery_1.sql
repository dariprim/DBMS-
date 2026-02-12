--1

-- CREATE database Apartment;

GO
USE Apartment;
GO

-- CREATE TABLE Privatization (
--     Address NVARCHAR(60),
--     District NVARCHAR(15),
--     Balance NVARCHAR(60),
--     Year INT,
--     Material NVARCHAR(15),
--     Base NVARCHAR(15),
--     Wear INT,
--     Flow INT,
--     Line INT,
--     Square INT,
--     Hall BIT,
--     Flats INT,
--     Elevator BIT,
--     Flat INT,
--     Storey INT,
--     Rooms INT,
--     SquareFlat INT,
--     Dwell INT,
--     Branch INT,
--     Balcony INT,
--     Height INT,
--     Record INT,
--     Document NVARCHAR(60),
--     DateDoc DATE,
--     Cost MONEY,
--     FioHost NVARCHAR(60),
--     Pasport NVARCHAR(60),
--     Sign BIT,
--     Born INT,
--     Status NVARCHAR(20)
-- );
-- GO

-- INSERT INTO Privatization VALUES
-- (N'ул. Ленина, 10', N'Центральный', N'ГорЖилФонд', 1985, N'Кирпич', N'Бетон', 30, 5, 500, 5000, 1, 50, 1, 25, 3, 2, 60, 40, 10, 5, 3, 1, N'Договор №123', '2023-01-15', 1500000, N'Иванов И.И.', N'4500 123456', 1, 1970, N'Собственник'),
-- (N'ул. Мира, 5', N'Северный', N'ГорЖилФонд', 1990, N'Панель', N'Бетон', 20, 9, 3000, 7000, 0, 100, 1, 45, 5, 3, 75, 50, 15, 8, 3, 2, N'Договор №124', '2023-02-20', 2000000, N'Петров П.П.', N'4501 654321', 1, 1980, N'Собственник'),
-- (N'ул. Зеленая, 15', N'Западный', N'Частный', 2000, N'Кирпич', N'Бетон', 10, 3, 4000, 3000, 1, 20, 0, 10, 1, 1, 40, 30, 5, 3, 3, 3, N'Договор №125', '2023-03-10', 1000000, N'Сидоров С.С.', N'4502 789012', 0, 1990, N'Арендатор'),
-- (N'ул. Лесная, 8', N'Восточный', N'ГорЖилФонд', 1975, N'Панель', N'Бетон', 40, 4, 2000, 4000, 0, 40, 0, 12, 2, 2, 55, 35, 10, 4, 3, 4, N'Договор №126', '2023-04-05', 1200000, N'Кузнецов К.К.', N'4503 345678', 1, 1965, N'Собственник');
-- GO

-- SELECT * FROM Privatization;

--многотаблички

-- CREATE TABLE Buildings (
--     BuildingID INT IDENTITY(1,1) PRIMARY KEY,
--     Address NVARCHAR(60) NOT NULL,
--     District NVARCHAR(15) NOT NULL, 
--     Balance NVARCHAR(60),
--     Year INT,
--     Material NVARCHAR(15),
--     Base NVARCHAR(15),
--     Wear INT,
--     Flow INT,
--     Line INT,
--     Square DECIMAL(10, 2),
--     Hall BIT,
--     FlatsCount INT,
--     Elevator BIT
-- );

-- CREATE TABLE Flats(
--     FlatID INT IDENTITY(1,1) PRIMARY KEY,
--     BuildingID INT FOREIGN KEY REFERENCES Buildings(BuildingID),
--     FlatNumber INT,
--     Storey INT,
--     Rooms INT,
--     SquareFlat DECIMAL(5,2),
--     Dwell DECIMAL(5,2),
--     Branch DECIMAL(5,2),
--     Balcony DECIMAL(5,2),
--     Height DECIMAL(3,2)

-- );

-- CREATE TABLE Residents(
--     ResidentID INT IDENTITY(1,1) PRIMARY KEY, 
--     FioHost NVARCHAR(60) NOT NULL,
--     Born INT, 
--     Pasport NVARCHAR(60), 
--     Status NVARCHAR(20)
-- );

-- CREATE TABLE PrivatizationList(
--     RecordID INT IDENTITY(1,1) PRIMARY KEY,
--     FlatID INT FOREIGN KEY REFERENCES Flats(FlatID),
--     ResidentID INT FOREIGN KEY REFERENCES Residents(ResidentID),
--     Document NVARCHAR(60),
--     DateDoc DATE, 
--     Cost MONEY, 
--     Sign BIT

-- );

-- ALTER TABLE Buildings
-- ADD 
--     CONSTRAINT LimitWear CHECK (Wear >= 0),
--     CONSTRAINT LimitFlow CHECK (Flow >= 1 AND Flow <= 99),
--     CONSTRAINT LimitLine CHECK (Line >= 1 AND Line <= 99999),
--     CONSTRAINT LimitSquare CHECK (Square >= 0),
--     CONSTRAINT LimitFlats CHECK (FlatsCount >= 1 AND FlatsCount <= 999);

-- ALTER TABLE Flats
-- ADD
--     CONSTRAINT CHK_FlatNumber_Range CHECK (FlatNumber >= 1 AND FlatNumber <= 9999),
--     CONSTRAINT CHK_Storey_Range CHECK (Storey >= 1 AND Storey <= 99),
--     CONSTRAINT CHK_Rooms_Range CHECK (Rooms >= 1 AND Rooms <= 9),
--     CONSTRAINT CHK_Height_Range CHECK (Height >= 2.00 AND Height <= 4.00),
--     CONSTRAINT CHK_SquareFlat_Positive CHECK (SquareFlat >= 0),
--     CONSTRAINT CHK_Dwell_LessThan_SquareFlat CHECK (Dwell >= 0 AND Dwell <= SquareFlat),
--     CONSTRAINT CHK_Balcony_Positive CHECK (Balcony >= 0);

-- ALTER TABLE Residents
-- ADD 
--     CONSTRAINT CHK_Born_Range CHECK (Born >= 1900 AND Born <= YEAR(GETDATE())),
--     CONSTRAINT CHK_Status_Values CHECK (Status IN (N'Собственник', N'Арендатор', N'Член семьи', N'Временный'));

-- ALTER TABLE PrivatizationList
-- ADD 
--     CONSTRAINT CHK_DateDoc_Range CHECK (DateDoc <= GETDATE()),
--     CONSTRAINT CHK_Cost_Positive CHECK (Cost >= 0),
--     CONSTRAINT UQ_Flat_Resident UNIQUE (FlatID, ResidentID);

-- -- 1. Заполняем таблицу Buildings 
-- INSERT INTO Buildings (Address, District, Balance, Year, Material, Base, Wear, Flow, Line, Square, Hall, FlatsCount, Elevator)
-- VALUES
-- (N'ул. Ленина, 10', N'Центральный', N'Горжилфонд', 1985, N'Кирпич', N'Бетон', 30, 5, 500, 1250.75, 1, 50, 1),
-- (N'ул. Мира, 5', N'Северный', N'Горжилфонд', 1990, N'Панель', N'Бетон', 20, 9, 3000, 2543.20, 0, 100, 1),
-- (N'ул. Зеленая, 15', N'Западный', N'Частный владелец', 2000, N'Кирпич', N'Бетон', 10, 3, 4000, 850.50, 1, 20, 0),
-- (N'ул. Советская, 25', N'Восточный', N'Жилстройтрест', 1975, N'Панель', N'Бетон', 45, 4, 1500, 980.30, 0, 40, 0);
-- GO

-- -- 2. Заполняем таблицу Flats 
-- INSERT INTO Flats (BuildingID, FlatNumber, Storey, Rooms, SquareFlat, Dwell, Branch, Balcony, Height)
-- VALUES
-- (1, 25, 3, 2, 62.5, 42.3, 12.7, 5.2, 2.65),
-- (1, 30, 4, 3, 78.9, 52.1, 16.4, 8.5, 2.70),
-- (1, 12, 1, 1, 42.7, 28.5, 6.8, 3.4, 2.60),
-- (2, 45, 5, 3, 85.3, 57.8, 16.2, 10.5, 2.75),
-- (2, 67, 6, 2, 65.8, 43.2, 14.3, 6.5, 2.70),
-- (3, 10, 1, 3, 72.4, 48.6, 15.2, 7.8, 2.80),
-- (4, 18, 2, 2, 58.6, 39.4, 11.7, 5.2, 2.65);
-- GO

-- -- 3. Заполняем таблицу Residents 
-- INSERT INTO Residents (FioHost, Born, Pasport, Status)
-- VALUES
-- (N'Иванов Иван Иванович', 1970, N'4500 123456', N'Собственник'),
-- (N'Петрова Мария Сергеевна', 1980, N'4501 654321', N'Собственник'),
-- (N'Сидоров Алексей Петрович', 1990, N'4502 789012', N'Арендатор'),
-- (N'Кузнецова Ольга Викторовна', 1965, N'4503 345678', N'Собственник'),
-- (N'Смирнов Дмитрий Андреевич', 1975, N'4504 987654', N'Член семьи'),
-- (N'Федорова Анна Владимировна', 1985, N'4505 234567', N'Собственник'),
-- (N'Новиков Павел Сергеевич', 1995, N'4506 876543', N'Временный'),
-- (N'Волкова Екатерина Игоревна', 1978, N'4507 135790', N'Собственник');
-- GO

-- -- 4. Заполняем таблицу PrivatizationList 
-- INSERT INTO PrivatizationList (FlatID, ResidentID, Document, DateDoc, Cost, Sign)
-- VALUES
-- (1, 1, N'Договор приватизации №123-И', '2023-01-15', 1525000.50, 1),
-- (2, 2, N'Договор приватизации №124-П', '2023-02-20', 2150000.00, 1),
-- (4, 4, N'Договор приватизации №125-К', '2023-03-10', 1875000.75, 1),
-- (5, 6, N'Договор приватизации №126-Ф', '2023-04-05', 1650000.00, 1),
-- (7, 8, N'Договор приватизации №127-В', '2023-05-12', 1420000.50, 1),
-- (3, 3, NULL, NULL, NULL, 0),  
-- (6, 5, NULL, NULL, NULL, 0);  
-- GO

--запросики

-- SELECT FioHost FROM Residents r
-- LEFT JOIN PrivatizationList p ON r.ResidentID = p.ResidentID
-- WHERE p.Sign = 0;

-- INSERT INTO Residents (FioHost, Born, Pasport, Status)
-- VALUES 
-- (N'Умничкин Умник Умникович', 1992, N'4601 112233', N'Собственник');

--некорректные данные
-- INSERT INTO Buildings (Address, District, Wear, Flow, FlatsCount)
-- VALUES (N'ул. Ошибочная, 1', N'Тест', -10, 5, 20);

-- DELETE FROM Residents 
-- WHERE Status = N'Временный';

--удаление ссылочного типа, не атомарное
-- DELETE FROM Buildings 
-- WHERE Address = N'ул. Ленина, 10';


--2


-- INSERT INTO Buildings (Address, District, Balance, Year, Material, Base, Wear, Flow, Line, Square, Hall, FlatsCount, Elevator)
-- VALUES
-- (N'ул. Ленина, 1', N'Центральный', N'Горжилфонд', 1980, N'Кирпич', N'Бетон', 45, 5, 100, 1200.50, 1, 40, 1),
-- (N'ул. Ленина, 5', N'Центральный', N'Горжилфонд', 1985, N'Кирпич', N'Бетон', 40, 5, 150, 1350.75, 1, 45, 1),
-- (N'ул. Мира, 10', N'Северный', N'Жилстрой', 1995, N'Панель', N'Бетон', 25, 9, 500, 2500.00, 0, 90, 1),
-- (N'ул. Мира, 15', N'Северный', N'Жилстрой', 2000, N'Панель', N'Бетон', 15, 9, 550, 2600.25, 0, 95, 1),
-- (N'ул. Гагарина, 20', N'Южный', N'Новострой', 2010, N'Монолит', N'Железобетон', 5, 16, 1000, 4800.00, 1, 150, 1),
-- (N'ул. Гагарина, 22', N'Южный', N'Новострой', 2015, N'Монолит', N'Железобетон', 2, 16, 1050, 4950.50, 1, 155, 1),
-- (N'ул. Победы, 30', N'Западный', N'Западстрой', 1975, N'Кирпич', N'Бетон', 55, 4, 800, 850.30, 0, 32, 0),
-- (N'ул. Победы, 32', N'Западный', N'Западстрой', 1978, N'Кирпич', N'Бетон', 50, 4, 820, 880.40, 0, 35, 0),
-- (N'ул. Советская, 40', N'Восточный', N'Востокжил', 1988, N'Панель', N'Бетон', 35, 5, 1200, 1100.60, 1, 48, 1),
-- (N'ул. Советская, 42', N'Восточный', N'Востокжил', 1992, N'Панель', N'Бетон', 30, 5, 1250, 1150.80, 1, 50, 1),
-- (N'ул. Лесная, 7', N'Северный', N'Лесстрой', 2005, N'Кирпич', N'Бетон', 8, 3, 2000, 620.30, 1, 18, 0),
-- (N'ул. Лесная, 9', N'Северный', N'Лесстрой', 2008, N'Кирпич', N'Бетон', 5, 3, 2100, 650.50, 1, 20, 0),
-- (N'ул. Парковая, 11', N'Центральный', N'Центржил', 2000, N'Кирпич', N'Бетон', 12, 7, 300, 2100.00, 1, 70, 1),
-- (N'ул. Парковая, 13', N'Центральный', N'Центржил', 2003, N'Кирпич', N'Бетон', 8, 7, 320, 2150.50, 1, 72, 1),
-- (N'ул. Речная, 2', N'Западный', N'Речстрой', 1998, N'Панель', N'Бетон', 18, 12, 1500, 3200.00, 0, 110, 1),
-- (N'ул. Речная, 4', N'Западный', N'Речстрой', 2002, N'Панель', N'Бетон', 12, 12, 1550, 3350.75, 0, 115, 1),
-- (N'ул. Солнечная, 6', N'Восточный', N'Солнцестрой', 2012, N'Монолит', N'Железобетон', 3, 14, 2200, 4200.00, 1, 130, 1),
-- (N'ул. Солнечная, 8', N'Восточный', N'Солнцестрой', 2014, N'Монолит', N'Железобетон', 1, 14, 2250, 4300.25, 1, 135, 1),
-- (N'ул. Кедровая, 50', N'Северный', N'Кедрстрой', 1990, N'Кирпич', N'Бетон', 28, 2, 1800, 450.20, 0, 12, 0),
-- (N'ул. Кедровая, 52', N'Северный', N'Кедрстрой', 1993, N'Кирпич', N'Бетон', 22, 2, 1850, 470.80, 0, 14, 0);
-- GO


-- INSERT INTO Flats (BuildingID, FlatNumber, Storey, Rooms, SquareFlat, Dwell, Branch, Balcony, Height)
-- VALUES
-- (1, 1, 1, 1, 35.5, 18.2, 8.3, 4.0, 2.65),
-- (1, 12, 3, 2, 48.2, 28.5, 10.2, 5.5, 2.65),
-- (1, 25, 5, 3, 62.8, 40.3, 13.5, 6.0, 2.65),
-- (2, 5, 2, 2, 45.3, 27.8, 9.5, 5.0, 2.70),
-- (2, 18, 4, 2, 50.5, 30.2, 11.3, 5.8, 2.70),
-- (2, 30, 5, 3, 65.2, 42.1, 14.2, 6.5, 2.70),
-- (3, 10, 2, 1, 38.7, 20.5, 8.2, 4.2, 2.60),
-- (3, 45, 5, 2, 52.3, 32.4, 10.5, 5.2, 2.60),
-- (3, 67, 7, 3, 70.1, 45.8, 15.3, 7.5, 2.60),
-- (4, 23, 3, 2, 49.8, 29.6, 11.2, 5.8, 2.75),
-- (4, 56, 6, 3, 68.4, 43.2, 16.2, 8.5, 2.75),
-- (5, 101, 10, 2, 58.9, 36.5, 13.4, 6.8, 2.80),
-- (5, 150, 15, 3, 82.3, 52.8, 18.5, 10.2, 2.80),
-- (6, 201, 12, 2, 60.2, 37.8, 13.9, 7.0, 2.85),
-- (6, 250, 16, 3, 85.7, 55.2, 19.5, 11.0, 2.85),
-- (7, 1, 1, 1, 32.4, 16.8, 7.6, 3.5, 2.55),
-- (7, 12, 3, 2, 44.6, 26.3, 9.8, 4.8, 2.55),
-- (8, 8, 2, 2, 46.7, 27.9, 10.3, 5.1, 2.60),
-- (9, 25, 3, 3, 63.5, 41.2, 13.8, 6.2, 2.70),
-- (10, 30, 4, 2, 51.2, 31.5, 11.7, 5.9, 2.70);
-- GO

-- INSERT INTO Residents (FioHost, Born, Pasport, Status)
-- VALUES
-- (N'Иванов Иван Иванович', 1970, N'4500 123456', N'Собственник'),
-- (N'Петров Петр Петрович', 1965, N'4501 234567', N'Собственник'),
-- (N'Сидорова Анна Сергеевна', 1980, N'4502 345678', N'Собственник'),
-- (N'Козлов Дмитрий Николаевич', 1975, N'4503 456789', N'Собственник'),
-- (N'Смирнова Елена Викторовна', 1985, N'4504 567890', N'Собственник'),
-- (N'Васильев Алексей Иванович', 1990, N'4505 678901', N'Арендатор'),
-- (N'Михайлова Ольга Петровна', 1982, N'4506 789012', N'Член семьи'),
-- (N'Федоров Сергей Александрович', 1978, N'4507 890123', N'Собственник'),
-- (N'Николаева Татьяна Владимировна', 1987, N'4508 901234', N'Арендатор'),
-- (N'Алексеев Андрей Андреевич', 1995, N'4509 012345', N'Временный'),
-- (N'Степанов Владимир Сергеевич', 1972, N'4510 112233', N'Собственник'),
-- (N'Андреева Наталья Павловна', 1983, N'4511 223344', N'Собственник'),
-- (N'Сергеев Максим Игоревич', 1992, N'4512 334455', N'Арендатор'),
-- (N'Дмитриева Ксения Алексеевна', 1988, N'4513 445566', N'Член семьи'),
-- (N'Александров Денис Валерьевич', 1980, N'4514 556677', N'Собственник'),
-- (N'Григорьева Юлия Михайловна', 1984, N'4515 667788', N'Собственник'),
-- (N'Борисов Илья Олегович', 1979, N'4516 778899', N'Арендатор'),
-- (N'Егорова Марина Дмитриевна', 1991, N'4517 889900', N'Член семьи'),
-- (N'Павлов Роман Владимирович', 1973, N'4518 990011', N'Собственник'),
-- (N'Зайцева Людмила Петровна', 1976, N'4519 001122', N'Собственник');
-- GO

-- INSERT INTO PrivatizationList (FlatID, ResidentID, Document, DateDoc, Cost, Sign)
-- VALUES
-- (1, 1, N'Договор приватизации №001/2023', '2023-01-15', 1250000.00, 1),
-- (2, 2, N'Договор приватизации №002/2023', '2023-01-20', 1450000.00, 1),
-- (3, 3, N'Договор приватизации №003/2023', '2023-01-25', 1850000.00, 1),
-- (4, 4, N'Договор приватизации №004/2023', '2023-02-01', 1520000.00, 1),
-- (5, 5, N'Договор приватизации №005/2023', '2023-02-10', 1650000.00, 1),
-- (6, 8, N'Договор приватизации №006/2023', '2023-02-15', 2100000.00, 1),
-- (7, 6, NULL, NULL, NULL, 0),
-- (8, 7, N'Договор приватизации №008/2023', '2023-03-01', 1580000.00, 1),
-- (9, 11, N'Договор приватизации №009/2023', '2023-03-10', 2350000.00, 1),
-- (10, 12, N'Договор приватизации №010/2023', '2023-03-15', 1720000.00, 1),
-- (11, 9, NULL, NULL, NULL, 0),
-- (12, 15, N'Договор приватизации №012/2023', '2023-04-05', 1920000.00, 1),
-- (13, 16, N'Договор приватизации №013/2023', '2023-04-12', 2680000.00, 1),
-- (14, 10, NULL, NULL, NULL, 0),
-- (15, 19, N'Договор приватизации №015/2023', '2023-05-10', 1820000.00, 1),
-- (16, 13, NULL, NULL, NULL, 0),
-- (17, 14, N'Договор приватизации №017/2023', '2023-05-20', 1950000.00, 1),
-- (18, 20, N'Договор приватизации №018/2023', '2023-06-01', 2780000.00, 1),
-- (19, 17, NULL, NULL, NULL, 0),
-- (20, 18, N'Договор приватизации №020/2023', '2023-06-15', 1480000.00, 1);
-- GO

-- SELECT 
--     b.Address AS Адрес,
--     f.FlatNumber AS Квартира,
--     f.SquareFlat AS Площадь
-- FROM Flats f
-- JOIN Buildings b ON f.BuildingID = b.BuildingID
-- WHERE f.SquareFlat > 70;

-- SELECT Document FROM PrivatizationList
-- WHERE Cost BETWEEN 1350000 AND 1600000

-- SELECT b.Address, f.FlatNumber, f.Storey AS Этаж
-- FROM Flats f
-- JOIN Buildings b ON f.BuildingID = b.BuildingID
-- WHERE f.Storey IN (1, 5, 10);

-- SELECT 
--     b.Address,
--     f.FlatNumber,
--     f.SquareFlat
-- FROM Flats f
-- JOIN Buildings b ON f.BuildingID = b.BuildingID
-- LEFT JOIN PrivatizationList p ON f.FlatID = p.FlatID
-- WHERE p.RecordID IS NULL OR p.Sign = 0;

-- SELECT 
--     FioHost, 
--     Status
-- From Residents 
-- WHERE FioHost LIKE N'А%'
-- ORDER BY Status DESC;
-- SELECT 
--     BuildingID,
--     SUM(Rooms) as Total
-- FROM Flats
-- GROUP BY BuildingID
-- ORDER BY Total DESC;

-- SELECT 
--     AVG(Born) as medium_age
-- FROM Residents

-- SELECT 
--     MIN(r.born) AS young, 
--     MAX(p.Cost) AS capital
-- FROM Residents r
-- LEFT JOIN PrivatizationList p ON r.ResidentID = p.ResidentID

-- SELECT 
--     COUNT(Document) AS Количество_документов,
--     COUNT(*) AS Всего_записей
-- FROM PrivatizationList;

-- SELECT 
--     COUNT(DISTINCT District) AS Количество_районов
-- FROM Buildings;

-- SELECT 
--     'Buildings' AS Таблица, COUNT(*) AS Строк FROM Buildings
-- UNION ALL
-- SELECT 'Flats', COUNT(*) FROM Flats
-- UNION ALL
-- SELECT 'Residents', COUNT(*) FROM Residents
-- UNION ALL
-- SELECT 'PrivatizationList', COUNT(*) FROM PrivatizationList;

-- SELECT 
--     b.District AS Район,
--     SUM(p.Cost) AS Общая_стоимость,
--     COUNT(p.RecordID) AS Количество_договоров
-- FROM PrivatizationList p
-- JOIN Flats f ON p.FlatID = f.FlatID
-- JOIN Buildings b ON f.BuildingID = b.BuildingID
-- WHERE p.Sign = 1
-- GROUP BY b.District
-- ORDER BY Общая_стоимость DESC;

-- SELECT 
--     Rooms AS Комнат,
--     COUNT(*) AS Количество_квартир,
--     AVG(SquareFlat) AS Средняя_площадь,
--     AVG(Dwell) AS Средняя_жилая_площадь
-- FROM Flats
-- GROUP BY Rooms
-- ORDER BY Rooms;

-- SELECT 
--     b.District AS Район,
--     MIN(b.Year) AS Старейшее_здание,
--     MAX(b.Year) AS Новейшее_здание,
--     AVG(f.SquareFlat) AS Средняя_площадь_квартир,
--     MIN(f.SquareFlat) AS Мин_площадь,
--     MAX(f.SquareFlat) AS Макс_площадь
-- FROM Buildings b
-- JOIN Flats f ON b.BuildingID = f.BuildingID
-- GROUP BY b.District
-- ORDER BY b.District;

-- SELECT 
--     Storey AS Этаж,
--     COUNT(*) AS Количество_квартир,
--     COUNT(FlatNumber) AS Количество_номеров
-- FROM Flats
-- GROUP BY Storey
-- ORDER BY Этаж;

-- SELECT 
--     District AS 'Район',
--     COUNT(DISTINCT Material) AS Различных_материалов,
--     COUNT(DISTINCT Balance) AS Различных_балансодержателей
-- FROM Buildings
-- GROUP BY District
-- ORDER BY Район;

-- SELECT 
--     p.RecordID,
--     p.Cost AS [Стоимость],
--     f.SquareFlat AS [Площадь],
    
--     -- Стоимость за квадратный метр
--     ROUND(p.Cost / f.SquareFlat, 2) AS [Цена_за_м2],
    
--     -- Налог при продаже (13%)
--     ROUND(p.Cost * 0.13, 2) AS [Налог_при_продаже],
    
--     -- Ежемесячный платеж при ипотеке (условно 10% годовых на 20 лет)
--     ROUND((p.Cost * 0.1 / 12) / (1 - POWER(1 + 0.1/12, -240)), 2) AS [Ипотека_в_месяц]
    
-- FROM PrivatizationList p
-- JOIN Flats f ON p.FlatID = f.FlatID
-- WHERE p.Sign = 1;

--SELECT MAX(LEN(FioHost)) from Residents
-- SELECT
--     CONCAT(LEFT(FioHost, 30), N' ', RIGHT(Pasport, 4)) AS 'ФИО + серия паспорта'
-- FROM Residents

-- SELECT 
--     Address
-- FROM Buildings
-- WHERE BuildingID in (
--     SELECT 
--         BuildingID
--     FROM Flats
--     WHERE Rooms = 3
-- )

-- UPDATE Residents
-- SET Born = '1999'
-- WHERE ResidentID = 11

-- DELETE FROM Residents 
-- WHERE Status = N'Временный';

-- DELETE FROM PrivatizationList 
-- WHERE Sign IS NULL;

-- Начинаем транзакцию
-- BEGIN TRANSACTION;
-- PRINT '=== ТРАНЗАКЦИЯ НАЧАТА ===';
-- PRINT 'Время начала: ' + CONVERT(NVARCHAR, GETDATE(), 121);
-- GO

-- -- ============================================================
-- -- ТОЧКА СОХРАНЕНИЯ №1
-- -- ============================================================
-- SAVE TRANSACTION Point1;
-- PRINT '>>> Точка сохранения Point1 создана <<<';
-- GO

-- -- Удаление 1: Удаляем временных жильцов
-- PRINT '--- Удаление 1: Временные жильцы ---';
-- DELETE FROM Residents WHERE Status = N'Временный';
-- PRINT 'Удалено строк: ' + CAST(@@ROWCOUNT AS NVARCHAR);
-- SELECT Status, COUNT(*) AS Количество FROM Residents GROUP BY Status;
-- GO

-- -- ============================================================
-- -- ТОЧКА СОХРАНЕНИЯ №2
-- -- ============================================================
-- SAVE TRANSACTION Point2;
-- PRINT '>>> Точка сохранения Point2 создана <<<';
-- GO

-- -- Удаление 2: Удаляем неприватизированные квартиры
-- PRINT '--- Удаление 2: Неприватизированные квартиры ---';
-- DELETE FROM PrivatizationList WHERE Sign = 0 OR Sign IS NULL;
-- PRINT 'Удалено строк: ' + CAST(@@ROWCOUNT AS NVARCHAR);
-- SELECT Sign, COUNT(*) AS Количество FROM PrivatizationList GROUP BY Sign;
-- GO

-- -- ============================================================
-- -- ТОЧКА СОХРАНЕНИЯ №3
-- -- ============================================================
-- SAVE TRANSACTION Point3;
-- PRINT '>>> Точка сохранения Point3 создана <<<';
-- GO

-- -- Удаление 3: Удаляем квартиры в домах с износом > 50%
-- PRINT '--- Удаление 3: Квартиры в аварийных домах (износ > 50%) ---';
-- DELETE FROM Flats 
-- WHERE BuildingID IN (SELECT BuildingID FROM Buildings WHERE Wear > 50);
-- PRINT 'Удалено строк: ' + CAST(@@ROWCOUNT AS NVARCHAR);
-- SELECT COUNT(*) AS 'Квартир осталось' FROM Flats;
-- GO

-- -- ============================================================
-- -- ТОЧКА СОХРАНЕНИЯ №4
-- -- ============================================================
-- SAVE TRANSACTION Point4;
-- PRINT '>>> Точка сохранения Point4 создана <<<';
-- GO

-- -- Удаление 4: Удаляем старые здания (до 1980 года)
-- PRINT '--- Удаление 4: Здания построенные до 1980 года ---';
-- DELETE FROM Buildings WHERE Year < 1980;
-- PRINT 'Удалено строк: ' + CAST(@@ROWCOUNT AS NVARCHAR);
-- SELECT COUNT(*) AS 'Зданий осталось' FROM Buildings;
-- GO

-- -- ============================================================
-- -- ВОЗВРАТ КО 2-Й ТОЧКЕ СОХРАНЕНИЯ
-- -- ============================================================
-- PRINT '=== ВОЗВРАТ К ТОЧКЕ СОХРАНЕНИЯ POINT2 ===';
-- ROLLBACK TRANSACTION Point2;
-- PRINT 'Время возврата: ' + CONVERT(NVARCHAR, GETDATE(), 121);
-- GO

-- -- ============================================================
-- -- ПРОВЕРКА СОСТОЯНИЯ ПОСЛЕ ВОЗВРАТА
-- -- ============================================================
-- PRINT '=== СОСТОЯНИЕ БАЗЫ ДАННЫХ ПОСЛЕ ВОЗВРАТА К POINT2 ===';

-- PRINT '--- ТАБЛИЦА Buildings (Здания) ---';
-- SELECT 
--     COUNT(*) AS Всего_зданий,
--     MIN(Year) AS Самый_старый,
--     MAX(Year) AS Самый_новый,
--     AVG(Wear) AS Средний_износ
-- FROM Buildings;
-- SELECT Address, Year, Wear, FlatsCount FROM Buildings ORDER BY Year;

-- PRINT '--- ТАБЛИЦА Flats (Квартиры) ---';
-- SELECT 
--     COUNT(*) AS Всего_квартир,
--     AVG(SquareFlat) AS Средняя_площадь,
--     MIN(SquareFlat) AS Мин_площадь,
--     MAX(SquareFlat) AS Макс_площадь
-- FROM Flats;
-- SELECT TOP 10 FlatID, FlatNumber, SquareFlat, Rooms FROM Flats ORDER BY FlatID;

-- PRINT '--- ТАБЛИЦА Residents (Жители) ---';
-- SELECT 
--     COUNT(*) AS Всего_жителей,
--     Status,
--     COUNT(*) AS Количество
-- FROM Residents 
-- GROUP BY Status
-- ORDER BY Status;

-- PRINT '--- ТАБЛИЦА PrivatizationList (Приватизация) ---';
-- SELECT 
--     COUNT(*) AS Всего_записей,
--     Sign,
--     COUNT(*) AS Количество,
--     AVG(Cost) AS Средняя_стоимость
-- FROM PrivatizationList 
-- GROUP BY Sign;
-- GO
