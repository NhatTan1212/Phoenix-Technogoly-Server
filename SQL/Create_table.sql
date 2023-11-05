CREATE TABLE USERS (
  id int NOT NULL PRIMARY KEY identity(1,1),
  name Nvarchar(100) NOT NULL,
  password varchar(255) NOT NULL,
  email varchar(100) NOT NULL
)

select * FROM USERS

ALTER TABLE USERS ADD role varchar(50);

DELETE TOP(20) FROM USERS

CREATE TABLE PRODUCTS (
  id INT IDENTITY(1,1) PRIMARY KEY,
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
  updated_at DATETIME DEFAULT GETDATE()
);


select * FROM PRODUCTS 

DELETE TOP(3) FROM PRODUCTS


CREATE TABLE CARTS (
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
	foreign key(product_id) references PRODUCTS(id)
);


select * FROM CARTS 
select * from USERS

INSERT INTO CARTS (user_id, product_id, description, avatar, price, is_possible_to_order, count, product_total, created_at, updated_at)
SELECT @user_id, @product_id, prod_description, avatar, price, quantity, @count, price * @count, GETDATE(), GETDATE()
FROM PRODUCTS
WHERE id = @product_id;

declare @product_id int = 33;
declare @count int = 2;
declare @user_id int = 2015;
UPDATE CARTS
    SET count = count-2
    WHERE user_id = @user_id AND product_id = @product_id;


declare @product_id int = 31;
declare @count int = 2;
declare @user_id int = 2015;
select * FROM CARTS 
delete CARTS
where user_id = @user_id
AND product_id = @product_id


declare @product_id int = 33;
declare @count int = 2;
declare @user_id int = 2015;
UPDATE CARTS
SET count = count + 3,
	count = CASE
        WHEN count >= is_possible_to_order THEN count - 3
    END
WHERE user_id = @user_id AND product_id = @product_id;

select * FROM CARTS 
select * from PRODUCTS

declare @product_id int = 33;
declare @count int = 2;
declare @user_id int = 2015;
UPDATE CARTS
SET count = count + 0,
	is_possible_to_order = 27,
	product_total = count * price,
	updated_at = CURRENT_TIMESTAMP
WHERE user_id = @user_id AND product_id = @product_id
    AND count +0 <= is_possible_to_order;

UPDATE CARTS
SET price = count + 0

SELECT *
FROM ORDERS
WHERE id = (SELECT MAX(id) FROM ORDERS);