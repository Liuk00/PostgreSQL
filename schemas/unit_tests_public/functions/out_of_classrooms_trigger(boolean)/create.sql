﻿-- Function: unit_tests_public.out_of_classrooms_trigger(boolean)

-- DROP FUNCTION unit_tests_public.out_of_classrooms_trigger(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.out_of_classrooms_trigger(
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
  ----------------------------------------------------
  test_name = 'UPDATE on_date with a non-lessons day';
  ----------------------------------------------------
  BEGIN
    UPDATE scuola247.out_of_classrooms set on_date = '2013-01-20' WHERE out_of_classroom = '98577000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but in the date there are no lessons', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
     _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0501');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------------------
  test_name = 'INSERT on_date with a non-lessons day';
  ----------------------------------------------------
  BEGIN

     INSERT INTO scuola247.out_of_classrooms(out_of_classroom,school_operator,description,on_date,from_time,to_time,classroom_student) VALUES ('198577000000000','32937000000000','per selezioni sportive','2013-01-20','08:00:00','12:00:00','10379000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but in the date there are no lessons', NULL::diagnostic.error);
    RETURN;
     EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
     _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0502');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -------------------------------------------------------------
  test_name = 'UPDATE school_operator from a different school';
  -------------------------------------------------------------
  BEGIN
    UPDATE scuola247.out_of_classrooms set school_operator = '4529000000000' WHERE out_of_classroom = '98577000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the school_operator is from a different school', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
     _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0505');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -------------------------------------------------------------
  test_name = 'INSERT school_operator from a different school';
  -------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.out_of_classrooms(out_of_classroom,school_operator,description,on_date,from_time,to_time,classroom_student) VALUES ('198577000000000','4529000000000','per selezioni sportive','2013-09-23','08:00:00','12:00:00','10379000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the school_operator is from a different school', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
     _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0506');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -------------------------------------------------
  test_name = 'UPDATE on_date with an absent date';
  -------------------------------------------------
  BEGIN
    UPDATE scuola247.out_of_classrooms set on_date = '2013-10-02' WHERE out_of_classroom = '98577000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the student was absent that day', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
     _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0507');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -------------------------------------------------
  test_name = 'INSERT on_date with an absent date';
  -------------------------------------------------
  BEGIN
    INSERT INTO scuola247.out_of_classrooms(out_of_classroom,school_operator,description,on_date,from_time,to_time,classroom_student) VALUES ('198577000000000','32937000000000','per selezioni sportive','2013-10-02','08:00:00','12:00:00','10379000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the student was absent that day', NULL::diagnostic.error);
    RETURN;
     EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
     _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0508');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------------------------
  test_name = 'UPDATE school_operator with none of the roles.';
  --------------------------------------------------------------
  BEGIN
    UPDATE scuola247.out_of_classrooms SET school_operator = '4892000000000' WHERE out_of_classroom = '98577000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the school operator does not have the role to accomplish the action', NULL::diagnostic.error);
    RETURN;
     EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
     _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U050H');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------------------------
  test_name = 'INSERT school_operator with none of the roles.';
  --------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.out_of_classrooms(out_of_classroom,school_operator,description,on_date,from_time,to_time,classroom_student) VALUES ('1198577000000000','4892000000000','per selezioni sportive','2013-09-20','08:00:00','12:00:00','10379000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the school operator does not have the role to accomplish the action', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
     _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U050I');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;



  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.out_of_classrooms_trigger(boolean)
  OWNER TO scuola247_supervisor;
