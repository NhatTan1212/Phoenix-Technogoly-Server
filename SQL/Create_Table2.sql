CREATE TABLE USERS (
  id int NOT NULL PRIMARY KEY identity(1,1),
  name Nvarchar(100) NOT NULL,
  password varchar(255) NOT NULL,
  email varchar(100) NOT NULL
);

ALTER TABLE USERS
ADD registration_token varchar(255)

ALTER TABLE USERS
ADD confirmation_status varchar(10)


SELECT TOP 1 * FROM USERS ORDER BY id DESC;

CREATE TABLE PROVIDED_USERS (
  user_id int,
  name Nvarchar(100),
  email varchar(100),
  provider varchar(255),
  foreign key(user_id) references USERS(id)
);

CREATE TABLE PRODUCTS (
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

ALTER TABLE PRODUCTS
ALTER COLUMN id INT IDENTITY(1,1) PRIMARY KEY;


SET IDENTITY_INSERT PRODUCTS ON;


ALTER TABLE PRODUCTS
ADD brand_id INT
ADD FOREIGN KEY (brand_id) REFERENCES BRANDS (brand_id),
ALTER TABLE PRODUCTS
ADD ram Nvarchar(125), graphics Nvarchar(125)

ADD category_id INT,
ADD FOREIGN KEY (category_id) REFERENCES CATEGORIES (category_id);

CREATE TABLE BRANDS (
    brand_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
ALTER TABLE BRANDS
ADD slug NVARCHAR(255) NULL; 
insert into BRANDS 

CREATE TABLE CATEGORIES (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255),
	created_at DATETIME DEFAULT GETDATE(),
	updated_at DATETIME DEFAULT GETDATE()
);
ALTER TABLE CATEGORIES
ADD slug NVARCHAR(255) NULL; 


CREATE TABLE IMAGES (
  image_id INT IDENTITY(1,1) PRIMARY KEY,
  product_id INT,
  image_url NVARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES PRODUCTS (id)
);

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
ALTER TABLE CARTS
ADD id int IDENTITY(1,1) PRIMARY KEY;

ALTER TABLE CARTS
ADD guest_id varchar(50);

ALTER TABLE CARTS
DROP COLUMN guest_id;

CREATE TABLE ORDERS (
  id INT IDENTITY(1,1) PRIMARY KEY,
  paymentMethods VARCHAR(255),
  total FLOAT,
  user_id INT,
  name Nvarchar(100) NOT NULL,
  email varchar(100),
  user_address Nvarchar(255) NOT NULL,
  phone varchar(25),
  trading_code VARCHAR(255),
  is_payment INT,
  is_transported INT,
  is_success INT,
  created_at DATETIME,
  updated_at DATETIME,
  foreign key(user_id) references USERS(id)
);

ALTER TABLE ORDERS
ADD guest_id varchar(50);

ALTER TABLE ORDERS
ADD avatar Nvarchar(255);

ALTER TABLE ORDERS
ADD is_being_shipped int;

ALTER TABLE ORDERS
ADD note Nvarchar(255);

CREATE TABLE ORDER_DETAILS (
  product_id INT,
  order_id INT,
  quantity INT,
  price FLOAT,
  created_at DATETIME,
  updated_at DATETIME,
  foreign key(product_id) references PRODUCTS(id),
  FOREIGN KEY (order_id) REFERENCES ORDERS(id)
);

CREATE TABLE REVIEWS (
  review_id INT IDENTITY(1,1) PRIMARY KEY,
  product_id INT,
  user_id INT,
  rating INT,
  comment NVARCHAR(MAX),
  created_at DATETIME,
  FOREIGN KEY (product_id) REFERENCES PRODUCTS(id),
  FOREIGN KEY (user_id) REFERENCES USERS(id)
);

ALTER TABLE REVIEWS
ADD updated_at DATETIME;

ALTER TABLE ORDERS
ADD is_rated INT;

select * from USERS
select * from PROVIDED_USERS
select * from CARTS
select * from PRODUCTS
select * from ORDERS
select * from ORDER_DETAILS
select * from REVIEWS
select * from CATEGORIES

ALTER TABLE USERS ALTER COLUMN password DROP NOT NULL;
ALTER TABLE USERS ADD provider VARCHAR(255);
ALTER TABLE PROVIDED_USERS ADD subject VARCHAR(255);
ALTER TABLE USERS
ALTER COLUMN password varchar(255) null;
ALTER TABLE USERS
ALTER COLUMN email varchar(100) null;

DELETE PROVIDED_USERS where provider = 'https://www.facebook.com'
DELETE ORDER_DETAILS where order_id = 3012

select * FROM ORDER_DETAILS where order_id = 3013
select * from PRODUCTS where manufacturer ='Dell'
select * FROM REVIEWS where product_id = 3