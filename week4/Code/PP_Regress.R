rm(list = ls())
require(ggplot2)
require(dplyr)

MyDF<- read.csv("../data/EcolArchives-E089-51-D1.csv")

#covert mg to g
MyDF$Prey.mass[MyDF$Prey.mass.unit == "mg"] <- MyDF$Prey.mass[MyDF$Prey.mass.unit == "mg"] / 1000
MyDF$Prey.mass.unit[MyDF$Prey.mass.unit == "mg"] <- "g"


ggplot(MyDF, aes(
  x = Prey.mass,
  y = Predator.mass,
  colour = Predator.lifestage
)) +
  geom_point(shape = 3, alpha = 0.6) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    fullrange = TRUE,
    na.rm = TRUE
  ) +
  facet_grid(Type.of.feeding.interaction ~ .) +
  scale_x_log10("Prey mass in grams") +
  scale_y_log10("Predator mass in grams") +
  theme_bw() +
  theme(
    legend.position = "bottom",                         # 🔹 Legend alta
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9),
    strip.text.y = element_text(angle = 90, size = 8),   # 🔹 Facet yazılarını küçült
    axis.title = element_text(size = 11, face = "bold"),
    axis.text = element_text(size = 9)
  )

ggsave("../Results/Pred_vs_Prey_Faceted.pdf", width = 6, height = 10)



### Results as .csv

RegResults <- MyDF %>%
  group_by(Type.of.feeding.interaction, Predator.lifestage) %>%
  summarise(
    Slope = {
      if (n() > 2) coef(lm(log10(Predator.mass) ~ log10(Prey.mass)))[2] else NA
    },
    Intercept = {
      if (n() > 2) coef(lm(log10(Predator.mass) ~ log10(Prey.mass)))[1] else NA
    },
    R2 = {
      if (n() > 2) summary(lm(log10(Predator.mass) ~ log10(Prey.mass)))$r.squared else NA
    },
    Fstat = {
      if (n() > 2) summary(lm(log10(Predator.mass) ~ log10(Prey.mass)))$fstatistic[1] else NA
    },
    p_value = {
      if (n() > 2) pf(
        summary(lm(log10(Predator.mass) ~ log10(Prey.mass)))$fstatistic[1],
        summary(lm(log10(Predator.mass) ~ log10(Prey.mass)))$fstatistic[2],
        summary(lm(log10(Predator.mass) ~ log10(Prey.mass)))$fstatistic[3],
        lower.tail = FALSE
      ) else NA
    },
    .groups = "drop"
  )

write.csv(RegResults, "../Results/PP_Regress_Results.csv", row.names = FALSE)


