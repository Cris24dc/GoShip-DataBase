CREATE TABLE WAREHOUSES (
    warehouse_id      NUMBER NOT NULL,
    warehouse_name    VARCHAR2(50) NOT NULL,
    warehouse_address VARCHAR2(255) NOT NULL,
    CONSTRAINT warehouse_pk PRIMARY KEY (warehouse_id)
);

CREATE TABLE PRODUCERS (
    producer_id       NUMBER NOT NULL,
    producer_name     VARCHAR2(50) NOT NULL,
    producer_address  VARCHAR2(255) NOT NULL,
    CONSTRAINT producer_pk PRIMARY KEY (producer_id)
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
    producer_id       NUMBER NOT NULL,
    category_id       NUMBER NOT NULL,
    product_name      VARCHAR2(50) NOT NULL,
    product_price     NUMBER NOT NULL,
    product_stock     NUMBER NOT NULL,
    product_description VARCHAR2(255),
    CONSTRAINT product_pk PRIMARY KEY (product_id),
    CONSTRAINT product_producer_fk FOREIGN KEY (producer_id) REFERENCES PRODUCERS(producer_id),
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