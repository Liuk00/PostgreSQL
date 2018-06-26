﻿-- Function: unit_tests_security.vertical_security(boolean, text)

-- DROP FUNCTION unit_tests_security.vertical_security(boolean, text);

CREATE OR REPLACE FUNCTION unit_tests_security.vertical_security(
    IN _build_dependencies boolean DEFAULT false,
    IN _group text DEFAULT 'scuola247_supervisor'::text,
    OUT _results unit_testing.unit_test_result[])
  RETURNS unit_testing.unit_test_result[] AS
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_security.vertical_security(boolean, text)
  OWNER TO "jiahaodong@gmail.com";