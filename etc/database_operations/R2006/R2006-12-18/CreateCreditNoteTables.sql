DROP TABLE IF EXISTS CREDIT_NOTE;
CREATE TABLE CREDIT_NOTE (
  ID_INTERNAL int(11) unsigned NOT NULL auto_increment,
  KEY_ROOT_DOMAIN_OBJECT int(11) NOT NULL default 1,
  KEY_RECEIPT int(11) NOT NULL,
  KEY_EMPLOYEE int(11) NOT NULL,  
  WHEN_CREATED datetime NOT NULL,
  WHEN_UPDATED datetime NOT NULL,
  STATE varchar(255) NOT NULL,
  YEAR int(4) NOT NULL,
  NUMBER int(11) NOT NULL,  
  PRIMARY KEY  (ID_INTERNAL),
  KEY (KEY_ROOT_DOMAIN_OBJECT),
  KEY (KEY_EMPLOYEE),
  KEY (KEY_RECEIPT),
  UNIQUE (YEAR, NUMBER)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS CREDIT_NOTE_ENTRY;
CREATE TABLE CREDIT_NOTE_ENTRY (
  ID_INTERNAL int(11) unsigned NOT NULL auto_increment,
  KEY_ROOT_DOMAIN_OBJECT int(11) NOT NULL default 1,
  KEY_CREDIT_NOTE int(11) NOT NULL,
  KEY_ACCOUNTING_ENTRY int(11) NOT NULL,
  KEY_ADJUSTMENT_ACCOUNTING_ENTRY int(11) NULL,
  AMOUNT varchar(255) NOT NULL,
  PRIMARY KEY (ID_INTERNAL),
  KEY (KEY_ROOT_DOMAIN_OBJECT),
  KEY (KEY_CREDIT_NOTE),
  KEY (KEY_ACCOUNTING_ENTRY),
  KEY (KEY_ADJUSTMENT_ACCOUNTING_ENTRY)
) ENGINE=InnoDB;


