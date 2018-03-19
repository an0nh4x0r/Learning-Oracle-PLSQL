BEGIN

  DBMS_OUTPUT.PUT_LINE('--- Simple for loop ---');
  FOR counter IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- Simple reverse for loop ---');
  FOR counter IN REVERSE 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- Simple for loop with exit ---');
  FOR counter IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE(counter);
    EXIT;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- Simple for loop with conditional exit ---');
  FOR counter IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE(counter);
    EXIT WHEN counter = 2;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- Simple for loop with continue ---');
  FOR counter IN 1..3 LOOP
    CONTINUE;
    DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- Simple for loop with conditional continue ---');
  FOR counter IN 1..3 LOOP
    CONTINUE WHEN counter = 2;
    DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- loop with exit condition ---');
  DECLARE
    v_stop_now BOOLEAN;
    BEGIN

    v_stop_now := FALSE;

    LOOP
      DBMS_OUTPUT.PUT_LINE('Simple Loop 1');
      v_stop_now := TRUE;
      EXIT WHEN v_stop_now;
      DBMS_OUTPUT.PUT_LINE('Simple Loop 2');
    END LOOP;

    v_stop_now := FALSE;

    WHILE NOT v_stop_now LOOP
      DBMS_OUTPUT.PUT_LINE('Simple While Loop 1');
      v_stop_now := TRUE;
      DBMS_OUTPUT.PUT_LINE('Simple While Loop 2');
    END LOOP;

  END;

END;
