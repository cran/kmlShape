\name{ParKmlShape-class}
\Rdversion{1.1}
\docType{class}
\alias{ParKmlShape-class}
\alias{[,ParKmlShape,ANY,ANY-method}
\alias{[<-,ParKmlShape,ANY,ANY,ANY-method}
%\alias{show,ParKmlShape-method}

\title{~ Class: "ParKmlShape" ~ }
\description{\code{ParKmlShape} is an object containing some parameter used by \code{\link{kmlShape}}.}

\section{Slots}{
  \describe{
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
}

\section{Methods}{
  \describe{
    \item{\code{object['xxx']}}{Get the value of the field \code{xxx}.}
  }
}


\examples{
parAlgo <- parKmlShape()
parAlgo["aggregationMethod"]
parAlgo["aggregationMethod"] <- "hierarchical"
}

\keyword{classes}
