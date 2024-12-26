-- Inserari:

-- Depozite:
INSERT INTO DEPOZITE VALUES (seq_depozit.nextval, 'Depozit Bucuresti', 'Bucuresti, Strada Grivitei, Nr. 45');
INSERT INTO DEPOZITE VALUES (seq_depozit.nextval, 'Depozit Cluj-Napoca', 'Cluj-Napoca, Strada Horea, Nr. 12');
INSERT INTO DEPOZITE VALUES (seq_depozit.nextval, 'Depozit Timisoara', 'Timisoara, Strada Victor Babes, Nr. 78');
INSERT INTO DEPOZITE VALUES (seq_depozit.nextval, 'Depozit Constanta', 'Constanta, Strada Mihail Kogalniceanu, Nr. 22');
INSERT INTO DEPOZITE VALUES (seq_depozit.nextval, 'Depozit Brasov', 'Brasov, Strada Iuliu Maniu, Nr. 30');
INSERT INTO DEPOZITE VALUES (seq_depozit.nextval, 'Depozit Iasi', 'Iasi, Strada Stefan Cel Mare, Nr. 18');

-- Angajati:
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 101, 'Maria', 'Popescu', 'maria.popescu@gmail.com', '0745123456', 3000, TO_DATE('15-06-2015', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 102, 'Elena', 'Georgescu', 'elena.georgescu@outlook.com', '0789888777', 3200, TO_DATE('12-12-2018', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 103, 'Mihai', 'Marin', 'mihai.marin@gmail.com', '0766554433', 2800, TO_DATE('23-02-2016', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 104, 'Gheorghe', 'Petrescu', 'gheorghe.petrescu@gmail.com', '0744222333', 3800, TO_DATE('09-11-2020', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 105, 'Adriana', 'Vasile', 'adriana.vasile@gmail.com', '0765443322', 2500, TO_DATE('14-08-2016', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 106, 'Florin', 'Munteanu', 'florin.munteanu@outlook.com', '0722444666', 3600, TO_DATE('18-01-2018', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 101, 'Cosmin', 'Ionescu', 'cosmin.ionescu@gmail.com', '0745126789', 2700, TO_DATE('10-06-2020', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 102, 'Ion', 'Ionescu', 'ion.ionescu@yahoo.com', '0722334455', 3500, TO_DATE('01-09-2017', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 103, 'Ana', 'Dumitru', 'ana.dumitru@live.com', '0733222111', 3300, TO_DATE('05-07-2019', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 104, 'Ioana', 'Stanciu', 'ioana.stanciu@yahoo.com', '0798765432', 3100, TO_DATE('02-04-2014', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 105, 'Vasile', 'Radulescu', 'vasile.radulescu@hotmail.com', '0755332211', 2900, TO_DATE('21-10-2017', 'DD-MM-YYYY'));
INSERT INTO ANGAJATI VALUES (seq_angajat.nextval, 106, 'Raluca', 'Neagu', 'raluca.neagu@live.com', '0739888777', 3400, TO_DATE('30-09-2021', 'DD-MM-YYYY'));

-- Producatori:
INSERT INTO PRODUCATORI VALUES (seq_producator.nextval, 'Danone Romania', 'Bucuresti, Strada Fabrica de Glucoza, Nr. 4');
INSERT INTO PRODUCATORI VALUES (seq_producator.nextval, 'Altex Romania', 'Bucuresti, Strada Calea Vitan, Nr. 27');
INSERT INTO PRODUCATORI VALUES (seq_producator.nextval, 'H&M Romania', 'Bucuresti, Calea Dorobanti, Nr. 230');
INSERT INTO PRODUCATORI VALUES (seq_producator.nextval, 'IKEA Romania', 'Bucuresti, Strada Bulevardul Timisoara, Nr. 26');
INSERT INTO PRODUCATORI VALUES (seq_producator.nextval, 'Noriel', 'Bucuresti, Strada Lizeanu, Nr. id: 10');
INSERT INTO PRODUCATORI VALUES (seq_producator.nextval, 'Sephora', 'Bucuresti, Strada Sos. Nicolae Titulescu, Nr. 6');
INSERT INTO PRODUCATORI VALUES (seq_producator.nextval, 'Decathlon', 'Bucuresti, Strada Barbu Vacarescu, Nr. 120');

-- Categorii:
INSERT INTO CATEGORII VALUES (seq_categorie.nextval, 'Alimente', 'Produse alimentare pentru consumul zilnic');
INSERT INTO CATEGORII VALUES (seq_categorie.nextval, 'Electronice', 'Produse electronice perfecte pentru orice casa');
INSERT INTO CATEGORII VALUES (seq_categorie.nextval, 'Haine', 'Imbracaminte pentru toate varstele');
INSERT INTO CATEGORII VALUES (seq_categorie.nextval, 'Mobilier', 'Produse pentru decorarea si amenajarea casei');
INSERT INTO CATEGORII VALUES (seq_categorie.nextval, 'Jucarii', 'Jucarii pentru copii de toate varstele');
INSERT INTO CATEGORII VALUES (seq_categorie.nextval, 'Cosmetice', 'Produse pentru ingrijire');
INSERT INTO CATEGORII VALUES (seq_categorie.nextval, 'Sport', 'Echipamente si imbracaminte sportiva');

-- Produse:
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 101, 101, 'Lapte', 5.5, 100, 'Lapte proaspat 1L');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 102, 102, 'Televizor LED', 1500, 50, 'Televizor LED 4K 55 inch');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 103, 103, 'Tricou', 79, 200, 'Tricou din bumbac pentru barbati');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 104, 104, 'Canapea', 1500, 30, 'Canapea extensibila 3 locuri');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 105, 105, 'Masina de jucarie', 120, 150, 'Masina de jucarie cu telecomanda');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 106, 106, 'Ruj', 45, 80, 'Ruj mat cu finish natural');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 107, 107, 'Echipament fotbal', 250, 50, 'Set echipament fotbal copii');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 101, 101, 'Branza', 15, 120, 'Branza de burduf 200g');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 102, 102, 'Laptop', 3500, 40, 'Laptop HP i7, 16GB RAM, 512GB SSD');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 103, 103, 'Pantaloni', 120, 90, 'Pantaloni chino pentru barbati');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 104, 104, 'Masa de dining', 800, 60, 'Masa de dining din lemn masiv');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 105, 105, 'Puzzle', 50, 100, 'Puzzle 1000 piese pentru copii');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 106, 106, 'Crema hidratanta', 65, 120, 'Crema hidratanta pentru fata');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 107, 107, 'Trening', 150, 70, 'Trening sportiv barbati');
INSERT INTO PRODUSE VALUES (seq_produs.nextval, 101, 101, 'Iaurt', 3.5, 200, 'Iaurt natur 400g');


