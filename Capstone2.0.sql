SELECT 
    CASE 
        WHEN HOUR(order_date_time) BETWEEN 9 AND 14 THEN '9 AM - 3 PM'
        WHEN HOUR(order_date_time) BETWEEN 15 AND 18 THEN '3 PM - 7 PM'
        WHEN HOUR(order_date_time) BETWEEN 19 AND 22 THEN '7 PM - 11 PM'
    END AS time_interval,
    COUNT(*) AS order_count
FROM Orders
GROUP BY time_interval
ORDER BY time_interval;

SELECT 
    CASE 
        WHEN HOUR(order_date_time) BETWEEN 9 AND 14 THEN '9 AM - 3 PM'
        WHEN HOUR(order_date_time) BETWEEN 15 AND 18 THEN '3 PM - 7 PM'
        WHEN HOUR(order_date_time) BETWEEN 19 AND 22 THEN '7 PM - 11 PM'
    END AS time_interval,
    SUM(total) AS total_sales
FROM Orders
GROUP BY time_interval
ORDER BY time_interval;

SELECT 
   e.employee_id,
   e.first_name,
   e.last_name,
   SUM(o.total) AS total_sales
FROM 
   Employees e
JOIN 
   Orders o ON e.employee_id = o.employee_id
GROUP BY 
   e.employee_id, e.first_name, e.last_name
ORDER BY 
   total_sales DESC;
   
   SELECT
    CASE
        WHEN DAYOFWEEK(order_date_time) IN (1, 7) THEN 'Weekend' -- 1 = Sunday, 7 = Saturday
        ELSE 'Weekday'
    END AS day_type,
    ROUND(AVG(total), 2) AS average_sales
FROM Orders
GROUP BY day_type;

SELECT
    DATE(order_date_time) AS order_date,
    ROUND(AVG(total), 2) AS average_sales
FROM Orders
GROUP BY DATE(order_date_time)
ORDER BY order_date;


SELECT 
    t.truck_id,
    COALESCE(round(avg(daily_sales.total), 2), 0) AS avg_daily_sales
FROM 
    Trucks t
LEFT JOIN 
    Employees e ON t.driver_id = e.employee_id
LEFT JOIN 
    (
        SELECT 
            o.employee_id, 
            DATE(o.order_date_time) AS order_date, 
            SUM(o.total) AS total
        FROM 
            Orders o
        GROUP BY 
            o.employee_id, DATE(o.order_date_time)
    ) AS daily_sales ON e.employee_id = daily_sales.employee_id
GROUP BY t.truck_id
ORDER BY t.truck_id;
    

SELECT E.first_name, E.last_name, COUNT(O.order_id) AS total_orders 
FROM Employees E 
LEFT JOIN Orders O ON E.employee_id = O.employee_id 
GROUP BY E.employee_id 
ORDER BY total_orders DESC;