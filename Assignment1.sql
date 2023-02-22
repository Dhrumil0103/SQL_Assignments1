CREATE DATABASE Assignment;
USE assignment;
-- 1. List the three stores with the highest number of customer transaction
CREATE TABLE Ass_sql
(
  Cus_id int unsigned,
  Cus_name VARCHAR (45),
  Shop_name VARCHAR(45),
  Order_id INT,
  Order_price INT
);
INSERT INTO Ass_sql (Cus_id, Cus_name, Shop_name, Order_id, Order_price) Values (111,'Dipal','Shree Traders',1213,12500);
INSERT INTO Ass_sql (Cus_id, Cus_name, Shop_name, Order_id, Order_price) Values (222,'Jayesh','Jyot Traders',2324,16500);
INSERT INTO Ass_sql (Cus_id, Cus_name, Shop_name, Order_id, Order_price) Values (333,'Manish','Shreeji Traders',3435,11500);
INSERT INTO Ass_sql (Cus_id, Cus_name, Shop_name, Order_id, Order_price) Values (444,'Vivek','Vijay Traders',4546,8500);
INSERT INTO Ass_sql (Cus_id, Cus_name, Shop_name, Order_id, Order_price) Values (555,'Lakhan','Mahadev Traders',5657,13500);

SELECT Shop_name, MAX(ORDER_PRICE) AS Higest_Transaction
FROM Ass_sql
group by Shop_name
order by MAX(ORDER_PRICE) DESC
LIMIT 3;

/* 2. Extract employee IDs for all employees who earned a three or high 
   on their last performance review */

CREATE TABLE Ass2_sql
(
  Emp_Id int unsigned,
  Emp_Fname varchar(45),
  Emp_Lwork varchar(55),
  Emp_Lperformance_review INT
);

INSERT INTO ass2_sql (Emp_Id, Emp_Fname, Emp_Lwork, Emp_Lperformance_review) VALUES (00212,'Viken','Accounting',4);
INSERT INTO ass2_sql (Emp_Id, Emp_Fname, Emp_Lwork, Emp_Lperformance_review) VALUES (00258,'Avinash','Sales',7);
INSERT INTO ass2_sql (Emp_Id, Emp_Fname, Emp_Lwork, Emp_Lperformance_review) VALUES (00325,'Kush','Cashier',2);
INSERT INTO ass2_sql (Emp_Id, Emp_Fname, Emp_Lwork, Emp_Lperformance_review) VALUES (00315,'Smit','Marketing',3);
INSERT INTO ass2_sql (Emp_Id, Emp_Fname, Emp_Lwork, Emp_Lperformance_review) VALUES (00423,'Aditya','Account Manager',1);

SELECT Emp_Id, Emp_Lperformance_review,
CASE 
  WHEN Emp_Lperformance_review > 3 THEN 'Performance Review Greater Than 3'
  -- when Emp_Lperformance_review = 3 THEN 'Performance Review Is 3'
ELSE 'Performance Review is less than 3'
END AS REVIEW
FROM ass2_sql;

/*3. Calculate the average monthly sales by product displayed in 
descending order*/
CREATE TABLE Ass3_sql
(
  Bill_no INT unsigned,
  Product_list VARCHAR(45),
  Monthly_sales INT,
  PRIMARY KEY (Bill_no)
);

insert INTO ass3_sql (Bill_no, Product_list, Monthly_sales) values (1214,'Sugar',50500);
insert INTO ass3_sql (Bill_no, Product_list, Monthly_sales) values (1321,'Chilli',64500);
insert INTO ass3_sql (Bill_no, Product_list, Monthly_sales) values (1625,'Garam Masala',36500);
insert INTO ass3_sql (Bill_no, Product_list, Monthly_sales) values (1578,'Hing',24750);
insert INTO ass3_sql (Bill_no, Product_list, Monthly_sales) values (1457,'Haldi Powder',53640);

SELECT Index_no, Month_2022, Sugar, AVG(Sugar) AS Sugar_Sales FROM Ass3_sql
group by Index_no, Month_2022, Sugar
order by avg(sugar) DESC;

SELECT Index_no, Month_2022, Tea, AVG(Tea) AS Tea_Sales FROM Ass3_sql
group by Index_no, Month_2022, Tea
order by avg(Tea) DESC;

SELECT Index_no, Month_2022, Chilli_Powder, AVG(Chilli_Powder) AS Chilli_Powder_Sales FROM Ass3_sql
group by Index_no, Month_2022, Chilli_Powder
order by avg(Chilli_Powder) DESC;

SELECT Index_no, Month_2022, Garam_Masala, AVG(Garam_Masala) AS Garam_Masala_Sales FROM Ass3_sql
group by Index_no, Month_2022, Garam_Masala
order by avg(Garam_Masala) DESC;

SELECT Index_no, Month_2022, Haldi_Powder, AVG(Haldi_Powder) AS Haldi_Powder_Sales FROM Ass3_sql
group by Index_no, Month_2022, Haldi_Powder
order by avg(Haldi_Powder) DESC;

/* 4. Find and remove duplicate in the table without creating another 
table.*/
CREATE TABLE Ass4_sql
(
  Index_No INT unsigned,
  St_Name VARCHAR(45),
  St_City VARCHAR(45),
  primary key (Index_No)
);

INSERT INTO ass4_sql (Index_No, St_Name, St_City) values (111,'Pinkesh','Mehsana');
INSERT INTO ass4_sql (Index_No, St_Name, St_City) values (222,'Vraj','Vadodara');
INSERT INTO ass4_sql (Index_No, St_Name, St_City) values (333,'Kishan','Anand');
INSERT INTO ass4_sql (Index_No, St_Name, St_City) values (444,'Manav','Vadodara');
INSERT INTO ass4_sql (Index_No, St_Name, St_City) values (555,'Pratham','Vadodara');
INSERT INTO ass4_sql (Index_No, St_Name, St_City) values (666,'Anant','Anand');

SELECT St_city, count(St_City) AS Duplicate_count
from Ass4_sql
group by st_city;

-- 5. Identify the common record between two tables
CREATE TABLE Ass5_sql
(
  A_Id INT unsigned,
  A_Name VARCHAR(45),
  A_Transaction INT,
  PRIMARY KEY (A_Id)
);
INSERT INTO Ass5_sql (A_Id, A_Name, A_Transaction) values (123,'Ashish',12000);
INSERT INTO Ass5_sql (A_Id, A_Name, A_Transaction) values (234,'Milan',24000);
INSERT INTO Ass5_sql (A_Id, A_Name, A_Transaction) values (345,'Ankit',34000);
INSERT INTO Ass5_sql (A_Id, A_Name, A_Transaction) values (456,'Hiren',55000);
INSERT INTO Ass5_sql (A_Id, A_Name, A_Transaction) values (567,'Vimal',26000);

create table Ass0_sql
(
  B_Id Int unsigned,
  B_name varchar(45),
  B_transaction INT,
  primary key(B_Id)
);
INSERT INTO Ass0_sql (B_Id, B_Name, B_Transaction) values (456,'Hiren','55000');
INSERT INTO Ass0_sql (B_Id, B_Name, B_Transaction) values (234,'Milan',24000);
INSERT INTO Ass0_sql (B_Id, B_Name, B_Transaction) values (890,'Vinay',14000);
INSERT INTO Ass0_sql (B_Id, B_Name, B_Transaction) values (990,'Milan',24000);
INSERT INTO Ass0_sql (B_Id, B_Name, B_Transaction) values (567,'Vimal',26000);

SELECT * FROM ass5_sql INTERSECT SELECT * FROM Ass0_sql;

-- **Finished**