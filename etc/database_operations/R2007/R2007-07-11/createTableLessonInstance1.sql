CREATE TABLE LESSON_INSTANCE (
	ID_INTERNAL int(11) unsigned NOT NULL auto_increment,
	BEGIN_DATE_TIME timestamp NOT NULL default '0000-00-00 00:00:00',
	END_DATE_TIME timestamp NOT NULL default '0000-00-00 00:00:00',
	KEY_LESSON int(11) unsigned NOT NULL,
	KEY_SUMMARY int(11) unsigned default NULL,
	KEY_LESSON_INSTANCE_SPACE_OCCUPATION int(11) unsigned default NULL,
	KEY_ROOT_DOMAIN_OBJECT int(11) NOT NULL default '1',
	PRIMARY KEY  (ID_INTERNAL),
	KEY KEY_ROOT_DOMAIN_OBJECT (KEY_ROOT_DOMAIN_OBJECT),
	KEY KEY_LESSON (KEY_LESSON),	
	KEY KEY_SUMMARY (KEY_SUMMARY),
	KEY KEY_LESSON_INSTANCE_SPACE_OCCUPATION (KEY_LESSON_INSTANCE_SPACE_OCCUPATION)
)ENGINE=InnoDB;


alter table RESOURCE_ALLOCATION add column KEY_LESSON_INSTANCE int(11) unsigned default NULL;
alter table RESOURCE_ALLOCATION add key KEY_LESSON_INSTANCE (KEY_LESSON_INSTANCE);

alter table SUMMARY add column KEY_LESSON_INSTANCE int(11) unsigned default NULL;
alter table SUMMARY add key KEY_LESSON_INSTANCE (KEY_LESSON_INSTANCE);

alter table GENERIC_EVENT add column START_TIME_DATE_HOUR_MINUTE_SECOND time NOT NULL;
alter table GENERIC_EVENT add column END_TIME_DATE_HOUR_MINUTE_SECOND time NOT NULL;
alter table GENERIC_EVENT add column BEGIN_DATE varchar(10) NOT NULL;
alter table GENERIC_EVENT add column END_DATE varchar(10) NOT NULL;
alter table GENERIC_EVENT add column DAILY_FREQUENCY_MARK_SUNDAY tinyint(1) default '1';
alter table GENERIC_EVENT add column DAILY_FREQUENCY_MARK_SATURDAY tinyint(1) default '1';


alter table LESSON add column KEY_PERIOD int(11) default NULL;
alter table LESSON add key KEY_PERIOD (KEY_PERIOD); 

alter table LESSON change column FREQUENCY FREQUENCY2 int(11) default NULL;
alter table LESSON add column FREQUENCY varchar(100) default '';

update LESSON set FREQUENCY = 'DAILY' where FREQUENCY2 = 1;
update LESSON set FREQUENCY = 'WEEKLY' where FREQUENCY2 = 2;
update LESSON set FREQUENCY = 'BIWEEKLY' where FREQUENCY2 = 3;

alter table LESSON drop column FREQUENCY2;

insert into LESSON_INSTANCE (BEGIN_DATE_TIME, END_DATE_TIME, KEY_LESSON, KEY_SUMMARY) select CONCAT(SUMMARY.SUMMARY_DATE_YEAR_MONTH_DAY , ' ' , LESSON.BEGIN_HOUR_MINUTE_SECOND), CONCAT(SUMMARY.SUMMARY_DATE_YEAR_MONTH_DAY , ' ' , LESSON.END_HOUR_MINUTE_SECOND), LESSON.ID_INTERNAL, SUMMARY.ID_INTERNAL from SUMMARY inner join LESSON on SUMMARY.KEY_LESSON = LESSON.ID_INTERNAL; 
