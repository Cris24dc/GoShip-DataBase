DROP SEQUENCE seq_employee;
DROP SEQUENCE seq_warehouse;
DROP SEQUENCE seq_manufacturer;
DROP SEQUENCE seq_category;
DROP SEQUENCE seq_product;
DROP SEQUENCE seq_order;
DROP SEQUENCE seq_client;
DROP SEQUENCE seq_invoice;

DROP TABLE ORDER_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE ROUTES CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE HANDLERS CASCADE CONSTRAINTS;
DROP TABLE DRIVERS CASCADE CONSTRAINTS;

DROP TABLE PRODUCTS CASCADE CONSTRAINTS;
DROP TABLE MANUFACTURERS CASCADE CONSTRAINTS;
DROP TABLE CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE INVOICES CASCADE CONSTRAINTS;
DROP TABLE CLIENTS CASCADE CONSTRAINTS;

DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE WAREHOUSES CASCADE CONSTRAINTS;

CREATE SEQUENCE seq_employee
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_warehouse
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_manufacturer
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_category
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_product
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_order
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_client
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_invoice
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE TABLE WAREHOUSES (
    warehouse_id      NUMBER NOT NULL,
    warehouse_name    VARCHAR2(50) NOT NULL,
    warehouse_address VARCHAR2(255) NOT NULL,
    CONSTRAINT warehouse_pk PRIMARY KEY (warehouse_id)
);

CREATE TABLE MANUFACTURERS (
    manufacturer_id       NUMBER NOT NULL,
    manufacturer_name     VARCHAR2(50) NOT NULL,
    manufacturer_address  VARCHAR2(255) NOT NULL,
    CONSTRAINT manufacturer_pk PRIMARY KEY (manufacturer_id)
);

CREATE TABLE CATEGORIES (
    category_id       NUMBER NOT NULL,
    category_name     VARCHAR2(50) NOT NULL,
    category_description VARCHAR2(255),
    CONSTRAINT category_pk PRIMARY KEY (category_id)
);

CREATE TABLE CLIENTS (
    client_id         NUMBER NOT NULL,
    client_first_name VARCHAR2(50) NOT NULL,
    client_last_name  VARCHAR2(50) NOT NULL,
    client_email      VARCHAR2(100) NOT NULL,
    client_phone      VARCHAR2(15) NOT NULL,
    client_address    VARCHAR2(255) NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (client_id)
);

CREATE TABLE EMPLOYEES (
    employee_id       NUMBER NOT NULL,
    warehouse_id      NUMBER NOT NULL,
    employee_first_name VARCHAR2(50) NOT NULL,
    employee_last_name VARCHAR2(50) NOT NULL,
    employee_email    VARCHAR2(100) NOT NULL,
    employee_phone    VARCHAR2(10),
    employee_salary   NUMBER NOT NULL,
    hire_date         DATE NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY (employee_id),
    CONSTRAINT employee_warehouse_fk FOREIGN KEY (warehouse_id) REFERENCES WAREHOUSES(warehouse_id)
);

CREATE TABLE HANDLERS (
    employee_id       NUMBER NOT NULL,
    start_time        DATE NOT NULL,
    end_time          DATE NOT NULL,
    CONSTRAINT handler_pk PRIMARY KEY (employee_id),
    CONSTRAINT handler_employee_fk FOREIGN KEY (employee_id) REFERENCES EMPLOYEES(employee_id)
);

CREATE TABLE DRIVERS (
    employee_id       NUMBER NOT NULL,
    driver_license_category VARCHAR2(10) NOT NULL,
    driver_vehicle_number VARCHAR2(50) NOT NULL,
    driver_insurance_date DATE NOT NULL,
    CONSTRAINT driver_pk PRIMARY KEY (employee_id),
    CONSTRAINT driver_employee_fk FOREIGN KEY (employee_id) REFERENCES EMPLOYEES(employee_id)
);

CREATE TABLE PRODUCTS (
    product_id        NUMBER NOT NULL,
    manufacturer_id       NUMBER NOT NULL,
    category_id       NUMBER NOT NULL,
    product_name      VARCHAR2(50) NOT NULL,
    product_price     NUMBER NOT NULL,
    product_stock     NUMBER NOT NULL,
    product_description VARCHAR2(255),
    CONSTRAINT product_pk PRIMARY KEY (product_id),
    CONSTRAINT product_manufacturer_fk FOREIGN KEY (manufacturer_id) REFERENCES manufacturerS(manufacturer_id),
    CONSTRAINT product_category_fk FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id)
);

