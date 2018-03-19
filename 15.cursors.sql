-- Explicit cursor OPEN, CLOSE AND FETCH with variable types
DECLARE
  CURSOR curs_get_animal IS
    SELECT *
    FROM ANIMAL;

  -- variable using %ROWTYPE
  v_table_row     animal%ROWTYPE;

  -- variable that takes on columns and datatypes from
  -- the cursor table
  v_cursor_row    curs_get_animal%ROWTYPE;

  -- variable using %TYPE
  v_anchored_id   animal.animal_id%TYPE;
  v_anchored_name animal.animal_name%TYPE;

  -- explicitly defined variables
  v_animal_id     NUMBER;
  v_animal_name   VARCHAR2(100);

BEGIN

  -- explicit cursor open
  OPEN curs_get_animal;

  -- fetch to table row
  FETCH curs_get_animal INTO v_table_row;

  -- fetch to cursor row
  FETCH curs_get_animal INTO v_cursor_row;

  -- fetch to anchored variables
  FETCH curs_get_animal INTO v_anchored_id, v_anchored_name;

  -- fetch to explicit variables
  FETCH curs_get_animal INTO v_animal_id, v_animal_name;

  -- explicitly cursor close
  CLOSE curs_get_animal;

  DBMS_OUTPUT.PUT_LINE('Table row: ' || v_table_row.ANIMAL_ID || ' ' || v_table_row.ANIMAL_NAME);
  DBMS_OUTPUT.PUT_LINE('Cursor row: ' || v_cursor_row.ANIMAL_ID || ' ' || v_cursor_row.ANIMAL_NAME);
  DBMS_OUTPUT.PUT_LINE('Anchored Variable: ' || v_anchored_id || ' ' || v_anchored_name);
  DBMS_OUTPUT.PUT_LINE('Explicit Variables: ' || v_animal_id || ' ' || v_animal_name);
END;


-- explicit cursor attributes
DECLARE
  CURSOR curs_get_animal IS
    SELECT *
    FROM ANIMAL;

  v_animal animal%ROWTYPE;
BEGIN

  IF NOT curs_get_animal%ISOPEN
  THEN
    DBMS_OUTPUT.PUT_LINE('Before: Cursor is not open.');
  END IF;

  OPEN curs_get_animal;

  IF curs_get_animal%ISOPEN
  THEN
    DBMS_OUTPUT.PUT_LINE('Open: Cursor is open.');
  END IF;

  FOR counter IN 1..5 LOOP
    FETCH curs_get_animal INTO v_animal;
    DBMS_OUTPUT.PUT_LINE('Fetched Record ' || curs_get_animal%ROWCOUNT);
    IF curs_get_animal%FOUND
    THEN
      DBMS_OUTPUT.PUT_LINE('Found One');
    END IF;
    IF curs_get_animal%NOTFOUND
    THEN
      DBMS_OUTPUT.PUT_LINE('Did Not Find One');
    END IF;
  END LOOP;

  CLOSE curs_get_animal;

  IF NOT curs_get_animal%ISOPEN
  THEN
    DBMS_OUTPUT.PUT_LINE('Close: Cursor is not open.');
  END IF;

END;

--implicit cursor attribute (non-looping)
-- in implicit SQL keyword returns the cursor to the last executed line.
DECLARE
  v_animal_rec animal%ROWTYPE;
BEGIN

  SELECT *
  INTO v_animal_rec
  FROM ANIMAL
  WHERE ANIMAL_ID = 1;

  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);

  IF SQL%FOUND
  THEN
    DBMS_OUTPUT.PUT_LINE('Found One');
  END IF;

  SELECT *
  INTO v_animal_rec
  FROM ANIMAL
  WHERE ANIMAL_ID = 99;

  EXCEPTION WHEN NO_DATA_FOUND
  THEN
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
    IF SQL%NOTFOUND
    THEN
      DBMS_OUTPUT.PUT_LINE('Did not found one.');
    END IF;
END;

-- can't open cursor that is already open
DECLARE
  CURSOR v_curs IS
    SELECT *
    FROM ANIMAL;
BEGIN
  OPEN v_curs;
  OPEN v_curs;
  EXCEPTION WHEN CURSOR_ALREADY_OPEN
  THEN
    CLOSE v_curs;
END;

-- cant fetch from or close cursor that is not open
DECLARE
  CURSOR v_curs IS
    SELECT *
    FROM ANIMAL;
  v_animal_rec animal%ROWTYPE;
BEGIN
  FETCH v_curs INTO v_animal_rec;
  CLOSE v_curs;
  EXCEPTION WHEN INVALID_CURSOR
  THEN
    NULL;
END;
