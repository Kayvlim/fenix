ALTER TABLE ACCOUNTING_TRANSACTION ADD COLUMN OJB_CONCRETE_CLASS varchar(255) NOT NULL;
ALTER TABLE ACCOUNTING_TRANSACTION ADD COLUMN KEY_INSTALLMENT int(11) NULL;


UPDATE ACCOUNTING_TRANSACTION SET OJB_CONCRETE_CLASS = 'net.sourceforge.fenixedu.domain.accounting.AccountingTransaction';
