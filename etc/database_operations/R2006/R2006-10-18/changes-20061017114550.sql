--  SQL file representing changes to the functionalities model
--  Generated at Tue Oct 17 11:45:52 WEST 2006
--  DO NOT EDIT THIS FILE, run the generating script instead

--  Preamble
SET AUTOCOMMIT = 0;

START TRANSACTION;

-- 
--  Updating existing functionalities
-- 

--  ID: 130 UUID: '8f7d1dc2-9155-47c9-b142-19c545390907'
UPDATE `FUNCTIONALITY` AS own SET own.`ORDER_IN_MODULE` = 10 WHERE own.`UUID` = '8f7d1dc2-9155-47c9-b142-19c545390907';

-- 
--  Inserting new functionalities
-- 

--  ID: 260 UUID: '178d66a1-e8cf-4bb4-8278-5a453f024639'
INSERT INTO `FUNCTIONALITY` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`) SELECT '178d66a1-e8cf-4bb4-8278-5a453f024639', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt16:Gestão de Cargos', 'pt14:Escolher Cargo', NULL, 'functionsManagement/chooseFunction.faces', NULL, 1, 1, NULL, 7, 0, 0, 1 FROM `FUNCTIONALITY` WHERE `UUID` = 'cced3f10-5a09-470a-bfed-aed2454805bf';

--  ID: 261 UUID: 'abc88970-ebe8-4a4d-9df1-fc45e27fb025'
INSERT INTO `FUNCTIONALITY` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`) SELECT 'abc88970-ebe8-4a4d-9df1-fc45e27fb025', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt16:Gestão de Cargos', 'pt11:Confirmação', NULL, 'functionsManagement/confirmation.faces', NULL, 1, 1, NULL, 8, 0, 0, 1 FROM `FUNCTIONALITY` WHERE `UUID` = 'cced3f10-5a09-470a-bfed-aed2454805bf';

--  ID: 262 UUID: '69f1121b-9917-47ae-ad00-d36f701c101f'
INSERT INTO `FUNCTIONALITY` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`) SELECT '69f1121b-9917-47ae-ad00-d36f701c101f', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt16:Gestão de Cargos', 'pt22:Apagar Cargo de Gestão', NULL, 'functionsManagement/deletePersonFunction.faces', NULL, 1, 1, NULL, 9, 0, 0, 1 FROM `FUNCTIONALITY` WHERE `UUID` = 'cced3f10-5a09-470a-bfed-aed2454805bf';

COMMIT;
