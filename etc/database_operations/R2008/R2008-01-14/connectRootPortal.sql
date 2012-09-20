ALTER TABLE CONTENT
	ADD COLUMN KEY_PORTAL_ROOT_DOMAIN_OBJECT INTEGER;

ALTER TABLE ROOT_DOMAIN_OBJECT
	ADD COLUMN KEY_ROOT_PORTAL INTEGER;

INSERT INTO CONTENT (OJB_CONCRETE_CLASS, KEY_ROOT_DOMAIN_OBJECT, KEY_PORTAL_ROOT_DOMAIN_OBJECT, NAME, CREATION_DATE, PREFIX, TYPE)
VALUES ('net.sourceforge.fenixedu.domain.contents.Portal', 1, 1, 'pt5:Fénix', NOW(), '/', 'PUBLIC');

UPDATE ROOT_DOMAIN_OBJECT AS RDO, CONTENT AS C
SET RDO.KEY_ROOT_PORTAL = C.ID_INTERNAL
WHERE RDO.ID_INTERNAL = C.KEY_PORTAL_ROOT_DOMAIN_OBJECT;

