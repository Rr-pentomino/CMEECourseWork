MyData<-read.csv("/Users/ahmetselimesmer/Documents/MQB-main/content/data/trees.csv")
MyData
head(MyData)
str(MyData)

TreeHeight <- function(degrees, distance) {
  radians <- degrees * pi/180
  height <- distance * tan(radians)
  
  return(height)
}
TreeHeights <-TreeHeight(MyData[ ,3], MyData[ ,2]) 
TreeHeights

NewData <- cbind(MyData, TreeHeights)
NewData

write.csv(NewData, "week3/results/TreeHts.csv" )
