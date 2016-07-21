# Creating tables

DROP TABLE School;

CREATE TABLE School

(School_id INTEGER NOT NULL PRIMARY KEY,

School_name VARCHAR2 (20) NOT NULL,

Adress VARCHAR2 (50) NOT NULL,

Phone_number VARCHAR2 (12) NOT NULL

);

DROP TABLE Offer;

CREATE TABLE Offer

(Offer_id INTEGER NOT NULL PRIMARY KEY,

School_id INTEGER,

Offer_name VARCHAR2 (20),

Number_of_people INTEGER NOT NULL,

Durat INTEGER NOT NULL,

Age INTEGER,

Lev VARCHAR2 (20),

Offer_price FLOAT NOT NULL

);



DROP TABLE Reservation;

CREATE TABLE Reservation

(Reservation_id INTEGER NOT NULL PRIMARY KEY,

Customer_id INTEGER NOT NULL,

Offer_id INTEGER NOT NULL,

Emp_id INTEGER NOT NULL,

Dat DATE NOT NULL,

Tim DATE NOT NULL,

RESPayment_id INTEGER NOT NULL UNIQUE

);



DROP TABLE Customer;

CREATE TABLE Customer

(Customer_id INTEGER NOT NULL PRIMARY KEY,

First_name VARCHAR2 (20) NOT NULL,

Last_name VARCHAR2 (25) NOT NULL,

Pesel INTEGER NOT NULL,

Phone_number VARCHAR(20) NOT NULL,

Address VARCHAR2 (50),

Age INTEGER NOT NULL,

Gender VARCHAR2(10),

Lev VARCHAR2 (15) NOT NULL

);



DROP TABLE Payment;

CREATE TABLE Payment

(Payment_id INTEGER NOT NULL PRIMARY KEY,

RESPayment_id INTEGER UNIQUE,

RENPayment_id INTEGER UNIQUE,

Payment_value INTEGER NOT NULL,

Dat DATE NOT NULL

);

DROP TABLE Rental;

CREATE TABLE Rental

(Rental_id INTEGER NOT NULL PRIMARY KEY,

Equipment_id INTEGER NOT NULL,

Rental_date DATE NOT NULL,

Return_date DATE NOT NULL,

Customer_id INTEGER NOT NULL,

RENPayment_id INTEGER NOT NULL UNIQUE

);

DROP TABLE Equipment;

CREATE TABLE Equipment

(Equipment_id INTEGER NOT NULL PRIMARY KEY,

Nam VARCHAR2 (20),

Brand VARCHAR2 (30),

Price FLOAT,

Siz VARCHAR2 (10),

Amount INTEGER,

Production_date DATE

);

DROP TABLE Employee;

CREATE TABLE Employee

(Employee_id INTEGER NOT NULL PRIMARY KEY,

School_id INTEGER NOT NULL,

First_name VARCHAR2 (30) NOT NULL,

Last_name VARCHAR2 (30) NOT NULL,

Phone_number VARCHAR2(12) NOT NULL,

Address VARCHAR2 (50) NOT NULL

);











# /*/ creating constraints /*/



ALTER TABLE Offer 

ADD CONSTRAINT fk_school

FOREIGN KEY (School_id)

REFERENCES School(School_id);





ALTER TABLE Reservation

ADD CONSTRAINT fk_customer

  FOREIGN KEY (Customer_id)

  REFERENCES Customer(Customer_id);

  

ALTER TABLE Reservation

ADD CONSTRAINT fk_offer

  FOREIGN KEY (Offer_Id)

  REFERENCES Offer(Offer_id);

  

 ALTER TABLE Reservation

ADD  

  CONSTRAINT fk_employee

  FOREIGN KEY (Emp_id)

  REFERENCES Employee(Employee_id);



ALTER TABLE Payment

ADD CONSTRAINT fk_respayment

FOREIGN KEY (RESPayment_id)

REFERENCES Reservation(RESPayment_id);







ALTER TABLE Payment

ADD CONSTRAINT fk_renpayment

FOREIGN KEY (REnPayment_id)

REFERENCES Rental(RENPayment_id);



ALTER TABLE Rental

ADD CONSTRAINT fk_equipment

FOREIGN KEY (Equipment_id)

REFERENCES Equipment(Equipment_id);



ALTER TABLE Rental

ADD CONSTRAINT fk_custrent

FOREIGN KEY (Customer_id)

REFERENCES Customer(Customer_id);



ALTER TABLE Employee

ADD CONSTRAINT fk_school_emp

  FOREIGN KEY (School_id)

  REFERENCES School(School_id);



