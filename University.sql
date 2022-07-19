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

CREATE TABLE CreateAccount
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	User__Name VARCHAR(255),
	Email NVARCHAR(255) NULL,
	Number VARCHAR(255) NULL,
	[Password] NVARCHAR(255),
	Confirm__Password NVARCHAR(255),
	CreatedOn DATE
);

-- Queries --
INSERT INTO University__Student VALUES ('Ident_Current', 23,'Male',1200,'Delhi','Document','Image',GETDATE())
INSERT INTO Course VALUES ('c-sharp', GETDATE(), 10000)
INSERT INTO Course VALUES ('Sql-Server', GETDATE(), 10001)

SELECT * FROM University__Student
SELECT * FROM Course
SELECT * FROM CreateAccount

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

-- Insert StudentCombineCourse
ALTER PROCEDURE spInsertUniversityStudentCombineCourse
(
	@Name VARCHAR(255),  @Age INT,  @Gender VARCHAR(255),
	@Fees INT,  @City VARCHAR(255), @Document NVARCHAR(255),
	@Image NVARCHAR(MAX), @CreaedOn DATE,

	@CourseName VARCHAR(255),  @CreatedOn DATE
)
AS
BEGIN
	--SET @CreaedOn = ISNULL(@CreaedOn ,GETDATE())
	INSERT INTO University__Student VALUES (@Name, @Age, @Gender, @Fees, @City, @Document, @Image, @CreaedOn)
	INSERT INTO Course VALUES (@CourseName, @CreaedOn, IDENT_CURRENT('University__Student'))
END

EXECUTE spInsertUniversityStudentCombineCourse 'test', 10, 'testGender', 1200, 'testCity', 'testDocument', 'testImage','2022-07-05 13:11:10.237', 'testCourse', '2022-07-05 13:11:10.237'

--Get Course By ID
CREATE PROCEDURE spGetCourseByID (@ID INT) AS
BEGIN
	SELECT * FROM Course WHERE ID = @ID
END

EXECUTE spGetCourseByID 4

-- Get course Name distinct
CREATE PROCEDURE spGetDistinctCourseName AS
BEGIN
	SELECT DISTINCT Name FROM Course
END

EXECUTE spGetDistinctCourseName

-- Insert in Create Account Table.
ALTER PROCEDURE spInsertCreateAccount
(
	@UserName VARCHAR(255), @Email NVARCHAR(255) NULL, @Number VARCHAR(255) NULL,
	@Password NVARCHAR(255), @ConfirmPassword NVARCHAR(255), @CreatedOn DATE
) AS 
BEGIN
	INSERT INTO CreateAccount VALUES (@UserName, @Email, @Number, @Password, @ConfirmPassword, @CreatedOn)
END

EXECUTE spInsertCreateAccount 'Sachin', 'sachin@hotmail.com', '+91 123 456 789', 'sachin123', 'sachin123', '2022-07-19 13:21:49.360'

