CREATE SCHEMA IF NOT EXISTS HOMEWORK
USE homework;
CREATE TABLE users(
user_id CHAR(36) PRIMARY KEY,
first_name Varchar (200),
last_name Varchar (200),
address Varchar (200),
email Varchar (200));

CREATE TABLE products( 
product_id CHAR (36) PRIMARY KEY,
product_name Varchar (200),
descriptionn TEXT,
price INT);

CREATE TABLE orders (
order_id CHAR (36) PRIMARY KEY,
userss CHAR (36),
Product_ordered CHAR (36),
total_paid INT,
FOREIGN KEY (userss) REFERENCES users(user_id),
FOREIGN KEY (product_ordered) REFERENCES products(product_id));
INSERT INTO users  (user_id, first_name, last_name, address, email)
 VALUES
 (1,'Lusi','Malkhasyan','Aparan','lusmalxasyan555@gmail.com'),
 (2,'Hakob','Kirakosyan','Ashtarak','hokobbkir552@gmail.com'),
 (3,'Melisa','Karapetyan','Abovyan','melissmel336@gmail.com');
SELECT *FROM homework.users ;
INSERT INTO  products (product_id, product_name, descriptionn, price)
 VALUES
 (1,'Yogurt ','Elakov',300),
 (2,'Cola','Zero ',800),
 (3,'Tey','hataptuxnerov',1000);
SELECT *FROM homework.products;
INSERT INTO  orders (order_id,userss ,Product_ordered, total_paid)
 VALUES
 (1,3,1,300),
 (2,2,1,300),
 (3,1,3,1000);
Select *FROM homework.orders;
CREATE SCHEMA IF NOT EXISTS HOMEWORK2;
USE HOMEWORK2;
CREATE TABLE country(
country_id INT PRIMARY KEY ,
country_name Varchar (255));
SELECT *FROM country;
CREATE TABLE department (
department_id INT PRIMARY KEY,
department_name Varchar (255));
SELECT *FROM department;
CREATE TABLE job_title(
job_id INT PRIMARY KEY,
job_name Varchar (255),
job_description INT);
SELECT *FROM job_title;
CREATE TABLE employee(
employee_id INT PRIMARY KEY,
firstname VARCHAR (255),
lastname VARCHAR (255),
start_date DATE,
end_date Date,
job_title_id INT,
department_id INT,
country_id INT,
FOREIGN KEY (job_title_id)REFERENCES job_title(job_id),
FOREIGN KEY(department_id) REFERENCES department(department_id),
FOREIGN KEY (country_id) REFERENCES country(country_id));
SELECT *FROM employee;

CREATE SCHEMA IF NOT EXISTS HOMEWORK3
USE HOMEWORK3;
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    Email VARCHAR(100),
    Password VARCHAR(100)
);
CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    UserID INT,
    Conte TEXT,
    PostD DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
CREATE TABLE Comment (
    CommentID INT PRIMARY KEY,
    UserID INT,
    PostID INT,
    Content TEXT,
    CommentD DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID)
);
CREATE TABLE LikePost (
    User INT,
    Post INT,
    Likee DATE,
    PRIMARY KEY (User, Post),
    FOREIGN KEY (User) REFERENCES User(UserID),
    FOREIGN KEY (Post) REFERENCES Post(PostID)
);
CREATE TABLE LikeComment(
UserID INT,
Commentt int ,
LikeDate DATE,
PRIMARY KEY(UserID,Commentt),
FOREIGN KEY (UserID)REFERENCES User (UserID),
FOREIGN KEY (Commentt)REFERENCES Comment (CommentID)
);

CREATE SCHEMA IF NOT EXISTS HOMEWORK4;
USE HOMEWORK4;
CREATE TABLE Company (
Id_Comp INT PRIMARY KEY,
Comp_Name VARCHAR(255));
CREATE TABLE Trip (
Trip_No INT PRIMARY KEY,
ID_Comp INT,
Plane CHAR (36),
Town_from CHAR(36),
Town_To Char (36),
Time_out TIME(3),
Time_in TIME(3),
FOREIGN KEY (ID_Comp)REFERENCES Company(Id_Comp));
ALTER TABLE Trip
MODIFY COLUMN time_out TIME(3);

ALTER TABLE Trip
MODIFY COLUMN time_in TIME(3);

CREATE TABLE Passenger(
ID_psg INT PRIMARY KEY,
name CHAR(36));
CREATE TABLE Pass_In_Trip(
Trip_No INT,
datee DATETIME,
Id_psg INT,
place Char ,
PRIMARY KEY (Trip_No, Id_psg,datee),
FOREIGN KEY (Trip_No) REFERENCES Trip(Trip_No),
FOREIGN KEY (Id_psg) REFERENCES Passenger(ID_psg)
);

