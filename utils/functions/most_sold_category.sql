CREATE OR REPLACE FUNCTION best_selling_category RETURN VARCHAR2 IS
    category_name VARCHAR2(50);

BEGIN
    SELECT c.category_name
    INTO category_name
    FROM CATEGORIES c
    JOIN (
        SELECT p.category_id, COUNT(*) AS total_sales
        FROM PRODUCTS p
        JOIN ORDER_PRODUCT po ON p.product_id = po.product_id
        GROUP BY p.category_id
        HAVING COUNT(*) = (
            SELECT MAX(total_sales) FROM (
                SELECT p.category_id, COUNT(*) AS total_sales
                FROM PRODUCTS p
                JOIN ORDER_PRODUCT po ON p.product_id = po.product_id
                GROUP BY p.category_id
            )
        )
    ) sales_category ON c.category_id = sales_category.category_id;

    RETURN category_name;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No category was sold';
    WHEN TOO_MANY_ROWS THEN
        RETURN 'Multiple categories are sold equally well';
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(best_selling_category());
END;
/
