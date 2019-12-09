CREATE SCHEMA FinalProject;
SHOW SCHEMAS;
USE FinalProject;

CREATE TABLE Students (
	StudentID	varchar (6) primary key,
	StudentFirstName	varchar(30) ,
	StudentLastName 	varchar(30) not null,
	Grade		varchar(2),
	ParentID	varchar (6)
);

SELECT * 
FROM Students;

DESCRIBE Students;

INSERT INTO Students (StudentID, StudentFirstName, StudentLastName, Grade, ParentID)
	Values 
		('000111', 'David', 'Tennant', '10', '100111'),
		('000112', 'Matt', 'Smith', '11', '100112'),
		('000113', 'Christopher', 'Eccleston', '9', '100113'),
		('000114', 'Peter', 'Capaldi', '12', '100114'),
		('000115', 'Tom', 'Baker', '8', '100115'),
		('000116', 'Sylvester', 'McCoy', '7', '100116');

	
SELECT * 
FROM Students;

SELECT 
	StudentID,
    StudentLastName AS 'Last',
    StudentFirstName AS 'First',
    Grade,
    ParentID
FROM Students
GROUP BY StudentID
ORDER BY Grade,
		'First',
		'Last';

CREATE TABLE Meal_Status(
	StudentID 	varchar (6) primary key,
	MealStatus varchar(7),
	StudentLastName varchar(30) not null,
	StudentFirstName  varchar(30)
);

INSERT INTO Meal_Status (StudentID, MealStatus, StudentLastName, StudentFirstName)
	Values 
		('000111', 'Free', 'Tennant', 'David'),
		('000112', 'Free', 'Smith', 'Matt'),
		('000113', 'Reduced', 'Eccleston', 'Christopher'),
		('000114', 'Reduced', 'Capaldi', 'Peter'),
		('000115', 'Paid', 'Baker', 'Tom'),
		('000116', 'Paid', 'McCoy', 'Sylvester');
            
SELECT * 
FROM Meal_Status

CREATE TABLE Parents (
	ParentID  varchar (6) primary key,
	ParentLastName 	varchar (30) not null,
	ParentFirstName	varchar (30),
	Street		varchar (25),
	City 		varchar (25),
	State		varchar (15),
	ZipCode	varchar (5),
	PhoneNumber	varchar (13),
	Email		varchar (45),
    StudentID varchar (6)
);

INSERT INTO Parents (ParentID, ParentLastName, ParentFirstName, Street, City, State, ZipCode, PhoneNumber, Email, StudentID)
	Values 
		('100111', 'Tennant', 'Michael', '221 B Baker Street', 'St. Louis', 'Missouri', '63102', '314-325-4679', 'MT8585@gmail.com', '000111'),
		('100112', 'Smith', 'Mary', '410 W Hornisse Street', 'St. Louis', 'Missouri', '63104', '314-935-2817', 'MarySmith@gmail.com', '000112'),
		('100113', 'Eccleston', 'Terry', '109 E Eastings Street', 'St. Louis', 'Missouri', '63102', '314-989-1846', 'TerryECTerry@gmail.com', '000113'),
		('100114', 'Capaldi', 'Mathhaius', '190 N Hawker Blvd', 'St. Louis', 'Missouri', '63104', '314-472-5852', 'MCapaldi@gmail.com', '000114'),
		('100115', 'Baker', 'Martin', '332 Avro Lane', 'St. Louis', 'Missouri', '63102', '314-873-9472', 'MartinBakerMD@gmail.com', '000115'),
		('100116', 'McCoy', 'Karen', '334 Avro Lane', 'St. Louis', 'Missouri', '63102', '314-113-4053', 'KarenMcCoy@yahoo.com', '000116');

SELECT * 
FROM Parents;

CREATE TABLE Meals_Table (
	MealID varchar (5) primary key,
   	Entree 	varchar (40),
	Side	varchar(40),
   	Side_2	varchar (40),
   	Choice_Of_Milk	varchar(30)
);

SELECT * 
FROM Meals_Table

INSERT INTO Meals_Table (MealID, Entree, Side, Side_2, Choice_Of_Milk)
	Values 
		('11111', 'Chicken_Nuggets', 'Glazed_Sweet_Potatoes', 'Chilled_Mixed_Fruit', 'Choice_Of_Milk'),
		('22222', 'Bean_Nachos', 'Corn_Whole_Kernel', 'Apple_Slices_With_Cinnamon', 'Choice_Of_Milk'),
		('33333', 'PBJ_With_Cheesestick', 'Fresh_Mango', 'Fresh_Cucumber_With_Dip', 'Choice_Of_Milk'),
		('44444', 'Chili_Beef_With_Beans', 'Cornbread', 'Chilled_Pears', 'Choice_Of_Milk'),
		('55555', 'Deli_Sandwich_With_Lettuce_&_Tomato', 'Mini_Carrots', 'Fresh_Grapes', 'Choice_Of_Milk');
            
SELECT * 
FROM Meals_Table
GROUP BY MealID;
	
