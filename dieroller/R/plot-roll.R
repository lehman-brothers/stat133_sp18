#' @title plot-roll function
#' @description returns a barplot with the frequency of each die face appearing over the number of rolls
#' @param rolls is a set series of die rolls
#' @return a barplot with "sides of die" on the x axis and "relative frequencies" on the y axis

plot_roll <- function(x){
  a <- table(x$rolls) / x$total
  b <- barplot(a, main = "Frequencies in a series of die rolls", xlab = "sides of die", ylab = "relative frequencies")

}

#plot_roll(fair_50)

one_freqs <- function(x) {
  cumsum(x$rolls == x$rolls[1]) / x$total
}

two_freqs <- function(x) {
  cumsum(x$rolls == x$rolls[2]) / x$total
}

three_freqs <- function(x) {
  cumsum(x$rolls == x$rolls[3]) / x$total
}

four_freqs <- function(x) {
  cumsum(x$rolls == x$rolls[4]) / x$total
}

five_freqs <- function(x) {
  cumsum(x$rolls == x$rolls[5]) / x$total
}

six_freqs <- function(x) {
  cumsum(x$rolls == x$rolls[6]) / x$total
}

