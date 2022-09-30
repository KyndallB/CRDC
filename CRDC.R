students <- read.csv("~/Downloads/Enrollment.csv")
> students[students == -9] <- 9
> students[students == -6] <- 6
> students[students == -5] <- 5
> white <- c(students$SCH_ENR_WH_M + students$SCH_ENR_WH_F)
> black <- c(students$SCH_ENR_B_M + students$SCH_ENR_BL_F)
> black <- c(students$SCH_ENR_BL_M + students$SCH_ENR_BL_F)
> pacific <- c(students$SCH_ENR_HP_M + students$SCH_ENR_HP_F)
> asian <- c(students$SCH_ENR_AS_M + students$SCH_ENR_ASL_F)
> native <- c(students$SCH_ENR_AM_M + students$SCH_ENR_AM_F)
> hispanic <- c(students$SCH_ENR_HI_M + students$SCH_ENR_HI_F)
> asian <- c(students$SCH_ENR_AS_M + students$SCH_ENR_AS_F)
> females <- c(students$SCH_ENR_AS_F + students$SCH_ENR_HI_F + students$SCH_ENR_AM_F + students$SCH_ENR_HP_F + students$SCH_ENR_BL_F + students$SCH_ENR_WH_F)
> males <- c(students$SCH_ENR_AS_M + students$SCH_ENR_HI_M + students$SCH_ENR_AM_M + students$SCH_ENR_HP_M + students$SCH_ENR_BL_M + students$SCH_ENR_WH_M)
> race <- c(white + black + pacific + asian + native + hispanic)
> gender <- c(females +males)
> enrollment <- c(students$TOT_ENR_M + students$TOT_ENR_F)
> model <- aov(enrollment ~ gender * students$LEA_STATE)
> summary(model)
                             Df    Sum Sq   Mean Sq   F value Pr(>F)    
gender                        1 1.952e+10 1.952e+10 4.452e+07 <2e-16 ***
students$LEA_STATE           51 6.563e+06 1.287e+05 2.935e+02 <2e-16 ***
gender:students$LEA_STATE    51 3.712e+06 7.278e+04 1.660e+02 <2e-16 ***
Residuals                 97528 4.276e+07 4.380e+02                     
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

model <- aov(students$TOT_ENR_M ~ students$JJ * students$LEA_STATE)