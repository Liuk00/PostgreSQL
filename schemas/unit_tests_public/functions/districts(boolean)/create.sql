﻿-- Function: unit_tests_public.districts(boolean)

-- DROP FUNCTION unit_tests_public.districts(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.districts(
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
    PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_public.regions');
    RETURN;
  END IF;
  -------------------------------
  test_name = 'INSERT districts';
  -------------------------------
  BEGIN

	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('01','Torino (test)','1000000000','758321000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('02','Vercelli (test)','1000000000','758322000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('03','Novara (test)','1000000000','758323000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('04','Cuneo (test)','1000000000','758324000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('05','Asti (test)','1000000000','758325000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('06','Alessandria (test)','1000000000','758326000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('07','Biella (test)','1000000000','758327000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('08','Verbano-Cusio-Ossola (test)','1000000000','758328000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('09','Valle d''Aosta/Vallée d''Aoste (test)','2000000000','758329000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('10','Varese (test)','3000000000','758330000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('11','Como (test)','3000000000','758331000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('12','Sondrio (test)','3000000000','758332000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('13','Milano (test)','3000000000','758333000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('14','Bergamo (test)','3000000000','758334000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('15','Brescia (test)','3000000000','758335000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('16','Pavia (test)','3000000000','758336000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('17','Cremona (test)','3000000000','758337000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('18','Mantova (test)','3000000000','758338000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('19','Lecco (test)','3000000000','758339000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('20','Lodi (test)','3000000000','758340000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('21','Monza e della Brianza (test)','3000000000','758341000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('22','Bolzano/Bozen (test)','4000000000','758342000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('33','Trento (test)','4000000000','758343000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('34','Verona (test)','5000000000','758344000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('35','Vicenza (test)','5000000000','758345000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('36','Belluno (test)','5000000000','758346000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('37','Treviso (test)','5000000000','758347000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('38','Venezia (test)','5000000000','758348000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('39','Padova (test)','5000000000','758349000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('40','Rovigo (test)','5000000000','758350000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('41','Udine (test)','6000000000','758351000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('42','Gorizia (test)','6000000000','758352000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('43','Trieste (test)','6000000000','758353000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('44','Pordenone (test)','6000000000','758354000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('45','Imperia (test)','7000000000','758355000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('46','Savona (test)','7000000000','758356000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('47','Genova (test)','7000000000','758357000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('48','La Spezia (test)','7000000000','758358000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('49','Piacenza (test)','8000000000','758359000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('50','Parma (test)','8000000000','758360000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('51','Reggio nell''Emilia (test)','8000000000','758361000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('52','Modena (test)','8000000000','758362000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('53','Bologna (test)','8000000000','758363000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('54','Ferrara (test)','8000000000','758364000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('55','Ravenna (test)','8000000000','758365000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('56','Forlì-Cesena (test)','8000000000','758366000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('57','Rimini (test)','8000000000','758367000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('58','Massa-Carrara (test)','9000000000','758368000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('59','Lucca (test)','9000000000','758369000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('60','Pistoia (test)','9000000000','758370000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('61','Firenze (test)','9000000000','758371000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('62','Livorno (test)','9000000000','758372000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('63','Pisa (test)','9000000000','758373000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('64','Arezzo (test)','9000000000','758374000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('65','Siena (test)','9000000000','758375000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('66','Grosseto (test)','9000000000','758376000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('67','Prato (test)','9000000000','758377000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('68','Perugia (test)','10000000000','758378000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('69','Terni (test)','10000000000','758379000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('70','Pesaro e Urbino (test)','11000000000','758380000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('71','Ancona (test)','11000000000','758381000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('72','Macerata (test)','11000000000','758382000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('73','Ascoli Piceno (test)','11000000000','758383000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('74','Fermo (test)','11000000000','758384000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('75','Viterbo (test)','12000000000','758385000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('76','Rieti (test)','12000000000','758386000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('77','Roma (test)','12000000000','758387000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('78','Latina (test)','12000000000','758388000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('79','Frosinone (test)','12000000000','758389000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('80','L''Aquila (test)','13000000000','758390000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('81','Teramo (test)','13000000000','758391000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('82','Pescara (test)','13000000000','758392000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('83','Chieti (test)','13000000000','758393000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('84','Campobasso (test)','14000000000','758394000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('85','Isernia (test)','14000000000','758395000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('86','Caserta (test)','15000000000','758396000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('87','Benevento (test)','15000000000','758397000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('88','Napoli (test)','15000000000','758398000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('89','Avellino (test)','15000000000','758399000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('90','Salerno (test)','15000000000','758400000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('91','Foggia (test)','16000000000','758401000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('92','Bari (test)','16000000000','758402000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('93','Taranto (test)','16000000000','758403000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('94','Brindisi (test)','16000000000','758404000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('95','Lecce (test)','16000000000','758405000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('96','Barletta-Andria-Trani (test)','16000000000','758406000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('97','Potenza (test)','17000000000','758407000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('98','Matera (test)','17000000000','758408000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('99','Cosenza (test)','18000000000','758409000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A1','Catanzaro (test)','18000000000','758410000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A2','Reggio di Calabria (test)','18000000000','758411000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A3','Crotone (test)','18000000000','758412000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A4','Vibo Valentia (test)','18000000000','758413000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A5','Trapani (test)','19000000000','758414000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A6','Palermo (test)','19000000000','758415000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A7','Messina (test)','19000000000','758416000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A8','Agrigento (test)','19000000000','758417000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('A9','Caltanissetta (test)','19000000000','758418000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B1','Enna (test)','19000000000','758419000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B2','Catania (test)','19000000000','758420000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B3','Ragusa (test)','19000000000','758421000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B4','Siracusa (test)','19000000000','758422000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B5','Sassari (test)','20000000000','758423000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B6','Nuoro (test)','20000000000','758424000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B7','Cagliari (test)','20000000000','758425000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B8','Oristano (test)','20000000000','758426000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('B9','Olbia-Tempio (test)','20000000000','758427000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('C1','Ogliastra (test)','20000000000','758428000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('C2','Medio Campidano (test)','20000000000','758429000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('C3','Carbonia-Iglesias (test)','20000000000','758430000000000');
	INSERT INTO shared.districts(mnemonic,description,region,district) VALUES ('C4','Provincia ***ERRATA*** (test)','1000000000','758431000000000');

    _results = _results || assert.pass(full_function_name, test_name);

    EXCEPTION
       WHEN OTHERS THEN
         GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
         _results = _results || assert.fail(full_function_name, test_name, 'INSERT shared.districts FAILED'::text, error);
       RETURN;
  END;
  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.districts(boolean)
  OWNER TO postgres;
