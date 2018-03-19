DECLARE

  -- table type and variable
  TYPE v_table_t IS TABLE OF VARCHAR2(30);
  v_table v_table_t := v_table_t();

  BEGIN

  -- add 3 enteries
  v_table.extend(3);
  v_table(1) := 'A';
  v_table(2) := 'B';
  v_table(3) := 'C';

  DBMS_OUTPUT.PUT_LINE('---3 enteries added---');
  DBMS_OUTPUT.PUT_LINE('Table count ' || v_table.COUNT);
  DBMS_OUTPUT.PUT_LINE('Table first ' || v_table.FIRST);
  DBMS_OUTPUT.PUT_LINE('Table last ' || v_table.LAST);

  DBMS_OUTPUT.PUT_LINE('--- simple loop ---');
  FOR counter IN 1..v_table.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(counter || ' ' || v_table(counter));
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- first and next ---');
  DECLARE
    v_counter BINARY_INTEGER;
    BEGIN
    v_counter := v_table.FIRST;
    LOOP
      EXIT WHEN v_counter IS NULL;
      DBMS_OUTPUT.PUT_LINE(v_counter || ' ' || v_table(v_counter));
      v_counter := v_table.NEXT(v_counter);
    END LOOP;

  END;

  DBMS_OUTPUT.PUT_LINE('--- Last and prior ---');
  DECLARE
    v_counter BINARY_INTEGER;
    BEGIN
    v_counter := v_table.LAST;
    LOOP
      EXIT WHEN v_counter IS NULL;
      DBMS_OUTPUT.PUT_LINE(v_counter || ' ' || v_table(v_counter));
      v_counter := v_table.PRIOR(v_counter);
    END LOOP;
  END;

END;
