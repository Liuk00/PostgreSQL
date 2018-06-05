﻿-- Function: unit_tests.grading_meetings_trigger(boolean)

-- DROP FUNCTION unit_tests.grading_meetings_trigger(boolean);

CREATE OR REPLACE FUNCTION unit_tests.grading_meetings_trigger(
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
    PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'_after_data_insert');
    RETURN;
  END IF;  
  --------------------------------------------------------------
  test_name = 'UPDATE grading_meetings with date 2 years later';
  --------------------------------------------------------------
  BEGIN
    UPDATE public.grading_meetings set on_date = '2017-06-16' WHERE grading_meeting = '119537000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the date is 2 years later than end duration', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN SQLSTATE 'U04P1' THEN
      _results = _results || assert.pass(full_function_name, test_name);
      WHEN OTHERS THEN 
        GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
        _results = _results || assert.fail(full_function_name, test_name, 'Unexpected exception', error); 
        RETURN;
  END;    
  --------------------------------------------------------------
  test_name = 'INSERT grading_meetings with date 2 years later';
  --------------------------------------------------------------
  BEGIN
    INSERT INTO public.grading_meetings(grading_meeting,school_year,on_date,description,closed) VALUES ('1000119537000000000','244000000000','2017-06-16','Scrutinio secondo quadrimestre (prova trigger)','f');
    
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the date is 2 years later then end duration', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN SQLSTATE 'U04P2' THEN
      _results = _results || assert.pass(full_function_name, test_name);
      WHEN OTHERS THEN 
        GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
        _results = _results || assert.fail(full_function_name, test_name, 'Unexpected exception', error); 
        RETURN;
  END;  
  RETURN; 
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests.grading_meetings_trigger(boolean)
  OWNER TO postgres;