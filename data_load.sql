-- =========================
-- CUSTOMERS
-- =========================

INSERT INTO customers VALUES
(1,'Aarav Mehta','aarav@gmail.com','Mumbai','2023-01-10'),
(2,'Riya Sharma','riya@gmail.com','Delhi','2023-02-15'),
(3,'Kabir Singh','kabir@gmail.com','Bangalore','2023-03-12'),
(4,'Ananya Gupta','ananya@gmail.com','Pune','2023-04-01'),
(5,'Rahul Verma','rahul@gmail.com','Hyderabad','2023-05-19'),
(6,'Sneha Kapoor','sneha@gmail.com','Chennai','2023-06-21'),
(7,'Arjun Nair','arjun@gmail.com','Kolkata','2023-07-08'),
(8,'Meera Joshi','meera@gmail.com','Ahmedabad','2023-08-11'),
(9,'Dev Patel','dev@gmail.com','Mumbai','2023-09-14'),
(10,'Isha Malhotra','isha@gmail.com','Delhi','2023-10-10'),
(11,'Karan Shah','karan@gmail.com','Pune','2023-11-02'),
(12,'Priya Desai','priya@gmail.com','Bangalore','2023-11-18'),
(13,'Yash Jain','yash@gmail.com','Mumbai','2024-01-05'),
(14,'Simran Kaur','simran@gmail.com','Delhi','2024-01-12'),
(15,'Rohit Das','rohit@gmail.com','Hyderabad','2024-01-20'),
(16,'Neha Rao','neha@gmail.com','Chennai','2024-02-11'),
(17,'Vikram Roy','vikram@gmail.com','Kolkata','2024-02-18'),
(18,'Pooja Bansal','pooja@gmail.com','Ahmedabad','2024-03-02'),
(19,'Aditi Sinha','aditi@gmail.com','Mumbai','2024-03-09'),
(20,'Manav Arora','manav@gmail.com','Delhi','2024-03-20');

-- =========================
-- PRODUCTS
-- =========================

INSERT INTO products VALUES
(101,'iPhone 15','Electronics',79999),
(102,'Samsung Galaxy S24','Electronics',69999),
(103,'Boat Headphones','Accessories',2999),
(104,'Nike Shoes','Fashion',4999),
(105,'Adidas T-Shirt','Fashion',1999),
(106,'HP Laptop','Electronics',65000),
(107,'Dell Monitor','Electronics',15000),
(108,'Wildcraft Backpack','Accessories',2499),
(109,'Puma Hoodie','Fashion',3499),
(110,'Apple Watch','Electronics',45000),
(111,'Keyboard','Accessories',1499),
(112,'Mouse','Accessories',999),
(113,'Gaming Chair','Furniture',12000),
(114,'Study Table','Furniture',8500),
(115,'Water Bottle','Home',499),
(116,'Mixer Grinder','Home',3999),
(117,'Bedsheet','Home',1499),
(118,'Smart TV','Electronics',55000),
(119,'Bluetooth Speaker','Accessories',3999),
(120,'Office Lamp','Home',1999);

-- =========================
-- ORDERS
-- =========================

INSERT INTO orders VALUES
(1001,1,'2024-01-05','delivered'),
(1002,2,'2024-01-10','delivered'),
(1003,3,'2024-01-15','cancelled'),
(1004,1,'2024-02-01','delivered'),
(1005,4,'2024-02-11','pending'),
(1006,5,'2024-02-14','delivered'),
(1007,6,'2024-02-20','delivered'),
(1008,7,'2024-03-01','delivered'),
(1009,8,'2024-03-03','cancelled'),
(1010,9,'2024-03-08','delivered'),
(1011,10,'2024-03-11','delivered'),
(1012,11,'2024-03-15','delivered'),
(1013,12,'2024-03-20','pending'),
(1014,13,'2024-04-01','delivered'),
(1015,14,'2024-04-04','delivered'),
(1016,15,'2024-04-10','delivered'),
(1017,16,'2024-04-15','cancelled'),
(1018,17,'2024-04-20','delivered'),
(1019,18,'2024-04-25','delivered'),
(1020,19,'2024-05-01','delivered');

-- =========================
-- ORDER ITEMS
-- =========================

INSERT INTO order_items VALUES
(1,1001,101,1,79999),
(2,1001,103,2,2999),
(3,1002,104,1,4999),
(4,1002,105,2,1999),
(5,1003,106,1,65000),
(6,1004,110,1,45000),
(7,1005,108,1,2499),
(8,1006,118,1,55000),
(9,1007,111,2,1499),
(10,1008,112,3,999),
(11,1009,113,1,12000),
(12,1010,114,1,8500),
(13,1011,115,5,499),
(14,1012,116,1,3999),
(15,1013,117,2,1499),
(16,1014,119,1,3999),
(17,1015,120,2,1999),
(18,1016,102,1,69999),
(19,1017,107,1,15000),
(20,1018,109,2,3499),
(21,1019,103,1,2999),
(22,1020,101,1,79999);
