-- flow control with exception handler that does not re-raise error
DECLARE
  v_number NUMBER;
  BEGIN
  -- start embedding block
  BEGIN
    v_number := 'ABC';
    EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('When Others');
  END;
  -- end embedded block
  DBMS_OUTPUT.PUT_LINE('Next Line');
END;

-- flow control with exception handler that does re-raise error
DECLARE
  v_number NUMBER;
  BEGIN
  -- start embedding block
  BEGIN
    v_number := 'ABC';
    EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('When Others');
      RAISE;
  END;
  -- end embedded block
  DBMS_OUTPUT.PUT_LINE('Next Line');
END;

-- flow control with exception handler that does re-raise the error
-- which then gets trapped
DECLARE
  v_number NUMBER;
  BEGIN
  -- start embedding block
  BEGIN
    v_number := 'ABC';
    EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('When Others');
      RAISE;
  END;
  -- end embedding block
  DBMS_OUTPUT.PUT_LINE('Next Line');
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Other When Others');
END;

-- raise an error directly
BEGIN
  RAISE NO_DATA_FOUND;
END;

-- raise an error directly, handle it
-- raise something else
BEGIN
  RAISE NO_DATA_FOUND;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE DUP_VAL_ON_INDEX;
END;


-- Exception handlers can affect transactions
DROP TABLE ANIMAL;

CREATE TABLE ANIMAL(
  ANIMAL_ID NUMBER PRIMARY KEY NOT NULL,
  ANIMAL_NAME VARCHAR2(100)
);

INSERT ALL
  INTO ANIMAL VALUES (1, 'Zebra')
  INTO ANIMAL VALUES (2, 'Panda')
SELECT * FROM dual;

SELECT * FROM ANIMAL;

BEGIN
  INSERT INTO ANIMAL
    VALUES (3, 'Lion');
  INSERT INTO ANIMAL
    VALUES (2, 'Elephant');
  INSERT INTO ANIMAL
    VALUES (4, 'Hippo');
  EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;

SELECT * FROM ANIMAL;

ROLLBACK;














