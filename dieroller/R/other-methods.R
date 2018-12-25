#' @title extraction method
#' @description a function to extract the value of a given roll
#' @param rolls is a set series of die rolls
#' @return the value of a specified roll

"[.roll" <- function(x, i){
  x$roll[i]
}


#' @title replacement method
#' @description a function to replace the value of a given roll
#' @param rolls is a set series of die rolls
#' @return an updated version of the number of rolls

"[<-.roll" <- function(x, i, value){
  x$roll[i] <- value
  make_roll(x$die, x$roll)
}


#' @title addition method
#' @description a function to add a specified number of rolls
#' @param rolls is a set series of die rolls
#' @return an updated version of the roll object with the new total number of rolls

"+.roll" <- function(object, increment){
  if (length(increment) != 1 | increment <= 0){
    stop("\ninvalid increment")
  }
  object$total <- object$total + increment
  more_tosses <- rolls(object, times = increment)
  object$rolls <- c(object$rolls, more_tosses)
  return(object)
}

