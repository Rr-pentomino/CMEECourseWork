d <- read.table("../data/SparrowSize.txt", header = T)
str(d)
head(d)
summary(d)
table(d$Year)
table(d$BirdID)
table(table(d$BirdID))
require(dplyr)
library(ggplot2)
library(ggExtra)

birdIDcount <- d %>% count(BirdID,BirdID, sort = T)
birdIDcount %>% count(n)



PBPY <- d %>% count(BirdID,Year, sort = T)
class(PBPY)
head(PBPY)

summary_table <- PBPY %>%
  group_by(Year) %>%
  summarise(
    mean_sightings = mean(n),
    total_sightings = sum(n),
    birds_observed = n()
  )
View(summary_table)

ggplot(PBPY, aes(x = Year, y = n)) +
  geom_jitter(width = 0.2, height = 0, alpha = 0.6, color = "dodgerblue") +
  labs(
    x = "Year",
    y = "Number of Sightings (n)",
    title = "Each Bird's Sightings per Year"
  ) +
  theme_minimal()


p <- ggplot(PBPY, aes(x = Year, y = n)) +
  geom_jitter(width = 0.2, alpha = 0.6, color = "dodgerblue") +
  labs(
    title = "Bird Sightings per Year",
    x = "Year",
    y = "Number of Sightings (n)"
  ) +
  theme_minimal()

ggMarginal(p, type = "boxplot", fill = "grey70")




###############

YS <- as.data.frame(d %>% count(Year, Sex.1, sort = F))
YS
YS_table <- table(d$Year,d$Sex.1)
YS_table




ggplot(YS, aes(x = Year, y = n, fill = Sex.1)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(y = "Number of birds", title = "Male vs Female per Year") +
  theme_minimal()

##########

hist(d$BirdID, probability=TRUE, col="lightblue",
     main="Gaussian (Normal) Distribution", xlab="Value")
lines(density(d$BirdID), col="darkblue", lwd=2)

# Gaussian (Normal) Distribution
x <- seq(-4, 4, length=200)
plot(x, dnorm(x, mean=0, sd=1), type="l", lwd=2, col="blue",
     main="Gaussian (Normal) Density", ylab="Density", xlab="x")
# Probability example:
pnorm(1.96, mean=0, sd=1)  # cumulative probability

# Poisson Distribution
x <- 0:20
plot(x, dpois(x, lambda=5), type="h", lwd=2, col="red",
     main="Poisson Probability Distribution", ylab="Probability", xlab="x")
# Probability example:
ppois(5, lambda=5)

# Binomial Distribution
x <- 0:20
plot(x, dbinom(x, size=20, prob=0.5), type="h", lwd=2, col="purple",
     main="Binomial Probability Distribution", ylab="Probability", xlab="x")
# Probability example:
pbinom(10, size=20, prob=0.5)

# Random Uniform Distribution
x <- runif(10000, min=0, max=1)
hist(x, probability=TRUE, col="lightgreen", border="white",
     main="Uniform Random Distribution", xlab="x")
lines(density(x), col="darkgreen", lwd=2)

#####

d1 <- subset(d, !is.na(d$Tarsus))
d1
seTarsus <- sqrt(var(d1$Tarsus)/length(d1$Tarsus))
seTarsus

#######
TailLength <- rnorm(500, mean = 3.8, sd=2)
summary(TailLength)
length(TailLength)
var(TailLength)
sd(TailLength)
hist(TailLength)



rm(list=ls())
TailLength<-rnorm(201,mean=3.8, sd=2)
length(TailLength)
## [1] 201
x<-1:201
y<-mean(TailLength)+0*x
plot(x,y, cex=0.03, ylim=c(3,4.5),xlim=c(0,201), xlab="Sample size n", ylab="
Mean of tail length ±SE (m)", col="red")
n<-seq(from=1, to=201, by=10)
n

SE<-c(1)
mu<-c(1)
for (i in 1:length(n)) {d<-sample(TailLength, n[i], replace=FALSE)
mu[i]<-mean(TailLength)
SE[i]<-sd(TailLength)/sqrt(n[i])
}
up<-mu+SE
down<-mu-SE
length(up)
## [1] 21
length(n)
## [1] 21
plot(x,y, cex=0.03, ylim=c(3,4.5),xlim=c(0,201), xlab="Sample size n", ylab="
Mean of tail length ±SE (m)", col="red")
points(n,mu,cex=0.3, col="red")
segments(n, up, x1=n, y1=down, lty=1)


seTar <- sd(d$Tarsus, na.rm = TRUE)/sqrt(sum(!is.na(d$Tarsus)))
seTar
seWing <- sd(d$Wing, na.rm = TRUE)/sqrt(sum(!is.na(d$Wing)))
seWing
seBill <- sd(d$Bill, na.rm = TRUE)/sqrt(sum(!is.na(d$Bill)))
seBill
seMass <- sd(d$Mass, na.rm = TRUE)/sqrt(sum(!is.na(d$Mass)))
seMass


d1<-subset(d, d$Year==2001)

seTar1 <- sd(d1$Tarsus, na.rm = TRUE)/sqrt(sum(!is.na(d1$Tarsus)))
seTar1
seWing1 <- sd(d1$Wing, na.rm = TRUE)/sqrt(sum(!is.na(d1$Wing)))
seWing1
seBill1 <- sd(d1$Bill, na.rm = TRUE)/sqrt(sum(!is.na(d1$Bill)))
seBill1
seMass1 <- sd(d1$Mass, na.rm = TRUE)/sqrt(sum(!is.na(d1$Mass)))
seMass1

#######
t_crit <- qt(0.975, df = sum(!is.na(d$Tarsus)) - 1)
mean_Tar <- mean(d$Tarsus, na.rm = TRUE)
CI_Tar <- c(mean_Tar - t_crit * seTar, mean_Tar + t_crit * seTar)
CI_Tar


t_crit <- qt(0.975, df = sum(!is.na(d1$Tarsus)) - 1)
mean_Tar <- mean(d1$Tarsus, na.rm = TRUE)
CI_Tar1 <- c(mean_Tar - t_crit * seTar, mean_Tar + t_crit * seTar)
CI_Tar1
