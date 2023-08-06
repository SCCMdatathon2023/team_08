DROP TABLE IF EXISTS `team8-395017.project_data.1-reference`;
CREATE TABLE `team8-395017.project_data.1-reference` AS (
  SELECT 
  icu_id,
  WHO_Region,
  month_of_patient_admission,
  quarter_patient_adm,
  peds_age_months,
  isaric_study_id,
  petal_study_id,
  employed_as_a_healthcare_w,
  hcw_cateogry,
  hcw_other,
  hospital_admission_source,
  admitted_to_icu,
  day_to_icu,
  icu_adm_source,
  icu_adm_source_1,
  age,
  sex,
  gender_identity,
  prgnant,
  calculated_bmi,
  bmi_value,
  weight,
  height,
  race,
  other_race,
  ethnic_group,
  pediatric_yes,
  baseline_code_status
  FROM `sccm-discovery.VIRUS.coredata1_2` 
)