CREATE TABLE Daily_Transactions(
	TransactionID varchar(7) primary key,
	ParentID varchar (6),
	StudentID varchar (6),
	Date 	varchar (14),
	Time	varchar (5),
	MealStatus varchar (7),
	AmountPaid decimal (4, 2),
    PaymentID varchar (6),
    MealID varchar (5)
);

SELECT * 
FROM Daily_Transactions



INSERT INTO Daily_Transactions (TransactionID, ParentID, StudentID, Date, Time, MealStatus, AmountPaid, PaymentID, MealID)
	Values 
		('1001003', '100111', '000111', '05/Dec/2019', '11:00', 'Free', '0.00', 'Null', '33333'),
		('1001004', '100111', '000111', '06/Dec/2019', '11:00', 'Free', '0.00', 'Null', '33333'),
		('1001005', '100112', '000112', '05/Dec/2019', '11:00', 'Free', '0.00', 'Null', '11111'),
		('1001006', '100112', '000112', '06/Dec/2019', '11:00', 'Free', '0.00', 'Null', '11111'),
		('1001007', '100113', '000113', '05/Dec/2019', '11:00', 'Reduced', '0.40', '400000', '22222'),
		('1001008', '100113', '000113', '06/Dec/2019', '11:00', 'Reduced', '0.00', 'Null', '22222'),
		('1001009', '100114', '000114', '05/Dec/2019', '11:00', 'Reduced', '0.40', '400001', '44444'),
		('1001010', '100114', '000114', '06/Dec/2019', '11:00', 'Reduced', '0.40', '400002', '44444'),
		('1001011', '100115', '000115', '05/Dec/2019', '11:00', 'Paid', '3.00', '300000', '55555'),
		('1001012', '100115', '000115', '06/Dec/2019', '11:00', 'Paid', '3.00', '300001', '55555'),
		('1001013', '100116', '000116', '05/Dec/2019', '11:00', 'Paid', '3.00', '300002', '11111'),
		('1001014', '100116', '000116', '06/Dec/2019', '11:00', 'Paid', '0.00', 'Null', '11111');



SELECT 
	count(TransactionID) AS 'MealsServed', 
    (count(TransactionID) * '3.00') AS 'DailyMealCost'
FROM Daily_Transactions
GROUP BY Date;


CREATE TABLE TotalFreeMeals (
	StudentID VARCHAR(6) primary key,
    Date VARCHAR(14),
    MealStatus VARCHAR(7),
	StudentLastName VARCHAR(30) NOT NULL,
	StudentFirstName VARCHAR(30),
    Grade INT(2),
	NumberofMeals INT(8),
    PriceofMeal DECIMAL(10, 2)
    );
    
    INSERT INTO TotalFreeMeals (StudentID, Date, MealStatus, StudentLastName, StudentFirstName, Grade, NumberofMeals, PriceofMeal)
    VALUES 
		('000111', '07/Dec/2019', 'Free', 'Tennant', 'David', '10', '2', '3.00'),
        ('000112', '07/Dec/2019', 'Free', 'Smith', 'Matt', '11', '2', '3.00');

SELECT * 
FROM TotalFreeMeals;

SELECT 
	StudentID,
    Date,
    MealStatus,
    CONCAT(StudentFirstName,', ', StudentLastName) AS 'Name',
    Grade,
    SUM(NumberofMeals * PriceofMeal) AS 'TotalStateRembursement'
FROM TotalFreeMeals
GROUP BY StudentID;
        
CREATE TABLE TotalReducedMeals (
	StudentID VARCHAR(6) primary key,
    Date VARCHAR(14),
    MealStatus VARCHAR(7),
	StudentLastName VARCHAR(30) NOT NULL,
	StudentFirstName VARCHAR(30),
    Grade INT(2),
	NumberofMeals INT(8),
    PriceofMeal DECIMAL(10, 2)
    );

    INSERT INTO TotalReducedMeals (StudentID, Date, MealStatus, StudentLastName, StudentFirstName, Grade, NumberofMeals, PriceofMeal)
    VALUES 
		('000113', '07/Dec/2019', 'Reduced', 'Eccleston', 'Christopher', '9', '2', '2.60'),
        ('000114', '07/Dec/2019', 'Reduced', 'Capaldi', 'Peter', '12', '2', '2.60');

SELECT *
FROM TotalReducedMeals;

SELECT 
	StudentID,
    Date,
    MealStatus,
    CONCAT(StudentFirstName,', ', StudentLastName) AS 'Name',
    Grade,
    SUM(NumberofMeals * PriceofMeal) AS 'TotalStateRembursement'
FROM TotalReducedMeals
GROUP BY StudentID;
    
CREATE TABLE Payments (
	PaymentID VARCHAR(6) primary key,
    DatePaid VARCHAR(14),
    MealStatus VARCHAR(7),
	StudentID VARCHAR(6),
    ParentID VARCHAR(6),
    PaymentType VARCHAR(12),
    AmountPaid DECIMAL(10, 2),
    ProcessedBy VARCHAR(20),
    Notes VARCHAR(600)
    );
    
