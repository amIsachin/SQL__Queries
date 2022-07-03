CREATE TABLE University__Student
(
	Enrolment__Number INT PRIMARY KEY IDENTITY(10000, 1),  -- SMALLINT
	[Name] VARCHAR(255),
	Age INT,
	Gender VARCHAR(255),
	Fees INT,
	City VARCHAR(255),
	Document NVARCHAR(255),
	[Image] VARCHAR(MAX),
	CreatedOn DATE
);

CREATE TABLE Course
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(255),
	CreatedOn DATE,
	Student__ID INT FOREIGN KEY REFERENCES University__Student(Enrolment__Number)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

-- Queries --
INSERT INTO University__Student VALUES ('Venkat', 23,'Male',1200,'Delhi','Document','Image',GETDATE())
INSERT INTO Course VALUES ('c-sharp', GETDATE(), 10000)
INSERT INTO Course VALUES ('Sql-Server', GETDATE(), 10001)

SELECT * FROM University__Student
SELECT * FROM Course

--- Stored Procedures -----
--Get All University Student
CREATE PROCEDURE spGetAllUniversityStudent AS
BEGIN
	SELECT * FROM University__Student
END

EXECUTE spGetAllUniversityStudent

-- Get all Courses
CREATE PROCEDURE spGetAllCourses AS 
BEGIN
	SELECT * FROM Course
END 

EXECUTE spGetAllCourses
