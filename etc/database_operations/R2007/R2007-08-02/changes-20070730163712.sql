--  SQL file representing changes to the functionalities model
--  Generated at Mon Jul 30 16:38:48 WEST 2007
--  DO NOT EDIT THIS FILE, run the generating script instead

--  Preamble
SET AUTOCOMMIT = 0;

START TRANSACTION;

-- 
--  Inserting new functionalities
-- 

--  ID: 254888 UUID: 'd4845ab9-d479-43d7-8290-ef96975e2372'
INSERT INTO `ACCESSIBLE_ITEM` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`, `KEY_SUPERIOR_SECTION`, `SECTION_ORDER`, `KEY_SITE`, `LAST_MODIFIED_DATE_YEAR_MONTH_DAY`, `KEY_SECTION`, `ITEM_ORDER`, `INFORMATION`, `KEY_FUNCTIONALITY`, `SHOW_NAME`, `KEY_INTRODUCTION_UNIT_SITE`) SELECT 'd4845ab9-d479-43d7-8290-ef96975e2372', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt16:Mover Inscrições', NULL, NULL, '/curriculumLinesLocationManagement.do?method=prepare', NULL, 1, 1, NULL, 1, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '8632c58a-c200-4fb7-ac2d-9ec68ee5635a';

COMMIT;
