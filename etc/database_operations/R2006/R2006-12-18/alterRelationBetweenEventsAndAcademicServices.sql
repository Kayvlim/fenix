ALTER TABLE ACADEMIC_SERVICE_REQUEST DROP COLUMN CREATION_DATE;

ALTER TABLE ACADEMIC_SERVICE_REQUEST CHANGE COLUMN KEY_CERTIFICATE_REQUEST_EVENT KEY_EVENT int(11) default NULL;
ALTER TABLE ACCOUNTING_EVENT CHANGE COLUMN KEY_CERTIFICATE_REQUEST KEY_ACADEMIC_SERVICE_REQUEST int(11) default NULL;
