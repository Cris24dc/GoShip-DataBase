-- Creaza un subprogram stocat independent de tip functie care sa returneze cea mai vanduta categorie

CREATE OR REPLACE FUNCTION cea_mai_vanduta_categorie RETURN VARCHAR2 IS
    nume_categorie VARCHAR2(50);

BEGIN
    SELECT c.nume_categorie
    INTO nume_categorie
    FROM CATEGORII c
    JOIN (
        SELECT p.id_categorie, COUNT(*) AS vanzari_totale
        FROM PRODUSE p
        JOIN PRODUS_COMANDA pc ON p.id_produs = pc.id_produs
        GROUP BY p.id_categorie
        HAVING COUNT(*) = (
            SELECT MAX(vanzari_totale) FROM (
                SELECT p.id_categorie, COUNT(*) AS vanzari_totale
                FROM PRODUSE p
                JOIN PRODUS_COMANDA pc ON p.id_produs = pc.id_produs
                GROUP BY p.id_categorie
            )
        )
    ) vanzari_categorie ON c.id_categorie = vanzari_categorie.id_categorie;

    RETURN nume_categorie;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Nicio categorie nu a fost vândută';
    WHEN TOO_MANY_ROWS THEN
        RETURN 'Mai multe categorii sunt vândute la fel de bine';
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(cea_mai_vanduta_categorie());
END;
/
