-- coding error trapped and ignored
DECLARE
  v_number NUMBER;
BEGIN
  v_number := 'A';
  EXCEPTION
  WHEN OTHERS
  THEN
    NULL;
END;

-- coding error trapped and displayed
DECLARE
  v_number NUMBER;
BEGIN
  v_number := 'A';
  EXCEPTION
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

-- coding error trapped and raised
DECLARE
  v_number NUMBER;
BEGIN
  v_number := 'A';
  EXCEPTION
  WHEN OTHERS
  THEN
    RAISE;
END;

-- create animal table
CREATE TABLE ANIMAL (
  ANIMAL_ID   INTEGER NOT NULL PRIMARY KEY,
  ANIMAL_NAME VARCHAR2(100)
);

-- Insert data
INSERT INTO ANIMAL VALUES (1, 'Duplicate Panda');

-- db error handled
BEGIN
  INSERT INTO ANIMAL VALUES (1, 'Duplicate Panda');
  EXCEPTION
  WHEN DUP_VAL_ON_INDEX
  THEN
    DBMS_OUTPUT.PUT_LINE('That animal_id already exists.');
END;

-- display detailed call stack for error
BEGIN
  INSERT INTO ANIMAL VALUES (1, 'Duplicate Panda');
  EXCEPTION
  WHEN DUP_VAL_ON_INDEX
  THEN
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
END;

-- even success has an error code
BEGIN
  DBMS_OUTPUT.PUT_LINE(SQLCODE);
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
