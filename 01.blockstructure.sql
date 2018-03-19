BEGIN
  -- simple block of sql
  NULL;
END;


-- declaration of a variable
DECLARE
  v_variable NUMBER;
  BEGIN
  v_variable := 1;
  DBMS_OUTPUT.PUT_LINE('v_variable = ' || v_variable);
END;

-- nesting of blocks
BEGIN
  DBMS_OUTPUT.PUT_LINE('First Block');
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Second Block');
  END;
END;

-- nesting of block and variables
DECLARE
  outer_variable NUMBER;
  BEGIN
  outer_variable := 10;
  DECLARE
    inner_variable NUMBER;
    BEGIN
    inner_variable := 20;
    DBMS_OUTPUT.PUT_LINE('inner_variable: ' || inner_variable);
    DBMS_OUTPUT.PUT_LINE('outer_variable: ' || outer_variable);
  END;
END;

-- embedded block and duplicate variable names
DECLARE
  v_outer_variable NUMBER := 10;
  BEGIN
  DBMS_OUTPUT.PUT_LINE(v_outer_variable);
  DECLARE
    v_outer_variable NUMBER := 20;
    BEGIN
    DBMS_OUTPUT.PUT_LINE('inner value: ' || v_outer_variable);
  END;
  DBMS_OUTPUT.PUT_LINE('outer value: ' || v_outer_variable);
END;

-- block structure within a procedure
CREATE OR REPLACE PROCEDURE abc AS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
  END;

BEGIN
  abc();
END;

