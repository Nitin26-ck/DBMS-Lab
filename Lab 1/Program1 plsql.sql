//Consider an Employee with a social security number (SSN) working on multiple projects with definite hours for each. Each Employee belongs to a Department. Each project is associated with some domain areas such as Database, Cloud and so on.  Each Employee will be assigned to some project. Assume the attributes for Employee and Project relations.  

// Table Creation

CREATE TABLE Employee(
SSN	VARCHAR(5),
Name	VARCHAR(5),
Salary	NUMBER(10),
Deptno  VARCHAR(5),
PRIMARY KEY (SSN)
);
CREATE TABLE Project(
Pno	VARCHAR(5),
Pdomain  VARCHAR(10),
PRIMARY KEY (Pno)
);
CREATE TABLE Workson(
SSN	VARCHAR(5),
Pno	VARCHAR(5),
Hours    NUMBER(2),
PRIMARY KEY (SSN,Pno),
FOREIGN KEY (SSN) REFERENCES  Employee(SSN),
FOREIGN KEY (Pno) REFERENCES Project(Pno)
);

//Inserting the values

INSERT INTO Employee VALUES('E1','Ricky',20000,'D1');
INSERT INTO Employee VALUES('E2','Sam',30000,'D2');
INSERT INTO Employee VALUES('E3,'Ram',15000,'D2');
INSERT INTO Employee VALUES('E4','Sami',35000,'D1');	
INSERT INTO Employee VALUES('E5','Sajel',25000,'D2');

INSERT INTO Project VALUES('P1','Cloud');	
INSERT INTO Project VALUES('P2','Cloud');
INSERT INTO Project VALUES('P3','Database');
INSERT INTO Project VALUES('P4,'Cloud');
INSERT INTO Project VALUES('P5','Database');

INSERT INTO Workson VALUES('E1','P1',12);
INSERT INTO Workson VALUES('E5','P3',7);
INSERT INTO Workson VALUES('E4','P2',13);
IINSERT INTO Workson VALUES('E1','P4',2);
INSERT INTO Workson VALUES('E2','P5',10);


 //Write a program that gives all employees in Department #number a 15% pay increase. Display a message displaying how many employees were awarded the increase.  
//PL-SQL 

BEGIN
	UPDATE Employee
	SET Salary=Salary+(0.15*Salary)
	WHERE Deptno='D2';
	dbms_output.put_line('no of employees whose salary got 						incremented is :' ||sql%rowcount);
END;
/
