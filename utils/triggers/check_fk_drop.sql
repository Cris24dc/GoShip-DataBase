CREATE OR REPLACE TRIGGER check_fk_before_drop
BEFORE DROP ON SCHEMA
DECLARE
    constraint_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO constraint_count
    FROM all_constraints
    WHERE UPPER(table_name) = UPPER(ora_dict_obj_name)
      AND constraint_type = 'R';

    IF constraint_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'The table cannot be dropped because it has associated FOREIGN KEY constraints.');
    END IF;
END;
/
