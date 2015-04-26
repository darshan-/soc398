
## Two strongest correlations I found by trying a few I expected to correlate aren't that strong:

## education and age:
## cor(od$V3020, od$V3013, use = 'complete.obs')
##[1] 0.215417

## education and poverty
##> cor(od$V3020, od$poverty, use = 'complete.obs')
##[1] -0.2147437

## We only have 5215 complete cases:
##>length(od[which(complete.cases(od)),]$crime)
##[1] 5215

##> cor(od$crime, od$poverty, use = 'complete.obs')
##[1] 0.092199


load('od.Rdata')


summary(lm(od$crime ~ od$poverty + od$V3020 + od$V3023A + od$V3013 + od$V3017))
summary(lm(od$property ~ od$poverty + od$V3020 + od$V3023A + od$V3013 + od$V3017))
summary(lm(od$violent ~ od$poverty + od$V3020 + od$V3023A + od$V3013 + od$V3017))
