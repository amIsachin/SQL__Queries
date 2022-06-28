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

INSERT INTO University__Student VALUES ('Sachin', 23,'Male',1200,'Delhi','Document','Image',GETDATE())
INSERT INTO Course VALUES ('c-sharp', GETDATE(), 10000)

SELECT * FROM University__Student
SELECT * FROM Course
