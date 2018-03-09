DECLARE

  -- index-by type and variable
  TYPE V_INDEX_BY_T IS TABLE OF VARCHAR2(30)
  INDEX BY BINARY_INTEGER;
  v_ib V_INDEX_BY_T;

BEGIN

  -- add 3 entries
  v_ib(1) := 'A';
  v_ib(2) := 'B';
  v_ib(3) := 'C';

  DBMS_OUTPUT.PUT_LINE('...When 3 entries added...');
  DBMS_OUTPUT.PUT_LINE('Index by count ' || v_ib.COUNT);
  DBMS_OUTPUT.PUT_LINE('Index by first ' || v_ib.FIRST);
  DBMS_OUTPUT.PUT_LINE('Index by last ' || v_ib.LAST);

--     v_ib.DELETE(2); VERY VERY IMPORTANT CONCEPT EXPLAINED IN LAST PARAGRAPHS OF THIS FILE.

  -- Simple for loop example

  DBMS_OUTPUT.PUT_LINE('...simple for loop...');
  FOR counter IN 1..v_ib.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(counter || ' ' || v_ib(counter));
  END LOOP;

  -- For loop using first and next example

  DBMS_OUTPUT.PUT_LINE('... First and next ...');
  DECLARE
    v_counter BINARY_INTEGER;
  BEGIN
    v_counter := v_ib.FIRST;
    LOOP
      EXIT WHEN v_counter IS NULL;
      DBMS_OUTPUT.PUT_LINE(v_counter || ' ' || v_ib(v_counter));
      v_counter := v_ib.NEXT(v_counter);
    END LOOP;
  END;

  -- For loop using last and prior

  DBMS_OUTPUT.PUT_LINE('... LAST AND PRIOR ...');
  DECLARE
    v_counter BINARY_INTEGER;
  BEGIN
    v_counter := v_ib.LAST;
    LOOP
      EXIT WHEN v_counter IS NULL;
      DBMS_OUTPUT.PUT_LINE(v_counter || ' ' || v_ib(v_counter));
      v_counter := v_ib.PRIOR(v_counter);
    END LOOP;
  END;

-- important note
-- we should use FIRST AND NEXT ... OR ... LAST AND PRIOR
-- If we delete element at index 2 then only first and next && last and prior will work
-- simple for loop will not work in that case.
-- experimenting done on line number 20

END;

