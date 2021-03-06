﻿-- Function: unit_tests_public.metrics(boolean)

-- DROP FUNCTION unit_tests_public.metrics(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.metrics(
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
    PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_public.schools');
    RETURN;
  END IF;
  -----------------------------
  test_name = 'INSERT metrics';
  -----------------------------
  BEGIN
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('11433000000000','1000000000','Decimale','600');
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('11436000000000','2000000000','Decimale','600');
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('29062000000000','28961000000000','Decimale','600');
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('29063000000000','28961000000000','Binaria','600');
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('11434000000000','1000000000','Descrittiva','600');
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('11437000000000','2000000000','Descrittiva','600');
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('11435000000000','1000000000','Binaria','600');
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('11438000000000','2000000000','Binaria','600');
    INSERT INTO scuola247.metrics(metric,school,description,sufficiency) VALUES ('30414000000000','28961000000000','Descrittiva','600');

    _results = _results || assert.pass(full_function_name, test_name);

    EXCEPTION
       WHEN OTHERS THEN
         GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
         _results = _results || assert.fail(full_function_name, test_name, 'INSERT scuola247.metrics FAILED'::text, error);
       RETURN;
  END;
  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.metrics(boolean)
  OWNER TO postgres;
