######### Functions ##########

myexperiment <- function(popn,n) {
    pop_sample <- sample(popn, n, replace = FALSE)
    return(mean(pop_sample))
}

loopy_sample1 <- function(popn, n, num) {
    result1 <- vector()  
    for(i in 1:num) {
        result1 <- c(result1, myexperiment(popn, n))
    }
    return(result1)
}

loopy_sample2 <- function(popn, n, num) {
    result2 <- vector(,num) 
    for(i in 1:num) {
        result2[i] <- myexperiment(popn, n)
    }
    return(result2)
}

loopy_sample3 <- function(popn, n, num) {
    result3 <- vector("list", num) 
    for(i in 1:num) {
        result3[[i]] <- myexperiment(popn, n)
    }
    return(result3)
}


lapply_sample <- function(popn, n, num) {
    result4 <- lapply(1:num, function(i) myexperiment(popn, n))
    return(result4)
}

sapply_sample <- function(popn, n, num) {
    result5 <- sapply(1:num, function(i) myexperiment(popn, n))
    return(result5)
}

set.seed(12345)
popn <- rnorm(10000) 


n <- 100 
num <- 10000 

print("Using loops without preallocation on a vector took:" )
print(system.time(loopy_sample1(popn, n, num)))

print("Using loops with preallocation on a vector took:" )
print(system.time(loopy_sample2(popn, n, num)))

print("Using loops with preallocation on a list took:" )
print(system.time(loopy_sample3(popn, n, num)))

print("Using the vectorized sapply function (on a list) took:" )
print(system.time(sapply_sample(popn, n, num)))

print("Using the vectorized lapply function (on a list) took:" )
print(system.time(lapply_sample(popn, n, num)))
