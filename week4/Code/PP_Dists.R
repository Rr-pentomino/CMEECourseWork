rm(list = ls())
require(ggplot2)
require(dplyr)

MyDF<- read.csv("../data/EcolArchives-E089-51-D1.csv")

#covert mg to g
MyDF$Prey.mass[MyDF$Prey.mass.unit == "mg"] <- MyDF$Prey.mass[MyDF$Prey.mass.unit == "mg"] / 1000
MyDF$Prey.mass.unit[MyDF$Prey.mass.unit == "mg"] <- "g"

# Create log-transformed columns
MyDF <- MyDF %>%
  mutate(
    log.Predator.mass = log10(Predator.mass),
    log.Prey.mass = log10(Prey.mass),
    log.SizeRatio = log10(Prey.mass / Predator.mass)
  )

# Get feeding interaction types 
feeding_types <- unique(MyDF$Type.of.feeding.interaction)
n_types <- length(feeding_types)

#  Define a function to create subplot PDFs
make_subplots <- function(data, variable, filename, xlabel) {
  pdf(file = paste0("../Results/", filename))
  par(mfrow = c(2, ceiling(n_types / 2)), mar = c(4, 4, 2, 1))
  
  data %>%
    group_by(Type.of.feeding.interaction) %>%
    do({
      x <- .[[variable]]  # extract variable correctly
      hist(
        x,
        main = unique(.$Type.of.feeding.interaction),
        xlab = xlabel,
        ylab = "Count",
        col = "lightblue",
        border = "white"
      )
      data.frame()  # placeholder return for do()
    })
  
  dev.off()
}

#  Predator mass subplot 
make_subplots(MyDF, "log.Predator.mass", "Pred_Subplots.pdf", "log10(Predator mass (g))")

#  Prey mass subplot 
make_subplots(MyDF, "log.Prey.mass", "Prey_Subplots.pdf", "log10(Prey mass (g))")

#  Size ratio subplot 
make_subplots(MyDF, "log.SizeRatio", "SizeRatio_Subplots.pdf", "log10(Prey/Predator mass ratio)")

# Calculate (log) means and medians by feeding type 
results <- MyDF %>%
  group_by(Type.of.feeding.interaction) %>%
  summarise(
    MeanPred = mean(log.Predator.mass, na.rm = TRUE),
    MedianPred = median(log.Predator.mass, na.rm = TRUE),
    MeanPrey = mean(log.Prey.mass, na.rm = TRUE),
    MedianPrey = median(log.Prey.mass, na.rm = TRUE),
    MeanRatio = mean(log.SizeRatio, na.rm = TRUE),
    MedianRatio = median(log.SizeRatio, na.rm = TRUE)
  )

# Save results as CSV 
write.csv(results, "../Results/PP_Results.csv", row.names = FALSE)

cat("✅ PP_Dists.R complete! 3 PDFs and 1 CSV saved in ../Results/\n")


