﻿
-- Function: unit_tests_public.grading_meetings_valutations_trigger(boolean)

-- DROP FUNCTION unit_tests_public.valutations_trigger(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.valutations_trigger(
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

  ------------------------------------------------------------------
  test_name = 'UPDATE valutations with subject of different school';
  ------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations set subject = '32913000000000'  WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the subject has a different school from the student', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0573');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ------------------------------------------------------------------
  test_name = 'INSERT valutations with subject of different school';
  ------------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','32913000000000','72745000000000','62012000000000','29096000000000',NULL,'f','29148000000000','2013-12-06',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the subject has a different school from the student', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0574');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------------------------------------
  test_name = 'UPDATE valutations with grade_type of different subject';
  ----------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET grade_type = '46302000000000' WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the grade_type has a different subject', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0575');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------------------------------------
  test_name = 'INSERT valutations with grade_type of different subject';
  ----------------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','46302000000000','62012000000000','29096000000000',NULL,'f','29148000000000','2013-12-06',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the grade_type has a different subject', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0576');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -----------------------------------------------------------------
  test_name = 'UPDATE valutations with topic of different subject';
  -----------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET topic = '61967000000000' WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the topic has a different subject', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0577');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -----------------------------------------------------------------
  test_name = 'INSERT valutations with topic of different subject';
  -----------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','72745000000000','61967000000000','29096000000000',NULL,'f','29148000000000','2013-12-06',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the topic has a different subject', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0578');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------------------------------
  test_name = 'UPDATE valutations with topic of different degree';
  ----------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET topic = '62002000000000' WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the grade_type has a different degree', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U0579');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------------------------------
  test_name = 'INSERT valutations with topic of different degree';
  ----------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','72745000000000','62002000000000','29096000000000',NULL,'f','29148000000000','2013-12-06',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,' was OK but the grade_type has a different degree', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057A');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;


  -----------------------------------------------------------------
  test_name = 'UPDATE valutations with metric of different school';
  -----------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET grade = '11439000000000' WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the metric of grade has a different school', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057B');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -----------------------------------------------------------------
  test_name = 'INSERT valutations with metric of different school';
  -----------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','72745000000000','62012000000000','11439000000000',NULL,'f','29148000000000','2013-12-06',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the metric has a different school', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057C');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------------------------------
  test_name = 'UPDATE valutations with note of different student';
  ----------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET note = '104925000000000' WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the note has a different student', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057F');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ---------------------------------------------------------------
  test_name = 'INSERT valutations with note of different school';
  ---------------------------------------------------------------
  BEGIN
      INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','72745000000000','62012000000000','29096000000000',NULL,'f','29148000000000','2013-12-06','104925000000000','31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the note has a different student', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057G');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------------------------------
  test_name = 'UPDATE valutations with teacher of a different school';
  --------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET teacher = '287713000000000' WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the teacher is from a different school', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057H');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------------------------------
  test_name = 'INSERT valutations with teacher of a different school';
  --------------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','72745000000000','62012000000000','29096000000000',NULL,'f','287713000000000','2013-12-06',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the teacher is from a different school', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057I');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;


  ------------------------------------------------------------------------
  test_name = 'UPDATE valutations with teacher that has different role';
  ------------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET teacher = '30900000000000' WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the teacher is not a teacher', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057L');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ----------------------------------------------------------------------
  test_name = 'INSERT valutations with teacher that has different role';
  ----------------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','72745000000000','62012000000000','29096000000000',NULL,'f','30900000000000','2013-12-06',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the teacher is not a teacher', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057M');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------------------------------------
  test_name = 'UPDATE valutations with on_date of out school''s year range';
  --------------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET on_date = '2014-09-14' WHERE valutation = '86813000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the valutation''s date is out of the school year duration', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057N');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------------------------------------
  test_name = 'INSERT valutations with on_date of out school''s year range';
  --------------------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','72745000000000','62012000000000','29096000000000',NULL,'f','29148000000000','2014-09-14',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the valutation''s date is out of the school year duration', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057O');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  --------------------------------------------------------------------------
  test_name = 'UPDATE valutations with on_date of out school''s year range';
  --------------------------------------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET grade = '29096000000000',
				  evaluation = NULL,
				  private = 'f',
				  on_date = '2013-12-06',
				  note = NULL,
			          classroom_student =  '31458000000000',
				  subject = '29107000000000',
				  teacher = '29148000000000',
				  grade_type = '72745000000000',
				  topic = '62012000000000'
			          WHERE valutation = '86814000000000';

    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the valutation''s has duplicated values', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057P');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;
  --------------------------------------------------------
  test_name = 'INSERT valutations with duplicated values';
  --------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('186813000000000','29107000000000','72745000000000','62012000000000','29096000000000',NULL,'f','29148000000000','2013-12-06',NULL,'31458000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the valutation''s has duplicated values', NULL::diagnostic.error);
    RETURN;
	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057Q');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  -----------------------------------------------
  test_name = 'UPDATE private and note NOT NULL';
  -----------------------------------------------
  BEGIN
    UPDATE scuola247.valutations SET private = 't', note = '104939000000000' WHERE valutation = '105226000000000';
    _results = _results || assert.fail(full_function_name, test_name,'UPDATE was OK but the valutation''s has private and note NOT NULL', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057R');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

  ---------------------------------------------------------------
  test_name = 'INSERT valutation with private and note NOT NULL';
  ---------------------------------------------------------------
  BEGIN
    INSERT INTO scuola247.valutations(valutation,subject,grade_type,topic,grade,evaluation,private,teacher,on_date,note,classroom_student) VALUES ('1105226000000000','32913000000000','98547000000000','33244000000000','11461000000000',NULL,'t','32927000000000','2013-09-21',104939000000000,'10381000000000');
    _results = _results || assert.fail(full_function_name, test_name,'INSERT was OK but the valutation''s has private and note NOT NULL', NULL::diagnostic.error);
    RETURN;
    EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
		_results = _results || assert.sqlstate_equals(me.full_function_name, me.test_name, me.error, 'U057S');
	IF unit_testing.last_checkpoint_failed(_results) THEN RETURN; END IF;
  END;

    RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.valutations_trigger(boolean)
  OWNER TO postgres;
