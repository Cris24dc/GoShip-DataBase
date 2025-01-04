CREATE OR REPLACE PROCEDURE DATE_DEPOZIT IS
   TYPE salarii_depozit IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
   l_salarii_totale salarii_depozit;

   TYPE angajati IS TABLE OF VARCHAR2(255);
   l_angajati_depozit angajati := angajati();

   TYPE salarii IS VARRAY(100) OF NUMBER;
   l_salarii_angajati salarii;

BEGIN
   FOR depozit IN (
      SELECT D.ID_DEPOZIT, D.NUME_DEPOZIT, NVL(SUM(A.SALARIU_ANGAJAT), 0) AS SALARIU_TOTAL
      FROM DEPOZITE D
      LEFT JOIN ANGAJATI A ON D.ID_DEPOZIT = A.ID_DEPOZIT
      GROUP BY D.ID_DEPOZIT, D.NUME_DEPOZIT
   ) LOOP
      l_salarii_totale(depozit.ID_DEPOZIT) := depozit.SALARIU_TOTAL;

      l_angajati_depozit.DELETE;
      l_salarii_angajati := salarii();

      FOR angajat IN (
         SELECT NUME_ANGAJAT, PRENUME_ANGAJAT, SALARIU_ANGAJAT
         FROM ANGAJATI
         WHERE ID_DEPOZIT = depozit.ID_DEPOZIT
      ) LOOP
         l_angajati_depozit.EXTEND;
         l_angajati_depozit(l_angajati_depozit.COUNT) := angajat.NUME_ANGAJAT || ' ' || angajat.PRENUME_ANGAJAT;

         IF l_salarii_angajati.COUNT < l_salarii_angajati.LIMIT THEN
            l_salarii_angajati.EXTEND;
            l_salarii_angajati(l_salarii_angajati.COUNT) := angajat.SALARIU_ANGAJAT;
         ELSE
            DBMS_OUTPUT.PUT_LINE('Depozitul ' || depozit.NUME_DEPOZIT || ' are prea multi angajati.');
         END IF;
      END LOOP;

      DECLARE
         suma_salarii NUMBER := 0;
         salariu_mediu NUMBER := 0;
      BEGIN
         FOR i IN 1 .. l_salarii_angajati.COUNT LOOP
            suma_salarii := suma_salarii + l_salarii_angajati(i);
         END LOOP;
         IF l_salarii_angajati.COUNT > 0 THEN
            salariu_mediu := suma_salarii / l_salarii_angajati.COUNT;
         END IF;

         DBMS_OUTPUT.PUT_LINE('----------------------');
         DBMS_OUTPUT.PUT_LINE(depozit.NUME_DEPOZIT);
         DBMS_OUTPUT.PUT_LINE('  Salariul total: ' || l_salarii_totale(depozit.ID_DEPOZIT));
         DBMS_OUTPUT.PUT_LINE('  Salariul mediu: ' || salariu_mediu);
         DBMS_OUTPUT.PUT_LINE('  Angajati:');
         FOR i IN 1 .. l_angajati_depozit.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('   - ' || l_angajati_depozit(i));
         END LOOP;
      END;
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('----------------------');
END;
/

BEGIN
   date_depozit;
END;
/