CREATE TABLE ORDERS (
    order_id          NUMBER NOT NULL,
    client_id         NUMBER NOT NULL,
    order_date        DATE NOT NULL,
    order_status      VARCHAR2(50) NOT NULL,
    order_total       NUMBER NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY (order_id),
    CONSTRAINT order_client_fk FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id)
);

CREATE TABLE INVOICES (
    invoice_id        NUMBER NOT NULL,
    order_id          NUMBER NOT NULL,
    invoice_date      DATE NOT NULL,
    invoice_total     NUMBER NOT NULL,
    invoice_tax       NUMBER NOT NULL,
    CONSTRAINT invoice_pk PRIMARY KEY (invoice_id),
    CONSTRAINT invoice_order_fk FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
);

CREATE TABLE ORDER_PRODUCT (
    product_id        NUMBER NOT NULL,
    order_id          NUMBER NOT NULL,
    CONSTRAINT product_order_product_fk FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),
    CONSTRAINT product_order_order_fk FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
);

CREATE TABLE ROUTES (
    warehouse_id      NUMBER NOT NULL,
    order_id          NUMBER NOT NULL,
    driver_id         NUMBER NOT NULL,
    departure_date    DATE,
    CONSTRAINT route_warehouse_fk FOREIGN KEY (warehouse_id) REFERENCES WAREHOUSES(warehouse_id),
    CONSTRAINT route_order_fk FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    CONSTRAINT route_driver_fk FOREIGN KEY (driver_id) REFERENCES DRIVERS(employee_id)
);

INSERT INTO WAREHOUSES VALUES (seq_warehouse.nextval, 'Warehouse Bucharest', 'Bucharest, Grivitei Street, No. 45');
INSERT INTO WAREHOUSES VALUES (seq_warehouse.nextval, 'Warehouse Cluj-Napoca', 'Cluj-Napoca, Horea Street, No. 12');
INSERT INTO WAREHOUSES VALUES (seq_warehouse.nextval, 'Warehouse Timisoara', 'Timisoara, Victor Babes Street, No. 78');
INSERT INTO WAREHOUSES VALUES (seq_warehouse.nextval, 'Warehouse Constanta', 'Constanta, Mihail Kogalniceanu Street, No. 22');
INSERT INTO WAREHOUSES VALUES (seq_warehouse.nextval, 'Warehouse Brasov', 'Brasov, Iuliu Maniu Street, No. 30');
INSERT INTO WAREHOUSES VALUES (seq_warehouse.nextval, 'Warehouse Iasi', 'Iasi, Stefan Cel Mare Street, No. 18');

INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 101, 'Maria', 'Popescu', 'maria.popescu@gmail.com', '0745123456', 3000, TO_DATE('15-06-2015', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 102, 'Elena', 'Georgescu', 'elena.georgescu@outlook.com', '0789888777', 3200, TO_DATE('12-12-2018', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 103, 'Mihai', 'Marin', 'mihai.marin@gmail.com', '0766554433', 2800, TO_DATE('23-02-2016', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 104, 'Gheorghe', 'Petrescu', 'gheorghe.petrescu@gmail.com', '0744222333', 3800, TO_DATE('09-11-2020', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 105, 'Adriana', 'Vasile', 'adriana.vasile@gmail.com', '0765443322', 2500, TO_DATE('14-08-2016', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 106, 'Florin', 'Munteanu', 'florin.munteanu@outlook.com', '0722444666', 3600, TO_DATE('18-01-2018', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 101, 'Cosmin', 'Ionescu', 'cosmin.ionescu@gmail.com', '0745126789', 2700, TO_DATE('10-06-2020', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 102, 'Ion', 'Ionescu', 'ion.ionescu@yahoo.com', '0722334455', 3500, TO_DATE('01-09-2017', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 103, 'Ana', 'Dumitru', 'ana.dumitru@live.com', '0733222111', 3300, TO_DATE('05-07-2019', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 104, 'Ioana', 'Stanciu', 'ioana.stanciu@yahoo.com', '0798765432', 3100, TO_DATE('02-04-2014', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 105, 'Vasile', 'Radulescu', 'vasile.radulescu@hotmail.com', '0755332211', 2900, TO_DATE('21-10-2017', 'DD-MM-YYYY'));
INSERT INTO EMPLOYEES VALUES (seq_employee.nextval, 106, 'Raluca', 'Neagu', 'raluca.neagu@live.com', '0739888777', 3400, TO_DATE('30-09-2021', 'DD-MM-YYYY'));

INSERT INTO MANUFACTURERS VALUES (seq_manufacturer.nextval, 'Danone Romania', 'Bucharest, Fabrica de Glucoza Street, No. 4');
INSERT INTO MANUFACTURERS VALUES (seq_manufacturer.nextval, 'Altex Romania', 'Bucharest, Calea Vitan Street, No. 27');
INSERT INTO MANUFACTURERS VALUES (seq_manufacturer.nextval, 'HnM Romania', 'Bucharest, Dorobanti Street, No. 230');
INSERT INTO MANUFACTURERS VALUES (seq_manufacturer.nextval, 'IKEA Romania', 'Bucharest, Bulevardul Timisoara Street, No. 26');
INSERT INTO MANUFACTURERS VALUES (seq_manufacturer.nextval, 'Noriel', 'Bucharest, Lizeanu Street, No. 10');
INSERT INTO MANUFACTURERS VALUES (seq_manufacturer.nextval, 'Sephora', 'Bucharest, Sos. Nicolae Titulescu Street, No. 6');
INSERT INTO MANUFACTURERS VALUES (seq_manufacturer.nextval, 'Decathlon', 'Bucharest, Barbu Vacarescu Street, No. 120');

INSERT INTO CATEGORIES VALUES (seq_category.nextval, 'Food', 'Food products for daily consumption');
INSERT INTO CATEGORIES VALUES (seq_category.nextval, 'Electronics', 'Electronic products perfect for any home');
INSERT INTO CATEGORIES VALUES (seq_category.nextval, 'Clothing', 'Clothing for all ages');
INSERT INTO CATEGORIES VALUES (seq_category.nextval, 'Furniture', 'Products for home decoration and furnishing');
INSERT INTO CATEGORIES VALUES (seq_category.nextval, 'Toys', 'Toys for children of all ages');
INSERT INTO CATEGORIES VALUES (seq_category.nextval, 'Cosmetics', 'Products for personal care');
INSERT INTO CATEGORIES VALUES (seq_category.nextval, 'Sports', 'Sport equipment and clothing');

INSERT INTO PRODUCTS VALUES (seq_product.nextval, 101, 101, 'Milk', 5.5, 100, 'Fresh milk 1L');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 102, 102, 'LED TV', 1500, 50, '4K LED TV 55 inch');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 103, 103, 'T-shirt', 79, 200, 'Cotton T-shirt for men');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 104, 104, 'Sofa', 1500, 30, '3-seater expandable sofa');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 105, 105, 'Toy car', 120, 150, 'Remote-controlled toy car');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 106, 106, 'Lipstick', 45, 80, 'Matte lipstick with natural finish');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 107, 107, 'Football equipment', 250, 50, 'Childrens football kit');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 101, 101, 'Cheese', 15, 120, 'Cheese burduf 200g');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 102, 102, 'Laptop', 3500, 40, 'HP laptop i7, 16GB RAM, 512GB SSD');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 103, 103, 'Pants', 120, 90, 'Chino pants for men');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 104, 104, 'Dining table', 800, 60, 'Dining table made of solid wood');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 105, 105, 'Puzzle', 50, 100, '1000-piece puzzle for kids');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 106, 106, 'Moisturizer', 65, 120, 'Face moisturizer');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 107, 107, 'Tracksuit', 150, 70, 'Sports tracksuit for men');
INSERT INTO PRODUCTS VALUES (seq_product.nextval, 101, 101, 'Yogurt', 3.5, 200, 'Natural yogurt 400g');

INSERT INTO CLIENTS VALUES (seq_client.nextval, 'Ion', 'Popescu', 'ion.popescu@email.com', '0723456789', 'Bucharest, Mihai Eminescu Street, No. 45');
INSERT INTO CLIENTS VALUES (seq_client.nextval, 'Maria', 'Ionescu', 'maria.ionescu@email.com', '0734567890', 'Cluj-Napoca, Avram Iancu Street, No. 23');
INSERT INTO CLIENTS VALUES (seq_client.nextval, 'Andrei', 'Vasile', 'andrei.vasile@email.com', '0745678901', 'Timisoara, Alba Iulia Street, No. 88');
INSERT INTO CLIENTS VALUES (seq_client.nextval, 'Elena', 'Dumitrescu', 'elena.dumitrescu@email.com', '0756789012', 'Iasi, Copou Street, No. 12');
INSERT INTO CLIENTS VALUES (seq_client.nextval, 'Florin', 'Mihailescu', 'florin.mihailescu@email.com', '0767890123', 'Constanta, Unirii Street, No. 56');
INSERT INTO CLIENTS VALUES (seq_client.nextval, 'Ana', 'Georgescu', 'ana.georgescu@email.com', '0778901234', 'Brasov, Lunga Street, No. 34');

