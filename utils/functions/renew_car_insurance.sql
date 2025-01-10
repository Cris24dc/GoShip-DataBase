-- Creaza un subprogram stocat independent care sa identifice soferii cu asigurarile care depasesc termenul dat ca parametru. 
-- Acesta sa afiseze numarul de soferi cu asigurari expirate si numele acestora. Daca nu exista soferi cu asigurari expirate,
-- sa afiseze un mesaj corespunzator.

CREATE OR REPLACE PROCEDURE reinnoire_asigurari (p_perioada_luni IN NUMBER) IS
  CURSOR cursor_soferi_expirati IS
    SELECT id_angajat, numar_masina_sofer, data_asigurare_sofer
    FROM SOFERI
    WHERE data_asigurare_sofer < ADD_MONTHS(SYSDATE, -p_perioada_luni)
    FOR UPDATE;

  CURSOR cursor_nume_angajat(p_id_angajat IN NUMBER) IS
    SELECT nume_angajat, prenume_angajat
    FROM ANGAJATI
    WHERE id_angajat = p_id_angajat;

  v_numar_masina_sofer SOFERI.numar_masina_sofer%TYPE;
  v_nr_expirati NUMBER := 0;
  v_nume_angajati_reinnoiti VARCHAR2(100);
  v_nume_angajati_collection VARCHAR2(100) := '';
  
BEGIN
  FOR sofer IN cursor_soferi_expirati LOOP
    UPDATE SOFERI
    SET data_asigurare_sofer = SYSDATE
    WHERE CURRENT OF cursor_soferi_expirati;

    v_nr_expirati := v_nr_expirati + 1;

    FOR angajat IN cursor_nume_angajat(sofer.id_angajat) LOOP
      v_nume_angajati_collection := v_nume_angajati_collection || ' - ' || angajat.nume_angajat || ' ' || angajat.prenume_angajat || CHR(10);
    END LOOP;
  END LOOP;

  IF v_nr_expirati = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Nu exista soferi cu asigurari expirate.');
  ELSE
    DBMS_OUTPUT.PUT_LINE(v_nr_expirati || ' soferi au avut asigurarile reinnoite.');
    DBMS_OUTPUT.PUT_LINE(v_nume_angajati_collection);
  END IF;

  COMMIT;
END;
/

BEGIN
  reinnoire_asigurari(12);
END;
/
