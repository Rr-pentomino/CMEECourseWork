rm(list = ls())

d <- read.table("../data/SparrowSize.txt", header = TRUE)

hist(d$Tarsus)

mean(d$Tarsus, na.rm = T)
median(d$Tarsus, na.rm = T)
mode(d$Tarsus)

par(mfrow = c(2, 2))
?par

hist(d$Tarsus, breaks = 3, col = "blue")
hist(d$Tarsus, breaks = 10, col = "red")
hist(d$Tarsus, breaks = 30, col = "lightblue")
hist(d$Tarsus, breaks = 100, col = "darkblue")

