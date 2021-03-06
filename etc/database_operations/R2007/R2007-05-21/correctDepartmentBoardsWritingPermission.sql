UPDATE ANNOUNCEMENT_BOARD AB, PARTY P, SITE S
SET 
  AB.UNIT_PERMITTED_WRITE_GROUP_TYPE = 'UB_UNITSITE_MANAGERS', 
  AB.WRITERS = concat("role('MANAGER') || unitSiteManagers($I(", S.ID_INTERNAL, ", 'DepartmentSite'))")
WHERE AB.UNIT_PERMITTED_WRITE_GROUP_TYPE = 'UB_DEPARTMENT_EMPLOYEES'
  AND AB.KEY_PARTY = P.ID_INTERNAL 
  AND S.KEY_UNIT = P.ID_INTERNAL;
