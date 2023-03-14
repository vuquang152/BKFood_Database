--1.Add or delete customer
CREATE OR REPLACE FUNCTION add_or_delete_customer()
  RETURNS TRIGGER AS $$
  BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO customer (id, customer_name, phone_number, email, password)
      VALUES (NEW.id, NEW.customer_name, NEW.phone_number, NEW.email, NEW.password);
    ELSIF TG_OP = 'DELETE' THEN
      DELETE FROM customer WHERE id = OLD.id;
    END IF;
    RETURN NULL;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER add_or_delete_customer_trigger
AFTER INSERT OR DELETE ON customer
FOR EACH ROW
EXECUTE FUNCTION add_or_delete_customer();

--2.Replace seller
CREATE OR REPLACE FUNCTION replace_seller()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE sellers
    SET seller_name = NEW.seller_name,
        restaurant_name = NEW.restaurant_name,
        email = NEW.email,
        password = NEW.password
    WHERE seller_id = OLD.seller_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER replace_seller_trigger
AFTER UPDATE ON sellers
FOR EACH ROW
EXECUTE FUNCTION replace_seller();

--3.add_or_delete_menu_item
CREATE OR REPLACE FUNCTION add_or_delete_menu_item()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO menu_item (id, item_name, category_name, image, description, ingredients, price, active, restaurant_id)
    VALUES (NEW.id, NEW.item_name, NEW.category_name, NEW.image, NEW.description, NEW.ingredients, NEW.price, NEW.active, NEW.restaurant_id);
  ELSIF TG_OP = 'DELETE' THEN
    DELETE FROM menu_item WHERE id = OLD.id;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Add trigger to menu_item table
CREATE TRIGGER add_or_delete_menu_item_trigger
AFTER INSERT OR DELETE ON menu_item
FOR EACH ROW
EXECUTE FUNCTION add_or_delete_menu_item();

--4.add or delete restaurant
CREATE OR REPLACE FUNCTION add_or_delete_restaurant() RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO restaurant (id, restaurant_name, restaurant_address)
        VALUES (NEW.id, NEW.restaurant_name, NEW.restaurant_address);
    ELSIF TG_OP = 'DELETE' THEN
        DELETE FROM restaurant WHERE id = OLD.id;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER add_or_delete_restaurant_trigger
AFTER INSERT OR DELETE ON Sellers
FOR EACH ROW
EXECUTE FUNCTION add_or_delete_restaurant();
