-- Creeaza un Row-level DML Trigger in oracle plsql, care atunci cand este un angajat adaugat in tabela de angajati, verifica daca in depozitul angajatului sunt minim 3 angajati, iar daca sunt, fiecare primeste un bonus de 10% de lei la salariu

CREATE OR REPLACE TRIGGER trg_bonus_angajati
AFTER INSERT ON ANGAJATI
FOR EACH ROW
DECLARE
    numar_angajati NUMBER;
BEGIN
    -- Calculăm numărul de angajați din depozitul asociat
    SELECT COUNT(*)
    INTO numar_angajati
    FROM ANGAJATI
    WHERE id_depozit = :NEW.id_depozit;

    -- Dacă sunt cel puțin 3 angajați în depozit, actualizăm salariile cu bonusul de 10%
    IF numar_angajati >= 3 THEN
        UPDATE ANGAJATI
        SET salariu_angajat = salariu_angajat * 1.1
        WHERE id_depozit = :NEW.id_depozit;
    END IF;
END;
/
