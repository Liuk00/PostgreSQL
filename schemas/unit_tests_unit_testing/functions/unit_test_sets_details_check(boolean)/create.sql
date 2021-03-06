﻿-- Function: unit_tests_unit_testing.unit_test_sets_details_check(boolean)

-- DROP FUNCTION unit_tests_unit_testing.unit_test_sets_details_check(boolean);

CREATE OR REPLACE FUNCTION unit_tests_unit_testing.unit_test_sets_details_check(
    IN _build_dependencies boolean DEFAULT false,
    OUT _results unit_testing.unit_test_result[])
  RETURNS unit_testing.unit_test_result[] AS
$BODY$
<<me>>
DECLARE
  context               text;
  full_function_name 	text;
  test_name		text = '';
  error			diagnostic.error;

BEGIN

  GET DIAGNOSTICS context = PG_CONTEXT;
  full_function_name = diagnostic.full_function_name(context);
  -- check to build dependencies
  IF _build_dependencies THEN
      PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_public._after_data_insert');
    RETURN;
  END IF;
  
  --------------------------------------
  test_name = 'unit_test_set mandatory';
  --------------------------------------
  BEGIN
    UPDATE unit_testing.unit_test_sets_details SET unit_test_set = NULL WHERE unit_test_set_detail = '59000000000';
    _results =  _results || assert.fail(full_function_name, test_name, 'Update was OK but unit_test_set mandatory was expected', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ---------------------------------------------------------------------
  test_name = 'duplicate unit_test_set, schema_name and function_name';
  ---------------------------------------------------------------------
  BEGIN
    UPDATE unit_testing.unit_test_sets_details SET unit_test_set = '56000000000' WHERE unit_test_set_detail = '1388000000000';
    _results =  _results || assert.fail(full_function_name, test_name, 'Update was OK but duplicate unit_test_set, schema_name and function_name was expected', NULL::diagnostic.error);
    RETURN;

    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23505', 'unit_test_sets_details_uq_all_but_unit_test_set_detail');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------
  test_name = 'function_name mandatory';  -- Fanno scattare il trigger 
  --------------------------------------
  BEGIN
    UPDATE unit_testing.unit_test_sets_details SET function_name = NULL WHERE unit_test_set_detail = '59000000000';
    _results =  _results || assert.fail(full_function_name, test_name, 'Update was OK but function_name mandatory was expected', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  ------------------------------------
  test_name = 'schema_name mandatory';  -- Fanno scattare il trigger 
  ------------------------------------
  BEGIN
    UPDATE unit_testing.unit_test_sets_details SET schema_name = NULL WHERE unit_test_set_detail = '59000000000';
    _results =  _results || assert.fail(full_function_name, test_name, 'Update was OK but schema_name mandatory was expected', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  
  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_unit_testing.unit_test_sets_details_check(boolean)
  OWNER TO postgres;
