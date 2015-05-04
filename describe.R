## cor(od$crime, od$poverty, use = 'complete.obs')

load('od.Rdata')

##options('scipen'=2)

od <- od[which(!is.na(od$crime)),]

mean(od$age)
sd(od$age)

mean(od$hhsize)
sd(od$hhsize)

print(nTotal <- length(od$sex))

print(nMales <- length(od[which(od$sex == 1), ]$sex))
print(nFemales <- length(od[which(od$sex == 2), ]$sex))

nMales / nTotal
nFemales / nTotal

print(nWhite <- length(od[which(od$race == 'white'), ]$race))
print(nBlack <- length(od[which(od$race == 'black'), ]$race))
print(nNative <- length(od[which(od$race == 'native'), ]$race))
print(nAsian <- length(od[which(od$race == 'asian'), ]$race))
print(nOther <- length(od[which(od$race == 'other'), ]$race))

nWhite / nTotal
nBlack / nTotal
nNative / nTotal
nAsian / nTotal
nOther / nTotal

print(nLTHS <- length(od[which(od$education == 'lths'), ]$education))
print(nHS <- length(od[which(od$education == 'hs'), ]$education))
print(nBD <- length(od[which(od$education == 'bd'), ]$education))
print(nGD <- length(od[which(od$education == 'gd'), ]$education))

nLTHS / nTotal
nHS / nTotal
nBD / nTotal
nGD / nTotal

print(nPoverty <- length(od[which(od$poverty == TRUE), ]$poverty))
nPoverty <- length(od[which(od$poverty == FALSE), ]$poverty)

nPoverty / nTotal

print(nCrime <- length(od[which(od$crime == TRUE), ]$crime))
length(od[which(od$crime == FALSE), ]$crime)

nCrime / nTotal

poverty <- od[which(od$poverty == TRUE), ]
crime <- od[which(od$crime == TRUE), ]

print(nPoverty <- length(poverty$poverty))
print(nCrime <- length(crime$crime))

print(nPovertyAndCrime <- length(poverty[which(poverty$crime == TRUE), ]$crime))
print(nPovertyAndNotCrime <- nPoverty - nPovertyAndCrime)
print(nCrimeAndNotPoverty <- length(crime[which(crime$poverty == FALSE), ]$crime))

print(nNotPovertyAndNotCrime <- nTotal - nPoverty - nCrime + nPovertyAndCrime)
