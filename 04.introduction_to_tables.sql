DECLARE

  -- index-by type and variable
  TYPE V_INDEX_BY_T IS TABLE OF VARCHAR2(30)
  INDEX BY BINARY_INTEGER;
  v_ib     V_INDEX_BY_T;

  -- table type and variable
  TYPE V_TABLE_T IS TABLE OF VARCHAR2(20);
  v_table  V_TABLE_T := v_table_t();

  -- varray type and variable
  TYPE V_VARRAY_T IS VARRAY (4) OF VARCHAR2(20);
  v_varray V_VARRAY_T := v_varray_t();

BEGIN

  DBMS_OUTPUT.PUT_LINE('... WHEN EMPTY ...');
  DBMS_OUTPUT.PUT_LINE('Index by count ' || v_ib.COUNT);
  DBMS_OUTPUT.PUT_LINE('Table Count ' || v_table.COUNT);
  DBMS_OUTPUT.PUT_LINE('Varray Count ' || v_varray.COUNT);

  DBMS_OUTPUT.PUT_LINE('Index by first ' || v_ib.FIRST);
  DBMS_OUTPUT.PUT_LINE('Table first ' || v_table.FIRST);
  DBMS_OUTPUT.PUT_LINE('Varray last ' || v_varray.LAST);

  DBMS_OUTPUT.PUT_LINE('Index by last ' || v_ib.LAST);
  DBMS_OUTPUT.PUT_LINE('Table last ' || v_table.LAST);
  DBMS_OUTPUT.PUT_LINE('Varray last ' || v_varray.LAST);

END;
