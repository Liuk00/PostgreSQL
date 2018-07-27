-- Function: unit_tests_unit_testing.function_test_circular_reference_2(text)

-- DROP FUNCTION unit_tests_unit_testing.function_test_circular_reference_2(text);

CREATE OR REPLACE FUNCTION unit_tests_unit_testing.function_test_circular_reference_2(
    IN _build_dependencies text DEFAULT 'false')
$BODY$
<<me>>
DECLARE
  context               	  text;
  full_function_name 	          text;
  test_name		          text = '';
  error			          diagnostic.error;
BEGIN
  GET DIAGNOSTICS context = PG_CONTEXT;
  full_function_name = diagnostic.full_function_name(context);
  -- check to build dependencies
  IF _build_dependencies::boolean THEN
      PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_unit_testing.function_test_circular_reference');
    RETURN;
  END IF;
  ---------------------------------------------------------------------------------------
  test_name = 'nothing_function the only purpose is being added to unit_tests_list view';
  ---------------------------------------------------------------------------------------
  BEGIN

    _results =  _results || assert.pass(full_function_name, test_name);

    EXCEPTION
      WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
        _results = _results || assert.fail(full_function_name, test_name, 'unit_tests_unit_testing.nothing_function FAILED'::text, error);
        RETURN;
  END;
  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_unit_testing.function_test_circular_reference_2(text)
  OWNER TO postgres;