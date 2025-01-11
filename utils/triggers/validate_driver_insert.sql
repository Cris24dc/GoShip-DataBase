CREATE OR REPLACE TRIGGER validate_driver_insert
BEFORE INSERT OR UPDATE ON DRIVERS
FOR EACH ROW
DECLARE
    v_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_exists
    FROM EMPLOYEES
    WHERE employee_id = :NEW.employee_id;

    IF v_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'The employee ID does not exist in the EMPLOYEES table.');
    END IF;
END;
