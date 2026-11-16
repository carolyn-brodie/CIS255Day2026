IF SCHEMA_ID('Registration') IS NULL
BEGIN
    EXEC ('CREATE SCHEMA Registration AUTHORIZATION dbo')
END 
GO

IF OBJECT_ID('Registration.Enrollment', 'U') IS NOT NULL
   DROP TABLE Registration.Enrollment;

IF OBJECT_ID('Registration.Class', 'U') IS NOT NULL
   DROP TABLE Registrationl.Class;

IF OBJECT_ID('Registration.Instructor', 'U') IS NOT NULL
   DROP TABLE Registration.Instructor;

IF OBJECT_ID('Registration.Student', 'U') IS NOT NULL
   DROP TABLE Registration.Student;

CREATE TABLE Registration.Instructor
(
 Instructor_ID				INT				NOT NULL		IDENTITY,
 Instructor_Last_Name			VARCHAR(20)		NOT NULL,
 Instructor_First_Name		VARCHAR(20)		NOT NULL,
 Instructor_Date_of_Birth		DATE			NOT NULL,
 PRIMARY KEY(Instructor_ID),
 CHECK(DATEDIFF(year, Instructor_Date_of_Birth, GETDATE()) >= 25)
);

CREATE TABLE Registration.Class
(
 Class_ID	INT			NOT NULL	IDENTITY,
 Class_Title VARCHAR(20)	NOT NULL	UNIQUE,
 Class_Start_Date	DATE	NOT NULL,
 Instructor_ID	INT		NOT NULL,

 PRIMARY KEY(Class_ID),	
 FOREIGN KEY(Instructor_ID) REFERENCES Registration.Instructor(Instructor_ID)
);

CREATE TABLE Registration.Student
(
 Student_ID				INT				NOT NULL	IDENTITY,
 Student_Last_Name		VARCHAR(20)		NOT NULL,
 Student_First_Name		VARCHAR(20)		NOT NULL,
 Student_Date_of_Birth		DATE			NOT NULL,
 PRIMARY KEY(Student_ID)
);

CREATE TABLE Registration.Enrollment
(
 Student_ID		INT				NOT NULL,
 Class_ID		INT				NOT NULL,
 Grade			CHAR(1)			NULL,
 PRIMARY KEY(Student_ID, Class_ID),
 FOREIGN KEY(Class_ID) REFERENCES Registration.Class(Class_ID),
 FOREIGN KEY(Student_ID) REFERENCES Registration.Student(Student_ID),
 CHECK(Grade IN ('A', 'B', 'C', 'D', 'F'))
);

GO

INSERT INTO Registration.Instructor(Instructor_Last_Name, Instructor_First_Name, Instructor_Date_of_Birth) VALUES('Wozniak', 'Steve', '1950-08-11');
INSERT INTO Registration.Instructor(Instructor_Last_Name, Instructor_First_Name, Instructor_Date_of_Birth) VALUES('Andreessen', 'Mark', '1971-07-09');
INSERT INTO Registration.Instructor(Instructor_Last_Name, Instructor_First_Name, Instructor_Date_of_Birth) VALUES('Sandburg', 'Sheryl', '1969-08-29');
INSERT INTO Registration.Instructor(Instructor_Last_Name, Instructor_First_Name, Instructor_Date_of_Birth) VALUES('Page', 'Larry', '1973-03-26');

INSERT INTO Registration.Class(Class_Title, Class_Start_Date, Instructor_ID) VALUES('CS', '2016-08-30', 3);
INSERT INTO Registration.Class(Class_Title, Class_Start_Date, Instructor_ID) VALUES('Math', '2016-08-30', 3);
INSERT INTO Registration.Class(Class_Title, Class_Start_Date, Instructor_ID) VALUES('Physics', '2016-08-30', 1);
INSERT INTO Registration.Class(Class_Title, Class_Start_Date, Instructor_ID) VALUES('Chemistry', '2016-08-31', 2);
INSERT INTO Registration.Class(Class_Title, Class_Start_Date, Instructor_ID) VALUES('Religion', '2016-09-01', 2);
 
INSERT INTO Registration.Student(Student_Last_Name, Student_First_Name, Student_Date_of_Birth) VALUES('Attrick', 'Jerry', '1986-09-26');
INSERT INTO Registration.Student(Student_Last_Name, Student_First_Name, Student_Date_of_Birth) VALUES('Bush', 'Rose', '1996-06-04');
INSERT INTO Registration.Student(Student_Last_Name, Student_First_Name, Student_Date_of_Birth) VALUES('Gunn', 'Tommy', '1995-12-11');
INSERT INTO Registration.Student(Student_Last_Name, Student_First_Name, Student_Date_of_Birth) VALUES('Lettuce', 'Hedda', '1996-02-29');
INSERT INTO Registration.Student(Student_Last_Name, Student_First_Name, Student_Date_of_Birth) VALUES('Soap', 'Joe', '1997-08-08');
INSERT INTO Registration.Student(Student_Last_Name, Student_First_Name, Student_Date_of_Birth) VALUES('Smith', 'Pat', '1996-06-05');

-- First student's grades.
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(1, 1, 'C');
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(2, 1, 'B');
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(3, 1, 'B');
INSERT INTO Registration.Enrollment(Class_ID, Student_ID) VALUES(4, 1);

-- Second student's grades.
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(1, 2, 'B');
INSERT INTO Registration.Enrollment(Class_ID, Student_ID) VALUES(3, 2);
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(5, 2, 'A');

-- Third student's grades.
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(1, 3, 'C');
INSERT INTO Registration.Enrollment(Class_ID, Student_ID) VALUES(2, 3);
INSERT INTO Registration.Enrollment(Class_ID, Student_ID) VALUES(4, 3);

-- Fourth student's grades.
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(1, 4, 'A');
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(2, 4, 'A');
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(3, 4, 'A');
INSERT INTO Registration.Enrollment(Class_ID, Student_ID, Grade) VALUES(5, 4, 'A');

-- Fifth student's grades.
INSERT INTO Registration.Enrollment(Class_ID, Student_ID) VALUES(1, 5);
INSERT INTO Registration.Enrollment(Class_ID, Student_ID) VALUES(4, 5);


--GO 
