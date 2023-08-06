DROP TABLE IF EXISTS `team8-395017.project_data.2-blood_culture`;
CREATE TABLE `team8-395017.project_data.2-blood_culture` AS (
  SELECT 
  icu_id,
  blood_cultures_positive,
  positive_blood_culture_org
   FROM `sccm-discovery.VIRUS.coredata3` 
);