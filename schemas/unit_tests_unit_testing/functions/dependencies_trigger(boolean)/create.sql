-- Function: unit_tests_unit_testing.dependencies_trigger(boolean)

-- DROP FUNCTION unit_tests_unit_testing.dependencies_trigger(boolean);

CREATE OR REPLACE FUNCTION unit_tests_unit_testing.dependencies_trigger(
    IN _build_dependencies boolean DEFAULT false,
    OUT _results unit_testing.unit_test_result[])
  RETURNS unit_testing.unit_test_result[] AS
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
  IF _build_dependencies THEN
      PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context));
    RETURN;
  END IF;
  --------------------------------------------------------------------------
  test_name = 'UPDATE before_function_name with one not in unit_tests_list';
  --------------------------------------------------------------------------
  BEGIN
    UPDATE unit_testing.dependencies SET before_function_name = 'not_existince_nothing_function' WHERE before_function_name = 'nothing_function';
    _results = _results || assert.fail(full_function_name, test_name,'Update was OK but before_function_name is not in unit_tests_list', NULL::diagnostic.error);
    RETURN;

    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U06J1');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -----------------------------------------------------------------------
  test_name = 'UPDATE run_function_name with one not in unit_tests_list';
  -----------------------------------------------------------------------
  BEGIN
    UPDATE unit_testing.dependencies SET run_function_name = 'not_existince_nothing_function' WHERE before_function_name = 'nothing_function';
    _results = _results || assert.fail(full_function_name, test_name,'Update was OK but run_function_name is not in unit_tests_list', NULL::diagnostic.error);
    RETURN;

    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U06J2');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END; 

  ----------------------------------
  test_name = 'Circular References';
  ----------------------------------
  BEGIN
    UPDATE unit_testing.dependencies SET run_function_name = 'not_existince_nothing_function' WHERE before_function_name = 'nothing_function';
    _results = _results || assert.fail(full_function_name, test_name,'Update was OK but run_function_name is not in unit_tests_list', NULL::diagnostic.error);
    RETURN;

    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U06J3');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END; 

  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_unit_testing.dependencies_trigger(boolean)
  OWNER TO postgres;
