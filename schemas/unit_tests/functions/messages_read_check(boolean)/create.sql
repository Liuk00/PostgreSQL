﻿-- Function: unit_tests_public.messages_read_check(boolean)

-- DROP FUNCTION unit_tests_public.messages_read_check(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.messages_read_check(
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

  ------------------------------------
  test_name = 'message mandatory';
  ------------------------------------
  BEGIN
  UPDATE public.messages_read SET message = NULL WHERE message_read = '60304000000000';
   _results =  _results || assert.fail(full_function_name, test_name, 'UPDATE was OK but message was expected', NULL::diagnostic.error);      
    RETURN;      
    EXCEPTION WHEN SQLSTATE '23502' THEN 
      GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;	 
      WHEN OTHERS THEN 
        GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
	_results =  _results || assert.fail(full_function_name, test_name, 'Unexpected exception', error);       
        RETURN; 
  END;

  ------------------------------------
  test_name = 'person mandatory';
  ------------------------------------
  BEGIN
  UPDATE public.messages_read SET person = NULL WHERE message_read = '60304000000000';
   _results =  _results || assert.fail(full_function_name, test_name, 'UPDATE was OK but person was expected', NULL::diagnostic.error);      
    RETURN;      
    EXCEPTION WHEN SQLSTATE '23502' THEN 
      GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;	 
      WHEN OTHERS THEN 
        GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
	_results =  _results || assert.fail(full_function_name, test_name, 'Unexpected exception', error);       
        RETURN; 
  END;

  ------------------------------------
  test_name = 'duplicate read on';
  ------------------------------------
  BEGIN
    INSERT INTO public.messages_read(message_read,message,person,read_on) VALUES ('160304000000000','50112000000000','32925000000000','2013-09-16 16:26:43');
   _results =  _results || assert.fail(full_function_name, test_name, 'Insert was OK but this (message, person) already exist', NULL::diagnostic.error);      
    RETURN;      
    EXCEPTION WHEN SQLSTATE '23505' THEN 
      GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;	
      IF error.constraint_name = 'messages_read_uq_read_on' THEN
        _results =  _results || assert.pass(full_function_name, test_name);
      ELSE
	_results =  _results || assert.fail(full_function_name, test_name, 'Unexpected exception', error);      
	RETURN; 
      END IF; 
      WHEN OTHERS THEN 
        GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
	_results =  _results || assert.fail(full_function_name, test_name, 'Unexpected exception', error);       
        RETURN; 
  END;

    RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.messages_read_check(boolean)
  OWNER TO postgres;