Alter table Pass_in_trip MODIFY COLUMN place VARCHAR(255);
insert into Company values(1,'Don_avia  ');
insert into Company values(2,'Aeroflot  ');
insert into Company values(3,'Dale_avia ');
insert into Company values(4,'air_France');
insert into Company values(5,'British_AW');
select *from Company;


insert into Passenger values(1,'Bruce Willis        ');
insert into Passenger values(2,'George Clooney      ');
insert into Passenger values(3,'Kevin Costner       ');
insert into Passenger values(4,'Donald Sutherland   ');
insert into Passenger values(5,'Jennifer Lopez      ');
insert into Passenger values(6,'Ray Liotta          ');
insert into Passenger values(7,'Samuel L. Jackson   ');
insert into Passenger values(8,'Nikole Kidman       ');
insert into Passenger values(9,'Alan Rickman        ');
insert into Passenger values(10,'Kurt Russell        ');
insert into Passenger values(11,'Harrison Ford       ');
insert into Passenger values(12,'Russell Crowe       ');
insert into Passenger values(13,'Steve Martin        ');
insert into Passenger values(14,'Michael Caine       ');
insert into Passenger values(15,'Angelina Jolie      ');
insert into Passenger values(16,'Mel Gibson          ');
insert into Passenger values(17,'Michael Douglas     ');
insert into Passenger values(18,'John Travolta       ');
insert into Passenger values(19,'Sylvester Stallone  ');
insert into Passenger values(20,'Tommy Lee Jones     ');
insert into Passenger values(21,'Catherine Zeta-Jones');
insert into Passenger values(22,'Antonio Banderas    ');
insert into Passenger values(23,'Kim Basinger        ');
insert into Passenger values(24,'Sam Neill           ');
insert into Passenger values(25,'Gary Oldman         ');
insert into Passenger values(26,'Clint Eastwood      ');
insert into Passenger values(27,'Brad Pitt           ');
insert into Passenger values(28,'Johnny Depp         ');
insert into Passenger values(29,'Pierce Brosnan      ');
insert into Passenger values(30,'Sean Connery        ');
insert into Passenger values(31,'Bruce Willis        ');
insert into Passenger values(37,'Mullah Omar         ');
select *from Passenger;



insert into Trip values(1100,4,'Boeing    ','Rostov                   ','Paris                    ','14:30:00.000','17:50:00.000');
insert into Trip values(1101,4,'Boeing    ','Paris                    ','Rostov                   ','08:12:00.000','11:45:00.000');
insert into Trip values(1123,3,'TU-154    ','Rostov                   ','Vladivostok              ','16:20:00.000','03:40:00.000');
insert into Trip values(1124,3,'TU-154    ','Vladivostok              ','Rostov                   ','09:00:00.000','19:50:00.000');
insert into Trip values(1145,2,'IL-86     ','Moscow                   ','Rostov                   ','09:35:00.000','11:23:00.000');
insert into Trip values(1146,2,'IL-86     ','Rostov                   ','Moscow                   ','17:55:00.000','20:01:00.000');
insert into Trip values(1181,1,'TU-134    ','Rostov                   ','Moscow                   ','06:12:00.000','08:01:00.000');
insert into Trip values(1182,1,'TU-134    ','Moscow                   ','Rostov                   ','12:35:00.000','14:30:00.000');
insert into Trip values(1187,1,'TU-134    ','Rostov                   ','Moscow                   ','15:42:00.000','17:39:00.000');
insert into Trip values(1188,1,'TU-134    ','Moscow                   ','Rostov                   ','22:50:00.000','00:48:00.000');
insert into Trip values(1195,1,'TU-154    ','Rostov                   ','Moscow                   ','23:30:00.000','01:11:00.000');
insert into Trip values(1196,1,'TU-154    ','Moscow                   ','Rostov                   ','04:00:00.000','05:45:00.000');
insert into Trip values(7771,5,'Boeing    ','London                   ','Singapore                ','01:00:00.000','11:00:00.000');
insert into Trip values(7772,5,'Boeing    ','Singapore                ','London                   ','12:00:00.000','02:00:00.000');
insert into Trip values(7773,5,'Boeing    ','London                   ','Singapore                ','03:00:00.000','13:00:00.000');
insert into Trip values(7774,5,'Boeing    ','Singapore                ','London                   ','14:00:00.000','06:00:00.000');
insert into Trip values(7775,5,'Boeing    ','London                   ','Singapore                ','09:00:00.000','20:00:00.000');
insert into Trip values(7776,5,'Boeing    ','Singapore                ','London                   ','18:00:00.000','08:00:00.000');
insert into Trip values(7777,5,'Boeing    ','London                   ','Singapore                ','18:00:00.000','06:00:00.000');
insert into Trip values(7778,5,'Boeing    ','Singapore                ','London                   ','22:00:00.000','12:00:00.000');
insert into Trip values(8881,5,'Boeing    ','London                   ','Paris                    ','03:00:00.000','04:00:00.000');
insert into Trip values(8882,5,'Boeing    ','Paris                    ','London                   ','22:00:00.000','23:00:00.000');


