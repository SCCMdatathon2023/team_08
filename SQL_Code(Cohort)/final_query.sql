DROP TABLE IF EXISTS `team8-395017.project_data.final_table`;
CREATE TABLE `team8-395017.project_data.final_table` AS (
  SELECT t1.*,
  t2.*EXCEPT(icu_id),
  t3.*EXCEPT(icu_id)
   FROM `team8-395017.project_data.1-reference` t1
   LEFT JOIN `team8-395017.project_data.2-blood_culture` t2
   ON t1.icu_id = t2.icu_id
   LEFT JOIN `team8-395017.project_data.6-outcomes_and_severity_level` t3
   ON t1.icu_id = t3.icu_id
   WHERE 
)