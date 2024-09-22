
--Table 1 (SALES)

Create Table sales
(
	sales_id serial primary key,
	order_id int,
	product_id int,
	quantity int,
	amount int	
) 
alter table sales
drop column customers_id 
select * from sales	
copy sales (sales_id,order_id,product_id,quantity,amount) from 'D:\PowerBI_TASK\BIG_TASK_CSV.xlsx.csv' DELIMITER ',' CSV HEADER

--Table 2 (CUSTOMERS)
	
Create Table Customers
(
	customer_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	phone int,
	city varchar(100),
	county varchar(50)
)
alter table customers
add column country varchar(50)	
Insert into customers (customer_id,first_name,last_name,phone,city,country) 
values (1,'jaya','gupta',12321,'nagpur','india'),(2,'pooja','sujal',235252,'pune','india'),(3,'Akshay','karmankar',557675,'amravati','india'),
(4,'jagruti','dunedar',4545645,'nagpur','india'),(5,'sejal','wanjari',24121,'banglore','india')
select * from customers

--Table 3 (PRODUCT)

Create Table Products(
	product_id serial primary key,
	product_name varchar(100),
	price int,
	category varchar(50)
)

Insert into Products (product_id,product_name,price,category) 
values (1,'Laptop',65000,'Electronics'),(2,'Washingmachine',20000,'Electronics'),(3,'playingcar',65000,'Toys'),
(4,'dinning_Table',35000,'Furniture'),(5,'book',1000,'Book'),(6,'Tennis_Racket',65000,'sport')
select * from products

--Table 4 (Shipment)

Create Table Shipment(
	Shipment_id serial primary key,
	order_id int REFERENCES sales (sales_id),
	ship_date date,
	ship_mode varchar(50),
	carrier varchar(50)
)

INSERT INTO shipment (Shipment_id,order_id, ship_date, ship_mode, carrier)
VALUES 
(1,1, '2024-09-10', 'Standard Shipping', 'FedEx'),
(2,2, '2024-09-11', 'Express Shipping', 'UPS'),
(3,3, '2024-09-12', 'Two-Day Shipping', 'DHL'),
(4,4, '2024-09-13', 'Overnight Shipping', 'FedEx'),
(5,5, '2024-09-14', 'Same-Day Delivery', 'Amazon Logistics'),
(6,6, '2024-09-15', 'Economy Shipping', 'USPS'),
(7,7, '2024-09-16', 'In-Store Pickup', 'N/A'),
(8,8, '2024-09-17', 'Curbside Pickup', 'N/A'),
(9,9, '2024-09-18', 'Drone Delivery', 'Amazon Drone Service'),
(10,10, '2024-09-19', 'Freight Shipping', 'XPO Logistics');

select * from shipment

--FULL JOIN QUERY
	
SELECT *
FROM sales s
FULL OUTER JOIN shipment sh ON s.order_id = sh.order_id
FULL OUTER JOIN products p ON s.product_id = p.product_id
FULL OUTER JOIN customers c ON s.customer_id = c.customer_id;