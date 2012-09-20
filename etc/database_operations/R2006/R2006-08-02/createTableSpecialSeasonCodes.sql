CREATE TABLE `SPECIAL_SEASON_CODE` (
  `ID_INTERNAL` int(11) unsigned NOT NULL auto_increment,
  `KEY_ROOT_DOMAIN_OBJECT` int(11) NOT NULL default '1',  
  `CODE` int(11) NOT NULL,  
  `SITUATION` varchar(150) NOT NULL,
  `MAX_ENROLMENTS` int(11) NOT NULL,
  PRIMARY KEY  (`ID_INTERNAL`),
  UNIQUE KEY `U1` (`CODE`),  
  KEY `KEY_ROOT_DOMAIN_OBJECT` (`KEY_ROOT_DOMAIN_OBJECT`)
) ENGINE=InnoDB; 

CREATE TABLE `YEAR_STUDENT_SPECIAL_SEASON_CODE` (
  `ID_INTERNAL` int(11) unsigned NOT NULL auto_increment,
  `KEY_ROOT_DOMAIN_OBJECT` int(11) NOT NULL default '1',  
  `KEY_EXECUTION_YEAR` int(11) NOT NULL default '0',  
  `KEY_SPECIAL_SEASON_CODE` int(11) NOT NULL default '0',
  `KEY_STUDENT` int(11) NOT NULL default '0',  
  PRIMARY KEY  (`ID_INTERNAL`),
  UNIQUE KEY `U1` (`KEY_EXECUTION_YEAR`, `KEY_STUDENT`),
  KEY `KEY_EXECUTION_YEAR` (`KEY_EXECUTION_YEAR`),
  KEY `KEY_SPECIAL_SEASON_CODE` (`KEY_SPECIAL_SEASON_CODE`),
  KEY `KEY_STUDENT` (`KEY_STUDENT`),  
  KEY `KEY_ROOT_DOMAIN_OBJECT` (`KEY_ROOT_DOMAIN_OBJECT`)
) ENGINE=InnoDB; 

INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (1, "Finalistas", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (2, "Trabalhadores Estudantes", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (3, "Desportistas de Alta Competição", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (4, "Portadores de deficiência Física ou Sensorial", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (6, "Parturiantes ou Cônjugues", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (7, "Conselho Directivo", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (8, "Direcção da AEIST", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (9, "Dirigentes Associativos Juvenis", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (10, "Mesa Assembleia de Representantes", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (11, "Comissão Executiva do Conselho Pedagógico", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (12, "Mesa da Assembleia Geral e Conselho Fiscal e Disciplinar da AEIST", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (13, "Comissões da Assembleia de Representantes", 2);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (14, "Comissão Coordenadora do Conselho Pedagógico", 2);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (15, "Bolseiros do IST", 2);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (16, "Secções Autónomas da AEIST", 2);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (17, "Desportistas do IST", 2);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (18, "Tunas do IST", 2);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (19, "Academias Militares", 2);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (20, "Atestados Médicos", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (21, "Regime de transição da LEGI para Tagus Park", 4);
INSERT INTO SPECIAL_SEASON_CODE (CODE, SITUATION, MAX_ENROLMENTS) VALUES (22, "Outros (requerimentos)", 4);
