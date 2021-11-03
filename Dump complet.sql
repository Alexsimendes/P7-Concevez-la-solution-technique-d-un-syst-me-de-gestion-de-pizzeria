--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UHC';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adress (
    adress_id integer NOT NULL,
    street_number character varying(5) NOT NULL,
    way character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    zip_code character varying(10) NOT NULL,
    code character varying(10),
    intercom character varying(10),
    instructions character varying(250)
);


ALTER TABLE public.adress OWNER TO postgres;

--
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill (
    bill_id integer NOT NULL,
    order_id integer NOT NULL,
    date date NOT NULL,
    price_ht numeric(5,2) NOT NULL,
    price_tva numeric(4,2) NOT NULL,
    price_ttc numeric(5,2) NOT NULL
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    adress_id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    phone_number character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(20) NOT NULL,
    birthday_date date NOT NULL,
    store_employee boolean NOT NULL,
    employee_id integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient (
    ingredient_id integer NOT NULL,
    ingredient_name character varying(20) NOT NULL,
    price_ttc numeric(4,2) NOT NULL
);


ALTER TABLE public.ingredient OWNER TO postgres;

--
-- Name: pizza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza (
    pizza_id integer NOT NULL,
    pizza_name character varying(20) NOT NULL,
    price_ttc numeric(4,2) NOT NULL
);


ALTER TABLE public.pizza OWNER TO postgres;

--
-- Name: pizza_ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza_ingredients (
    pizza_ingredients_id integer NOT NULL,
    pizza_id integer NOT NULL,
    ingredient_id integer NOT NULL
    ingredient_quantity integer NOT NULL,
);


ALTER TABLE public.pizza_ingredients OWNER TO postgres;

--
-- Name: pizza_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza_order (
    order_id integer NOT NULL,
    pizzeria_id integer NOT NULL,
    customer_id integer NOT NULL,
    date_order date NOT NULL,
    time_order time without time zone NOT NULL,
    wish_date_order date,
    wish_time_order time without time zone,
    payment boolean NOT NULL,
    delivery boolean NOT NULL,
    order_state character varying NOT NULL,
    payment_mode character varying NOT NULL
);


ALTER TABLE public.pizza_order OWNER TO postgres;

--
-- Name: pizzeria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzeria (
    pizzeria_id integer NOT NULL,
    adress_id integer NOT NULL,
    pizzeria_name character varying(30) NOT NULL
);


ALTER TABLE public.pizzeria OWNER TO postgres;

--
-- Name: quantity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quantity (
    quantity_id integer NOT NULL,
    bill_id integer NOT NULL,
    pizza_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.quantity OWNER TO postgres;

--
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    stock_id integer NOT NULL,
    pizzeria_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- Name: store_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_employee (
    employee_id integer NOT NULL,
    pizzeria_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    task character varying(10) NOT NULL
);


ALTER TABLE public.store_employee OWNER TO postgres;

--
-- Data for Name: adress; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.adress (adress_id, street_number, way, city, zip_code, code, intercom, instructions) VALUES (1, '20', 'rue Voltaire', 'Paris', '75015', NULL, NULL, NULL);
INSERT INTO public.adress (adress_id, street_number, way, city, zip_code, code, intercom, instructions) VALUES (2, '30', 'rue Diderot', 'Marseille', '13005', NULL, NULL, NULL);
INSERT INTO public.adress (adress_id, street_number, way, city, zip_code, code, intercom, instructions) VALUES (3, '40', 'rue Baudelaire', 'Lyon', '69002', NULL, NULL, NULL);
INSERT INTO public.adress (adress_id, street_number, way, city, zip_code, code, intercom, instructions) VALUES (4, '50', 'rue Victor Hugo', 'Bordeaux', '32000', NULL, NULL, NULL);
INSERT INTO public.adress (adress_id, street_number, way, city, zip_code, code, intercom, instructions) VALUES (5, '60', 'rue Emile Zola', 'Rennes', '35700', NULL, NULL, NULL);
INSERT INTO public.adress (adress_id, street_number, way, city, zip_code, code, intercom, instructions) VALUES (6, '20', 'rue Voltaire', 'Paris', '75015', '1357', NULL, NULL);
INSERT INTO public.adress (adress_id, street_number, way, city, zip_code, code, intercom, instructions) VALUES (7, '10', 'avenue Rousseau', 'Marseille', '13005', '1248', '048', 'Asc en panne');
INSERT INTO public.adress (adress_id, street_number, way, city, zip_code, code, intercom, instructions) VALUES (8, '150', 'boulevard Desflandres', 'Paris', '75016', '1418', NULL, NULL);


--
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bill (bill_id, order_id, date, price_ht, price_tva, price_ttc) VALUES (1, 1, '2019-01-01', 10.00, 1.00, 11.00);
INSERT INTO public.bill (bill_id, order_id, date, price_ht, price_tva, price_ttc) VALUES (2, 2, '2019-01-01', 10.00, 1.00, 11.00);
INSERT INTO public.bill (bill_id, order_id, date, price_ht, price_tva, price_ttc) VALUES (3, 3, '2019-01-01', 10.00, 1.00, 11.00);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (customer_id, adress_id, last_name, first_name, phone_number, email, password, birthday_date, store_employee, employee_id) VALUES (1, 6, 'Wayne', 'Bruce', '0615627275', 'B.wayne@gmail.com', 'akshn', '1987-06-04', false, NULL);
INSERT INTO public.customer (customer_id, adress_id, last_name, first_name, phone_number, email, password, birthday_date, store_employee, employee_id) VALUES (2, 7, 'Todd', 'Jason', '0667672626', 'J.todd@gmail.com', 'zdazd', '2000-12-14', false, NULL);
INSERT INTO public.customer (customer_id, adress_id, last_name, first_name, phone_number, email, password, birthday_date, store_employee, employee_id) VALUES (3, 8, 'Parker', 'Peter', '0671882828', 'P.Parker@gmail.com', 'adzd', '1998-01-24', false, NULL);


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (1, 'Pate', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (2, 'Sauce tomate', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (3, 'Sauce creme fraiche', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (4, 'Champignons', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (5, 'Jambon', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (6, 'Oignon', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (7, 'Thon', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (8, 'Mozza', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (9, 'Basilic', 2.00);
INSERT INTO public.ingredient (ingredient_id, ingredient_name, price_ttc) VALUES (10, 'Origan', 2.00);


--
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (1, 'Reine', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (2, 'Pecheur', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (3, 'Margherita', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (4, 'Savoyarde', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (5, 'Forestiere', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (6, 'Tex-Mex', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (7, 'Indienne', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (8, 'Orientale', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (9, 'Vegetale', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (10, 'Vegan', 11.00);
INSERT INTO public.pizza (pizza_id, pizza_name, price_ttc) VALUES (11, 'Deluxe', 13.00);

ingredient_quantity
--
-- Data for Name: pizza_ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (1, 1, 1, 1);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (2, 1, 2, 1);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (3, 1, 4, 10);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (4, 1, 5, 10);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (5, 2, 1, 1);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (6, 2, 2, 1);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (7, 2, 6, 10);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (8, 2, 7,10);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (9, 3, 1, 1);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (10, 3, 3, 1);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (11, 3, 8, 10);
INSERT INTO public.pizza_ingredients (pizza_ingredients_id, pizza_id, ingredient_id, ingredient_quantity) VALUES (12, 3, 9, 10);


--
-- Data for Name: pizza_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizza_order (order_id, pizzeria_id, customer_id, date_order, time_order, wish_date_order, wish_time_order, payment, delivery, order_state, payment_mode) VALUES (1, 1, 1, '2019-01-01', '20:00:00', NULL, NULL, true, true, 'On Delivery', 'Online');
INSERT INTO public.pizza_order (order_id, pizzeria_id, customer_id, date_order, time_order, wish_date_order, wish_time_order, payment, delivery, order_state, payment_mode) VALUES (2, 2, 2, '2019-01-01', '20:05:00', NULL, NULL, true, false, 'Being Prepared', 'Online');
INSERT INTO public.pizza_order (order_id, pizzeria_id, customer_id, date_order, time_order, wish_date_order, wish_time_order, payment, delivery, order_state, payment_mode) VALUES (3, 1, 3, '2019-01-01', '20:15:00', NULL, NULL, false, true, 'Waiting List', 'CB on delivery');


--
-- Data for Name: pizzeria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizzeria (pizzeria_id, adress_id, pizzeria_name) VALUES (1, 1, 'OC Pizza Paris');
INSERT INTO public.pizzeria (pizzeria_id, adress_id, pizzeria_name) VALUES (2, 2, 'OC Pizza Marseille');
INSERT INTO public.pizzeria (pizzeria_id, adress_id, pizzeria_name) VALUES (3, 3, 'OC Pizza Lyon');
INSERT INTO public.pizzeria (pizzeria_id, adress_id, pizzeria_name) VALUES (4, 4, 'OC Pizza Bordeaux');
INSERT INTO public.pizzeria (pizzeria_id, adress_id, pizzeria_name) VALUES (5, 5, 'OC Pizza Rennes');


--
-- Data for Name: quantity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.quantity (quantity_id, bill_id, pizza_id, quantity) VALUES (1, 1, 1, 1);
INSERT INTO public.quantity (quantity_id, bill_id, pizza_id, quantity) VALUES (2, 2, 2, 1);
INSERT INTO public.quantity (quantity_id, bill_id, pizza_id, quantity) VALUES (3, 3, 3, 1);


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (1, 1, 1, 513);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (2, 1, 2, 520);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (3, 1, 3, 457);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (4, 1, 4, 567);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (5, 1, 5, 589);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (6, 1, 6, 390);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (7, 1, 7, 451);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (8, 1, 8, 122);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (9, 1, 9, 566);
INSERT INTO public.stock (stock_id, pizzeria_id, ingredient_id, quantity) VALUES (10, 1, 10, 200);


--
-- Data for Name: store_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (1, 1, 'Paul', 'Allemand', 'manager');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (2, 1, 'Pierre', 'Porte', 'pizzaiolo');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (3, 1, 'Sandrine', 'Tuchel', 'reception');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (4, 1, 'Marine', 'Lafont', 'delivery');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (5, 2, 'Jean', 'Valette', 'manager');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (6, 2, 'Luc', 'Douchez', 'pizzaiolo');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (7, 2, 'Emilie', 'Romagnoli', 'reception');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (8, 2, 'Robin', 'Michelin', 'delivery');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (9, 3, 'Issa', 'Diop', 'manager');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (10, 3, 'Marie', 'Toure', 'pizzaiolo');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (11, 3, 'Alex', 'Cunha', 'reception');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (12, 3, 'Arthur', 'Baleynaud', 'delivery');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (13, 4, 'Bilel', 'Mammoun', 'manager');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (14, 4, 'Thomas', 'Pesquet', 'pizzaiolo');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (15, 4, 'Luis', 'Fernandez', 'reception');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (16, 4, 'Edmond', 'Rostand', 'delivery');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (17, 5, 'Clemence', 'Sinclair', 'manager');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (18, 5, 'Nadia', 'Morel', 'pizzaiolo');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (19, 5, 'Louis', 'Abriel', 'reception');
INSERT INTO public.store_employee (employee_id, pizzeria_id, first_name, last_name, task) VALUES (20, 5, 'Maxime', 'Loit', 'delivery');


--
-- Name: adress adress_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress
    ADD CONSTRAINT adress_pk PRIMARY KEY (adress_id);


--
-- Name: bill bill_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pk PRIMARY KEY (bill_id);


--
-- Name: customer customer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pk PRIMARY KEY (customer_id);


--
-- Name: ingredient ingredient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id);


--
-- Name: pizza_ingredients pizza_ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT pizza_ingredients_pk PRIMARY KEY (pizza_ingredients_id);


--
-- Name: pizza_order pizza_order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT pizza_order_pk PRIMARY KEY (order_id);


--
-- Name: pizza pizza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (pizza_id);


--
-- Name: pizzeria pizzeria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT pizzeria_pk PRIMARY KEY (pizzeria_id);


--
-- Name: quantity quantity_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity
    ADD CONSTRAINT quantity_pk PRIMARY KEY (quantity_id);


--
-- Name: stock stock_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (stock_id);


--
-- Name: store_employee store_employee_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_employee
    ADD CONSTRAINT store_employee_pk PRIMARY KEY (employee_id);


--
-- Name: customer adress_customer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT adress_customer_fk FOREIGN KEY (adress_id) REFERENCES public.adress(adress_id);


--
-- Name: pizzeria adress_pizzeria_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT adress_pizzeria_fk FOREIGN KEY (adress_id) REFERENCES public.adress(adress_id);


--
-- Name: quantity bill_quantity_and_size_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity
    ADD CONSTRAINT bill_quantity_and_size_fk FOREIGN KEY (bill_id) REFERENCES public.bill(bill_id);


--
-- Name: pizza_order customer_pizza_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT customer_pizza_order_fk FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: pizza_ingredients ingredient_pizza_ingredients_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT ingredient_pizza_ingredients_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);


--
-- Name: stock ingredient_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT ingredient_stock_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);


--
-- Name: bill pizza_order_bill_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT pizza_order_bill_fk FOREIGN KEY (order_id) REFERENCES public.pizza_order(order_id);


--
-- Name: pizza_ingredients pizza_pizza_ingredients_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT pizza_pizza_ingredients_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(pizza_id);


--
-- Name: quantity pizza_quantity_and_size_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity
    ADD CONSTRAINT pizza_quantity_and_size_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(pizza_id);


--
-- Name: pizza_order pizzeria_pizza_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT pizzeria_pizza_order_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- Name: stock pizzeria_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT pizzeria_stock_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- Name: store_employee pizzeria_store_employee_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_employee
    ADD CONSTRAINT pizzeria_store_employee_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- Name: customer store_employee_customer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT store_employee_customer_fk FOREIGN KEY (employee_id) REFERENCES public.store_employee(employee_id);


--
-- PostgreSQL database dump complete
--

