select concat('update EXECUTION_DEGREE set EXECUTION_DEGREE.KEY_GRATUITY_VALUES = ',
	GRATUITY_VALUES.ID_INTERNAL, 
	' where EXECUTION_DEGREE.ID_INTERNAL = ', 
	GRATUITY_VALUES.KEY_EXECUTION_DEGREE, ';') 
as "" from GRATUITY_VALUES;
