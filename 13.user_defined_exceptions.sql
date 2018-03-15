CREATE TABLE demo(
  col1 NUMBER CHECK (col1 <= 10)
);

-- insert will fail
BEGIN
  INSERT INTO demo
    VALUES (11);
--   EXCEPTION
--   WHEN OTHERS THEN
--   DBMS_OUTPUT.PUT_LINE(SQLCODE);
--   sqlcode got from here will be used to make custom exception
END;

-- insert with explicit exception caught
DECLARE
  e_not_less_than_ten EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_not_less_than_ten, -2290);
  BEGIN
    INSERT INTO demo
      VALUES (11);
    EXCEPTION
      WHEN e_not_less_than_ten THEN
      DBMS_OUTPUT.PUT_LINE('Please use value less than 10');
END;

-- check unique constraint error code
BEGIN
  RAISE DUP_VAL_ON_INDEX;
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE(SQLCODE);
END;

-- dont define exceptions for errors that don't really match up
DECLARE
  e_to_big EXCEPTION;
  PRAGMA EXCEPTION_INIT (e_to_big, -1);
  v_number NUMBER := 12;
  BEGIN
    IF v_number >= 10 THEN
      RAISE e_to_big;
    END IF;
END;

-- Use RAISE_APPLICATION_ERROR to raise specific error number
-- then define exceptions based on that

DECLARE
  v_number NUMBER := 12;
  e_too_big EXCEPTION;
  PRAGMA EXCEPTION_INIT (e_too_big, -20000);
  BEGIN
    IF v_number > 10 THEN
      raise_application_error(-20000, 'Value too big');
    END IF;
    EXCEPTION
      WHEN e_too_big THEN
        DBMS_OUTPUT.PUT_LINE('Seriously - its too big');
END;
