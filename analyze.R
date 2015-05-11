## cor(od$crime, od$poverty, use = 'complete.obs')

load('od.Rdata')

options('scipen'=2)

# Just DV and IV
crime <- glm(od$crime ~ od$poverty, family = binomial(logit))
property <- glm(od$property ~ od$poverty, family = binomial(logit))
violent <- glm(od$violent ~ od$poverty, family = binomial(logit))

summary(crime)
summary(property)
summary(violent)

exp(coef(crime))
exp(coef(property))
exp(coef(violent))

logLik(crime)
logLik(property)
logLik(violent)

# DV, IV, and controls
crime <- glm(od$crime ~ od$poverty + od$education + od$race + od$age + od$sex, family = binomial(logit)) 
property <- glm(od$property ~ od$poverty + od$education + od$race + od$age + od$sex, family = binomial(logit))
violent <- glm(od$violent ~ od$poverty + od$education + od$race + od$age + od$sex, family = binomial(logit))

summary(crime)
summary(property)
summary(violent)

exp(coef(crime))
exp(coef(property))
exp(coef(violent))

logLik(crime)
logLik(property)
logLik(violent)
