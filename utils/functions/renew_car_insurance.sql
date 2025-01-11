CREATE OR REPLACE PROCEDURE renew_insurances (p_months_period IN NUMBER) IS
  CURSOR expired_drivers_cursor IS
    SELECT employee_id, driver_vehicle_number, driver_insurance_date
    FROM DRIVERS
    WHERE driver_insurance_date < ADD_MONTHS(SYSDATE, -p_months_period)
    FOR UPDATE;

  CURSOR employee_name_cursor(p_employee_id IN NUMBER) IS
    SELECT employee_first_name, employee_last_name
    FROM EMPLOYEES
    WHERE employee_id = p_employee_id;

  v_driver_vehicle_number DRIVERS.driver_vehicle_number%TYPE;
  v_expired_count NUMBER := 0;
  v_renewed_employee_names VARCHAR2(100);
  v_employee_names_collection VARCHAR2(100) := '';
  
BEGIN
  FOR driver IN expired_drivers_cursor LOOP
    UPDATE DRIVERS
    SET driver_insurance_date = SYSDATE
    WHERE CURRENT OF expired_drivers_cursor;

    v_expired_count := v_expired_count + 1;

    FOR employee IN employee_name_cursor(driver.employee_id) LOOP
      v_employee_names_collection := v_employee_names_collection || ' - ' || employee.employee_first_name || ' ' || employee.employee_last_name || CHR(10);
    END LOOP;
  END LOOP;

  IF v_expired_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('There are no drivers with expired insurances.');
  ELSE
    DBMS_OUTPUT.PUT_LINE(v_expired_count || ' drivers had their insurances renewed.');
    DBMS_OUTPUT.PUT_LINE(v_employee_names_collection);
  END IF;

  COMMIT;
END;
/

BEGIN
  renew_insurances(12);
END;
/
