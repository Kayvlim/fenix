SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO EXECUTION_PATH (EXECUTION_PATH,CONTENT_ID,KEY_FUNCTIONALITY,KEY_ROOT_DOMAIN_OBJECT) VALUES ('/viewEmployeeAssiduousness.do?method=chooseEmployee&action=showVacationsMap','f108f2c0-36c8-46e9-82b8-dfb863748780',5,1)  ;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_EXECUTION_PATH_VALUE,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES ('/viewEmployeeAssiduousness.do?method=chooseEmployee&action=showVacationsMap',null,6,'24342f3c-3ee6-4323-bed7-d145f9d5a8e7','2009-04-16 15:05:37','pt14:Mapa de Fériasen13:Vacations Map','pt14:Mapa de Fériasen13:Vacations Map',null,null,'en13:vacations-mappt14:mapa-de-ferias',null,null,1,null,'net.sourceforge.fenixedu.domain.functionalities.Functionality')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (7,1,1,'940d3b34-752c-4e56-8d35-c1dab4f954a8:24342f3c-3ee6-4323-bed7-d145f9d5a8e7',7,8,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(5,'24342f3c-3ee6-4323-bed7-d145f9d5a8e7','f108f2c0-36c8-46e9-82b8-dfb863748780') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(6,'f108f2c0-36c8-46e9-82b8-dfb863748780','24342f3c-3ee6-4323-bed7-d145f9d5a8e7') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(7,'24342f3c-3ee6-4323-bed7-d145f9d5a8e7','940d3b34-752c-4e56-8d35-c1dab4f954a8:24342f3c-3ee6-4323-bed7-d145f9d5a8e7') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(8,'940d3b34-752c-4e56-8d35-c1dab4f954a8','940d3b34-752c-4e56-8d35-c1dab4f954a8:24342f3c-3ee6-4323-bed7-d145f9d5a8e7') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO CONTENT (KEY_FUNCTIONALITY,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (9,'d58f7869-a32c-48b1-9440-ac9274f07b95','2009-04-16 15:06:09',null,null,null,null,null,null,null,1,null,'net.sourceforge.fenixedu.domain.contents.FunctionalityCall')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (7,1,1,'90853396807ee1c33c30f536a898437e:d58f7869-a32c-48b1-9440-ac9274f07b95',10,11,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(9,'24342f3c-3ee6-4323-bed7-d145f9d5a8e7','d58f7869-a32c-48b1-9440-ac9274f07b95') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(10,'d58f7869-a32c-48b1-9440-ac9274f07b95','90853396807ee1c33c30f536a898437e:d58f7869-a32c-48b1-9440-ac9274f07b95') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(11,'90853396807ee1c33c30f536a898437e','90853396807ee1c33c30f536a898437e:d58f7869-a32c-48b1-9440-ac9274f07b95') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;



COMMIT;
