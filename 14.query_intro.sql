DECLARE
  CURSOR curs_get_animal IS
    SELECT *
    FROM ANIMAL;
  v_animal ANIMAL%ROWTYPE;
BEGIN
  OPEN curs_get_animal;
  LOOP
    FETCH curs_get_animal INTO v_animal;
    EXIT WHEN curs_get_animal%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_animal.ANIMAL_ID || ' ' || v_animal.ANIMAL_NAME);
  END LOOP;
  CLOSE curs_get_animal;
END;

CREATE OR REPLACE PROCEDURE show_animal(cp_id NUMBER) IS
  CURSOR curs_get_animal (cp_id NUMBER) IS
    SELECT *
    FROM ANIMAL
    WHERE ANIMAL_ID = cp_id;
  v_animal ANIMAL%ROWTYPE;
  BEGIN
    OPEN curs_get_animal(cp_id);
    LOOP
      FETCH curs_get_animal INTO v_animal;
      EXIT WHEN curs_get_animal%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(v_animal.ANIMAL_ID || ' ' || v_animal.ANIMAL_NAME);
    END LOOP;
    CLOSE curs_get_animal;
  END;

BEGIN
  show_animal(3);
END;
