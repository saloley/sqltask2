create or replace database TEST_DB;
use TEST_DB;
create or replace schema TEST_DB.TEST_SCHEMA;
use TEST_SCHEMA;

create or replace TABLE TEST_DB.TEST_SCHEMA.TEST_RESULTS (
	ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	PARAM1 DATE,
	PARAM2 TIMESTAMP_NTZ(9),
	PARAM3 DATE,
	EXECUTION_TIME TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP(),
	primary key (ID)
);

CREATE OR REPLACE PROCEDURE TEST_DB.TEST_SCHEMA.TEST_2("P_PARAM1" DATE, "P_PARAM2" TIMESTAMP_NTZ(9), "P_PARAM3" DATE)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS '
BEGIN
    INSERT INTO test_results (param1, param2, param3)
    VALUES (:p_param1, :p_param2, :p_param3);
    
    RETURN ''Processed: '' || p_param1 || '', '' || p_param2 || '', '' || p_param3;
END;
';