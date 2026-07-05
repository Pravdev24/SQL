-- NOT NULL - Ensures that a column cannot have a NULL value
-- UNIQUE - Ensures that all values in a column are unique
-- PRIMARY KEY - Uniquely identifies each row in a table (a combination of a NOT NULL and UNIQUE)
-- FOREIGN KEY - Establishes a link between data in two tables, and prevents action that will destroy the link between them
				-- we have two table on has foreign key that should only take the values from another table primary key coulmn	
                -- CREATE TABLE Orders (
-- 					OrderID INT PRIMARY KEY, -- (a combination of a NOT NULL and UNIQUE)
-- 					OrderDate DATE,
-- 					CustomerID INT,
-- 					FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- CustomerID refer to the another table Customers(CustomerID)
-- 				);
-- CHECK - Ensures that the values in a column satisfies a specific condition
-- DEFAULT - Sets a default value for a column if no value is specified
-- CREATE INDEX - Creates indexes on columns to retrieve data from the database faster

create table product(
    p_id int primary key,
    p_name varchar(30) unique, -- all product name should be different
    price decimal(6,2), -- default 10.30 -- if not mention any values for price default value will be taken (10.30)
    constraint check_price check (price > 0) -- check_price-> name only add the value if the value is greaterthan zero rupees
);

select * from product;

alter table product -- add and drop constraint
drop CONSTRAINT check_price; 
alter table product
add constraint check_price check (price > 0);

alter table product
add constraint unique (p_id); 
-- alter table product
-- add constraint primary key (p_id); 

alter table product
alter price set default 15;

drop table product;

insert into product (p_id, p_name) -- if not mention any values for price default value will be taken what we mention after default
values (00, "potato");

insert into product (p_id, p_name, price)
values (01, "rice", "300.34");
insert into product -- Error Code: 1062. Duplicate entry 'rice' for key 'product.p_name'
values (02, "rice", "360.64");
insert into product 
values (03, "masala", "0");

select * from product;


-- Primary Key
-- auto_increment function it will increment the values 
create table transactions(
	-- trans_id int primary key auto_increment, -- without parimary key auto_increment wont work 
    trans_id int,
    amount decimal(6,2)
);

drop table transactions;

alter table transactions
add constraint primary key (trans_id);

alter table transactions
modify trans_id int auto_increment;

alter table transactions
modify trans_id int primary key auto_increment;

alter table transactions -- it will start from 200
auto_increment = 200 ;


select * from transactions;

insert into transactions(amount) -- it will start add 1,2 and so on
values (10);
insert into transactions(trans_id, amount) -- after this it will start add 35,36 and so on 
values (34, 10); -- 


-- foreign key = realtional database

CREATE TABLE customers (
    cus_id INT PRIMARY KEY AUTO_INCREMENT,
    cus_name VARCHAR(40),
    age INT
);

alter table customers
auto_increment = 1001;

insert into customers (cus_name, age) values 
	("praveen", 26),
	("jai", 25),
	("goms", 23),
	("sai", 24),
    ("gokz", 26),
	("kl", 15),
	("bav", 33),
	("siva", 30); 
    
select * from customers;
drop table customers;

create table transactions(
	trans_id int primary key auto_increment, -- without parimary key auto_increment wont work
    amount decimal(6,2),
    purchase_date datetime,
    customer_id int,
    -- constraint FK_c_id -- foreign key name
    foreign key(customer_id) references customers(cus_id)
);

alter table transactions
modify customer_id int not null;

alter table transactions -- remove foreign key without setting the name for the foreign key
drop foreign key transactions_ibfk_1; -- transactions_ibfk_1 name will  left side SCHEMAS information

alter table transactions -- add foreign key 
add constraint FK_c_id -- after this you can remove using this name no need see SCHEMAS
foreign key(customer_id) references customers(cus_id);

insert into transactions (amount, purchase_date, customer_id) values
	(30.33, now(), 1001),
    (43.33, now(), 1003),
    (7, now(), 1002);
    
insert into transactions (amount, purchase_date, customer_id) 
values (30.33, now(), null);

select * from transactions;
drop table transactions;
	










