#' @title die object function
#' @description returns a die object given sides and probability
#' @param sides is a six element vector, by default numbers 1,2,3,4,5,6. must be 6 element
#' @param prob is a vector of probabilities for each side, by default all equal to 1/6. must sum to 1
#' @return columns showing the sides of the die and the probability of rolling each one

die <- function(sides, prob){
  check_sides <- function(sides){
    return(length(sides) != 6)
  }
  check_prob <- function(prob){
    return(sum(prob) != 1)
  }


  if (missing(sides)){
    die_sides <- c(1,2,3,4,5,6)}
  else {(die_sides = sides)
  }
  if (missing(prob)){
    die_prob <- c(1/6,1/6,1/6,1/6,1/6,1/6)}
  else {(die_prob = prob)
  }


  if (check_sides(die_sides)) {
    stop("'sides' must be a vector of length 6")
  } else if (check_prob(die_prob)) {
    stop("elements in 'prob' must add up to 1")
  }

  a <- c(die_sides,die_prob)
  b <- matrix(a, nrow = 6, ncol = 2)
  c <- as.data.frame(b)
  colnames(c) <- c("side", "prob")

  die <- list(prob_dist = c)
  class(die) <- "die"
  return (die)
}

print.die <- function(x, ...) {
  cat('object "die"\n\n')
  print(x$prob_dist)
  invisible(x)
}

# default call: creates a standard fair die
#fair_die <- die()
#fair_die

# die with non-standard sides
#weird_die <- die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'))
#weird_die

# create a loaded die
#loaded_die <- die(prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
#loaded_die

# bad sides
#bad_die <- die(sides = c("a", "b", "c", "d", "e"))

# bad prob
#bad_die <- die(
  #sides = c("a", "b", "c", "d", "e", "f"),
  #prob = c(0.2, 0.1, 0.1, 0.1, 0.5, 0.1))

