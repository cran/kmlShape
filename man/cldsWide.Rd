\name{cldsWide}
\alias{cldsWide}

\title{
  ~ Function: cldsWide ~
}
\description{
  Turn trajectories in wide format into an object of class \code{\linkS4class{Clds}}.
}
\usage{
cldsWide(trajWide, times, id)
}
\arguments{
  \item{trajWide}{\code{[data.frame]} or \code{[matrix]}: the trajectories, in wide
    format (each line is an individual, each column is a specific
    time measurement).}
  \item{times}{\code{[vector(numeric)]} Times at which measures
      are made.}
  \item{id}{\code{[vector(factor)]} Vector of unique identifiers, one
    for each trajectories. If \code{id} is missing, the first column of the
    \code{trajWide} is turn into a factor and is used as id.}
}

\details{
  Turn trajectories in wide format into an object of class
  \code{\linkS4class{Clds}}. If \code{id} is missing, the first column of the
  \code{trajWide} is turn into a factor and is used as id. Column
  \code{2:ncol(trajWide)} are the trajectories. If id is not missing, column
  \code{1:ncol(trajWide)} are the trajectories.
}

\value{
Object of class \code{\link{Clds-class}}.
}

\examples{
data(ictusShort)
myClds <- cldsWide(ictusShort)
myClds
plotTraj(myClds)
}

