﻿-- Function: unit_tests.messages_trigger(boolean)

-- DROP FUNCTION unit_tests.messages_trigger(boolean);

CREATE OR REPLACE FUNCTION unit_tests.messages_trigger(
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
  -----------------------------------------------------------------------------
  test_name = 'UPDATE messages with different person from school';
  -----------------------------------------------------------------------------
  BEGIN
    UPDATE messages SET  person='4450000000000'  WHERE message ='50112000000000';  
    _results = _results || assert.fail(full_function_name, test_name,'Update was OK but who wrote the messages is not form the same school ', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN SQLSTATE 'U04W1' THEN
      _results = _results || assert.pass(full_function_name, test_name);
      WHEN OTHERS THEN 
        GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
        _results = _results || assert.fail(full_function_name, test_name, 'Unexpected exception', error); 
        RETURN;
  END;  
    -----------------------------------------------------------------------------
  test_name = 'Insert messages with different person from school ';
  -----------------------------------------------------------------------------
  BEGIN
    INSERT INTO public.messages(message,conversation,written_on,message_text,person) VALUES ('10050112000000000','46328000000000','2013-09-16 08:26:43','Giustifico il ritardo di mio figlio.','4450000000000');
    _results = _results || assert.fail(full_function_name, test_name,'Who wrote the messages is not form the same school', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN SQLSTATE 'U04W2' THEN
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
ALTER FUNCTION unit_tests.messages_trigger(boolean)
  OWNER TO postgres;