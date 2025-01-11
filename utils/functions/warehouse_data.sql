CREATE OR REPLACE PROCEDURE warehouse_data IS
   TYPE salaries_warehouse IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
   l_total_salaries salaries_warehouse;

   TYPE employees IS TABLE OF VARCHAR2(255);
   l_warehouse_employees employees := employees();

   TYPE salaries IS VARRAY(100) OF NUMBER;
   l_employee_salaries salaries;

BEGIN
   FOR warehouse IN (
      SELECT W.warehouse_id, W.warehouse_name, NVL(SUM(E.employee_salary), 0) AS total_salary
      FROM warehouses W
      LEFT JOIN employees E ON W.warehouse_id = E.warehouse_id
      GROUP BY W.warehouse_id, W.warehouse_name
   ) LOOP
      l_total_salaries(warehouse.warehouse_id) := warehouse.total_salary;

      l_warehouse_employees.DELETE;
      l_employee_salaries := salaries();

      FOR employee IN (
         SELECT employee_first_name, employee_last_name, employee_salary
         FROM employees
         WHERE warehouse_id = warehouse.warehouse_id
      ) LOOP
         l_warehouse_employees.EXTEND;
         l_warehouse_employees(l_warehouse_employees.COUNT) := employee.employee_first_name || ' ' || employee.employee_last_name;

         IF l_employee_salaries.COUNT < l_employee_salaries.LIMIT THEN
            l_employee_salaries.EXTEND;
            l_employee_salaries(l_employee_salaries.COUNT) := employee.employee_salary;
         ELSE
            DBMS_OUTPUT.PUT_LINE('The warehouse ' || warehouse.warehouse_name || ' has too many employees.');
         END IF;
      END LOOP;

      DECLARE
         total_salary_sum NUMBER := 0;
         average_salary NUMBER := 0;
      BEGIN
         FOR i IN 1 .. l_employee_salaries.COUNT LOOP
            total_salary_sum := total_salary_sum + l_employee_salaries(i);
         END LOOP;
         IF l_employee_salaries.COUNT > 0 THEN
            average_salary := total_salary_sum / l_employee_salaries.COUNT;
         END IF;

         DBMS_OUTPUT.PUT_LINE('----------------------');
         DBMS_OUTPUT.PUT_LINE(warehouse.warehouse_name);
         DBMS_OUTPUT.PUT_LINE('  Total Salary: ' || l_total_salaries(warehouse.warehouse_id));
         DBMS_OUTPUT.PUT_LINE('  Average Salary: ' || average_salary);
         DBMS_OUTPUT.PUT_LINE('  Employees:');
         FOR i IN 1 .. l_warehouse_employees.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('   - ' || l_warehouse_employees(i));
         END LOOP;
      END;
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('----------------------');
END;
/

BEGIN
   warehouse_data;
END;
/
