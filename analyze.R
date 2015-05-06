## cor(od$crime, od$poverty, use = 'complete.obs')

load('od.Rdata')

options('scipen'=2)

#summary(lm(od$crime ~ od$poverty + od$education + od$race + od$age + od$sex))
#summary(lm(od$property ~ od$poverty + od$education + od$race + od$age + od$sex))
#summary(lm(od$violent ~ od$poverty + od$education + od$race + od$age + od$sex))

summary(glm(od$crime ~ od$poverty + od$education + od$race + od$age + od$sex, family = binomial(logit)))
summary(glm(od$property ~ od$poverty + od$education + od$race + od$age + od$sex, family = binomial(logit)))
summary(glm(od$violent ~ od$poverty + od$education + od$race + od$age + od$sex, family = binomial(logit)))
