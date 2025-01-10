-- Creeaza un DDL Trigger in oracle plsql, care atunci cand se da drop la un tabel, daca acel tabel are FK, se afiseaza un mesaj de eroare si nu este lasat sa faca aceasta actiune

CREATE OR REPLACE TRIGGER prevent_table_drop_with_fk
BEFORE DROP ON SCHEMA
BEGIN
  FOR rec IN (
    SELECT c.table_name, c.constraint_name
    FROM user_constraints c
    WHERE c.constraint_type = 'R' -- Restriction for foreign keys
      AND EXISTS (
        SELECT 1
        FROM user_constraints p
        WHERE p.constraint_type IN ('P', 'U') -- Primary or Unique constraints
          AND c.r_constraint_name = p.constraint_name
          AND p.table_name = ora_dict_obj_name
      )
  )
  LOOP
    RAISE_APPLICATION_ERROR(
      -20001,
      'Cannot drop table ' || ora_dict_obj_name ||
      ' because it is referenced by foreign key constraint ' || rec.constraint_name
    );
  END LOOP;
END prevent_table_drop_with_fk;
/
