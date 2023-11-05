CREATE TABLE USERS2 (
  id int NOT NULL PRIMARY KEY identity(1,1),
  name Nvarchar(100) NOT NULL,
  password varchar(255) NOT NULL,
  email varchar(100) NOT NULL
);
SET IDENTITY_INSERT USERS2 OFF
insert into USERS2(id,name, password, email) 
select id, name, password, email
from USERS

select * from USERS2

ALTER TABLE USERS2
ALTER COLUMN password varchar(255) null;

insert into USERS2(name, email) 
values('test2213', 'tes123123t@gmail.com')

CREATE TABLE PRODUCTS_NEW_2 (
  id INT IDENTITY(1,1) PRIMARY KEY,
  brand_id INT,
  category_id INT,
  prod_name NVARCHAR(255) NOT NULL,
  avatar NVARCHAR(255),
  prod_description NVARCHAR(MAX),
  manufacturer NVARCHAR(255),
  price FLOAT,
  cost FLOAT,
  quantity INT,
  prod_percent FLOAT,
  cpu NVARCHAR(255),
  hard_drive NVARCHAR(255),
  mux_switch NVARCHAR(255),
  screen NVARCHAR(255),
  webcam NVARCHAR(255),
  connection NVARCHAR(255),
  prod_weight NVARCHAR(255),
  pin NVARCHAR(255),
  operation_system NVARCHAR(255),
  created_at DATETIME DEFAULT GETDATE(),
  updated_at DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (brand_id) REFERENCES BRANDS (brand_id),
  FOREIGN KEY (category_id) REFERENCES CATEGORIES (category_id)
);

insert into PRODUCTS_NEW_2(id,prod_name, avatar,prod_description,manufacturer,price,cost,quantity,prod_percent,cpu,
                            hard_drive,mux_switch,screen,webcam,connection,prod_weight,pin,operation_system) 
select id,prod_name, avatar,prod_description,manufacturer,price,cost,quantity,prod_percent,cpu,
            hard_drive,mux_switch,screen,webcam,connection,prod_weight,pin,operation_system
from PRODUCTS

SET IDENTITY_INSERT PRODUCTS_NEW_2 ON;


select * from PRODUCTS_NEW_2
select * from CARTS_NEW_2
select * from ORDER_DETAILS_NEW_2 order by (product_id)
select * from REVIEWS_NEW_2

SET IDENTITY_INSERT PRODUCTS_NEW ON;
UPDATE PRODUCTS_NEW SET id = 23 WHERE id = 1;
DROP TABLE Products;
DROP TABLE CARTS_NEW;
DROP TABLE ORDER_DETAILS_NEW;
DROP TABLE REVIEWS_NEW;
DROP TABLE CARTS_NEW_2;
DROP TABLE ORDER_DETAILS_NEW_2;
DROP TABLE REVIEWS_NEW_2;
DROP TABLE Products;

CREATE TABLE CARTS_NEW_2 (
    user_id INT,
    product_id INT,
	prod_name NVARCHAR(255),
    description NVARCHAR(MAX),
    avatar NVARCHAR(255),
    price FLOAT,
    is_possible_to_order INT,
    count INT,
    product_total FLOAT,
    created_at DATETIME,
    updated_at DATETIME,
	foreign key(user_id) references USERS(id),
	foreign key(product_id) references PRODUCTS_NEW_2(id)
);
CREATE TABLE ORDER_DETAILS_NEW_2 (
  product_id INT,
  order_id INT,
  quantity INT,
  price FLOAT,
  created_at DATETIME,
  updated_at DATETIME,
  foreign key(product_id) references PRODUCTS_NEW_2(id),
  FOREIGN KEY (order_id) REFERENCES ORDERS(id)
);

CREATE TABLE REVIEWS_NEW_2 (
  review_id INT IDENTITY(1,1) PRIMARY KEY,
  product_id INT,
  user_id INT,
  rating INT,
  comment NVARCHAR(MAX),
  created_at DATETIME,
  FOREIGN KEY (product_id) REFERENCES PRODUCTS_NEW_2(id),
  FOREIGN KEY (user_id) REFERENCES USERS(id)
);
INSERT INTO CARTS_NEW_2 (user_id, product_id, prod_name, description, avatar, price, is_possible_to_order, count, product_total, created_at, updated_at)
SELECT user_id, product_id, prod_name, description, avatar, price, is_possible_to_order, count, product_total, created_at, updated_at
FROM CARTS;

INSERT INTO ORDER_DETAILS_NEW_2 (product_id, order_id, quantity, price, created_at, updated_at)
SELECT product_id, order_id, quantity, price, created_at, updated_at
FROM ORDER_DETAILS;

INSERT INTO REVIEWS_NEW_2 (product_id, user_id, rating, comment, created_at)
SELECT product_id, user_id, rating, comment, created_at
FROM REVIEWS;

EXEC sp_rename 'PRODUCTS_NEW_2', 'PRODUCTS';
EXEC sp_rename 'CARTS_NEW_2', 'CARTS';
EXEC sp_rename 'ORDER_DETAILS_NEW_2', 'ORDER_DETAILS';
EXEC sp_rename 'REVIEWS_NEW_2', 'REVIEWS';