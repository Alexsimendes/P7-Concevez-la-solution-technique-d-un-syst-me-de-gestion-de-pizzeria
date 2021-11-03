
CREATE TABLE public.Ingredient (
                ingredient_id INTEGER NOT NULL,
                ingredient_name VARCHAR(20) NOT NULL,
                price_TTC NUMERIC(4,2) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id)
);


CREATE TABLE public.Adress (
                adress_id INTEGER NOT NULL,
                street_number VARCHAR(5) NOT NULL,
                way VARCHAR(50) NOT NULL,
                city VARCHAR(50) NOT NULL,
                zip_code VARCHAR(10) NOT NULL,
                code VARCHAR(10),
                intercom VARCHAR(10),
                instructions VARCHAR(250),
                CONSTRAINT adress_pk PRIMARY KEY (adress_id)
);


CREATE TABLE public.Pizzeria (
                pizzeria_id INTEGER NOT NULL,
                adress_id INTEGER NOT NULL,
                pizzeria_name VARCHAR(30) NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (pizzeria_id)
);


CREATE TABLE public.Store_employee (
                employee_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                first_name VARCHAR(50) NOT NULL,
                last_name VARCHAR(50) NOT NULL,
                task VARCHAR(10) NOT NULL,
                CONSTRAINT store_employee_pk PRIMARY KEY (employee_id)
);


CREATE TABLE public.Customer (
                customer_id INTEGER NOT NULL,
                adress_id INTEGER NOT NULL,
                last_name VARCHAR(50) NOT NULL,
                first_name VARCHAR(50) NOT NULL,
                phone_number VARCHAR(10) NOT NULL,
                email VARCHAR(50) NOT NULL,
                password VARCHAR(20) NOT NULL,
                birthday_date DATE NOT NULL,
                store_employee BOOLEAN NOT NULL,
                employee_id INTEGER,
                CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);


CREATE TABLE public.Stock (
                stock_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (stock_id)
);


CREATE TABLE public.Pizza (
                pizza_id INTEGER NOT NULL,
                pizza_name VARCHAR(20) NOT NULL,
                price_TTC NUMERIC(4,2) NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (pizza_id)
);


CREATE TABLE public.Pizza_ingredients (
                pizza_ingredients_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                ingredient_quantity INTEGER NOT NULL,
                CONSTRAINT pizza_ingredients_pk PRIMARY KEY (pizza_ingredients_id)
);


CREATE TABLE public.Pizza_order (
                order_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                customer_id INTEGER NOT NULL,
                date_order DATE NOT NULL,
                time_order TIME NOT NULL,
                wish_date_order DATE,
                wish_time_order TIME,
                payment BOOLEAN NOT NULL,
                delivery BOOLEAN NOT NULL,
                order_state VARCHAR NOT NULL,
                payment_mode VARCHAR NOT NULL,
                CONSTRAINT pizza_order_pk PRIMARY KEY (order_id)
);


CREATE TABLE public.Bill (
                bill_id INTEGER NOT NULL,
                order_id INTEGER NOT NULL,
                date DATE NOT NULL,
                price_HT NUMERIC(5,2) NOT NULL,
                price_TVA NUMERIC(4,2) NOT NULL,
                price_TTC NUMERIC(5,2) NOT NULL,
                CONSTRAINT bill_pk PRIMARY KEY (bill_id)
);


CREATE TABLE public.Quantity (
                Quantity_id INTEGER NOT NULL,
                bill_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT quantity_pk PRIMARY KEY (Quantity_id)
);


ALTER TABLE public.Pizza_ingredients ADD CONSTRAINT ingredient_pizza_ingredients_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizzeria ADD CONSTRAINT adress_pizzeria_fk
FOREIGN KEY (adress_id)
REFERENCES public.Adress (adress_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Customer ADD CONSTRAINT adress_customer_fk
FOREIGN KEY (adress_id)
REFERENCES public.Adress (adress_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizza_order ADD CONSTRAINT pizzeria_pizza_order_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Store_employee ADD CONSTRAINT pizzeria_store_employee_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Customer ADD CONSTRAINT store_employee_customer_fk
FOREIGN KEY (employee_id)
REFERENCES public.Store_employee (employee_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizza_order ADD CONSTRAINT customer_pizza_order_fk
FOREIGN KEY (customer_id)
REFERENCES public.Customer (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Quantity ADD CONSTRAINT pizza_quantity_and_size_fk
FOREIGN KEY (pizza_id)
REFERENCES public.Pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizza_ingredients ADD CONSTRAINT pizza_pizza_ingredients_fk
FOREIGN KEY (pizza_id)
REFERENCES public.Pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Bill ADD CONSTRAINT pizza_order_bill_fk
FOREIGN KEY (order_id)
REFERENCES public.Pizza_order (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Quantity ADD CONSTRAINT bill_quantity_and_size_fk
FOREIGN KEY (bill_id)
REFERENCES public.Bill (bill_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
