CREATE OR REPLACE PACKAGE ORDER_MANAGEMENT IS
    TYPE T_PRODUCT_LIST IS TABLE OF PRODUCTS%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE T_SELECTED_PRODUCT IS RECORD (
        product_id NUMBER,
        product_name VARCHAR2(50)
    );

    FUNCTION GENERATE_ORDER_ID RETURN NUMBER;
    FUNCTION LIST_PRODUCTS RETURN T_PRODUCT_LIST;

    PROCEDURE ADD_ORDER(client_id IN NUMBER);
    PROCEDURE SELECT_PRODUCTS(order_id IN NUMBER, product_id IN NUMBER);
END ORDER_MANAGEMENT;
/


CREATE OR REPLACE PACKAGE BODY ORDER_MANAGEMENT IS
    FUNCTION GENERATE_ORDER_ID RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT NVL(MAX(order_id), 0) + 1 INTO v_id FROM ORDERS;
        RETURN v_id;
    END GENERATE_ORDER_ID;

    FUNCTION LIST_PRODUCTS RETURN T_PRODUCT_LIST IS
        v_list T_PRODUCT_LIST;
        v_index PLS_INTEGER := 1;
    BEGIN
        FOR product IN (SELECT product_id, product_name, product_price, product_stock FROM PRODUCTS) LOOP
            v_list(v_index).product_id := product.product_id;
            v_list(v_index).product_name := product.product_name;
            v_index := v_index + 1;
        END LOOP;
        RETURN v_list;
    END LIST_PRODUCTS;

    PROCEDURE ADD_ORDER(client_id IN NUMBER) IS
        v_order_id NUMBER;
        v_order_date DATE := SYSDATE;
        v_status VARCHAR2(50) := 'New';
        v_price NUMBER := 0;
    BEGIN
        v_order_id := GENERATE_ORDER_ID;
        INSERT INTO ORDERS (order_id, client_id, order_date, order_status, order_total)
        VALUES (v_order_id, client_id, v_order_date, v_status, v_price);
        DBMS_OUTPUT.PUT_LINE('The order has been added with ID: ' || v_order_id);
    END ADD_ORDER;

    PROCEDURE SELECT_PRODUCTS(order_id IN NUMBER, product_id IN NUMBER) IS
    BEGIN
        BEGIN
            INSERT INTO ORDER_PRODUCT (product_id, order_id)
            VALUES (product_id, order_id);
            DBMS_OUTPUT.PUT_LINE('The product with ID ' || product_id || ' has been added to the order with ID ' || order_id || '.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error adding product: ' || SQLERRM);
        END;
    END SELECT_PRODUCTS;
END ORDER_MANAGEMENT;
/