ALTER TABLE Pass_In_Trip RENAME TO Pass_in_trip;
insert into Pass_in_trip values(1100,'2003-04-29 00:00:00.000',1,'1a        ');
insert into Pass_in_trip values(1123,'2003-04-05 00:00:00.000',3,'2a        ');
insert into Pass_in_trip values(1123,'2003-04-08 00:00:00.000',1,'4c        ');
insert into Pass_in_trip values(1123,'2003-04-08 00:00:00.000',6,'4b        ');
insert into Pass_in_trip values(1124,'2003-04-02 00:00:00.000',2,'2d        ');
insert into Pass_in_trip values(1145,'2003-04-05 00:00:00.000',3,'2c        ');
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00.000',1,'1a        ');
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00.000',6,'1b        ');
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00.000',8,'3c        ');
insert into Pass_in_trip values(1181,'2003-04-13 00:00:00.000',5,'1b        ');
insert into Pass_in_trip values(1182,'2003-04-13 00:00:00.000',5,'4b        ');
insert into Pass_in_trip values(1187,'2003-04-14 00:00:00.000',8,'3a        ');
insert into Pass_in_trip values(1188,'2003-04-01 00:00:00.000',8,'3a        ');
insert into Pass_in_trip values(1182,'2003-04-13 00:00:00.000',9,'6d        ');
insert into Pass_in_trip values(1145,'2003-04-25 00:00:00.000',5,'1d        ');
insert into Pass_in_trip values(1187,'2003-04-14 00:00:00.000',10,'3d        ');
insert into Pass_in_trip values(8882,'2005-11-06 00:00:00.000',37,'1a        ');
insert into Pass_in_trip values(7771,'2005-11-07 00:00:00.000',37,'1c        ');
insert into Pass_in_trip values(7772,'2005-11-07 00:00:00.000',37,'1a        ');
insert into Pass_in_trip values(8881,'2005-11-08 00:00:00.000',37,'1d        ');
insert into Pass_in_trip values(7778,'2005-11-05 00:00:00.000',10,'2a        ');
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00.000',10,'3a        ');
insert into Pass_in_trip values(7771,'2005-11-04 00:00:00.000',11,'4a        ');
insert into Pass_in_trip values(7771,'2005-11-07 00:00:00.000',11,'1b        ');
insert into Pass_in_trip values(7771,'2005-11-09 00:00:00.000',11,'5a        ');
insert into Pass_in_trip values(7772,'2005-11-07 00:00:00.000',12,'1d        ');
insert into Pass_in_trip values(7773,'2005-11-07 00:00:00.000',13,'2d        ');
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00.000',13,'1b        ');
insert into Pass_in_trip values(8882,'2005-11-13 00:00:00.000',14,'3d        ');
insert into Pass_in_trip values(7771,'2005-11-14 00:00:00.000',14,'4d        ');
insert into Pass_in_trip values(7771,'2005-11-16 00:00:00.000',14,'5d        ');
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00.000',14,'1c        ');
commit;

SELECT Pass_in_trip.datee, Trip.Trip_No FROM Pass_in_trip
JOIN Trip ON Pass_in_trip.Trip_No=Trip.Trip_No
WHERE Trip.Town_from='Paris' AND Trip.Town_to='London'
ORDER BY Trip.Trip_No, Pass_in_trip.datee;

SELECT Passenger.name
FROM Passenger
WHERE Passenger.name LIKE 'B%';

SELECT Pass_in_trip.Trip_No,Pass_in_trip.datee,COUNT(Pass_in_trip.Id_psg) AS num_passengers FROM Pass_in_trip
GROUP BY Pass_in_trip.Trip_No, Pass_in_trip.datee
ORDER BY Pass_in_trip.Trip_No, Pass_in_trip.datee;

SELECT Pass_in_trip.Id_psg, COUNT(Pass_in_trip.Trip_No) AS num_trips
FROM Pass_in_trip
GROUP BY Pass_in_trip.Id_psg
HAVING COUNT(Pass_in_trip.Trip_No) > 2
ORDER BY num_trips DESC;

SELECT Company.Comp_Name, Trip.Town_from, Trip.Town_To
FROM Trip
JOIN Company ON Trip.ID_Comp = Company.Id_Comp
ORDER BY Company.Comp_Name, Trip.Town_from, Trip.Town_To;

SELECT Pass_in_trip.Id_psg, Trip.Town_from, Trip.Town_To, COUNT(DISTINCT Pass_in_trip.datee) AS num_trips
FROM Pass_in_trip
JOIN Trip ON Pass_in_trip.Trip_No = Trip.Trip_No
GROUP BY Pass_in_trip.Id_psg, Trip.Town_from, Trip.Town_To
HAVING COUNT(DISTINCT Pass_in_trip.datee) > 2
ORDER BY Pass_in_trip.Id_psg, Trip.Town_from, Trip.Town_To;
