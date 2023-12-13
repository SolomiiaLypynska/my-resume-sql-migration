DECLARE
    IS_COLUMN_EXISTS NUMBER;
BEGIN

SELECT COUNT(1) INTO IS_COLUMN_EXISTS
FROM ALL_TAB_COLUMNS
WHERE  TABLE_NAME = UPPER('VACANCY')
    AND COLUMN_NAME = UPPER('LOCATION');

IF IS_COLUMN_EXISTS = 0 THEN
EXECUTE IMMEDIATE q'[
    ALTER TABLE VACANCY
    ADD LOCATION VARCHAR2(50)
    CONSTRAINT chk_U_LOCATION CHECK (LOCATION IN ('OFFICE', 'REMOTE'))
]';
END IF;

END;
/


