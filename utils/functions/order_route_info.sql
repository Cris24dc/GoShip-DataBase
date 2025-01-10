-- Creaza un subprogram stocat independent care sa ia ca parametri id-ul unei comenzi si o valoare booleana. Sa se afiseze
-- toate depozitele prin care comanda a trecut, alaturi de adresa acestora, soferii care au livrat comanda, dar si data de
-- plecare din fiecare depozit. Daca al doilea parametru este setat pe TRUE, sa se afiseze suplimentar si toate comenzile
-- care au fost livrate pe aceasta ruta.

CREATE OR REPLACE PROCEDURE detalii_comenzi (
    p_id_comanda IN NUMBER,
    p_afiseaza_toate IN BOOLEAN
) AS
    v_id_comenzi VARCHAR2(100) := '';
    CURSOR ruta_cursor(p_id NUMBER) IS
        SELECT 
            d.nume_depozit,
            d.adresa_depozit,
            a.nume_angajat || ' ' || a.prenume_angajat AS sofer,
            r.id_depozit,
            r.id_sofer,
            r.data_plecare
        FROM 
            RUTE r
        JOIN DEPOZITE d ON r.id_depozit = d.id_depozit
        JOIN SOFERI s ON r.id_sofer = s.id_angajat
        JOIN ANGAJATI a ON s.id_angajat = a.id_angajat
        WHERE 
            r.id_comanda = p_id
        ORDER BY 
            r.data_plecare;
BEGIN
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    FOR r IN ruta_cursor(p_id_comanda) LOOP
        -- Afișarea informațiilor comune
        DBMS_OUTPUT.PUT_LINE('Depozit: ' || r.nume_depozit);
        DBMS_OUTPUT.PUT_LINE('Adresă Depozit: ' || r.adresa_depozit);
        DBMS_OUTPUT.PUT_LINE('Șofer: ' || r.sofer);
        DBMS_OUTPUT.PUT_LINE('Data Plecare: ' || TO_CHAR(r.data_plecare, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('-----------------------------');

        -- Dacă trebuie afișate toate comenzile de pe aceeași rută
        IF p_afiseaza_toate THEN
            FOR r2 IN (
                SELECT DISTINCT c.id_comanda
                FROM 
                    RUTE r2
                JOIN COMENZI c ON r2.id_comanda = c.id_comanda
                WHERE
                    r2.id_depozit = r.id_depozit
                    AND r2.id_sofer = r.id_sofer
                    AND r2.data_plecare = r.data_plecare
            ) LOOP
                IF INSTR(' ' || v_id_comenzi || ' ', ' ' || r2.id_comanda || ' ') = 0 THEN
                    v_id_comenzi := v_id_comenzi || ' ' || r2.id_comanda;
                END IF;
            END LOOP;
        END IF;
    END LOOP;

    IF p_afiseaza_toate THEN
        DBMS_OUTPUT.PUT_LINE('Comenzile care au fost livrate pe aceeași rută: ' || TRIM(v_id_comenzi));
    END IF;
END;
/

BEGIN
    detalii_comenzi(101, FALSE);
END;
/

BEGIN
    detalii_comenzi(101, TRUE);
END;
/