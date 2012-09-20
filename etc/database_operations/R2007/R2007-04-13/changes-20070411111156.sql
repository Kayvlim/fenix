--  SQL file representing changes to the functionalities model
--  Generated at Wed Apr 11 11:12:43 WEST 2007
--  DO NOT EDIT THIS FILE, run the generating script instead

--  Preamble
SET AUTOCOMMIT = 0;

START TRANSACTION;

-- 
--  Updating existing functionalities
-- 

--  ID: 252 UUID: '9cf56518-f706-4854-b28e-2108ba374c43'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`NAME` = 'pt11:Comunicaçãoen9:Messaging' WHERE own.`UUID` = '9cf56518-f706-4854-b28e-2108ba374c43';

--  ID: 24644 UUID: '777c4663-1201-4281-b0cd-78ce5dbef5e9'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`NAME` = 'pt12:Apresentaçãoen12:Presentation', own.`TITLE` = 'pt12:Apresentaçãoen12:Presentation' WHERE own.`UUID` = '777c4663-1201-4281-b0cd-78ce5dbef5e9';

--  ID: 24645 UUID: '129fcf2c-4edb-4273-a58e-6d504ea3964c'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`NAME` = 'pt22:Interesses Científicosen18:Research Interests', own.`TITLE` = 'pt10:Interessesen18:Research Interests' WHERE own.`UUID` = '129fcf2c-4edb-4273-a58e-6d504ea3964c';

--  ID: 24646 UUID: '31fd792e-73c4-4a78-88ee-36d73347caf4'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`NAME` = 'pt11:Publicaçõesen12:Publications', own.`TITLE` = 'pt11:Publicaçõesen12:Publications' WHERE own.`UUID` = '31fd792e-73c4-4a78-88ee-36d73347caf4';

--  ID: 24647 UUID: '9d51e9a0-801f-48f1-b0f0-09a44c423010'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`NAME` = 'pt8:Patentesen7:Patents', own.`TITLE` = 'pt8:Patentesen7:Patents' WHERE own.`UUID` = '9d51e9a0-801f-48f1-b0f0-09a44c423010';

-- 
--  Inserting new functionalities
-- 

--  ID: 81263 UUID: '405b9767-a4d7-4bd7-93ec-00fe1e21d941'
INSERT INTO `ACCESSIBLE_ITEM` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`, `KEY_SUPERIOR_SECTION`, `SECTION_ORDER`, `KEY_SITE`, `LAST_MODIFIED_DATE_YEAR_MONTH_DAY`, `KEY_SECTION`, `ITEM_ORDER`, `INFORMATION`, `KEY_FUNCTIONALITY`) SELECT '405b9767-a4d7-4bd7-93ec-00fe1e21d941', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt23:Actividades Científicasen23:Scientifical Activities', 'pt23:Actividades Científicasen23:Scientifical Activities', NULL, '/showParticipations.do?method=showParticipations', NULL, 1, 1, 'homepageID', 4, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '65c62b99-26df-4ede-b2f5-139b31f2ca5d';
INSERT INTO `AVAILABILITY_POLICY` (`OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_ACCESSIBLE_ITEM`, `EXPRESSION`, `TARGET_GROUP`) SELECT 'net.sourceforge.fenixedu.domain.functionalities.ExpressionGroupAvailability', 1, `ID_INTERNAL`, 'ifTrue($I(homepageID, \'homepage.Homepage\').showParticipations)', 'ifTrue($I(homepageID, \'homepage.Homepage\').showParticipations)' FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '405b9767-a4d7-4bd7-93ec-00fe1e21d941';
UPDATE `ACCESSIBLE_ITEM` AS f, `AVAILABILITY_POLICY` AS ap SET f.`KEY_AVAILABILITY_POLICY` = ap.`ID_INTERNAL` WHERE f.`UUID` = '405b9767-a4d7-4bd7-93ec-00fe1e21d941' AND ap.`KEY_ACCESSIBLE_ITEM` = f.`ID_INTERNAL`;

COMMIT;
