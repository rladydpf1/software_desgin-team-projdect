DROP TABLE SHOPPINGBASKET;
DROP TABLE MANAGER;
DROP TABLE CUSTOMER;
DROP TABLE STOCK;
DROP TABLE PERSON;
DROP TABLE REQUEST;

CREATE TABLE PERSON (
ID 		varchar(20) not null, 
Last_name 	varchar(20),
First_name 	varchar(20),
Address 	varchar(50),
Phone 		varchar(20),
Birth_date 	DATE,
Age 		int,
Pwd		varchar(20),
PRIMARY KEY (ID)
);

CREATE TABLE CUSTOMER (
Cnumber 	int not null,
C_ID		varchar(20) not null,
primary key(Cnumber),
FOREIGN KEY(C_ID) REFERENCES PERSON (ID)
);

CREATE TABLE MANAGER (
Mnumber 	int not null,
M_ID		varchar(20) not null,
Department	varchar(20),
primary key(Mnumber),
FOREIGN KEY(M_ID) REFERENCES PERSON (ID)
);

CREATE TABLE REQUEST (
Rnumber 	int not null,
Ino		int not null,
Rdate		DATE,
PRIMARY KEY(Rnumber)
);

CREATE TABLE STOCK (
Inumber		int not null,
Sitem		varchar(20) not null,
quantity	int not null,
PRIMARY KEY(Inumber)
);

CREATE TABLE SHOPPINGBASKET (
Cnum		int not null,
Inum		int not null,
Squantity	int,
PRIMARY KEY(Inum, Cnum),
FOREIGN KEY(Inum) REFERENCES STOCK (Inumber),
FOREIGN KEY(Cnum) REFERENCES CUSTOMER (Cnumber) 
);

INSERT INTO PERSON VALUES ('manager1', 'Kim', 'Yoel', 'Kyunpook University', '010-2305-7167',  STR_TO_DATE('1999-02-02' ,'%Y-%m-%d'), 22, 'manager2');
INSERT INTO PERSON VALUES ('customer1', 'Lee', 'Hogyung', 'Kyunpook University', '010-1234-5678',  STR_TO_DATE('1950-12-18' ,'%Y-%m-%d'), 60, 'customer2');
INSERT INTO CUSTOMER VALUES (1, 'customer1');
INSERT INTO MANAGER VALUES (1, 'manager1', 'Sales');
INSERT INTO REQUEST VALUES (1, 1, STR_TO_DATE('2018-12-18' ,'%Y-%m-%d'));
INSERT INTO STOCK VALUES (1, 'banana', 10);
INSERT INTO STOCK VALUES (2, 'apple', 20);
INSERT INTO STOCK VALUES (3, 'coat', 1);
INSERT INTO STOCK VALUES (4, 'dress', 0);
INSERT INTO SHOPPINGBASKET VALUES (1, 1, 4);
INSERT INTO SHOPPINGBASKET VALUES (1, 3, 2);
