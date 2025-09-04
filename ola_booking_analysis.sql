              -----  OLA Data Analyst Project -----
           
 --- 1. Retrieve all successful bookings ---
      select * from successful_bookings;
 
 --- 2. Find the average ride distance for each vehicle type --- 
	  select * from distance_travel_by_Vehicle;
      
 --- 3. Get the total number of cancelled rides by customers ---
	 select * from total_cancelled_rides_by_customers;
 
 --- 4. List the top 5 customers who booked the highest number of rides ---
     select * from top_5_customer_by_rides;
 
 --- 5. Get the number of rides cancelled by drivers due to personal and car-related issues ---
	 select * from rides_cancelled_due_to_Personal_and_Car_related_issue; 
 
 --- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings ---
     select * from Max_and_min_rating_for_Prime_Sedan_by_driver;
 
 --- 7. Retrieve all rides where payment was made using UPI ---
     select * from  Total_UPI_Payments ;  
 
 --- 8. Find the average customer rating per vehicle type ---
     select * from avg_cust_rating_per_vehicle_type; 
 
 --- 9. Calculate the total booking value of rides completed successfully ---
     select * from successful_booking_amount;
 
 --- 10. List all incomplete rides along with the reason ---
     select * from incomplete_rides ;



  ------ 1. Retrieve all successful bookings: -------
  
create view successful_bookings as
SELECT 
    COUNT(*) AS Total_bokings
FROM
    ola_boking
WHERE
    Booking_Status = 'success';
    
select * from successful_bookings;


 ---- 2. Find the average ride distance for each vehicle type ---

create view distance_travel_by_Vehicle as
  SELECT 
    vehicle_type, ROUND(AVG(Ride_Distance), 2) AS avg_distance
FROM
    ola_boking
GROUP BY 1
ORDER BY 1;
  
 select * from distance_travel_by_Vehicle; 
 
 
 ------ 3. Get the total number of cancelled rides by customers ------
 
create view total_cancelled_rides_by_customers as
SELECT 
    COUNT(*)
FROM
    ola_boking
WHERE
    Booking_Status = 'Canceled by Driver';

select * from total_cancelled_rides_by_customers;


------ 4. List the top 5 customers who booked the highest number of rides -------

create view top_5_customer_by_rides as
SELECT 
    customer_id, COUNT(Booking_Id) as total_rides
FROM
    ola_boking
GROUP BY 1
order by 2 desc
LIMIT 5;
 
 select * from top_5_customer_by_rides;
 
 ---- 5. Get the number of rides cancelled by drivers due to personal and car-related issues ----
 
create view rides_cancelled_due_to_Personal_and_Car_related_issue as
SELECT 
    COUNT(*)
FROM
    ola_boking
WHERE
    Canceled_Rides_by_Driver IN ('Personal & Car related issue');
    
select * from rides_cancelled_due_to_Personal_and_Car_related_issue;


 --- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings ---

create view Max_and_min_rating_for_Prime_Sedan_by_driver as
SELECT 
    MAX(Driver_Ratings) AS max_rating,
    MIN(driver_ratings) AS min_rating
FROM
    ola_boking
WHERE
    Vehicle_Type = 'prime sedan';
    
select * from Max_and_min_rating_for_Prime_Sedan_by_driver;


--- 7. Retrieve all rides where payment was made using UPI ---

create view Total_UPI_Payments as
SELECT 
    COUNT(*) AS total_UPI_Payments
FROM
    ola_boking
WHERE
    Payment_Method = 'UPI';

 select * from  Total_UPI_Payments ;  
 
 
--- 8. Find the average customer rating per vehicle type ---

create view avg_cust_rating_per_vehicle_type as
SELECT 
    Vehicle_type,
    ROUND(AVG(customer_rating), 2) AS avg_cust_rating
FROM
    ola_boking
GROUP BY 1
ORDER BY 2 DESC;

select * from avg_cust_rating_per_vehicle_type;


--- 9. Calculate the total booking value of rides completed successfully ---

create view successful_booking_amount as
SELECT 
    SUM(booking_value) as successful_boking_amount
FROM
    ola_boking
WHERE
    Booking_Status = 'success';
    
select * from successful_booking_amount;


------ 10. List all incomplete rides along with the reason  ----

create view incomplete_rides as
SELECT 
    booking_id,  Booking_Status
FROM
    ola_boking
WHERE  Booking_Status not in ('success');

select * from incomplete_rides ;

    

 
 
 
 
 
