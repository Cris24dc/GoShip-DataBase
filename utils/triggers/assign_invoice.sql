CREATE OR REPLACE TRIGGER associate_invoice_to_order
AFTER INSERT ON ORDERS
FOR EACH ROW
BEGIN
    INSERT INTO INVOICES (
        invoice_id, 
        order_id, 
        invoice_date, 
        invoice_total, 
        invoice_tax
    ) 
    VALUES (
        seq_invoice.NEXTVAL, 
        :NEW.order_id, 
        SYSDATE, 
        :NEW.order_total + (:NEW.order_total * 0.2), 
        20
    );
END;