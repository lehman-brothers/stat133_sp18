#' @title die roll function
#' @description returns the results of rolls given the die and number of rolls
#' @param die is a die usually called from the other object die
#' @param times is a nonnegative integer
#' @return the side of the die that resulted for each individual die roll

roll <- function(die, times = 1) {
  check_times <- function(times) {
    if (!times.isinteger() | times < 1) {
      stop("Invalid input for number of times.")
    }
  }

  rolls <- c()
  sides <- c(die$prob_dist$side)
  prob <- c(die$prob_dist$prob)
  total <- times

  samples = runif(times, 0, 1)

  sofar = 0
  for (i in (1:times)) {
    if (samples[i] < prob[1]) {
      rolls <- c(rolls, sides[1])
    } else if (samples[i] < prob[1] + prob[2]) {
      rolls <- c(rolls, sides[2])
    } else if (samples[i] < prob[1] + prob[2] + prob[3]) {
      rolls <- c(rolls, sides[3])
    } else if (samples[i] < prob[1] + prob[2] + prob[3] + prob[4]) {
      rolls <- c(rolls, sides[4])
      sofar = sofar + prob[4]
    } else if (samples[i] < prob[1] + prob[2] + prob[3] + prob[4] + prob[5]) {
      rolls <- c(rolls, sides[5])
      sofar <- sofar + prob[5]
    } else if (samples[i] < prob[1] + prob[2] + prob[3] + prob[4] + prob[5] + prob[6]) {
      rolls <- c(rolls, sides[6])
    }
  }

  roll <- list(rolls = rolls, sides = sides, prob = prob, total = total)
  class(roll) <- "roll"
  roll
}

print.roll <- function(x, ...) {
  cat('object "roll"\n\n')
  cat("$rolls\n")
  print(x$rolls)
  invisible(x)
}


# fair die 50 times
#fair_50 <- roll(fair_die, times = 50)
#fair_50

# what's in fair50?
#names(fair_50)
#fair_50$rolls
#fair_50$sides
#fair_50$prob
#fair_50$total

# string die
#str_die <- die(
#  sides = c("a", "b", "c", "d", "e", "f"),
#  prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)
#)

# roll 20 times
#set.seed(123)
#str_rolls <- roll(str_die, times = 20)
#names(str_rolls)
#str_rolls

