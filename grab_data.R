load('data/ICPSR_35164/DS0002/35164-0002-Data.rda') # da35164.0002
load('data/ICPSR_35164/DS0003/35164-0003-Data.rda') # da35164.0003
##load('data/ICPSR_35164/DS0004/35164-0004-Data.rda') # da35164.0004

q4.02 = da35164.0002[which(da35164.0002$YEARQ == '2013.4'),
    c('IDHH', 'V2026', 'V2071', 'V2072')]
q4.03 = da35164.0003[which(da35164.0003$YEARQ == '2013.4'),
    c('IDHH', 'IDPER', 'V3013', 'V3017', 'V3020', 'V3023A', 'V3034', 'V3036',
      'V3038', 'V3042', 'V3046', 'V3072')]

q3.02 = da35164.0002[which(da35164.0002$YEARQ == '2013.3'),
    c('IDHH', 'V2026', 'V2071', 'V2072')]
q3.03 = da35164.0003[which(da35164.0003$YEARQ == '2013.3'),
    c('IDHH', 'IDPER', 'V3013', 'V3017', 'V3020', 'V3023A', 'V3034', 'V3036',
      'V3038', 'V3042', 'V3046', 'V3072')]

##latest04 = da35164.0004[which(da35164.0004$YEARQ == '2013.4'),
##    c('IDHH', 'IDPER', 'V4066', 'V4067', 'V4068', 'V4069', 'V4070',
##      'V4071', 'V4072', 'V4073', 'V4074', 'V4075')]

##m1 <- merge(latest03, latest04, all.x = TRUE) # We want all responses, even those without crimes in set 04
##od <- merge(latest02, m1) # We only want household data for people we have responses from in sets 03 and 04

q3 <- merge(q3.02, q3.03)
q4 <- merge(q4.02, q4.03)
od <- rbind(q3, q4)
#od <- merge(latest02, latest03)
od$IDHH <- NULL
##od <- unique(od)


####od$IDPER <- as.numeric(od$IDPER)
od$IDPER <- NULL

##rm(da35164.0002, da35164.0003, da35164.0004, latest02, latest03, latest04, m1)
rm(da35164.0002, da35164.0003, q3.02, q3.03, q4.02, q4.03, q3, q4)


od <- od[which(od$V3013 >= 18),]

save.image('our_data01.Rdata')


## duplicates:
## subset(od, IDPER %in% od[which(duplicated(od$IDPER)), 'IDPER'])