-- Clienti:
INSERT INTO CLIENTI VALUES (seq_client.nextval, 'Ion', 'Popescu', 'ion.popescu@email.com', '0723456789', 'Bucuresti, Strada Mihai Eminescu, Nr. 45');
INSERT INTO CLIENTI VALUES (seq_client.nextval, 'Maria', 'Ionescu', 'maria.ionescu@email.com', '0734567890', 'Cluj-Napoca, Strada Avram Iancu, Nr. 23');
INSERT INTO CLIENTI VALUES (seq_client.nextval, 'Andrei', 'Vasile', 'andrei.vasile@email.com', '0745678901', 'Timisoara, Strada Alba Iulia, Nr. 88');
INSERT INTO CLIENTI VALUES (seq_client.nextval, 'Elena', 'Dumitrescu', 'elena.dumitrescu@email.com', '0756789012', 'Iasi, Strada Copou, Nr. 12');
INSERT INTO CLIENTI VALUES (seq_client.nextval, 'Florin', 'Mihailescu', 'florin.mihailescu@email.com', '0767890123', 'Constanta, Strada Unirii, Nr. 56');
INSERT INTO CLIENTI VALUES (seq_client.nextval, 'Ana', 'Georgescu', 'ana.georgescu@email.com', '0778901234', 'Brasov, Strada Lunga, Nr. 34');

-- Facturi:
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('19-01-2024', 'DD-MM-YYYY'), 120, 5);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('17-11-2024', 'DD-MM-YYYY'), 200, 19);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('04-10-2024', 'DD-MM-YYYY'), 600, 24);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('28-05-2024', 'DD-MM-YYYY'), 400, 19);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('30-08-2024', 'DD-MM-YYYY'), 750, 36);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('08-09-2024', 'DD-MM-YYYY'), 450, 22);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('23-06-2024', 'DD-MM-YYYY'), 500, 24);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('07-04-2024', 'DD-MM-YYYY'), 300, 14);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('15-03-2024', 'DD-MM-YYYY'), 250, 12);
INSERT INTO FACTURI VALUES (seq_factura.nextval, TO_DATE('12-07-2024', 'DD-MM-YYYY'), 150, 7);

-- Comenzi:
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 105, 101, TO_DATE('19-01-2024', 'DD-MM-YYYY'), 'Anulata', 120);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 104, 102, TO_DATE('17-11-2024', 'DD-MM-YYYY'), 'In asteptare', 200);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 104, 103, TO_DATE('04-10-2024', 'DD-MM-YYYY'), 'Procesata', 600);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 102, 104, TO_DATE('28-05-2024', 'DD-MM-YYYY'), 'Finalizata', 400);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 104, 105, TO_DATE('30-08-2024', 'DD-MM-YYYY'), 'Procesata', 750);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 106, 106, TO_DATE('08-09-2024', 'DD-MM-YYYY'), 'Procesata', 450);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 102, 107, TO_DATE('23-06-2024', 'DD-MM-YYYY'), 'Finalizata', 500);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 101, 108, TO_DATE('07-04-2024', 'DD-MM-YYYY'), 'In livrare', 300);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 101, 109, TO_DATE('15-03-2024', 'DD-MM-YYYY'), 'Procesata', 250);
INSERT INTO COMENZI VALUES (seq_comanda.nextval, 103, 110, TO_DATE('12-07-2024', 'DD-MM-YYYY'), 'In asteptare', 150);

