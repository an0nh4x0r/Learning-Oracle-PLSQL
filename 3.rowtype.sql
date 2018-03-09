-- tableName%ROWTYPE is basically used to get datatype of each instance in a single variable
-- it's just like a object of a class holding many types of datatypes
-- it's just like a row of a table.
DECLARE
  v_animal_row animal%ROWTYPE;
  BEGIN
  v_animal_row.ANIMAL_ID := 2;
  v_animal_row.ANIMAL_NAME := 'Panda';
  INSERT INTO ANIMAL
    VALUES v_animal_row;
END;

SELECT * FROM ANIMAL;

DECLARE
  v_animal_row animal%ROWTYPE;
  BEGIN
  SELECT *
    INTO v_animal_row
    FROM ANIMAL
    WHERE ANIMAL_ID=2;
  DBMS_OUTPUT.PUT_LINE(v_animal_row.ANIMAL_ID || ' : ' || v_animal_row.ANIMAL_NAME);
END;


