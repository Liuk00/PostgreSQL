﻿-- Function: unit_tests_public.grading_meetings_valutations_qua_trigger(boolean)

-- DROP FUNCTION unit_tests_public.grading_meetings_valutations_qua_trigger(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.grading_meetings_valutations_qua_trigger(
    IN _build_dependencies boolean DEFAULT false,
    OUT _results unit_testing.unit_test_result[])
  RETURNS unit_testing.unit_test_result[] AS
$BODY$
<<me>>
DECLARE
  context               text;
  full_function_name 	  text;
  test_name	          	text = '';
  error			            diagnostic.error;
BEGIN
  GET DIAGNOSTICS context = PG_CONTEXT;
  full_function_name = diagnostic.full_function_name(context);

  -- check to build dependencies
  IF _build_dependencies THEN
    PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_public._after_data_insert');
    RETURN;
  END IF;

  ------------------------------------------------------------------------------------------
  test_name = 'UPDATE grading_meetings_valutations_qua qualification in a different school';
  ------------------------------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.grading_meetings_valutations_qua set qualification = '195977000000000' WHERE grading_meeting_valutation = '124388000000000' ;
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but qualification is in a different school', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U04T1');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  -----------------------------------------------------------------------------------------------------------
  test_name = 'INSERT grading_meetings_valutations_qua qualification in a different school from the student';
  -----------------------------------------------------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.grading_meetings_valutations_qua(grading_meeting_valutation_qua,grading_meeting_valutation,qualification,grade,notes) VALUES ('1126109000000000','124388000000000','195977000000000','11478000000000','Esempio di una nota testuale a commento della valutazione della qualifica');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but qualification is in a different school from the student', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U04T2');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  ----------------------------------------------------------------------------------------------------------
  test_name = 'UPDATE grading_meetings_valutations_qua qualification in a different school from the metric';
  ----------------------------------------------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.grading_meetings_valutations_qua set grade = '11501000000000' WHERE qualification = '95977000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but qualification is in a different school from the metric', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U04T5');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  ----------------------------------------------------------------------------------------------------------
  test_name = 'INSERT grading_meetings_valutations_qua qualification in a different school from the metric';
  ----------------------------------------------------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.grading_meetings_valutations_qua(grading_meeting_valutation_qua,grading_meeting_valutation,qualification,grade,notes) VALUES ('1126109000000000','124388000000000','96103000000000','11501000000000','Esempio di una nota testuale a commento della valutazione della qualifica');

    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but qualification is in a different school from the metric', NULL::diagnostic.error);
    RETURN;
   EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U04T6');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  ------------------------------------------------------------------------------------
  test_name = 'UPDATE grading_meeting_valutation_qua where grading_meeting is closed';
  ------------------------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.grading_meetings_valutations_qua set grading_meeting_valutation = '1130752000000000' WHERE grading_meeting_valutation_qua = '126109000000000';

    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but grading_meeting is closed', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U04T7');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  -------------------------------------------------------------------------------------
  test_name = 'INSERT grading_meeting_valutation_qua  where grading_meeting is closed';
  -------------------------------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.grading_meetings_valutations_qua(grading_meeting_valutation_qua,grading_meeting_valutation,qualification,grade,notes) VALUES ('1126109000000000','1130752000000000','95977000000000','11478000000000','Esempio di una nota testuale a commento della valutazione della qualifica');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK grading_meeting is closed', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U04T8');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------------------------------------------
  test_name = 'DELETE grading_meeting_valutation_qua with closed grading meeting';
  --------------------------------------------------------------------------------
  BEGIN
    DELETE FROM scuola247.grading_meetings_valutations_qua WHERE grading_meeting_valutation = 124388000000000; 
    _results = _results || assert.fail(full_function_name, test_name,'DELETE was OK but grading_meeting is closed', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
    GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
    _results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U04S1');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.grading_meetings_valutations_qua_trigger(boolean)
  OWNER TO scuola247_supervisor;
GRANT EXECUTE ON FUNCTION unit_tests_public.grading_meetings_valutations_qua_trigger(boolean) TO scuola247_supervisor WITH GRANT OPTION;
GRANT EXECUTE ON FUNCTION unit_tests_public.grading_meetings_valutations_qua_trigger(boolean) TO scuola247_user;
REVOKE ALL ON FUNCTION unit_tests_public.grading_meetings_valutations_qua_trigger(boolean) FROM public;
