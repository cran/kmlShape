\name{parKmlShape}
\Rdversion{1.1}
\alias{parKmlShape}
\alias{[,ParKmlShape-method}
\title{ ~ Function: parKmlShape ~}

\description{
  \code{parKmlShape} is a constructor for the object \code{\linkS4class{ParKml}}.
}
\usage{
parKmlShape(aggregationMethod="all", shuffle=TRUE, sampleSize=128,
   methodHclust="average", maxIter=100)
}
\arguments{
  \item{aggregationMethod}{[\code{character}]: define the aglomerative method used
    to compute the mean. Three methods are
    curently available: "all", "sample" and "hierarchical". See
    \code{\link{meanFrechet}} and [1] for details.}

  \item{shuffle}{[\code{logical}]: if the agglomerationMethod is "all" or "sample", this variable is use
    to decide if the trajectories will be agglomerate in a random order (\code{shuffle=TRUE}) or not.
    If not, the lexical order based on the individual identifiant is used.}

  \item{sampleSize}{[\code{integer}]: Define the number of trajectories
    that will be use to compute the \code{\link{meanFrechet}}
    when the aggregationMethod is "sample".}

  \item{methodHclust}{[\code{character}]: define the distance between
    two clusters used by the hierarchical clustering when the aggregationMethod
    is "hierarchical". The methods
    available are the one for \code{\link[=stats]{hclust}}}

   \item{maxIter}{[\code{numeric}]: the maximum number of iteration allowed.}
}


\details{
  \code{parKmlShape} is the constructor of object \code{\linkS4class{ParKml}}.
}
\value{
  An object \code{\linkS4class{ParKmlShape}}.
}

\examples{
parKmlShape()
parKmlShape(aggregationMethod="hierarchical",methodHclust="single")
}