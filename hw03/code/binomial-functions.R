#' @title is_integer()
#' @description this tests if a numeric value can be considered to be an integer number 
#' @return a value of TRUE of FALSE

is_integer <- function(value){
  if(value %% 1 == 0)
    return(TRUE)
  else
    return(FALSE)
}
is_integer(-1)
is_integer(0)
is_integer(2L)
is_integer(2)
is_integer(2.1)
is_integer(pi)
is_integer(0.01)


#' @title is_positive()
#' @description this tests if a numeric value is positive 
#' @return a value of TRUE of FALSE

is_positive <- function(value){
  if(value > 0)
    return(TRUE)
  else
    return(FALSE)
}
is_positive(0.01)
is_positive(2)
is_positive(-2)
is_positive(0)


#' @title is_nonnegative()
#' @description this tests if a numeric value is not negative 
#' @return a value of TRUE of FALSE

is_nonnegative <- function(value){
  if(value >= 0)
    return(TRUE)
  else
    return(FALSE)
}
is_nonnegative(0)
is_nonnegative(2)
is_nonnegative(-0.00001)
is_nonnegative(-2)


#' @title is_positive_integer()
#' @description this tests if a numeric value is both positive and an integer 
#' @return a value of TRUE of FALSE

is_positive_integer <- function(value){
  if((is_integer(value) == TRUE) && (is_positive(value) == TRUE))
    return(TRUE)
  else
    return(FALSE)
}
is_positive_integer(2)
is_positive_integer(2L)
is_positive_integer(0)
is_positive_integer(-2)


#' @title is_nonneg_integer()
#' @description this tests if a numeric value is both nonnegative and an integer 
#' @return a value of TRUE of FALSE

is_nonneg_integer <- function(value){
  if((is_integer(value) == TRUE) && (is_nonnegative(value) == TRUE))
    return(TRUE)
  else
    return(FALSE)
}
is_nonneg_integer(0)
is_nonneg_integer(1)
is_nonneg_integer(-1)
is_nonneg_integer(-2.5)


#' @title is_probability()
#' @description this tests if an input is a valid probability value 
#' @return a value of TRUE of FALSE

is_probability <- function(value){
  if((value >= 0) && (value <= 1))
    return(TRUE)
  else
    return(FALSE)
}
is_probability(0)
is_probability(0.5)
is_probability(1)
is_probability(-1)
is_probability(1.0000001)


#' @title bin_factorial()
#' @description calculates the factorial of a non-negative integer n 
#' @return the factorial of the specified non-negative integer 

bin_factorial <- function(x){
  y <- 1
  for (i in 1:x){
    if (x == 0) {
      (y <- 1)
    }
    else
    y <- y*((1:x)[i])
  }
  return(y)
}
bin_factorial(5)
bin_factorial(0)


#' @title bin_combinations()
#' @description calculates the number of combinations in which k successes can occur in n trials 
#' @return a number of combinations given n and k

bin_combinations <- function(n,k){
  c <- (bin_factorial(n))/((bin_factorial(k)*(bin_factorial(n-k))))
return(c)
} 
bin_combinations(5,2)
bin_combinations(10,3)
bin_combinations(4,4)


#' @title bin_probability()
#' @description calculates the probability of getting n number of successes in k number of trials 
#' @return a probability value given n, k, and p
bin_probability <- function(trials,success,prob){
  if (is_nonneg_integer(trials) == FALSE){
    stop("trials must be nonnegative integer")
  }
  if (is_nonneg_integer(success) == FALSE){
    stop("successes must be nonnegative integer")
  }
  prob_a <- (bin_combinations(trials,success))*((prob^success)*((1-prob)^(trials-success)))
  if (is_probability(prob) == FALSE) {
    stop("probability must be valid")
  }
  return(prob_a)
}
# probability of getting 2 successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(5,2,0.5)


#' @title bin_distribution()
#' @description displays values for success and probabability for each trial 
#' @return a data frame with a probability distribution
bin_distribution <- function(trials,prob){
    success <- seq(0,trials)
    probability <- rep(0,trials)
    for(i in 1:length(success)){
      probability[i] <- bin_probability(trials, success[i],prob)
    }
distribution <- data.frame(success, probability)
return(distribution)
}

# binomial probability distribution
bin_distribution(5,0.5)

