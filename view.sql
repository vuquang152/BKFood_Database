--1.Search food
CREATE VIEW menu_items_with_ellipsis AS
SELECT *
FROM menu_item
WHERE description LIKE '%...%';

--2. Search active orders
CREATE VIEW active_orders AS
SELECT po.id AS order_id, po.customer_id, po.restaurant_id, po.price, po.discount, po.delivery_fee, po.final_price, 
       po.payment_type, po.delivery_address, po.estimated_delivery_time, po.food_ready, po.comment, 
       os.time_order, os.order_status, os.payment_status
FROM placed_order po
JOIN order_status os ON po.id = os.placed_order_id
WHERE po.delivered = B'0'
  AND os.payment_status = 'CONFIRMED';

--3. Search all order of each restaurant
CREATE VIEW restaurant_orders AS
SELECT r.restaurant_name, o.id AS order_id, o.customer_id, o.price, o.final_price, o.delivered, o.payment_type
FROM placed_order o
JOIN restaurant r ON o.restaurant_id = r.id
ORDER BY r.restaurant_name ASC;