-- Function: unit_tests_translate.columns_foreign_key(boolean)

-- DROP FUNCTION unit_tests_translate.columns_foreign_key(boolean);

CREATE OR REPLACE FUNCTION unit_tests_translate.columns_foreign_key(
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
    PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_translate.columns');
    RETURN;
  END IF;
  
  ------------------------------------------------------------------------
  test_name = 'UPDATE columns set language with non existence language';
  ------------------------------------------------------------------------
  BEGIN
    UPDATE translate.columns c SET language = '999999999' WHERE c.column = '299999000000000';
    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but language set with a non existing one', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23503', 'columns_fk_language');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ------------------------------------------------------------------------
  test_name = 'UPDATE columns set relation with non existence language';
  ------------------------------------------------------------------------
  BEGIN
    UPDATE translate.columns c SET relation = '999999999' WHERE c.column = '299999000000000';
    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but language set with a non existing one', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23503', 'columns_fk_relation');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_translate.columns_foreign_key(boolean)
  OWNER TO postgres;
