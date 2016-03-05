\name{plot}
\alias{plot}
\alias{plot,Clds,missing-method}

\title{ ~ Function: plot for Clds ~ }
\description{
  \code{plot} plot both the trajectories the the clusters' means of an object
  \code{\linkS4class{Clds}}.
}
\usage{
\S4method{plot}{Clds,missing}(x,y,col="darkgrey",lty=1,legend=TRUE,...)
}

\arguments{
  \item{x}{[\code{\linkS4class{Clds}}]: Object containing the trajectories to plot.}

  \item{y}{Useless. For compatibility only.}

  \item{col}{[\code{character}], [\code{integer}] or
    [\code{vector(integer)}]: color use for the trajectories. If the
    special value "clusters" is used, the trajectories will be colored
    according to their clusters.}

  \item{lty}{[\code{integer}] or [\code{vector(integer)}]: line type of
    the trajectories}

  \item{legend}{[\code{logical}]: shall the pourcent of individual in
    each cluster be printed as a legend ?}

  \item{...}{Arguments to be passed to methods. These arguments need to
    be compatible with \code{\link{plotTraj}}.}
}

\details{
  \code{plot} plot both the trajectories the the clusters' means of an object
  \code{\linkS4class{Clds}}.
  If the option \code{col="clusters"} is used, the trajectories will be colored
  according to their clusters.
}

\examples{

### Generating artificial data
nbLignes <- 12
trajH <- matrix(0,nbLignes,10)

 for(i in 1:(nbLignes/3)){
   trajH[i,] <- pnorm(1:10,runif(1,3,8),1)*rnorm(1,10,1)
}
for(i in (nbLignes/3+1):(2*nbLignes/3)){
   trajH[i,] <- dnorm(1:10,runif(1,3,8),1)*rnorm(1,13,1)
}

for(i in (2*nbLignes/3+1):nbLignes){
   trajH[i,] <- pnorm(1:10,runif(1,3,8),1)*rnorm(1,5,0.1)
}

myClds <- cldsWide(data.frame(1:60,trajH))

par(mfrow=c(1,2))
plotTraj(myClds)
kmlShape(myClds,toPlot="none")
plotTraj(myClds)

}

\keyword{dplotTraj}    % Computations Related to PlotTrajting
\keyword{iplotTraj}    % Interacting with PlotTrajs
\keyword{chron}    % Dates and Times
\keyword{spatial}  % Spatial Statistics ['spatial' package]
\keyword{classif}  % Classification	['class' package]
\keyword{cluster}  % Clustering
\keyword{ts}       % Time Series


