DECLARE
  --table type and variable
  TYPE V_VARRAY_T IS VARRAY (3) OF VARCHAR2(30);
  v_varray V_VARRAY_T := V_VARRAY_T();

BEGIN

  -- add 3 entries
  v_varray.extend(3);
  v_varray(1) := 'A';
  v_varray(2) := 'B';
  v_varray(3) := 'C';

  DBMS_OUTPUT.PUT_LINE('... when 3 enteries added ...');
  DBMS_OUTPUT.PUT_LINE('Table count ' || v_varray.COUNT);
  DBMS_OUTPUT.PUT_LINE('Table first ' || v_varray.FIRST);
  DBMS_OUTPUT.PUT_LINE('Table last ' || v_varray.LAST);

  -- v_varray.DELETE; This will delete all the elements
  -- we can rely on simple for loop in case of VARRAY

  DBMS_OUTPUT.PUT_LINE('--- SIMPLE LOOP ---');
  FOR counter in 1..v_varray.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(counter || ' ' || v_varray(counter));
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- FIRST AND NEXT ---');
  DECLARE
    v_counter BINARY_INTEGER;
    BEGIN
    v_counter := v_varray.FIRST;
    LOOP
      EXIT when v_counter IS NULL;
      DBMS_OUTPUT.PUT_LINE(v_counter || ' ' || v_varray(v_counter));
      v_counter := v_varray.NEXT(v_counter);
    END LOOP;
  END;

  DBMS_OUTPUT.PUT_LINE('--- LAST AND PRIOR ---');
  DECLARE
    v_counter BINARY_INTEGER;
    BEGIN
    v_counter := v_varray.FIRST;
    LOOP
      EXIT WHEN v_counter IS NULL;
      DBMS_OUTPUT.PUT_LINE(v_counter || ' ' || v_varray(v_counter));
      v_counter := v_varray.NEXT(v_counter);
    END LOOP;
  END;

END;
