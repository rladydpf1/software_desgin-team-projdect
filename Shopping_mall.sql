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
Ritem		varchar(20) not null,
Rdate		DATE,
destination	int,
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

