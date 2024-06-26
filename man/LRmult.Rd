% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LittlewoodRichardson.R
\name{LRmult}
\alias{LRmult}
\title{Littlewood-Richardson rule for multiplication}
\usage{
LRmult(mu, nu, output = "dataframe")
}
\arguments{
\item{mu, nu}{integer partitions, given as vectors of decreasing integers}

\item{output}{the type of the output, \code{"dataframe"} or \code{"list"}}
}
\value{
This computes the expression of the two Schur polynomials
  associated to \code{mu} and \code{nu} as a linear combination of Schur
  polynomials. If \code{output="dataframe"}, the output is a dataframe with
  two columns: the column \code{coeff} gives the coefficients of this
  linear combination, and the column \code{lambda} gives the partitions
  defining the Schur polynomials of this linear combination as character
  strings, e.g. the partition \code{c(4, 3, 1)} is given by \code{"4, 3, 1"}.
  If \code{output="list"}, the output is a list with two fields: the field
  \code{coeff} is the vector made of the coefficients of the linear
  combination, and the field \code{lambda} is the list of partitions
  defining the Schur polynomials of the linear combination given as
  integer vectors.
}
\description{
Expression of the product of two Schur polynomials as a linear
  combination of Schur polynomials.
}
\examples{
library(jack)
mu <- c(2, 1)
nu <- c(3, 2, 1)
LR <- LRmult(mu, nu, output = "list")
LRcoeffs <- LR$coeff
LRparts <- LR$lambda
LRterms <- lapply(1:length(LRcoeffs), function(i) {
  LRcoeffs[i] * SchurPol(3, LRparts[[i]])
})
smu_times_snu <- Reduce(`+`, LRterms)
smu_times_snu == SchurPol(3, mu) * SchurPol(3, nu)
}
