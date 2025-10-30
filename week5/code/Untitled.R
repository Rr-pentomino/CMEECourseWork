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
