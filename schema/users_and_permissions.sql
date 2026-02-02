-- the users, which are the driver and customer
create user 'driver'@'localhost' identified by 'd123d';
create user 'customer'@'localhost' identified by 'c123c';
create user 'technical'@'localhost' identified by 't123t';

-- granting the user some permissions
-- customer permissions
grant execute on procedure taxiapp.book_trip to 'customer'@'localhost';
grant insert on taxiapp.customer to 'customer'@'localhost';
grant insert on taxiapp.trip_stop to 'customer'@'localhost';
grant insert on taxiapp.customer_trip to 'customer'@'localhost';
grant insert on taxiapp.driver_rating to 'customer'@'localhost';

-- driver permissions
grant insert on taxiapp.driver to 'driver'@'localhost';
grant insert on taxiapp.car to 'driver'@'localhost';

-- technical support permisissons
grant execute on procedure taxiapp.additional_Tdetail to 'technical'@'localhost';
grant execute on procedure taxiapp.see_driver_trips to 'technical'@'localhost';
grant execute on procedure taxiapp.see_car_trips to 'technical'@'localhost';
grant select on taxiapp.car_info to 'technical'@'localhost';
grant select on taxiapp.trip_info to 'technical'@'localhost';
grant select on taxiapp.driver_info to 'technical'@'localhost';
grant select on taxiapp.customer_info to 'technical'@'localhost';
grant select,delete,update on taxiapp.trip_stop to 'technical'@'localhost';
grant select,delete,update on taxiapp.driver_rating to 'technical'@'localhost';
grant select,delete,update on taxiapp.customer_trip to 'technical'@'localhost';