INSERT INTO ORDERS VALUES (seq_order.nextval, 105, TO_DATE('19-01-2024', 'DD-MM-YYYY'), 'Cancelled', 120);
INSERT INTO ORDERS VALUES (seq_order.nextval, 101, TO_DATE('15-01-2024', 'DD-MM-YYYY'), 'Processed', 250);
INSERT INTO ORDERS VALUES (seq_order.nextval, 101, TO_DATE('07-01-2024', 'DD-MM-YYYY'), 'In delivery', 300);
INSERT INTO ORDERS VALUES (seq_order.nextval, 103, TO_DATE('12-05-2024', 'DD-MM-YYYY'), 'Pending', 150);
INSERT INTO ORDERS VALUES (seq_order.nextval, 102, TO_DATE('13-05-2024', 'DD-MM-YYYY'), 'Completed', 500);
INSERT INTO ORDERS VALUES (seq_order.nextval, 102, TO_DATE('15-05-2024', 'DD-MM-YYYY'), 'Completed', 400);
INSERT INTO ORDERS VALUES (seq_order.nextval, 104, TO_DATE('18-05-2024', 'DD-MM-YYYY'), 'Processed', 750);
INSERT INTO ORDERS VALUES (seq_order.nextval, 104, TO_DATE('04-08-2024', 'DD-MM-YYYY'), 'Processed', 600);
INSERT INTO ORDERS VALUES (seq_order.nextval, 106, TO_DATE('08-08-2024', 'DD-MM-YYYY'), 'Processed', 450);
INSERT INTO ORDERS VALUES (seq_order.nextval, 104, TO_DATE('17-09-2024', 'DD-MM-YYYY'), 'Pending', 200);

INSERT INTO INVOICES VALUES (seq_invoice.nextval, 101, TO_DATE('19-01-2024', 'DD-MM-YYYY'), 120, 5);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 102, TO_DATE('15-01-2024', 'DD-MM-YYYY'), 250, 12);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 103, TO_DATE('07-01-2024', 'DD-MM-YYYY'), 300, 14);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 104, TO_DATE('12-05-2024', 'DD-MM-YYYY'), 150, 7);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 105, TO_DATE('13-05-2024', 'DD-MM-YYYY'), 500, 24);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 106, TO_DATE('15-05-2024', 'DD-MM-YYYY'), 400, 19);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 107, TO_DATE('18-05-2024', 'DD-MM-YYYY'), 750, 36);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 108, TO_DATE('04-08-2024', 'DD-MM-YYYY'), 600, 24);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 109, TO_DATE('08-08-2024', 'DD-MM-YYYY'), 450, 22);
INSERT INTO INVOICES VALUES (seq_invoice.nextval, 110, TO_DATE('17-09-2024', 'DD-MM-YYYY'), 200, 19);

INSERT INTO ORDER_PRODUCT VALUES (101, 101);
INSERT INTO ORDER_PRODUCT VALUES (102, 101);
INSERT INTO ORDER_PRODUCT VALUES (103, 102);
INSERT INTO ORDER_PRODUCT VALUES (104, 102);
INSERT INTO ORDER_PRODUCT VALUES (105, 103);
INSERT INTO ORDER_PRODUCT VALUES (106, 103);
INSERT INTO ORDER_PRODUCT VALUES (107, 104);
INSERT INTO ORDER_PRODUCT VALUES (101, 104);
INSERT INTO ORDER_PRODUCT VALUES (102, 105);
INSERT INTO ORDER_PRODUCT VALUES (103, 105);
INSERT INTO ORDER_PRODUCT VALUES (104, 106);
INSERT INTO ORDER_PRODUCT VALUES (105, 106);
INSERT INTO ORDER_PRODUCT VALUES (106, 107);
INSERT INTO ORDER_PRODUCT VALUES (107, 107);
INSERT INTO ORDER_PRODUCT VALUES (101, 108);
INSERT INTO ORDER_PRODUCT VALUES (102, 108);
INSERT INTO ORDER_PRODUCT VALUES (103, 109);
INSERT INTO ORDER_PRODUCT VALUES (104, 109);
INSERT INTO ORDER_PRODUCT VALUES (105, 110);
INSERT INTO ORDER_PRODUCT VALUES (106, 110);
INSERT INTO ORDER_PRODUCT VALUES (107, 101);
INSERT INTO ORDER_PRODUCT VALUES (101, 102);
INSERT INTO ORDER_PRODUCT VALUES (102, 103);
INSERT INTO ORDER_PRODUCT VALUES (103, 104);
INSERT INTO ORDER_PRODUCT VALUES (104, 105);
INSERT INTO ORDER_PRODUCT VALUES (105, 106);
INSERT INTO ORDER_PRODUCT VALUES (106, 107);
INSERT INTO ORDER_PRODUCT VALUES (107, 108);
INSERT INTO ORDER_PRODUCT VALUES (101, 109);
INSERT INTO ORDER_PRODUCT VALUES (102, 110);
INSERT INTO ORDER_PRODUCT VALUES (103, 101);
INSERT INTO ORDER_PRODUCT VALUES (104, 102);
INSERT INTO ORDER_PRODUCT VALUES (105, 103);
INSERT INTO ORDER_PRODUCT VALUES (106, 104);
INSERT INTO ORDER_PRODUCT VALUES (107, 105);
INSERT INTO ORDER_PRODUCT VALUES (107, 103);
INSERT INTO ORDER_PRODUCT VALUES (102, 104);
INSERT INTO ORDER_PRODUCT VALUES (101, 105);
INSERT INTO ORDER_PRODUCT VALUES (101, 103);

