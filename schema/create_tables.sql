-- database created
create database taxiapp;
-- use this database
use taxiapp;
-- below, are the tables created

create table customer(
id char(10) primary key,
fname varchar(30) not null,
lname varchar(30) not null,
phone char(10) unique not null,
email varchar(100) unique not null,
password varchar(100) not null
);

create table driver(
id char(10) primary key,
fname varchar(30) not null,
lname varchar(30) not null,
yob int not null check(yob<=2005),
phone char(10) unique not null,
email varchar(100) unique not null,
password varchar(100) not null
);

create table car(
license_plate varchar(7) primary key,
company varchar(30) not null,
model varchar(30) not null,
color varchar(15) not null,
year int not null check(year>=2022),
driver_id char(10) not null,
constraint driver_id_fk foreign key (driver_id) references driver(id)
on delete restrict
on update cascade
);

create table trip(
id char(10) primary key,
pickup_loc varchar(150) not null,
dropoff_loc varchar(150) not null,
car_plate varchar(7),
cost decimal(5,2),
payment_method char(4) default 'cash' not null check(payment_method in ('cash','visa')),
constraint car_trip_fk foreign key (car_plate) references car(license_plate)
on delete set null
on update cascade
);

create table driver_rating(
driver_id char(10),
customer_id char(10),
rating int check(rating>=1 and rating<=5),
constraint rating_pk primary key (driver_id,customer_id),
constraint driver_id_rating_fk foreign key (driver_id) references driver(id)
on delete cascade
on update cascade,
constraint customer_id_rating_fk foreign key (customer_id) references customer(id)
on delete cascade
on update cascade
);

create table customer_trip(
trip_id char(10),
customer_id char(10),
constraint customer_trip_pk primary key (trip_id,customer_id),
constraint customer_id_customertrip_fk foreign key (customer_id) references customer(id)
on delete cascade
on update cascade,
constraint trip_id_customertrip_fk foreign key (trip_id) references trip(id)
on delete cascade
on update cascade
);

create table trip_stop(
trip_id char(10),
stop_number int not null check(stop_number>=1),
location varchar(150) not null,
constraint trip_stop_pk primary key (trip_id,stop_number),
constraint tStop_tId_fk foreign key (trip_id) references trip(id)
on delete restrict
on update cascade
);