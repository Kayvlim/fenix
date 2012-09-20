SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_EXECUTION_PATH_VALUE,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_ROOT_DOMAIN_OBJECT,KEY_AVAILABILITY_POLICY,KEY_PORTAL,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES ('/findSpaces.do?method=prepareSearchSpaces',null,736,'38dfca47-4ca2-4b04-8f32-9e0afce9bf7e','2008-02-01 11:51:19','pt19:Pesquisa de Espaços','pt19:Pesquisa de Espaços',null,'pt19:Pesquisa de Espaços','pt19:pesquisa-de-espacos',1,null,null,null,'net.sourceforge.fenixedu.domain.functionalities.Functionality')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,OJB_CONCRETE_CLASS) VALUES (1,1,1,'1b6d4c06-fdfb-4426-a4a1-c3a217e89977:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e',1,1,2,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

UPDATE CONTENT SET EXECUTION_PATH='/findSpaces.do?method=prepareSearchSpaces',VISIBLE=null,KEY_EXECUTION_PATH_VALUE=736,CONTENT_ID='38dfca47-4ca2-4b04-8f32-9e0afce9bf7e',CREATION_DATE='2008-02-01 11:51:19',NAME='pt19:Pesquisa de Espaços',TITLE='pt19:Pesquisa de Espaços',BODY=null,DESCRIPTION='pt19:Pesquisa de Espaços',NORMALIZED_NAME='pt19:pesquisa-de-espacos',KEY_ROOT_DOMAIN_OBJECT=1,KEY_AVAILABILITY_POLICY=null,KEY_PORTAL=null,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.functionalities.Functionality' WHERE CONTENT_ID = '38dfca47-4ca2-4b04-8f32-9e0afce9bf7e'  ;

UPDATE NODE SET NODE_ORDER=1,ASCENDING=1,VISIBLE=1,CONTENT_ID='1b6d4c06-fdfb-4426-a4a1-c3a217e89977:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e',KEY_ROOT_DOMAIN_OBJECT=1,KEY_PARENT=3,KEY_CHILD=4,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '1b6d4c06-fdfb-4426-a4a1-c3a217e89977:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e'  ;

insert into EXECUTION_PATH (EXECUTION_PATH, KEY_FUNCTIONALITY, KEY_ROOT_DOMAIN_OBJECT) select "/findSpaces.do?method=prepareSearchSpaces", c.ID_INTERNAL, 1 from CONTENT c where c.CONTENT_ID = '38dfca47-4ca2-4b04-8f32-9e0afce9bf7e'; 

update CONTENT, EXECUTION_PATH set CONTENT.KEY_EXECUTION_PATH_VALUE = EXECUTION_PATH.ID_INTERNAL where CONTENT.ID_INTERNAL = EXECUTION_PATH.KEY_FUNCTIONALITY and EXECUTION_PATH.EXECUTION_PATH = "/findSpaces.do?method=prepareSearchSpaces";

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(1,'1b6d4c06-fdfb-4426-a4a1-c3a217e89977','1b6d4c06-fdfb-4426-a4a1-c3a217e89977:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(2,'38dfca47-4ca2-4b04-8f32-9e0afce9bf7e','1b6d4c06-fdfb-4426-a4a1-c3a217e89977:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(3,'1b6d4c06-fdfb-4426-a4a1-c3a217e89977','1b6d4c06-fdfb-4426-a4a1-c3a217e89977:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(4,'38dfca47-4ca2-4b04-8f32-9e0afce9bf7e','1b6d4c06-fdfb-4426-a4a1-c3a217e89977:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,OJB_CONCRETE_CLASS) VALUES (54,1,0,'382b0734-1431-102b-8308-0016ec91a6df:886afcf2-f257-48ac-b489-e3d8fbc7a692',1,5,6,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

INSERT INTO CONTENT (ENABLED,MODIFICATION_DATE,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_ROOT_DOMAIN_OBJECT,KEY_AVAILABILITY_POLICY,KEY_PORTAL,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,null,'886afcf2-f257-48ac-b489-e3d8fbc7a692','2008-02-01 11:52:28','pt18:Conteudos Publicos',null,null,null,'pt18:conteudos-publicos',1,null,null,null,'net.sourceforge.fenixedu.domain.Section')  ;

UPDATE NODE SET NODE_ORDER=54,ASCENDING=1,VISIBLE=0,CONTENT_ID='382b0734-1431-102b-8308-0016ec91a6df:886afcf2-f257-48ac-b489-e3d8fbc7a692',KEY_ROOT_DOMAIN_OBJECT=1,KEY_PARENT=7,KEY_CHILD=8,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '382b0734-1431-102b-8308-0016ec91a6df:886afcf2-f257-48ac-b489-e3d8fbc7a692'  ;

UPDATE CONTENT SET ENABLED=null,MODIFICATION_DATE=null,MAXIMIZABLE=null,PREFIX=null,KEY_INITIAL_CONTENT=null,CONTENT_ID='886afcf2-f257-48ac-b489-e3d8fbc7a692',CREATION_DATE='2008-02-01 11:52:28',NAME='pt18:Conteudos Publicos',TITLE=null,BODY=null,DESCRIPTION=null,NORMALIZED_NAME='pt18:conteudos-publicos',KEY_ROOT_DOMAIN_OBJECT=1,KEY_AVAILABILITY_POLICY=null,KEY_PORTAL=null,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.Section' WHERE CONTENT_ID = '886afcf2-f257-48ac-b489-e3d8fbc7a692'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(5,'382b0734-1431-102b-8308-0016ec91a6df','382b0734-1431-102b-8308-0016ec91a6df:886afcf2-f257-48ac-b489-e3d8fbc7a692') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(6,'886afcf2-f257-48ac-b489-e3d8fbc7a692','382b0734-1431-102b-8308-0016ec91a6df:886afcf2-f257-48ac-b489-e3d8fbc7a692') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(7,'382b0734-1431-102b-8308-0016ec91a6df','382b0734-1431-102b-8308-0016ec91a6df:886afcf2-f257-48ac-b489-e3d8fbc7a692') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(8,'886afcf2-f257-48ac-b489-e3d8fbc7a692','382b0734-1431-102b-8308-0016ec91a6df:886afcf2-f257-48ac-b489-e3d8fbc7a692') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,OJB_CONCRETE_CLASS) VALUES (0,1,1,'886afcf2-f257-48ac-b489-e3d8fbc7a692:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e',1,9,10,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

UPDATE NODE SET NODE_ORDER=0,ASCENDING=1,VISIBLE=1,CONTENT_ID='886afcf2-f257-48ac-b489-e3d8fbc7a692:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e',KEY_ROOT_DOMAIN_OBJECT=1,KEY_PARENT=11,KEY_CHILD=12,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '886afcf2-f257-48ac-b489-e3d8fbc7a692:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(9,'886afcf2-f257-48ac-b489-e3d8fbc7a692','886afcf2-f257-48ac-b489-e3d8fbc7a692:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(10,'38dfca47-4ca2-4b04-8f32-9e0afce9bf7e','886afcf2-f257-48ac-b489-e3d8fbc7a692:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(11,'886afcf2-f257-48ac-b489-e3d8fbc7a692','886afcf2-f257-48ac-b489-e3d8fbc7a692:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(12,'38dfca47-4ca2-4b04-8f32-9e0afce9bf7e','886afcf2-f257-48ac-b489-e3d8fbc7a692:38dfca47-4ca2-4b04-8f32-9e0afce9bf7e') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;



COMMIT;
