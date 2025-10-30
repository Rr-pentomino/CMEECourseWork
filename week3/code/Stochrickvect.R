
rm(list = ls())

P0 <- runif(1000, .5, 1.5)

E <- matrix(rnorm(100*1000, 0, 0.2), 100, 1000)

stochrickvect <- function(P0, r=1.2, K=1, numyears=100, E){
  N <- matrix(NA, numyears, length(P0))
  N[1, ] <- P0
for (yr in 2:numyears) {
  
  N[yr, ] <- N[yr-1, ] * exp(r*(1.0-(N[yr-1, ]/K)) + E[yr-1, ])
  
}
  return(N) }

system.time({
  P0 <- runif(1000, .5, 1.5)
  E <- matrix(rnorm(100*1000, 0, 0.2), 100, 1000)
  Output <- stochrickvect(P0, E=E)})

View(Output)


