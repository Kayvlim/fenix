alter table `RESOURCE` drop OID_CURRENT_ATTENDANCE;
alter table `SPACE_ATTENDANCES` add index (OID_OCCUPIED_LIBRARY_PLACE);
