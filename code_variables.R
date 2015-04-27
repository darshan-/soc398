## levels(od$V2026[1])
## "(1) < 5,000"        "(2) 5,000-7,499"    "(3) 7,500-9,999"
## "(4) 10,000-12,499"  "(5) 12,500-14,999"  "(6) 15,000-17,499"
## "(7) 17,500-19,999"  "(8) 20,000-24,999"  "(9) 25,000-29,999"
## "(10) 30,000-34,999" "(11) 35,000-39,999" "(12) 40,000-49,999"
## "(13) 50,000-74,999" "(14) 75,000 >"      "(98) Residue"

income.levels <- c(0, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 25000,
                   30000, 35000, 40000, 50000, 75000)

options(max.print = 999999)

pageit <- function() {
    page(od, method = 'print')
}

load('our_data01.Rdata')

od$hhsize <- od$V2071 + od$V2072
od$V2071 <- NULL
od$V2072 <- NULL

residueIncomeIsNA <- function (i) {
    if (i == 15)
        NA
    else
        i
}

poverty <- function(row) {
    income.levels[row$hhincome] < 11490 + (row$hhsize - 1) * 4020 || FALSE
}

property <- function(row) {
    row$V3034 == 1 || row$V3036 == 1 || row$V3038 == 1
}

violent <- function(row) {
    row$V3042 == 1 || row$V3046 == 1
}

crime <- function(row) {
    row$property || row$violent
}

od$hhincome <- lapply(as.numeric(od$V2026), residueIncomeIsNA)

od$poverty <- apply(od[c('hhincome', 'hhsize')], MARGIN=1, poverty)
od$property <- apply(od, MARGIN=1, property)
od$violent <- apply(od, MARGIN=1, violent)
od$crime <- apply(od, MARGIN=1, crime)

od$hhincome <- NULL
od$hhsize <- NULL
od$V2026 <- NULL

rm(residueIncomeIsNA, poverty)

od$sex <- od$V3017
od$V3017 <- NULL
od$age <- od$V3013
od$V3013 <- NULL

edLevel <- function(e) {
    if (e < 13 || e == 27)  # Consider 12 and 27 ("12th grade (no diploma)") as not finished high school
        'lths'
    else if (e < 42)
        'hs'
    else if (e < 43)
        'bd'
    else if (e <=45)
        'gd'
    else # 98 (Residual)
        NA
}

raceLevel <- function(r) {
    if (r == 1)
        'white'
    else if (r == 2)
        'black'
    else if (r == 3)
        'native'
    else if (r == 4)
        'asian'
    else
        'other'
}

od$education <- unlist(lapply(od$V3020, edLevel))
od$education <- factor(od$education)
od <- within(od, education <- relevel(education, ref = 'hs'))

od$race <- unlist(lapply(od$V3023A, raceLevel))
od$race <- factor(od$race)
od <- within(od, race <- relevel(race, ref = 'white'))

save.image('od.Rdata')
