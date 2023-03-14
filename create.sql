CREATE TABLE Customers
(
  customer_id INT NOT NULL,
  customer_name VARCHAR NOT NULL,
  phone_number VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE Customer_payment
(
  payment_id INT NOT NULL,
  payment_type VARCHAR NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Restaurants
(
  restaurant_id INT NOT NULL,
  restaurant_name VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  PRIMARY KEY (restaurant_id)
);

CREATE TABLE Menu
(
  menu_id INT NOT NULL,
  price INT NOT NULL,
  item_name VARCHAR NOT NULL,
  restaurant_id INT NOT NULL,
  PRIMARY KEY (menu_id),
  FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Orders
(
  order_id INT NOT NULL,
  quantities INT NOT NULL,
  menu_id INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

CREATE TABLE in_order
(
  in_order_id INT NOT NULL,
  total_price INT NOT NULL,
  discount INT NOT NULL,
  final_price INT NOT NULL,
  payment_id INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (in_order_id),
  FOREIGN KEY (payment_id) REFERENCES Customer_payment(payment_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE placed_order
(
  placed_order_id INT NOT NULL,
  note VARCHAR NOT NULL,
  time_start DATE NOT NULL,
  time_finish DATE NOT NULL,
  location VARCHAR NOT NULL,
  customer_id INT NOT NULL,
  in_order_id INT NOT NULL,
  PRIMARY KEY (placed_order_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (in_order_id) REFERENCES in_order(in_order_id)
);

CREATE TABLE Comment
(
  comment_id INT NOT NULL,
  comment_text VARCHAR NOT NULL,
  vote Decimal NOT NULL,
  placed_order_id INT NOT NULL,
  PRIMARY KEY (comment_id),
  FOREIGN KEY (placed_order_id) REFERENCES placed_order(placed_order_id)
);