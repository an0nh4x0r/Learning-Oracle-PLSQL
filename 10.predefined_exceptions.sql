SELECT *
FROM ANIMAL;

TRUNCATE TABLE ANIMAL;

INSERT ALL
INTO ANIMAL VALUES (1, 'Zebra')
INTO ANIMAL VALUES (2, 'Panda')
  SELECT *
  FROM dual;

-- use of generic when others handler
DECLARE
  v_number NUMBER := 11;
BEGIN
  v_number := v_number / 0;
  EXCEPTION
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('OTHERS ' || SQLCODE);
    DBMS_OUTPUT.PUT_LINE('OTHERS ' || SQLERRM);
END;

-- handler for zero divide
DECLARE
  v_number NUMBER := 11;
BEGIN
  v_number := v_number / 0;
  EXCEPTION
  -- handler for zero divide errors
  WHEN ZERO_DIVIDE
  THEN
    DBMS_OUTPUT.PUT_LINE('Zero ' || SQLCODE);
    DBMS_OUTPUT.PUT_LINE('Zero ' || SQLERRM);
  -- handler for other errors
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('Others ' || SQLCODE);
    DBMS_OUTPUT.PUT_LINE('Others ' || SQLERRM);
END;

-- no data found and two many rows when querying
-- records from DB
DECLARE
  v_animal_name ANIMAL.ANIMAL_NAME%TYPE;
BEGIN
  SELECT ANIMAL_NAME
  INTO v_animal_name
  FROM ANIMAL
  WHERE ANIMAL_ID = 190;
  EXCEPTION
  WHEN TOO_MANY_ROWS
  THEN
    DBMS_OUTPUT.PUT_LINE('Too many rows!');
  WHEN NO_DATA_FOUND
  THEN
    DBMS_OUTPUT.PUT_LINE('No record found!');
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

-- duplicate val on index exception
BEGIN
  INSERT INTO ANIMAL VALUES (2, 'Lion');
  EXCEPTION
  WHEN DUP_VAL_ON_INDEX
  THEN
    UPDATE ANIMAL SET ANIMAL_NAME='Lion' WHERE ANIMAL_ID = 2;
END;

  
