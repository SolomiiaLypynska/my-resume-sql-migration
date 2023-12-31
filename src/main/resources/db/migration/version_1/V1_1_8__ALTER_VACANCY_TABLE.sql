DECLARE
    IS_WORK_EXPERIENCE_EXISTS NUMBER;
    IS_COMPANY_TYPE_EXISTS NUMBER;
    IS_ENGLISH_LEVEL_EXISTS NUMBER;
BEGIN

SELECT COUNT(1) INTO IS_WORK_EXPERIENCE_EXISTS
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = UPPER('VACANCY')
    AND COLUMN_NAME = UPPER('WORK_EXPERIENCE');

SELECT COUNT(1) INTO IS_COMPANY_TYPE_EXISTS
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = UPPER('VACANCY')
    AND COLUMN_NAME = UPPER('COMPANY_TYPE');

SELECT COUNT(1) INTO IS_ENGLISH_LEVEL_EXISTS
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = UPPER('VACANCY')
    AND COLUMN_NAME = UPPER('ENGLISH_LEVEL');

IF IS_WORK_EXPERIENCE_EXISTS = 0 THEN
EXECUTE IMMEDIATE q'[ALTER TABLE VACANCY ADD WORK_EXPERIENCE DOUBLE PRECISION]';
END IF;

IF IS_COMPANY_TYPE_EXISTS = 0 THEN
EXECUTE IMMEDIATE q'[ALTER TABLE VACANCY ADD COMPANY_TYPE VARCHAR2(100)
    CONSTRAINT chk_COMPANY_TYPE CHECK (COMPANY_TYPE IN ('PRODUCT', 'OUTSOURCE', 'OUTSTAFF'))]';
END IF;

IF IS_ENGLISH_LEVEL_EXISTS = 0 THEN
EXECUTE IMMEDIATE q'[ALTER TABLE VACANCY ADD ENGLISH_LEVEL VARCHAR2(100)
    CONSTRAINT chk_ENGLISH_LEVEL CHECK (ENGLISH_LEVEL IN ('NO_ENGLISH', 'BEGINNER_ELEMENTARY', 'PRE_INTERMEDIATE',
    'INTERMEDIATE', 'UPPER_INTERMEDIATE', 'ADVANCED_FLUENT'))]';
END IF;

END;
/

