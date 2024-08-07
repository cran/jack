% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Kostka.R
\name{KostkaJackNumbersWithGivenLambda}
\alias{KostkaJackNumbersWithGivenLambda}
\title{Kostka-Jack numbers with a given partition \eqn{\lambda}}
\usage{
KostkaJackNumbersWithGivenLambda(lambda, alpha, output = "vector")
}
\arguments{
\item{lambda}{integer partition}

\item{alpha}{the Jack parameter, a \code{bigq} number or anything coercible
to a \code{bigq} number}

\item{output}{the format of the output, either \code{"vector"} or
\code{"list"}}
}
\value{
If \code{output="vector"}, this function returns a named vector.
  This vector is made of the non-zero (i.e. positive) Kostka-Jack numbers
  \eqn{K_{\lambda,\mu}(\alpha)} given as character strings and its names
  encode the partitions \eqn{\mu}.
  If \code{ouput="list"}, this function returns a list of lists.
  Each of these lists has two
  elements. The first one is named \code{mu} and is an integer
  partition, and the second one is named \code{value} and is a \code{bigq}
  rational number, the Kostka-Jack number \eqn{K_{\lambda,\mu}(\alpha)}.
}
\description{
Kostka numbers with Jack parameter, or Kostka-Jack numbers
  \eqn{K_{\lambda,\mu}(\alpha)} for a given Jack parameter \eqn{\alpha}
  and a given integer partition \eqn{\lambda}.
}
\details{
The Kostka-Jack number \eqn{K_{\lambda,\mu}(\alpha)} is the
  coefficient of the monomial symmetric polynomial \eqn{m_\mu} in the
  expression of the \eqn{P}-Jack polynomial \eqn{P_\lambda(\alpha)} as a
  linear combination of monomial symmetric polynomials. For \eqn{\alpha=1}
  it is the ordinary Kostka number.
}
\examples{
KostkaJackNumbersWithGivenLambda(c(3, 2), alpha = "2")
}
\seealso{
\code{\link{KostkaJackNumbers}},
  \code{\link{symbolicKostkaJackNumbersWithGivenLambda}}.
}
