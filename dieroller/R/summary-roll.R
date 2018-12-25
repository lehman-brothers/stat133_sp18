#' @title summary-roll function
#' @description returns a dataframe with the side, count, and proportion of each roll of a die
#' @param die is a die usually called from the other object die
#' @return a dataframe with the side, count, and proportion of each roll of a die

summary.roll <- function(x, ...){
  side <- x$sides
  count <- as.data.frame(table(x$rolls))[, 2]
  prop <- (count/x$total)

  freqs <- data.frame(side, count, prop)
  object <- list(freqs = freqs)
  class(object) <- "summary_roll"
  object

}

print.summary.roll <- function(x, ...){
  cat('summary "roll" \n \n')
  print(as.data.frame(x$object))
  invisible(x)
}

#set.seed(123)
#fair_50rolls <- roll(fair_die, times = 50)
#fair_50sum <- summary(fair_50rolls)

#fair_50sum

# what's in the summary
#class(fair_50sum)
#names(fair_50sum)
#fair_50sum$freqs

