-- Creeaza in oracle plsql un pachet care sa contina 2 tipuri de date, 2 proceduri si 2 functii, astfel incat sa se ceara un id al unui user si sa se adauge o noua comanda la userul respectiv cu datele implicite, iar cu suma comenzii 0. Iar apoi userului i se arata toate produsele si id-ul lor si il pune sa selecteze produse pana apasa q. Selectand produse se adauga relatia in tabelul intermediar produs_comanda, cu id-ul produsului si al comenzii. Repet tine minte ca aceste functionalitati trebuie facute intr-un pachet care sa contina 2 tipuri de date, 2 proceduri si 2 functii. Aceasta parte este foarte importanta.

CREATE OR REPLACE PACKAGE GESTIONARE_COMENZI IS
    -- Tipuri de date
    TYPE T_LISTA_PRODUSE IS TABLE OF PRODUSE%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE T_PRODUS_SELECTAT IS RECORD (
        id_produs NUMBER,
        nume_produs VARCHAR2(50)
    );

    -- Functii
    FUNCTION GENEREAZA_ID_COMANDA RETURN NUMBER;
    FUNCTION LISTA_PRODUSE RETURN T_LISTA_PRODUSE;

    -- Proceduri
    PROCEDURE ADAUGA_COMANDA(id_client IN NUMBER);
    PROCEDURE SELECTEAZA_PRODUSE(id_comanda IN NUMBER);
END GESTIONARE_COMENZI;
/
CREATE OR REPLACE PACKAGE BODY GESTIONARE_COMENZI IS
    -- Generare ID unic pentru comanda
    FUNCTION GENEREAZA_ID_COMANDA RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT NVL(MAX(id_comanda), 0) + 1 INTO v_id FROM COMENZI;
        RETURN v_id;
    END GENEREAZA_ID_COMANDA;

    -- Listarea produselor
    FUNCTION LISTA_PRODUSE RETURN T_LISTA_PRODUSE IS
        v_lista T_LISTA_PRODUSE;
        v_index PLS_INTEGER := 1;
    BEGIN
        FOR produs IN (SELECT id_produs, nume_produs, pret_produs, stoc_produs FROM PRODUSE) LOOP
            v_lista(v_index).id_produs := produs.id_produs;
            v_lista(v_index).nume_produs := produs.nume_produs;
            v_index := v_index + 1;
        END LOOP;
        RETURN v_lista;
    END LISTA_PRODUSE;

    -- Adaugarea unei comenzi cu date implicite
    PROCEDURE ADAUGA_COMANDA(id_client IN NUMBER) IS
        v_id_comanda NUMBER;
        v_data_plasare DATE := SYSDATE;
        v_status VARCHAR2(50) := 'Noua';
        v_pret NUMBER := 0;
    BEGIN
        v_id_comanda := GENEREAZA_ID_COMANDA;
        INSERT INTO COMENZI (id_comanda, id_client, data_plasare_comanda, status_comanda, pret_comanda)
        VALUES (v_id_comanda, id_client, v_data_plasare, v_status, v_pret);
        DBMS_OUTPUT.PUT_LINE('Comanda a fost adaugata cu ID-ul: ' || v_id_comanda);
    END ADAUGA_COMANDA;

    -- Selectarea produselor si asocierea lor cu comanda
    PROCEDURE SELECTEAZA_PRODUSE(id_comanda IN NUMBER) IS
        v_lista_produse T_LISTA_PRODUSE;
        v_id_produs NUMBER;
        v_input VARCHAR2(10);
    BEGIN
        v_lista_produse := LISTA_PRODUSE;
        DBMS_OUTPUT.PUT_LINE('Produsele disponibile:');
        FOR i IN 1..v_lista_produse.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_lista_produse(i).id_produs || ', Nume: ' || v_lista_produse(i).nume_produs);
        END LOOP;

        LOOP
            DBMS_OUTPUT.PUT_LINE('Introduceti ID-ul produsului dorit (sau "q" pentru a iesi):');
            v_input := LOWER(TRIM('&USER_INPUT'));
            EXIT WHEN v_input = 'q';

            BEGIN
                v_id_produs := TO_NUMBER(v_input);
                INSERT INTO PRODUS_COMANDA (id_produs, id_comanda)
                VALUES (v_id_produs, id_comanda);
                DBMS_OUTPUT.PUT_LINE('Produsul cu ID-ul ' || v_id_produs || ' a fost adaugat la comanda.');
            EXCEPTION
                WHEN VALUE_ERROR THEN
                    DBMS_OUTPUT.PUT_LINE('ID-ul introdus nu este valid. Va rugam incercati din nou.');
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('Eroare: ' || SQLERRM);
            END;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Produsele au fost adaugate cu succes la comanda.');
    END SELECTEAZA_PRODUSE;
END GESTIONARE_COMENZI;
/
BEGIN
    GESTIONARE_COMENZI.ADAUGA_COMANDA(1);
END;
/
BEGIN
    GESTIONARE_COMENZI.SELECTEAZA_PRODUSE(1);
END;
/
