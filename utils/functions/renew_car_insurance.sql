CREATE OR REPLACE PROCEDURE reinnoire_asigurari_expirate (p_perioada_luni IN NUMBER) IS
  CURSOR soferi_expirati_cursor(p_luni IN NUMBER) IS
    SELECT numar_masina_sofer
    FROM SOFERI
    WHERE data_asigurare_sofer < ADD_MONTHS(SYSDATE, -p_luni);

  CURSOR soferi_for_update_cursor IS
    SELECT numar_masina_sofer, data_asigurare_sofer
    FROM SOFERI
    WHERE data_asigurare_sofer < ADD_MONTHS(SYSDATE, -p_perioada_luni)
    FOR UPDATE;

  v_numar_masina_sofer SOFERI.numar_masina_sofer%TYPE;
  v_nr_expirati NUMBER := 0;

BEGIN
  FOR sofer IN soferi_expirati_cursor(p_perioada_luni) LOOP
    v_nr_expirati := v_nr_expirati + 1;
  END LOOP;

  IF v_nr_expirati = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Nu exista soferi cu asigurari expirate.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Asigurarile au fost reinnoite pentru masinile: ');
    FOR sofer IN soferi_expirati_cursor(p_perioada_luni) LOOP
        DBMS_OUTPUT.PUT_LINE('  - ' || sofer.numar_masina_sofer);
    END LOOP;
  END IF;

  FOR sofer IN soferi_for_update_cursor LOOP
    UPDATE SOFERI
    SET data_asigurare_sofer = SYSDATE
    WHERE numar_masina_sofer = sofer.numar_masina_sofer;
  END LOOP;

  COMMIT;
END;
/

BEGIN
  reinnoire_asigurari_expirate(12);
END;
/
