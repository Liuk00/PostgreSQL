﻿-- Function: unit_tests_public.classrooms_check(boolean)

-- DROP FUNCTION unit_tests_public.classrooms_check(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.classrooms_check(
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

    PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_public.school_years',
										       										       										               'unit_tests_public.degrees',
										       										       										               'unit_tests_public.branches');

    RETURN;

  END IF;



  ----------------------------------

  test_name = 'duplicate classroom';

  ----------------------------------

  BEGIN

     INSERT INTO scuola247.classrooms(classroom,school_year,degree,section,course_year,description,branch) VALUES ('10410062000000000','243000000000','9942000000000','C','1','Infanzia 6C','9952000000000');

    _results = _results || assert.fail(full_function_name, test_name, 'Insert was OK but duplicate scuola247.classrooms_uq_classroom was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23505', 'classrooms_uq_classroom');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;

 END;





  ------------------------------------

  test_name = 'duplicate description';

  ------------------------------------

  BEGIN

     INSERT INTO scuola247.classrooms(classroom,school_year,degree,section,course_year,description,branch) VALUES ('10510062000000000','243000000000','28970000000000','C','2','Infanzia 1C','9952000000000');

    _results = _results || assert.fail(full_function_name, test_name, 'Insert was OK but duplicate scuola247.classrooms_uq_classroom was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23505', 'classrooms_uq_description');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
     

END;



  ---------------------------------------

  test_name = 'school_year''s mandatory';

  ---------------------------------------

  BEGIN

    UPDATE scuola247.classrooms SET school_year = NULL WHERE classroom = '10062000000000';

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but school_year required was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;

  END;



  ---------------------------------------

  test_name = 'degree''s mandatory';

  ---------------------------------------

  BEGIN

    UPDATE scuola247.classrooms SET degree = NULL WHERE classroom = '10062000000000';

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but degree required was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;

  END;



  ---------------------------------------

  test_name = 'course_year''s mandatory';

  ---------------------------------------

  BEGIN

    UPDATE scuola247.classrooms SET course_year = NULL WHERE classroom = '10062000000000';

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but course_year required was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;

  END;



  ---------------------------------------

  test_name = 'description''s mandatory';

  ---------------------------------------

  BEGIN

    UPDATE scuola247.classrooms SET description = NULL WHERE classroom = '10062000000000';

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but description required was expected', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, '23502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;

  END;

  ---------------------------------------

  test_name = 'description not empty';

  ---------------------------------------

  BEGIN

    UPDATE scuola247.classrooms SET description = ' ' WHERE classroom = '10062000000000';

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but description was empty', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23514', 'classrooms_ck_description');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;

  END;  



  ---------------------------------------

  test_name = 'section not empty';

  ---------------------------------------

  BEGIN

    UPDATE scuola247.classrooms SET section = ' ' WHERE classroom = '10062000000000';

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but section was empty', NULL::diagnostic.error);

    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_constraint_equals(me.full_function_name, me.test_name, me.error, '23514', 'classrooms_ck_section');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;

  END;  

  ---------------------------------------

  test_name = 'branch''s mandatory';

  ---------------------------------------

  BEGIN

    UPDATE scuola247.classrooms SET branch = NULL WHERE classroom = '10062000000000';

    _results = _results || assert.fail(full_function_name, test_name, 'Update was OK but branch required was expected', NULL::diagnostic.error);

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
ALTER FUNCTION unit_tests_public.classrooms_check(boolean)
  OWNER TO postgres;
