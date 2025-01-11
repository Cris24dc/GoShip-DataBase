CREATE OR REPLACE PROCEDURE order_details (
    p_order_id IN NUMBER,
    p_display_all IN BOOLEAN
) AS
    v_order_ids VARCHAR2(100) := '';
    v_order_exists NUMBER := 0;
    v_route_found BOOLEAN := FALSE;
    CURSOR route_cursor(p_id NUMBER) IS
        SELECT 
            d.warehouse_name,
            d.warehouse_address,
            a.employee_first_name || ' ' || a.employee_last_name AS driver,
            r.warehouse_id,
            r.driver_id,
            r.departure_date
        FROM 
            ROUTES r
        JOIN WAREHOUSES d ON r.warehouse_id = d.warehouse_id
        JOIN DRIVERS s ON r.driver_id = s.employee_id
        JOIN EMPLOYEES a ON s.employee_id = a.employee_id
        WHERE 
            r.order_id = p_id
        ORDER BY 
            r.departure_date;

    order_not_found EXCEPTION;
    no_routes EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_order_exists
    FROM ORDERS
    WHERE order_id = p_order_id;

    IF v_order_exists = 0 THEN
        RAISE order_not_found;
    END IF;

    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    FOR r IN route_cursor(p_order_id) LOOP
        v_route_found := TRUE;
        DBMS_OUTPUT.PUT_LINE('Warehouse: ' || r.warehouse_name);
        DBMS_OUTPUT.PUT_LINE('Warehouse Address: ' || r.warehouse_address);
        DBMS_OUTPUT.PUT_LINE('Driver: ' || r.driver);
        DBMS_OUTPUT.PUT_LINE('Departure Date: ' || TO_CHAR(r.departure_date, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('-----------------------------');

        IF p_display_all THEN
            FOR r2 IN (
                SELECT DISTINCT c.order_id
                FROM 
                    ROUTES r2
                JOIN ORDERS c ON r2.order_id = c.order_id
                WHERE
                    r2.warehouse_id = r.warehouse_id
                    AND r2.driver_id = r.driver_id
                    AND r2.departure_date = r.departure_date
            ) LOOP
                IF INSTR(' ' || v_order_ids || ' ', ' ' || r2.order_id || ' ') = 0 THEN
                    v_order_ids := v_order_ids || ' ' || r2.order_id;
                END IF;
            END LOOP;
        END IF;
    END LOOP;

    IF NOT v_route_found THEN
        RAISE no_routes;
    END IF;

    IF p_display_all THEN
        DBMS_OUTPUT.PUT_LINE('Orders that have been delivered on the same route: ' || TRIM(v_order_ids));
    END IF;

EXCEPTION
    WHEN order_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: The order with ID ' || p_order_id || ' does not exist in the database.');
    WHEN no_routes THEN
        DBMS_OUTPUT.PUT_LINE('Error: The order with ID ' || p_order_id || ' has no associated routes.');
END;
/

BEGIN
    order_details(199, FALSE);
END;
/

BEGIN
    order_details(110, FALSE);
END;
/

BEGIN
    order_details(101, FALSE);
END;
/

BEGIN
    order_details(101, TRUE);
END;
/
