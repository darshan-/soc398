## levels(od$V2026[1])
## "(1) < 5,000"        "(2) 5,000-7,499"    "(3) 7,500-9,999"
## "(4) 10,000-12,499"  "(5) 12,500-14,999"  "(6) 15,000-17,499"
## "(7) 17,500-19,999"  "(8) 20,000-24,999"  "(9) 25,000-29,999"
## "(10) 30,000-34,999" "(11) 35,000-39,999" "(12) 40,000-49,999"
## "(13) 50,000-74,999" "(14) 75,000 >"      "(98) Residue"

income.levels <- c(0, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 25000,
                   30000, 35000, 40000, 50000, 75000)

## options(max.print = 999999)

## page(od, method = 'print')

load('our_data.Rdata')

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

od$hhincome <- lapply(as.numeric(od$V2026), residueIncomeIsNA)

od$poverty <- apply(od[c('hhincome', 'hhsize')], MARGIN=1, poverty)

### Verify:
## page(od[c('V2026', 'hhsize', 'hhincome', 'poverty')], method = 'print')
### Seems perfect!

od$hhincome <- NULL
od$hhsize <- NULL
od$V2026 <- NULL

rm(residueIncomeIsNA, poverty)

save.image('our_data.Rdata')
