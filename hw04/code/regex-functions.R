# loading packages
library("stringr")
library("XML")

# 2) Regex Functions

# 2.1) Splitting Characters
#' @title split_chars()
#' @description takes a character string, and splits the content into one single character elements 
#' @returns a vector with single character elements
split_chars <- function(string){
  a <- substring(string, seq(1,nchar(string),1), seq(1,nchar(string),1))
  return(a)
}
split_chars('Go Bears!')
split_chars('Expecto Patronum')

# 2.2) Number of Vowels
#' @title num_vowels()
#' @description returns the number of vowels in a character vector 
#' @returns a numeric vector with the number of vowels
num_vowels <- function(vector){
  sapply(c('a', 'e', 'i', 'o', 'u'), function(x) x<-sum(x==unlist(strsplit(casefold(vector),""))))
}
vec <- c('G', 'o', '', 'B', 'e', 'a', 'r', 's', '!')
num_vowels(vec)

# 2.3) Counting Vowels
#' @title count_vowels()
#' @description computes the number of vowels in a character string 
#' @returns the number of vowels
count_vowels <- function(string){
  a <- split_chars(string)
  b <- num_vowels(a)
  return(b)
}
count_vowels("The quick brown fox jumps over the lazy dog")
count_vowels("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")

# 2.4) Reversing Characters
#' @title reverse_chars()
#' @description reverses a string by characters 
#' @returns the reverse of the string that was put in
reverse_chars <- function(string){
  a <- paste(rev(substring(string,1:nchar(string),1:nchar(string))),collapse="")
  return(a)
}
reverse_chars("gattaca")
reverse_chars("Lumox Maxima")

# 2.5) Reversing Sentences by Words
#' @title reverse_words()
#' @description reverses a string by words
#' @returns the original string with reversed words
reverse_words <- function(string){
  string_split <- strsplit(as.character(string), split = " ")
  string_length <- length(string_split[[1]])
  if (string_length == 1) {
    reversed_string = string_split[[1]]
  } else {
    reversed_split = string_split[[1]][string_length:1]
    reversed_string = paste(reversed_split, collapse = " ")
  }
  return(reversed_string)
}
reverse_words("sentence! this reverse")
reverse_words("string")
