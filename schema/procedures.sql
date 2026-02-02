-- below, are the procedures 
delimiter //
create procedure book_trip(in tid char(10), in tpickl varchar(150),in tdropl varchar(150), in tmethod char(4))
begin
insert into trip (id,pickup_loc,dropoff_loc,payment_method) values
(tid,tpickl,tdropl,tmethod);
end//
delimiter ;

delimiter //
create procedure additional_Tdetail(in Dtrip_id char(10), in Dcar_plate char(7), in Dcost decimal(5,2))
begin
update trip set
car_plate = Dcar_plate,
cost = Dcost
where id = Dtrip_id;
end//
delimiter ;

delimiter //
create procedure see_car_trips(in license_num varchar(7))
begin
select t.id as Trip_ID, t.pickup_loc as PickUp_Location, t.dropoff_loc as DropOff_Location, t.cost as Cost, t.payment_method as Payment_Method from trip as t
where t.car_plate = license_num;
end//
delimiter ;

delimiter //
create procedure see_driver_trips(in Cdriver_id char(10))
begin
select t.id as Trip_ID, t.pickup_loc as PickUp_Location, t.dropoff_loc as DropOff_location, t.car_plate as Car_plate, t.cost as Cost, t.payment_method as Payment_method from trip as t
join car on t.car_plate = car.license_plate
join driver on car.driver_id = driver.id
where driver.id = Cdriver_id;
end//
delimiter ;