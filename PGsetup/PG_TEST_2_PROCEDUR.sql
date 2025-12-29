CREATE OR REPLACE PROCEDURE public.test_2(
	IN p_param1 date,
	IN p_param2 timestamp without time zone,
	IN p_param3 date)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
    INSERT INTO test_results (param1, param2, param3)
    VALUES (p_param1, p_param2, p_param3);
    
    RAISE NOTICE 'Processed: %, %, %', p_param1, p_param2, p_param3;
END;
$BODY$;
ALTER PROCEDURE public.test_2(date, timestamp without time zone, date)
    OWNER TO postgres;
