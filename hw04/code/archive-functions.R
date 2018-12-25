# loading packages
library("stringr")
library("XML")
library("ggplot2")

# 1) Archive of an R Package

# 1.1) Read Archive Data Table
#' @title read_archive()
#' @description takes the name of a package, and returns the data frame from reading the HTML table with the archive 
#' @return a data frame 
read_archive <- function(package_name){
  a <- "readHTMLTable('http://cran.r-project.org/src/contrib/Archive/package')"
  b <- sub("package", as.character(package_name), a)
  c <- parse(text = b)
  d <- eval(c)
  e <- d[[1]]
  return(e)
}
raw_data <- read_archive("stringr")
raw_data

# 1.2) Data Cleaning
#' @title version_names()
#' @description extracts the name of the package 
#' @return the package name 
version_names <- function(raw_data){
  a <- str_extract(raw_data$Name, pattern = "[a-z|A-Z]+")
  return(a)
}
version_names(raw_data)

#' @title version_numbers()
#' @description extracts the number of the package 
#' @return the package number 
version_numbers <- function(raw_data){
  a <- str_split(raw_data$Name, "_")
  a <- sapply(a, function(a) a[2])
  a <- str_replace(a, ".tar.gz","")
     return(a)
}
version_numbers(raw_data)

#' @title version_dates()
#' @description extracts the date of the version 
#' @return the version date 
version_dates <- function(raw_data){
  a <- str_split(raw_data$`Last modified`, " ")
  a <- sapply(a, function(a) a[1])
  return(a)
}
version_dates(raw_data)

#' @title version_sizes()
#' @description extracts the size of the version 
#' @return the version size 
version_sizes <- function(raw_data){
  a <- str_split(raw_data$Size, "K")
  a <- sapply(a, function(a) a[1])
  return(a)
}
version_sizes(raw_data)

# 1.2) Data Cleaning
#' @title clean_archive()
#' @description takes the output of read_archive() and returns a "tidy" table with the following columns: name, version, date, size 
#' @return a tidy data frame 
clean_archive <- function(x){
  raw_data <- read_archive(x)
  a <- raw_data[4:nrow(raw_data)-1, 2:4]
  b <- as.character(version_names(a))
  c <- as.character(version_numbers(a))
  d <- as.Date(version_dates(a))
  e <- as.numeric(version_sizes(a))
  f <- data.frame(names = b, version = c, date = d, size = e, stringsAsFactors = FALSE)
  return(f)
}
clean_archive('XML')

#1.3) Timeline plot
#' @title plot_archive()
#' @description creates a timeline with the different sizes of each version of a package 
#' @return a plot 
plot_archive <- function(a){
  ggplot(clean_archive(a), aes(date, size)) + geom_point() + geom_step()
}
plot_archive("stringr")
