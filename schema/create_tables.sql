-- drop tables with foreign key dependencies first
DROP TABLE PRODUS_COMANDA CASCADE CONSTRAINTS;
DROP TABLE RUTE CASCADE CONSTRAINTS;
DROP TABLE COMENZI CASCADE CONSTRAINTS;
DROP TABLE MANIPULANTI CASCADE CONSTRAINTS;
DROP TABLE SOFERI CASCADE CONSTRAINTS;

-- drop tables that are referenced by other tables
DROP TABLE PRODUSE CASCADE CONSTRAINTS;
DROP TABLE PRODUCATORI CASCADE CONSTRAINTS;
DROP TABLE CATEGORII CASCADE CONSTRAINTS;
DROP TABLE FACTURI CASCADE CONSTRAINTS;
DROP TABLE CLIENTI CASCADE CONSTRAINTS;

-- drop tables with no dependencies or primary dependencies
DROP TABLE ANGAJATI CASCADE CONSTRAINTS;
DROP TABLE DEPOZITE CASCADE CONSTRAINTS;

-- tabele:
CREATE TABLE DEPOZITE (
    id_depozit        NUMBER NOT NULL,
    nume_depozit      VARCHAR2(50) NOT NULL,
    adresa_depozit    VARCHAR2(255) NOT NULL,
    CONSTRAINT depozit_pk PRIMARY KEY (id_depozit)
);

CREATE TABLE PRODUCATORI (
    id_producator     NUMBER NOT NULL,
    nume_producator   VARCHAR2(50) NOT NULL,
    adresa_producator VARCHAR2(255) NOT NULL,
    CONSTRAINT producator_pk PRIMARY KEY (id_producator)
);

CREATE TABLE CATEGORII (
    id_categorie      NUMBER NOT NULL,
    nume_categorie    VARCHAR2(50) NOT NULL,
    descriere_categorie VARCHAR2(255),
    CONSTRAINT categorie_pk PRIMARY KEY (id_categorie)
);

CREATE TABLE CLIENTI (
    id_client         NUMBER NOT NULL,
    nume_client       VARCHAR2(50) NOT NULL,
    prenume_client    VARCHAR2(50) NOT NULL,
    email_client      VARCHAR2(100) NOT NULL,
    telefon_client    VARCHAR2(15) NOT NULL,
    adresa_client     VARCHAR2(255) NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (id_client)
);

CREATE TABLE FACTURI (
    id_factura        NUMBER NOT NULL,
    data_facturare    DATE NOT NULL,
    suma_factura      NUMBER NOT NULL,
    tva_factura       NUMBER NOT NULL,
    CONSTRAINT factura_pk PRIMARY KEY (id_factura)
);

CREATE TABLE ANGAJATI (
    id_angajat        NUMBER NOT NULL,
    id_depozit        NUMBER NOT NULL,
    nume_angajat      VARCHAR2(50) NOT NULL,
    prenume_angajat   VARCHAR2(50) NOT NULL,
    email_angajat     VARCHAR2(100) NOT NULL,
    telefon_angajat   VARCHAR2(10),
    salariu_angajat   NUMBER NOT NULL,
    data_angajare     DATE NOT NULL,
    CONSTRAINT angajat_pk PRIMARY KEY (id_angajat),
    CONSTRAINT angajat_depozit_fk FOREIGN KEY (id_depozit) REFERENCES DEPOZITE(id_depozit)
);

CREATE TABLE MANIPULANTI (
    id_angajat        NUMBER NOT NULL,
    ora_incepere_program DATE NOT NULL,
    ora_terminare_program DATE NOT NULL,
    CONSTRAINT manipulant_pk PRIMARY KEY (id_angajat),
    CONSTRAINT manipulant_angajat_fk FOREIGN KEY (id_angajat) REFERENCES ANGAJATI(id_angajat)
);

CREATE TABLE SOFERI (
    id_angajat        NUMBER NOT NULL,
    categorie_permis_sofer VARCHAR2(10) NOT NULL,
    numar_masina_sofer VARCHAR2(50) NOT NULL,
    data_asigurare_sofer DATE NOT NULL,
    CONSTRAINT sofer_pk PRIMARY KEY (id_angajat),
    CONSTRAINT sofer_angajat_fk FOREIGN KEY (id_angajat) REFERENCES ANGAJATI(id_angajat)
);

CREATE TABLE PRODUSE (
    id_produs         NUMBER NOT NULL,
    id_producator     NUMBER NOT NULL,
    id_categorie      NUMBER NOT NULL,
    nume_produs       VARCHAR2(50) NOT NULL,
    pret_produs       NUMBER NOT NULL,
    stoc_produs       NUMBER NOT NULL,
    descriere_produs  VARCHAR2(255),
    CONSTRAINT produs_pk PRIMARY KEY (id_produs),
    CONSTRAINT produs_producator_fk FOREIGN KEY (id_producator) REFERENCES PRODUCATORI(id_producator),
    CONSTRAINT produs_categorie_fk FOREIGN KEY (id_categorie) REFERENCES CATEGORII(id_categorie)
);

CREATE TABLE COMENZI (
    id_comanda        NUMBER NOT NULL,
    id_client         NUMBER NOT NULL,
    id_factura        NUMBER NOT NULL,
    data_plasare_comanda DATE NOT NULL,
    status_comanda    VARCHAR2(50) NOT NULL,
    pret_comanda      NUMBER NOT NULL,
    CONSTRAINT comanda_pk PRIMARY KEY (id_comanda),
    CONSTRAINT comanda_client_fk FOREIGN KEY (id_client) REFERENCES CLIENTI(id_client),
    CONSTRAINT comanda_factura_fk FOREIGN KEY (id_factura) REFERENCES FACTURI(id_factura)
);

CREATE TABLE PRODUS_COMANDA (
    id_produs         NUMBER NOT NULL,
    id_comanda        NUMBER NOT NULL,
    CONSTRAINT produs_comanda_produs_fk FOREIGN KEY (id_produs) REFERENCES PRODUSE(id_produs),
    CONSTRAINT produs_comanda_comanda_fk FOREIGN KEY (id_comanda) REFERENCES COMENZI(id_comanda)
);

CREATE TABLE RUTE (
    id_ruta         NUMBER NOT NULL,
    id_depozit      NUMBER NOT NULL,
    id_comanda      NUMBER NOT NULL,
    id_sofer        NUMBER NOT NULL,
    durata_estimata NUMBER NOT NULL,
    CONSTRAINT ruta_pk PRIMARY KEY (id_ruta),
    CONSTRAINT ruta_depozit_fk FOREIGN KEY (id_depozit) REFERENCES DEPOZITE(id_depozit),
    CONSTRAINT ruta_comanda_fk FOREIGN KEY (id_comanda) REFERENCES COMENZI(id_comanda),
    CONSTRAINT ruta_sofer_fk FOREIGN KEY (id_sofer) REFERENCES SOFERI(id_angajat)
);
