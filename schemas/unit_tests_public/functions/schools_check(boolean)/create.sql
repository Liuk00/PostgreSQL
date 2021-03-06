﻿-- Function: unit_tests_public.schools_check(boolean)

-- DROP FUNCTION unit_tests_public.schools_check(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.schools_check(
    IN _build_dependencies boolean DEFAULT false,
    OUT _results unit_testing.unit_test_result[])
  RETURNS unit_testing.unit_test_result[] AS
$BODY$

<<me>>

DECLARE

  context               text;

  full_function_name 	  text;

  test_name		          text = '';

  error			            diagnostic.error;

BEGIN

  GET DIAGNOSTICS context = PG_CONTEXT;

  full_function_name = diagnostic.full_function_name(context);

  -- check to build dependencies

  IF _build_dependencies THEN

      PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_public._after_data_insert');

    RETURN;

  END IF;

  ------------------------------------

  test_name = 'duplicate description';

  ------------------------------------

  BEGIN

    INSERT INTO scuola247.schools (school, description, processing_code, mnemonic, example, logo, behavior) VALUES (28961000000001, 'Istituto comprensivo "Voyager2"', 'BZIC00001Z', 'IC VOYAGER3', false, NULL, NULL);

   _results =  _results || assert.fail(full_function_name, test_name, 'Insert was OK but duplicate description was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23505','schools_uq_description');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ---------------------------------

  test_name = 'duplicate mnemonic';

  ---------------------------------

  BEGIN

    INSERT INTO scuola247.schools (school, description, processing_code, mnemonic, example, logo, behavior) VALUES (28961000000001, 'Istituto comprensivo "Voyager3"', 'BZIC00001Z', 'IC VOYAGER2', false, NULL, NULL);

    _results = _results || assert.fail(full_function_name, test_name, 'Insert was OK but duplicate mnemonic was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23505','schools_uq_mnemonic');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------

  test_name = 'duplicate processing code';

  ----------------------------------------

  BEGIN

    INSERT INTO scuola247.schools (school, description, processing_code, mnemonic, example, logo, behavior) VALUES (28961000000001, 'Istituto comprensivo "Voyager3"', 'AZIC00001Z', 'IC VOYAGER3', false, NULL, NULL);

    _results = _results || assert.fail(full_function_name, test_name, 'Insert was OK but duplicate processing code was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23505','schools_uq_processing_code');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ---------------------------------------

  test_name = 'description''s mandatory';

  ---------------------------------------

  BEGIN

    UPDATE scuola247.schools SET description = NULL WHERE school = 28961000000000;

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but description required was expected', NULL::diagnostic.error);

    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------

  test_name = 'description''s min lenght';

  ----------------------------------------

  BEGIN

    UPDATE scuola247.schools SET description = '  ' WHERE school = 28961000000000;

    _results = _results ||  assert.fail(full_function_name, test_name, 'Update was OK but empty description was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23514','schools_ck_description');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -------------------------------------------

  test_name = 'processing_code''s mandatory';

  -------------------------------------------

  BEGIN

    UPDATE scuola247.schools SET processing_code = NULL WHERE school = 28961000000000;

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but processing_code mandatory was expected', NULL::diagnostic.error);

    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------

  test_name = 'processing_code''s min lenght';

  --------------------------------------------

  BEGIN

    UPDATE scuola247.schools SET processing_code = '  ' WHERE school = 28961000000000;

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but empty processing_code was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23514','schools_ck_processing_code');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ------------------------------------

  test_name = 'mnemonic''s mandatory';

  ------------------------------------

  BEGIN

    UPDATE scuola247.schools SET mnemonic = NULL WHERE school = 28961000000000;

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but mnemonic mandatory was expected', NULL::diagnostic.error);

    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -------------------------------------

  test_name = 'mnemonic''s min lenght';

  -------------------------------------

  BEGIN

    UPDATE scuola247.schools SET mnemonic = '  ' WHERE school = 28961000000000;

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but empty mnemonic was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23514','schools_ck_mnemonic');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  RETURN;

END

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.schools_check(boolean)
  OWNER TO postgres;
