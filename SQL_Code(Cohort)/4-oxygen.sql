DROP TABLE IF EXISTS `team8-395017.project_data.4-overall_oxygen`;
CREATE TABLE `team8-395017.project_data.4-overall_oxygen` AS
 
 SELECT 
 icu_id,
  CASE WHEN MAX(oxygenation___2) = 1 
  THEN "INV"
  WHEN MAX(oxygenation___2) = 0 and MAX(oxygenation___3) = 1
  THEN "NIV"
  WHEN MAX(oxygenation___2) = 0 and MAX(oxygenation___3) = 0 and MAX(oxygenation___1) = 1
  THEN "HFNC"
  WHEN MAX(oxygenation___2) = 0 and MAX(oxygenation___3) = 0 and MAX(oxygenation___1) = 0 and
  MAX(oxygenation___4) = 1 or MAX(oxygenation___5) = 1 or MAX(oxygenation___6) = 1 or MAX(oxygenation___9) = 1
  THEN "OS"
  ELSE "RA" END AS worst_oxygen,
  FROM `sccm-discovery.VIRUS.coredata4` 
  GROUP BY icu_id
