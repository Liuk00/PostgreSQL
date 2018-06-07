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
    /*
    INSERT INTO public.districts(district,description,region) VALUES ('TO','Torino','1');
    INSERT INTO public.districts(district,description,region) VALUES ('VC','Vercelli','1');
    INSERT INTO public.districts(district,description,region) VALUES ('NO','Novara','1');
    INSERT INTO public.districts(district,description,region) VALUES ('CN','Cuneo','1');
    INSERT INTO public.districts(district,description,region) VALUES ('AT','Asti','1');
    INSERT INTO public.districts(district,description,region) VALUES ('AL','Alessandria','1');
    INSERT INTO public.districts(district,description,region) VALUES ('BI','Biella','1');
    INSERT INTO public.districts(district,description,region) VALUES ('VB','Verbano-Cusio-Ossola','1');
    INSERT INTO public.districts(district,description,region) VALUES ('AO','Valle d''Aosta/VallÃ©e d''Aoste','2');
    INSERT INTO public.districts(district,description,region) VALUES ('VA','Varese','3');
    INSERT INTO public.districts(district,description,region) VALUES ('CO','Como','3');
    INSERT INTO public.districts(district,description,region) VALUES ('SO','Sondrio','3');
    INSERT INTO public.districts(district,description,region) VALUES ('MI','Milano','3');
    INSERT INTO public.districts(district,description,region) VALUES ('BG','Bergamo','3');
    INSERT INTO public.districts(district,description,region) VALUES ('BS','Brescia','3');
    INSERT INTO public.districts(district,description,region) VALUES ('PV','Pavia','3');
    INSERT INTO public.districts(district,description,region) VALUES ('CR','Cremona','3');
    INSERT INTO public.districts(district,description,region) VALUES ('MN','Mantova','3');
    INSERT INTO public.districts(district,description,region) VALUES ('LC','Lecco','3');
    INSERT INTO public.districts(district,description,region) VALUES ('LO','Lodi','3');
    INSERT INTO public.districts(district,description,region) VALUES ('MB','Monza e della Brianza','3');
    INSERT INTO public.districts(district,description,region) VALUES ('BZ','Bolzano/Bozen','4');
    INSERT INTO public.districts(district,description,region) VALUES ('TN','Trento','4');
    INSERT INTO public.districts(district,description,region) VALUES ('VR','Verona','5');
    INSERT INTO public.districts(district,description,region) VALUES ('VI','Vicenza','5');
    INSERT INTO public.districts(district,description,region) VALUES ('BL','Belluno','5');
    INSERT INTO public.districts(district,description,region) VALUES ('TV','Treviso','5');
    INSERT INTO public.districts(district,description,region) VALUES ('VE','Venezia','5');
    INSERT INTO public.districts(district,description,region) VALUES ('PD','Padova','5');
    INSERT INTO public.districts(district,description,region) VALUES ('RO','Rovigo','5');
    INSERT INTO public.districts(district,description,region) VALUES ('UD','Udine','6');
    INSERT INTO public.districts(district,description,region) VALUES ('GO','Gorizia','6');
    INSERT INTO public.districts(district,description,region) VALUES ('TS','Trieste','6');
    INSERT INTO public.districts(district,description,region) VALUES ('PN','Pordenone','6');
    INSERT INTO public.districts(district,description,region) VALUES ('IM','Imperia','7');
    INSERT INTO public.districts(district,description,region) VALUES ('SV','Savona','7');
    INSERT INTO public.districts(district,description,region) VALUES ('GE','Genova','7');
    INSERT INTO public.districts(district,description,region) VALUES ('SP','La Spezia','7');
    INSERT INTO public.districts(district,description,region) VALUES ('PC','Piacenza','8');
    INSERT INTO public.districts(district,description,region) VALUES ('PR','Parma','8');
    INSERT INTO public.districts(district,description,region) VALUES ('RE','Reggio nell''Emilia','8');
    INSERT INTO public.districts(district,description,region) VALUES ('MO','Modena','8');
    INSERT INTO public.districts(district,description,region) VALUES ('BO','Bologna','8');
    INSERT INTO public.districts(district,description,region) VALUES ('FE','Ferrara','8');
    INSERT INTO public.districts(district,description,region) VALUES ('RA','Ravenna','8');
    INSERT INTO public.districts(district,description,region) VALUES ('FC','ForlÃ¬-Cesena','8');
    INSERT INTO public.districts(district,description,region) VALUES ('RN','Rimini','8');
    INSERT INTO public.districts(district,description,region) VALUES ('MS','Massa-Carrara','9');
    INSERT INTO public.districts(district,description,region) VALUES ('LU','Lucca','9');
    INSERT INTO public.districts(district,description,region) VALUES ('PT','Pistoia','9');
    INSERT INTO public.districts(district,description,region) VALUES ('FI','Firenze','9');
    INSERT INTO public.districts(district,description,region) VALUES ('LI','Livorno','9');
    INSERT INTO public.districts(district,description,region) VALUES ('PI','Pisa','9');
    INSERT INTO public.districts(district,description,region) VALUES ('AR','Arezzo','9');
    INSERT INTO public.districts(district,description,region) VALUES ('SI','Siena','9');
    INSERT INTO public.districts(district,description,region) VALUES ('GR','Grosseto','9');
    INSERT INTO public.districts(district,description,region) VALUES ('PO','Prato','9');
    INSERT INTO public.districts(district,description,region) VALUES ('PG','Perugia','10');
    INSERT INTO public.districts(district,description,region) VALUES ('TR','Terni','10');
    INSERT INTO public.districts(district,description,region) VALUES ('PU','Pesaro e Urbino','11');
    INSERT INTO public.districts(district,description,region) VALUES ('AN','Ancona','11');
    INSERT INTO public.districts(district,description,region) VALUES ('MC','Macerata','11');
    INSERT INTO public.districts(district,description,region) VALUES ('AP','Ascoli Piceno','11');
    INSERT INTO public.districts(district,description,region) VALUES ('FM','Fermo','11');
    INSERT INTO public.districts(district,description,region) VALUES ('VT','Viterbo','12');
    INSERT INTO public.districts(district,description,region) VALUES ('RI','Rieti','12');
    INSERT INTO public.districts(district,description,region) VALUES ('RM','Roma','12');
    INSERT INTO public.districts(district,description,region) VALUES ('LT','Latina','12');
    INSERT INTO public.districts(district,description,region) VALUES ('FR','Frosinone','12');
    INSERT INTO public.districts(district,description,region) VALUES ('AQ','L''Aquila','13');
    INSERT INTO public.districts(district,description,region) VALUES ('TE','Teramo','13');
    INSERT INTO public.districts(district,description,region) VALUES ('PE','Pescara','13');
    INSERT INTO public.districts(district,description,region) VALUES ('CH','Chieti','13');
    INSERT INTO public.districts(district,description,region) VALUES ('CB','Campobasso','14');
    INSERT INTO public.districts(district,description,region) VALUES ('IS','Isernia','14');
    INSERT INTO public.districts(district,description,region) VALUES ('CE','Caserta','15');
    INSERT INTO public.districts(district,description,region) VALUES ('BN','Benevento','15');
    INSERT INTO public.districts(district,description,region) VALUES ('NA','Napoli','15');
    INSERT INTO public.districts(district,description,region) VALUES ('AV','Avellino','15');
    INSERT INTO public.districts(district,description,region) VALUES ('SA','Salerno','15');
    INSERT INTO public.districts(district,description,region) VALUES ('FG','Foggia','16');
    INSERT INTO public.districts(district,description,region) VALUES ('BA','Bari','16');
    INSERT INTO public.districts(district,description,region) VALUES ('TA','Taranto','16');
    INSERT INTO public.districts(district,description,region) VALUES ('BR','Brindisi','16');
    INSERT INTO public.districts(district,description,region) VALUES ('LE','Lecce','16');
    INSERT INTO public.districts(district,description,region) VALUES ('BT','Barletta-Andria-Trani','16');
    INSERT INTO public.districts(district,description,region) VALUES ('PZ','Potenza','17');
    INSERT INTO public.districts(district,description,region) VALUES ('MT','Matera','17');
    INSERT INTO public.districts(district,description,region) VALUES ('CS','Cosenza','18');
    INSERT INTO public.districts(district,description,region) VALUES ('CZ','Catanzaro','18');
    INSERT INTO public.districts(district,description,region) VALUES ('RC','Reggio di Calabria','18');
    INSERT INTO public.districts(district,description,region) VALUES ('KR','Crotone','18');
    INSERT INTO public.districts(district,description,region) VALUES ('VV','Vibo Valentia','18');
    INSERT INTO public.districts(district,description,region) VALUES ('TP','Trapani','19');
    INSERT INTO public.districts(district,description,region) VALUES ('PA','Palermo','19');
    INSERT INTO public.districts(district,description,region) VALUES ('ME','Messina','19');
    INSERT INTO public.districts(district,description,region) VALUES ('AG','Agrigento','19');
    INSERT INTO public.districts(district,description,region) VALUES ('CL','Caltanissetta','19');
    INSERT INTO public.districts(district,description,region) VALUES ('EN','Enna','19');
    INSERT INTO public.districts(district,description,region) VALUES ('CT','Catania','19');
    INSERT INTO public.districts(district,description,region) VALUES ('RG','Ragusa','19');
    INSERT INTO public.districts(district,description,region) VALUES ('SR','Siracusa','19');
    INSERT INTO public.districts(district,description,region) VALUES ('SS','Sassari','20');
    INSERT INTO public.districts(district,description,region) VALUES ('NU','Nuoro','20');
    INSERT INTO public.districts(district,description,region) VALUES ('CA','Cagliari','20');
    INSERT INTO public.districts(district,description,region) VALUES ('OR','Oristano','20');
    INSERT INTO public.districts(district,description,region) VALUES ('OT','Olbia-Tempio','20');
    INSERT INTO public.districts(district,description,region) VALUES ('OG','Ogliastra','20');
    INSERT INTO public.districts(district,description,region) VALUES ('VS','Medio Campidano','20');
    INSERT INTO public.districts(district,description,region) VALUES ('CI','Carbonia-Iglesias','20');
    INSERT INTO public.districts(district,description,region) VALUES ('EE','Provincia ***ERRATA***','1');
    */
    
    
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('01','Torino','1000000000','758321000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('02','Vercelli','1000000000','758322000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('03','Novara','1000000000','758323000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('04','Cuneo','1000000000','758324000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('05','Asti','1000000000','758325000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('06','Alessandria','1000000000','758326000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('07','Biella','1000000000','758327000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('08','Verbano-Cusio-Ossola','1000000000','758328000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('09','Valle d''Aosta/Vallée d''Aoste','2000000000','758329000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('10','Varese','3000000000','758330000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('11','Como','3000000000','758331000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('12','Sondrio','3000000000','758332000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('13','Milano','3000000000','758333000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('14','Bergamo','3000000000','758334000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('15','Brescia','3000000000','758335000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('16','Pavia','3000000000','758336000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('17','Cremona','3000000000','758337000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('18','Mantova','3000000000','758338000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('19','Lecco','3000000000','758339000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('20','Lodi','3000000000','758340000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('21','Monza e della Brianza','3000000000','758341000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('22','Bolzano/Bozen','4000000000','758342000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('33','Trento','4000000000','758343000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('34','Verona','5000000000','758344000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('35','Vicenza','5000000000','758345000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('36','Belluno','5000000000','758346000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('37','Treviso','5000000000','758347000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('38','Venezia','5000000000','758348000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('39','Padova','5000000000','758349000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('40','Rovigo','5000000000','758350000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('41','Udine','6000000000','758351000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('42','Gorizia','6000000000','758352000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('43','Trieste','6000000000','758353000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('44','Pordenone','6000000000','758354000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('45','Imperia','7000000000','758355000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('46','Savona','7000000000','758356000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('47','Genova','7000000000','758357000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('48','La Spezia','7000000000','758358000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('49','Piacenza','8000000000','758359000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('50','Parma','8000000000','758360000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('51','Reggio nell''Emilia','8000000000','758361000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('52','Modena','8000000000','758362000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('53','Bologna','8000000000','758363000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('54','Ferrara','8000000000','758364000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('55','Ravenna','8000000000','758365000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('56','Forlì-Cesena','8000000000','758366000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('57','Rimini','8000000000','758367000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('58','Massa-Carrara','9000000000','758368000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('59','Lucca','9000000000','758369000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('60','Pistoia','9000000000','758370000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('61','Firenze','9000000000','758371000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('62','Livorno','9000000000','758372000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('63','Pisa','9000000000','758373000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('64','Arezzo','9000000000','758374000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('65','Siena','9000000000','758375000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('66','Grosseto','9000000000','758376000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('67','Prato','9000000000','758377000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('68','Perugia','10000000000','758378000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('69','Terni','10000000000','758379000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('70','Pesaro e Urbino','11000000000','758380000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('71','Ancona','11000000000','758381000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('72','Macerata','11000000000','758382000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('73','Ascoli Piceno','11000000000','758383000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('74','Fermo','11000000000','758384000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('75','Viterbo','12000000000','758385000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('76','Rieti','12000000000','758386000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('77','Roma','12000000000','758387000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('78','Latina','12000000000','758388000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('79','Frosinone','12000000000','758389000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('80','L''Aquila','13000000000','758390000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('81','Teramo','13000000000','758391000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('82','Pescara','13000000000','758392000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('83','Chieti','13000000000','758393000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('84','Campobasso','14000000000','758394000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('85','Isernia','14000000000','758395000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('86','Caserta','15000000000','758396000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('87','Benevento','15000000000','758397000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('88','Napoli','15000000000','758398000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('89','Avellino','15000000000','758399000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('90','Salerno','15000000000','758400000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('91','Foggia','16000000000','758401000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('92','Bari','16000000000','758402000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('93','Taranto','16000000000','758403000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('94','Brindisi','16000000000','758404000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('95','Lecce','16000000000','758405000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('96','Barletta-Andria-Trani','16000000000','758406000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('97','Potenza','17000000000','758407000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('98','Matera','17000000000','758408000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('99','Cosenza','18000000000','758409000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A1','Catanzaro','18000000000','758410000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A2','Reggio di Calabria','18000000000','758411000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A3','Crotone','18000000000','758412000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A4','Vibo Valentia','18000000000','758413000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A5','Trapani','19000000000','758414000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A6','Palermo','19000000000','758415000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A7','Messina','19000000000','758416000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A8','Agrigento','19000000000','758417000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('A9','Caltanissetta','19000000000','758418000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B1','Enna','19000000000','758419000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B2','Catania','19000000000','758420000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B3','Ragusa','19000000000','758421000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B4','Siracusa','19000000000','758422000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B5','Sassari','20000000000','758423000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B6','Nuoro','20000000000','758424000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B7','Cagliari','20000000000','758425000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B8','Oristano','20000000000','758426000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('B9','Olbia-Tempio','20000000000','758427000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('C1','Ogliastra','20000000000','758428000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('C2','Medio Campidano','20000000000','758429000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('C3','Carbonia-Iglesias','20000000000','758430000000000');
	INSERT INTO public.districts(mnemonic,description,region,district) VALUES ('C4','Provincia ***ERRATA***','1000000000','758431000000000');

    _results = _results || assert.pass(full_function_name, test_name);

    EXCEPTION
       WHEN OTHERS THEN 
         GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;
         _results = _results || assert.fail(full_function_name, test_name, 'INSERT public.districts FAILED'::text, error);   
       RETURN; 
  END;
  RETURN; 
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.districts(boolean)
  OWNER TO postgres;