-- Produs_comanda:
INSERT INTO PRODUS_COMANDA VALUES (101, 101);
INSERT INTO PRODUS_COMANDA VALUES (102, 101);
INSERT INTO PRODUS_COMANDA VALUES (103, 102);
INSERT INTO PRODUS_COMANDA VALUES (104, 102);
INSERT INTO PRODUS_COMANDA VALUES (105, 103);
INSERT INTO PRODUS_COMANDA VALUES (106, 103);
INSERT INTO PRODUS_COMANDA VALUES (107, 104);
INSERT INTO PRODUS_COMANDA VALUES (101, 104);
INSERT INTO PRODUS_COMANDA VALUES (102, 105);
INSERT INTO PRODUS_COMANDA VALUES (103, 105);
INSERT INTO PRODUS_COMANDA VALUES (104, 106);
INSERT INTO PRODUS_COMANDA VALUES (105, 106);
INSERT INTO PRODUS_COMANDA VALUES (106, 107);
INSERT INTO PRODUS_COMANDA VALUES (107, 107);
INSERT INTO PRODUS_COMANDA VALUES (101, 108);
INSERT INTO PRODUS_COMANDA VALUES (102, 108);
INSERT INTO PRODUS_COMANDA VALUES (103, 109);
INSERT INTO PRODUS_COMANDA VALUES (104, 109);
INSERT INTO PRODUS_COMANDA VALUES (105, 110);
INSERT INTO PRODUS_COMANDA VALUES (106, 110);
INSERT INTO PRODUS_COMANDA VALUES (107, 101);
INSERT INTO PRODUS_COMANDA VALUES (101, 102);
INSERT INTO PRODUS_COMANDA VALUES (102, 103);
INSERT INTO PRODUS_COMANDA VALUES (103, 104);
INSERT INTO PRODUS_COMANDA VALUES (104, 105);
INSERT INTO PRODUS_COMANDA VALUES (105, 106);
INSERT INTO PRODUS_COMANDA VALUES (106, 107);
INSERT INTO PRODUS_COMANDA VALUES (107, 108);
INSERT INTO PRODUS_COMANDA VALUES (101, 109);
INSERT INTO PRODUS_COMANDA VALUES (102, 110);
INSERT INTO PRODUS_COMANDA VALUES (103, 101);
INSERT INTO PRODUS_COMANDA VALUES (104, 102);
INSERT INTO PRODUS_COMANDA VALUES (105, 103);
INSERT INTO PRODUS_COMANDA VALUES (106, 104);
INSERT INTO PRODUS_COMANDA VALUES (107, 105);

-- Soferi:
INSERT INTO SOFERI VALUES (101, 'C1', 'BZ 101 MAR');
INSERT INTO SOFERI VALUES (102, 'C1E', 'CJ 102 GEO');
INSERT INTO SOFERI VALUES (103, 'C', 'BV 103 MAR');
INSERT INTO SOFERI VALUES (104, 'B1', 'AG 104 PET');
INSERT INTO SOFERI VALUES (105, 'C1', 'PH 105 VAS');
INSERT INTO SOFERI VALUES (106, 'C1E', 'TM 106 MUN');

-- Manipulanti:
INSERT INTO MANIPULANTI VALUES (107, TO_DATE('08-00', 'HH-MM'), TO_DATE('16-00', 'HH-MM'));
INSERT INTO MANIPULANTI VALUES (108, TO_DATE('09-00', 'HH-MM'), TO_DATE('17-00', 'HH-MM'));
INSERT INTO MANIPULANTI VALUES (109, TO_DATE('07-30', 'HH-MM'), TO_DATE('15-30', 'HH-MM'));
INSERT INTO MANIPULANTI VALUES (110, TO_DATE('10-00', 'HH-MM'), TO_DATE('18-00', 'HH-MM'));
INSERT INTO MANIPULANTI VALUES (111, TO_DATE('08-30', 'HH-MM'), TO_DATE('16-30', 'HH-MM'));
INSERT INTO MANIPULANTI VALUES (112, TO_DATE('11-00', 'HH-MM'), TO_DATE('19-00', 'HH-MM'));

-- Rute:
INSERT INTO RUTE VALUES (seq_ruta.nextval, 105, 101, 104, 4);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 102, 101, 106, 5);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 103, 102, 101, 6);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 104, 102, 103, 3);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 105, 103, 105, 7);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 106, 103, 103, 2);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 101, 104, 102, 5);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 104, 104, 104, 4);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 102, 105, 101, 6);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 105, 105, 103, 3);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 101, 106, 104, 8);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 102, 106, 105, 2);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 105, 106, 101, 4);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 106, 107, 106, 3);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 102, 107, 102, 5);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 104, 107, 102, 7);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 101, 108, 103, 6);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 103, 108, 101, 4);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 104, 109, 104, 5);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 106, 109, 105, 3);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 105, 110, 104, 8);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 104, 110, 103, 2);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 102, 110, 106, 5);
INSERT INTO RUTE VALUES (seq_ruta.nextval, 101, 101, 102, 7);
