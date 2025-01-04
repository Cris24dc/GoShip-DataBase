-- drop secvente:
DROP SEQUENCE seq_angajat;
DROP SEQUENCE seq_depozit;
DROP SEQUENCE seq_producator;
DROP SEQUENCE seq_categorie;
DROP SEQUENCE seq_produs;
DROP SEQUENCE seq_comanda;
DROP SEQUENCE seq_ruta;
DROP SEQUENCE seq_client;
DROP SEQUENCE seq_factura;

-- secvente:
CREATE SEQUENCE seq_angajat
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_depozit
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_producator
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_categorie
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_produs
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_comanda
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_ruta
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_client
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_factura
    START WITH 101 
    INCREMENT BY 1 
    MINVALUE 101 
    MAXVALUE 999 
    NOCACHE 
    NOCYCLE;

