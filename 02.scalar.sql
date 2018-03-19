DECLARE
  -- basic scalar variables
  v_vc2 VARCHAR2(100) := 'ABC';
  v_n NUMBER := 1.23;
  v_i INTEGER := 1.3;
  v_p PLS_INTEGER := 1.4;
  BEGIN
  DBMS_OUTPUT.PUT_LINE('v_vc2: ' || v_vc2);
  DBMS_OUTPUT.PUT_LINE('v_n: ' || v_n);
  DBMS_OUTPUT.PUT_LINE('v_i: ' || v_i);
  DBMS_OUTPUT.PUT_LINE('v_p: ' || v_p);
END;

-- This will give error
DECLARE
  v_vc2_1 VARCHAR2(1) := 'AB';
  BEGIN
  DBMS_OUTPUT.PUT_LINE(v_vc2_1);
END;

-- This too will give error
DECLARE
  v_n_t NUMBER;
  BEGIN
  v_n_t := 'ABC';
  DBMS_OUTPUT.PUT_LINE(v_n_t);
END;

-- example of not hardcoding variable data type
CREATE TABLE animal(
  animal_id NUMBER,
  animal_name VARCHAR2(30)
);

INSERT INTO animal
    VALUES (1, 'Zebra');

COMMIT;

SELECT * FROM animal;

-- because here we harcoded value here so this will give error .... that's why we'll use anchoring
DECLARE
  v_animal_name VARCHAR2(2);
  BEGIN
  SELECT animal_name
    INTO v_animal_name
    FROM animal;
END;

-- now we'll use anchoring example in this case to solve this problem
-- anchored variable TABLE.column_name%TYPE
DECLARE
  v_animal_name animal.animal_name%TYPE; -- This is called anchoring to datatype
  BEGIN
  SELECT animal_name
    INTO v_animal_name
    FROM animal;
  DBMS_OUTPUT.PUT_LINE(v_animal_name);
END;
