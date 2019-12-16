CREATE TABLE Customer (
    Firstname varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    MiddleName varchar(50),
    SSN varchar(9) NOT NULL,
    CustomerID bigint PRIMARY
);

select * from customer

insert into customer values ('Satish','Garimella',null,123,'10-28-1992')

CREATE TABLE CreditScore (
    Score int NOT NULL,
    CustomerID bigint,
    FOREIGN KEY (CustomerID) REFERENCES customer(customerId)
);

select * from CreditScore

insert into CreditScore values (740,123)

select * from CreditScore credit join customer cust on cust.customerId = credit.CustomerID

CREATE TABLE Contact (
    CustomerID bigint,
	PhoneNumber varchar(10),
	EmailAddress varchar(50),
	StreetAddress varchar(250),
	Apt varchar(10),
	City varchar(50),
	State varchar(2),
	Country varchar(25),
    FOREIGN KEY (CustomerID) REFERENCES customer(customerId)
);

select * from Contact

insert into Contact values (123,'3313055674','satish.gari@gmail.com','123 Blvd','AP# 533','Austin','TX','US')

select * from customer cust join Contact contact on contact.CustomerID = cust.customerId join CreditScore credit on credit.CustomerID = cust.customerId 

CREATE TABLE Loan (
    CustomerID bigint,
	LoanAmount bigint,
	EmailAddress varchar(50),
	DateApplied date,

    FOREIGN KEY (CustomerID) REFERENCES customer(customerId)
);

select * from Loan

insert into Loan values (123,150000,'satish.gari@gmail.com','2019-10-28')

alter table customer add ssn varchar(9)

update customer set ssn = '123456789' where customerId= 123

select * from customer cust join 
Contact contact on contact.CustomerID = cust.customerId join
CreditScore credit on credit.CustomerID = cust.customerId join Loan
loan on loan.CustomerID = cust.customerId where cust.customerId = 123 and cust.ssn = '123456789'
