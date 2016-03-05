\name{plotTraj}
\alias{plotTraj}
\alias{plotTraj,Clds,missing-method}

\title{ ~ Function: plotTraj for Clds ~ }
\description{
  \code{plotTraj} plot the trajectories of an object
  \code{\linkS4class{Clds}}.
}
\usage{
\S4method{plotTraj}{Clds,missing}(x, y, col="clusters", pourcent=NA, ...)
}

\arguments{
  \item{x}{[\code{\linkS4class{Clds}}]: Object containing the trajectories to plot.}

  \item{y}{Useless. For compatibility only.}

  \item{col}{[\code{character}], [\code{integer}] or
    [\code{vector(integer)}]: color use for the trajectories. If the
    special value "clusters" is used, the trajectories will be colored
    according to their clusters.}

  \item{pourcent}{[\code{vector(numeric)}]: if pourcent is not NA, then
    the vector pourcent is used as value for the legend. If pourcent is
    NA, the legend is not printed.}

  \item{...}{Arguments to be passed to methods. These arguments need to
    be compatible with \code{\link{matplot}}.}
}

\details{
  \code{plotTraj} the trajectories of an object
  \code{\linkS4class{Clds}}. If the option \code{col="clusters"} is used, the trajectories will be colored
  according to their clusters.
}

\examples{
data(ictusShort)
myClds <- cldsWide(ictusShort)
plot(myClds)
}

\keyword{dplotTraj}    % Computations Related to PlotTrajting
\keyword{iplotTraj}    % Interacting with PlotTrajs
\keyword{chron}    % Dates and Times
\keyword{spatial}  % Spatial Statistics ['spatial' package]
\keyword{classif}  % Classification	['class' package]
\keyword{cluster}  % Clustering
\keyword{ts}       % Time Series


