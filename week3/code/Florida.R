rm(list=ls())

load("../data/KeyWestAnnualMeanTemperature.RData")

ls()

head(ats)
plot(ats)

real.cor <- cor(ats$Year, ats$Temp)

nperm <- 10000

ran.cor <- numeric(nperm)

for (i in 1:nperm) {
  ran.cor[i] <- cor(ats$Year, sample(ats$Temp))
}

hist(ran.cor)

p.val <- sum(ran.cor >= real.cor) / nperm

p.val

plot(ran.cor)
