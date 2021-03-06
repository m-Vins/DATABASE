/*CREATE OR REPLACE TRIGGER UP_NUM
AFTER INSERT ON IMP
FOR EACH ROW
BEGIN
      UPDATE SUMMARY
      SET NUM=NUM+1
      WHERE JOB=:nEW.JOB;
END;
/

*/

--soluzione

CREATE OR REPLACE TRIGGER UP_NUM
AFTER INSERT ON IMP
FOR EACH ROW
DECLARE
    M NUMBER;
    N NUMBRE;
BEGIN
    SELECT COUNT(*) INTO N
    FROM SUMMARY
    WHERE JOB=:NEW.JOB;

    IF(N==0) THEN
    INSERT INTO SUMMARY(JOB,NUM)
    VALUES(:NEW.JOB,1);
    ELSE
    UPDATE SUMMARY
    SET NUM=NUM+1;
    WHERE JOB=:NEW.JOB
    END INF;
END;
/