INSERT INTO DRIVERS VALUES (101, 'C1', 'BZ 101 MAR', TO_DATE('15-03-2023', 'DD-MM-YYYY'));
INSERT INTO DRIVERS VALUES (102, 'C1E', 'CJ 102 GEO', TO_DATE('10-06-2022', 'DD-MM-YYYY'));
INSERT INTO DRIVERS VALUES (103, 'C', 'BV 103 MAR', TO_DATE('20-01-2024', 'DD-MM-YYYY'));
INSERT INTO DRIVERS VALUES (104, 'B1', 'AG 104 PET', TO_DATE('05-11-2024', 'DD-MM-YYYY'));
INSERT INTO DRIVERS VALUES (105, 'C1', 'PH 105 VAS', TO_DATE('28-08-2023', 'DD-MM-YYYY'));
INSERT INTO DRIVERS VALUES (106, 'C1E', 'TM 106 MUN', TO_DATE('17-04-2022', 'DD-MM-YYYY'));

INSERT INTO HANDLERS VALUES (107, TO_DATE('08:00', 'HH24:MI'), TO_DATE('16:00', 'HH24:MI'));
INSERT INTO HANDLERS VALUES (108, TO_DATE('09:00', 'HH24:MI'), TO_DATE('17:00', 'HH24:MI'));
INSERT INTO HANDLERS VALUES (109, TO_DATE('07:30', 'HH24:MI'), TO_DATE('15:30', 'HH24:MI'));
INSERT INTO HANDLERS VALUES (110, TO_DATE('10:00', 'HH24:MI'), TO_DATE('18:00', 'HH24:MI'));
INSERT INTO HANDLERS VALUES (111, TO_DATE('08:30', 'HH24:MI'), TO_DATE('16:30', 'HH24:MI'));
INSERT INTO HANDLERS VALUES (112, TO_DATE('11:00', 'HH24:MI'), TO_DATE('19:00', 'HH24:MI'));

INSERT INTO ROUTES VALUES (106, 101, 101, TO_DATE('21-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (101, 101, 103, TO_DATE('24-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (105, 101, 106, TO_DATE('25-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (106, 102, 101, TO_DATE('21-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (101, 102, 103, TO_DATE('24-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (105, 102, 106, TO_DATE('25-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (106, 103, 101, TO_DATE('21-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (101, 103, 103, TO_DATE('24-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (105, 103, 106, TO_DATE('25-01-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (103, 104, 102, TO_DATE('20-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (102, 104, 103, TO_DATE('23-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (104, 104, 105, TO_DATE('26-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (103, 105, 102, TO_DATE('20-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (102, 105, 103, TO_DATE('23-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (104, 105, 105, TO_DATE('26-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (103, 106, 102, TO_DATE('20-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (102, 106, 103, TO_DATE('23-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (104, 106, 105, TO_DATE('26-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (103, 107, 102, TO_DATE('20-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (102, 107, 103, TO_DATE('23-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (104, 107, 105, TO_DATE('26-05-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (101, 108, 101, TO_DATE('10-08-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (102, 108, 102, TO_DATE('12-08-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (105, 108, 106, TO_DATE('16-08-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (101, 109, 101, TO_DATE('10-08-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (102, 109, 102, TO_DATE('12-08-2024', 'DD-MM-YYYY'));
INSERT INTO ROUTES VALUES (105, 109, 106, TO_DATE('16-08-2024', 'DD-MM-YYYY'));
