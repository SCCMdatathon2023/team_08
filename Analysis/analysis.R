

library(data.table)
library(tidyr)
library(tidyverse)
library(readxl)
library(gdata)
library(lubridate)
library(comorbidity)
library(table1)
library(bigrquery)
library(tidyr)
library(DBI)
library(dbplyr)
library(dplyr)

'%!in%' <- function(x,y)!('%in%'(x,y))

#### Connect to BigQuery#####
#bq_auth(use_oob = TRUE)

projectid = "team8-395017"#replace with your own project id
bigrquery::bq_auth()#login with google account associated with physionet account

sql <- "
SELECT * FROM
`team8-395017.project_data.final_table`
WHERE age > 18 AND isaric_study_id IS NULL AND prgnant != 1.0 or prgnant is null
"

bq_data <- bq_project_query(projectid, query = sql)

df = bq_table_download(bq_data)

df$race = as.factor(df$race)
df$sex = as.factor(df$sex)
df$mort_28_days = as.factor(df$mort_28_days)
levels(df$race) <- c("american indian alaska native","asian american","black or african american","native hawaiian or other pacific islander","white caucasian","other","east asian","south asian","west asian","southeast asian","mixed race", "unknown","null")
df$race <- relevel(df$race, ref = "white caucasian")

df_imv = df%>%filter(Overall_IMV == 1)
df_imv_outcome = df_imv%>%filter(mort_28_days%in%c(0,1))
#sum(is.null(df_imv$sofa_renal))



fit1 <- glm(data = df_imv, Overall_prone~race+sofa_cardiovascular+sofa_coagulation+sofa_gcs+
            sofa_liver+sofa_renal+sofa_respiration,family = "binomial")
summary(fit1)

fit2 <- glm(data = df_imv_outcome, Overall_prone~race+sofa_cardiovascular+sofa_coagulation+sofa_gcs+
            sofa_liver+sofa_renal+sofa_respiration,family = "binomial")
summary(fit2)

fit3 <- glm(data = df_imv_outcome, mort_28_days~sofa_cardiovascular+sofa_coagulation+sofa_gcs+
              sofa_liver+sofa_renal+sofa_respiration+Overall_prone,family = "binomial")
summary(fit3)


table1(~ age + sex + race + WHO_Region + mort_28_days | Overall_prone, data=df_imv)
table1(~ bmi_value+sofa_cardiovascular+sofa_coagulation+sofa_gcs+sofa_liver+sofa_renal+sofa_respiration| Overall_prone, data=df_imv)