INSERT INTO Payments (PaymentID, DatePaid, MealStatus, StudentID, ParentID, PaymentType, AmountPaid, ProcessedBy, Notes)
VALUES
	('400000', '05/Dec/2019', 'Reduced', '000113', '100113', 'Cash', '0.40', 'Register', 'Paid in Full at Register'),
    ('400001', '05/Dec/2019', 'Reduced', '000114', '100114', 'Cash', '0.40', 'Register', 'Paid in Full at Register'),
    ('400002', '06/Dec/2019', 'Reduced', '000114', '100114', 'Cash', '0.40', 'Register', 'Paid in Full at Register'),
    ('300000', '05/Dec/2019', 'Paid', '000115', '100115', 'Credit Card', '3.00', 'Card Reader', 'Prepaid by Parents'),
    ('300001', '06/Dec/2019', 'Paid', '000115', '100115', 'Credit Card', '3.00', 'Card Reader', 'Prepaid by Parents'),
    ('300002', '05/Dec/2019', 'Paid', '000116', '100116', 'Cash', '3.00', 'Register', 'Paid in Full at Register');

SELECT * 
FROM Payments;

CREATE TABLE Balances (
	StudentID VARCHAR(6) primary key,
	StudentLastName VARCHAR(30) NOT NULL,
	StudentFirstName VARCHAR(30),
    TotalCharges DECIMAL (10, 2),
    TotalPayments DECIMAL (10, 2)
    );

INSERT INTO Balances (StudentID, StudentLastName, StudentFirstName, TotalCharges, TotalPayments)
	VALUES
		('000111', 'Tennant', 'David', '0.00', '0.00'),
		('000112', 'Smith', 'Matt', '0.00', '0.00'),
		('000113', 'Eccleston', 'Christopher', '0.80', '0.40'),
		('000114', 'Capaldi', 'Peter', '0.80', '0.80'),
		('000115', 'Baker', 'Tom', '6.00', '6.00'),
		('000116', 'McCoy', 'Sylvester', '6.00', '3.00');

SELECT * 
FROM Balances;

SELECT 
	StudentID,
    CONCAT(StudentFirstName, ', ', StudentLastName) AS 'Name',
    TotalCharges AS 'TotalOwed',
    TotalPayments AS 'TotalPaid',
    SUM(TotalCharges - TotalPayments) AS 'AmountStudentOwes'
FROM Balances
GROUP BY StudentID;

DELIMITER $$
CREATE PROCEDURE StudentParentContacts (StudNum INT) 
BEGIN
SELECT 
	s.StudentID,
    CONCAT(s.StudentLastName, ', ', s.StudentFirstName) AS 'StudentName',
    s.Grade,
    p.ParentID,
    CONCAT(p.ParentLastName, ', ', p.ParentFirstName) AS 'ParentName',
    p.PhoneNumber AS 'ContactNumber'
FROM Students s
INNER JOIN Parents p
ON s.ParentID = p.ParentID
WHERE s.StudentID = StudNum;
END$$
DELIMITER ;

CALL StudentParentContacts(000111);

DELIMITER $$
CREATE PROCEDURE StudentBalances (StudNum INT) 
BEGIN
SELECT 
	s.StudentID,
    CONCAT(s.StudentLastName, ', ', s.StudentFirstName) AS 'StudentName',
    s.Grade,
    s.ParentID,
	b.TotalCharges AS 'TotalOwed',
    b.TotalPayments AS 'TotalPaid',
	SUM(b.TotalCharges - b.TotalPayments) AS 'AmountStudentOwes'
FROM Students s
INNER JOIN Balances b
ON s.StudentID = b.StudentID
WHERE b.StudentID = StudNum;
END$$
DELIMITER ;

CALL StudentBalances(000114);

DELIMITER $$
CREATE PROCEDURE StudentPayments (StudNum INT) 
BEGIN
SELECT 
	s.StudentID,
    CONCAT(s.StudentLastName, ', ', s.StudentFirstName) AS 'StudentName',
    p.PaymentID,
    p.DatePaid,
    p.PaymentType,
    p.AmountPaid,
    p.ProcessedBy,
    p.Notes,
    p.ParentID	
FROM Students s
INNER JOIN Payments p
ON s.StudentID = p.StudentID
WHERE s.StudentID = StudNum;
END$$
DELIMITER ;

CALL StudentPayments(000114);

DELIMITER $$
CREATE PROCEDURE RembursementsFree (StudNum INT) 
BEGIN
SELECT 
	StudentID,
    CONCAT(StudentLastName, ', ', StudentFirstName) AS 'StudentName',
    Grade,
    SUM(NumberofMeals * PriceofMeal) AS 'TotalStateRembursement'
FROM TotalFreeMeals
WHERE StudentID = StudNum;
END$$
DELIMITER ;

CALL RembursementsFree(000112);

DELIMITER $$
CREATE PROCEDURE RembursementsReduced (StudNum INT) 
BEGIN
SELECT 
	StudentID,
    CONCAT(StudentLastName, ', ', StudentFirstName) AS 'StudentName',
    Grade,
    SUM(NumberofMeals * PriceofMeal) AS 'TotalStateRembursement'
FROM TotalReducedMeals
WHERE StudentID = StudNum;
END$$
DELIMITER ;

CALL RembursementsReduced(000113);