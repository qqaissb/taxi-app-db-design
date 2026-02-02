-- below, are the views
create view driver_info as
select d.id as Driver_ID, d.fname as First_Name, d.lname as Last_Name,(2025 - d.yob) as Age, d.phone as Phone_Number,count(distinct t.id) as Total_Trips ,avg(r.rating) as Rating from driver as d
left join driver_rating as r on d.id = r.driver_id
left join car as c on d.id = c.driver_id
left join trip as t on c.license_plate = t.car_plate
group by d.id;

create view customer_info as
select c.id as Customer_ID, c.fname as First_Name, c.lname as Last_Name, c.phone as Phone_Number, count(ct.trip_id) as Total_Trips from customer as c
left join customer_trip as ct on c.id = ct.customer_id
group by c.id;

create view car_info as
select c.license_plate as License_Plate_Number, c.company as Company_Name, c.model as Model_Name,c.color as Color, c.year as Year_Of_Manufacture, d.id as Driver_ID,d.fname as First_Name ,d.lname as Last_Name from car as c
join driver as d on c.driver_id = d.id;

create view trip_info as
select t.id as Trip_ID,t.pickup_loc as PickUp_Location, t.dropoff_loc as DropOff_Location, t.cost as Cost, t.payment_method as Payment_Method,d.id as Driver_ID,d.fname as Driver_First_Name, d.lname as Driver_Last_Name,t.car_plate as Car_Plate_Number , count(ct.customer_id) as Number_Of_Customers from trip as t
left join customer_trip as ct on t.id = ct.trip_id
left join car as c on t.car_plate = c.license_plate
left join driver as d on c.driver_id = d.id
group by t.id;