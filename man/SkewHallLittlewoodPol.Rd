% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SkewHallLittlewood.R
\name{SkewHallLittlewoodPol}
\alias{SkewHallLittlewoodPol}
\title{Skew Hall-Littlewood polynomial}
\usage{
SkewHallLittlewoodPol(n, lambda, mu, which = "P")
}
\arguments{
\item{n}{number of variables, a positive integer}

\item{lambda, mu}{integer partitions defining the skew partition:
\code{lambda} is the outer partition and \code{mu} is the inner partition
(so \code{mu} must be a subpartition of \code{lambda})}

\item{which}{which skew Hall-Littlewood polynomial, \code{"P"} or \code{"Q"}}
}
\value{
A \code{symbolicQspray} multivariate polynomial, the skew
  Hall-Littlewood polynomial associated to the skew partition defined by
  \code{lambda} and \code{mu}. It has a single parameter usually denoted
  by \eqn{t} and its coefficients are polynomial in this parameter.
  When substituting \eqn{t} with \eqn{0} in the skew Hall-Littlewood
  \eqn{P}-polynomials, one obtains the skew Schur polynomials.
}
\description{
Returns the skew Hall-Littlewood polynomial associated to
  the given skew partition.
}
\examples{
n <- 3; lambda <- c(3, 2, 1); mu <- c(1, 1)
skewHLpoly <- SkewHallLittlewoodPol(n, lambda, mu)
skewSchurPoly <- SkewSchurPol(n, lambda, mu)
substituteParameters(skewHLpoly, 0) == skewSchurPoly # should be TRUE
}
