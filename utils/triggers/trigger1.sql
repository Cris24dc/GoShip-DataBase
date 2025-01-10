-- Creeaza un Statement-level DML Trigger in oracle plsql, care atunci cand este adaugata o comanda sa adauge in tabelul facturi factura aferenta comenzii.

-- Crearea triggerului
CREATE OR REPLACE TRIGGER trg_after_insert_comenzi
AFTER INSERT ON COMENZI
FOR EACH ROW
BEGIN
    INSERT INTO FACTURI (
        id_factura, 
        id_comanda, 
        data_facturare, 
        suma_factura, 
        tva_factura
    ) 
    VALUES (
        seq_facturi.NEXTVAL, 
        :NEW.id_comanda, 
        SYSDATE, 
        :NEW.pret_comanda, 
        :NEW.pret_comanda * 0.19 -- Exemplu de TVA 19%
    );
END;
/