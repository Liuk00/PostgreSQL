﻿-- Function: unit_tests_security.set_role_vertical(boolean)

-- DROP FUNCTION unit_tests_security.set_role_vertical(boolean);

CREATE OR REPLACE FUNCTION unit_tests_security.set_role_vertical(
    IN _build_dependencies boolean DEFAULT false,
    OUT _results unit_testing.unit_test_result[])
  RETURNS unit_testing.unit_test_result[] AS
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_security.set_role_vertical(boolean)
  OWNER TO scuola247_supervisor;
GRANT EXECUTE ON FUNCTION unit_tests_security.set_role_vertical(boolean) TO public;
GRANT EXECUTE ON FUNCTION unit_tests_security.set_role_vertical(boolean) TO scuola247_supervisor WITH GRANT OPTION;
GRANT EXECUTE ON FUNCTION unit_tests_security.set_role_vertical(boolean) TO scuola247_user;