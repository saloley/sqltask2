CREATE TABLE IF NOT EXISTS test_results (
    id SERIAL PRIMARY KEY,
    param1 DATE,
    param2 TIMESTAMP,
    param3 DATE,
    execution_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);





CREATE OR REPLACE PROCEDURE test_2(
    p_param1 DATE,
    p_param2 TIMESTAMP,
    p_param3 DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO test_results (param1, param2, param3)
    VALUES (p_param1, p_param2, p_param3); 
    RAISE NOTICE 'Processed: %, %, %', p_param1, p_param2, p_param3;
END;
$$;