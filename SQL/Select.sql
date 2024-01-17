select * from USERS
Select * from IMAGES
select * from PRODUCTS
select * from BRANDS
select * from PROVIDED_USERS
select * from CARTS
select * from ORDERS
select * from ORDER_DETAILS
select * from REVIEWS
select * from CATEGORIES
select COUNT(*) FROM IMAGES

UPDATE BRANDS
SET slug = LOWER(name);

UPDATE CATEGORIES
SET slug = 'laptop-gaming'
where name='Laptop Gaming'

UPDATE CATEGORIES
SET slug = 'laptop-vanphong'
where name=N'Laptop Văn Phòng'

UPDATE CATEGORIES
SET slug = 'laptop-caocap-sangtrong'
where name=N'Laptop Cao Cấp - Sang Trọng'

UPDATE CATEGORIES
SET slug = 'laptop-dohoa-kythuat'
where name=N'Laptop Đồ Họa - Kỹ Thuật'

UPDATE CATEGORIES
SET slug = 'laptop-mongnhe-thoitrang'
where name=N'Laptop Mỏng Nhẹ - Thời Trang'

SELECT id, brand_id, category_id, prod_name
FROM PRODUCTS
WHERE category_id IN (SELECT category_id FROM CATEGORIES WHERE slug IN ('laptop-gaming'));


UPDATE IMAGES
SET url = REPLACE(url, 'http://localhost:8000/', 'https://phoenixlt.azurewebsites.net/')
WHERE url LIKE 'http://localhost:8000/%';

UPDATE PRODUCTS
SET avatar = REPLACE(avatar, 'http://localhost:8000/', 'https://phoenixlt.azurewebsites.net/')
WHERE avatar LIKE 'http://localhost:8000/%';

UPDATE CARTS
SET avatar = REPLACE(avatar, 'http://localhost:8000/', 'https://phoenixlt.azurewebsites.net/')
WHERE avatar LIKE 'http://localhost:8000/%';

UPDATE ORDERS
SET avatar = REPLACE(avatar, 'http://localhost:8000/', 'https://phoenixlt.azurewebsites.net/')
WHERE avatar LIKE 'http://localhost:8000/%';

UPDATE BRANDS
SET image = REPLACE(image, 'http://localhost:8000/', 'https://phoenixlt.azurewebsites.net/')
WHERE image LIKE 'http://localhost:8000/%';


ALTER TABLE ORDERS
ADD status NVARCHAR(255);

ALTER TABLE ORDERS
ADD successful_at DATETIME;

ALTER TABLE ORDERS
ADD paid_at DATETIME;

select * from ORDER_DETAILS where order_id = 14023
update IMAGES set url = 'http://localhost:8000/upload/laptop-hp-victus-16-5.png' where image_id=5

update USERS set role = 'admin' where id=7019
update ORDERS set is_success=0 where id=3015
select * FROM ORDERS where user_id = 1 or guest_id='0e7d7f8a-c185-462f-9301-3543604aa8ac'

delete from USERS where email='honhattan1@dtu.edu.vn'
delete from CARTS where user_id=7021
delete from ORDERS where id=10010
delete from ORDER_DETAILS where order_id=10010
DELETE FROM PRODUCTS
        WHERE id = 23;

WITH CTE AS (
    SELECT TOP 2 *
    FROM IMAGES
    WHERE product_id = 1034
    ORDER BY image_id DESC
)

DELETE FROM CTE;

SELECT p.id, p.prod_name, p.price, p.quantity, b.name, b.image
FROM PRODUCTS p, BRANDS b
WHERE p.brand_id = b.brand_id;

 INSERT INTO IMAGES ( product_id, image_url, url)
    VALUES ( 1034, 'http://localhost:8000/upload/laptop-hp-victus-16-fullsz.png', 'http://localhost:8000/upload/laptop-hp-victus-16-5.png')

update IMAGES set image_url = 'http://localhost:8000/upload/laptop-hp-victus-16-fullsz.png' where product_id = 1034 and image_id = 1

INSERT INTO CARTS (user_id, product_id, guest_id, prod_name, description, avatar, price, 
                            is_possible_to_order, count, product_total, created_at, updated_at)
        SELECT null, 31, '77ab2858-344e-4e87-a664-c5262bad5160' , prod_name, prod_description, avatar, price, 
                quantity, 1, price * 1, GETDATE(), GETDATE()
        FROM PRODUCTS
        WHERE id = 31;