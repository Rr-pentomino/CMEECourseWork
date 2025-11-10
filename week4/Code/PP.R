#--- Set working directory ---
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#--- Import data ---
MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")
dim(MyDF) #check the size of the data frame you loaded
str(MyDF)
head(MyDF)
require(tidyverse)
glimpse(MyDF)

MyDF$Type.of.feeding.interaction <- as.factor(MyDF$Type.of.feeding.interaction)
MyDF$Location <- as.factor(MyDF$Location)
str(MyDF)
unique(MyDF$Prey.mass.unit)

#covert mg to g
MyDF$Prey.mass[MyDF$Prey.mass.unit == "mg"] <- MyDF$Prey.mass[MyDF$Prey.mass.unit == "mg"] / 1000
MyDF$Prey.mass.unit[MyDF$Prey.mass.unit == "mg"] <- "g"

plot(MyDF$Predator.mass,MyDF$Prey.mass)

plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass))

plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass),pch=20, xlab = "Predator mass (g)", ylab = "Prey mass (g)")

par(mfcol=c(2,1))
par(mfg=c(1,1))
hist(log10(MyDF$Predator.mass), xlab = "log10(predator mass(g))", ylab = "count",
     col= "darkred",
     border = "yellow")

par(mfg=c(2,1))
hist(log10(MyDF$Prey.mass), xlab = "log10(prey mass(g))", ylab = "count",
     col= "red", border = 
       "yellow")


breaks <- seq(
  floor(min(log10(MyDF$Predator.mass), log10(MyDF$Prey.mass), na.rm = TRUE)),
  ceiling(max(log10(MyDF$Predator.mass), log10(MyDF$Prey.mass), na.rm = TRUE)),
  by = 0.2   # adjust bin width
)

hist(log10(MyDF$Predator.mass), breaks = breaks, # Predator histogram
     xlab="log10(Body Mass (g))", ylab="Count", 
     col = rgb(1, 0, 0, 0.5), # Note 'rgb', fourth value is transparency
     main = "Predator-prey size Overlap") 
hist(log10(MyDF$Prey.mass), breaks = breaks, col = rgb(0, 0, 1, 0.5), add = T) # Plot prey
legend('topleft',c('Predators','Prey'),   # Add legend
       fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) # Define legend colors


boxplot(log10(MyDF$Predator.mass)~MyDF$Location, xlab="Location", ylab="log10(predator mass(g))", main="predator mass")

boxplot(log(MyDF$Predator.mass)~MyDF$Type.of.feeding.interaction, xlab="Location", ylab="predator mass(g)", main="Predator mass by feeding interaction type")

par(fig=c(0,0.8,0,0.8)) # specify figure size as proportion
plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass), xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels
par(fig=c(0.3,0.8,0.6,1), new=TRUE)
boxplot(log(MyDF$Predator.mass), horizontal=TRUE, axes=FALSE)
par(fig=c(0.55,1,0,0.8),new=TRUE)
boxplot(log(MyDF$Prey.mass), axes=FALSE)
mtext("Fancy Predator-prey scatterplot", side=3, outer=TRUE, line=-3)


pdf("../results/Pred_Prey_Overlay.pdf", # Open blank pdf page using a relative path
    11.7, 8.3) # These numbers are page dimensions in inches
hist(log(MyDF$Predator.mass), # Plot predator histogram (note 'rgb')
     xlab="Body Mass (g)", ylab="Count", col = rgb(1, 0, 0, 0.5), main = "Predator-Prey Size Overlap") 
hist(log(MyDF$Prey.mass), # Plot prey weights
     col = rgb(0, 0, 1, 0.5), 
     add = T)  # Add to same plot = TRUE
legend('topleft',c('Predators','Prey'), # Add legend
       fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) 
graphics.off(); #you can also use dev.off() 

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, colour= Type.of.feeding.interaction, asp = 1, alpha=I(.5), geom = c("point", "smooth"))

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth")) + geom_smooth(method = "lm")

qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data = MyDF, geom = "boxplot")

qplot(log(Prey.mass/Predator.mass), data = MyDF, geom =  "density", 
      colour = Type.of.feeding.interaction, alpha = I(0.5))

qplot(log(Prey.mass/Predator.mass), facets = Type.of.feeding.interaction ~., data = MyDF, geom =  "density")
qplot(log(Prey.mass/Predator.mass), facets =  .~ Type.of.feeding.interaction, data = MyDF, geom =  "density")
