\name{kmlShape}
\alias{kmlShape}
\title{~kmlShape ~}

\description{
  This function run k-means for longitudinal data using some shape
  respecting distance and mean.
}

\usage{
kmlShape(myClds, nbClusters = 3, timeScale = 0.1, FrechetSumOrMax =
"max", toPlot="both", parAlgo=parKmlShape())
}

\arguments{
  \item{myClds}{[\code{\linkS4class{Clds}}]: Object that hold the
    trajectories, the 'senators' resulting from a
  simplification of the trajectories and, after the use of kmlShape, the
  clusters.}

  \item{nbClusters}{[\code{numeric}] or [\code{vector(numeric)}]: either
    the number of clusters, or a vector of initial (distinct) cluster
    centers. If a number, a random set of (distinct) trajectories is chosen
    as the initial centres.}

  \item{timeScale}{[\code{numeric}]: allow to modify the time scale,
    increasing or decreasing the cost of the horizontal shift. If timeScale is
    very big, then the Frechet mean tends to the
    euclidienne distance. If timeScale is very small, then it tends to
    the Dynamic Time Warping.}

%  \item{weight}{[\code{vector(numeric)}]: weight of the trajectories.
%    If a single value is given, then it is duplicate for all the trajectories.}

  \item{FrechetSumOrMax}{[\code{character}]: kmlShape uses \link[=distFrechet]{Frechet's
      distance} and \link[=pathFrechet]{Frechet path}. Since both of them can
    be define using the 'sum' function or the 'max' function, this option
    let the user to chose one or the other.}


  \item{toPlot}{[\code{character}]: use 'traj' for graphical display
    during computation, or 'none' for a faster but quiet run.}

  \item{parAlgo}{[\code{\linkS4class{ParKmlShape}}]:
    parameters used to run the algorithm. They can be change using the
    function \code{\link{parKmlShape}}. Option are mainly
    'aggregationMethod', 'shuffle', 'sampleSize', 'methodHclust' and  'maxIter'.
    See \code{\linkS4class{ParKmlShape}} for details.}
}


\details{
  This function run k-means for longitudinal data using a shape
  respecting distance (\code{\link{distFrechet}}) and a shape
  respecting mean (\code{\link{meanFrechet}}). See [1] for details.
}

\value{
  An object of class \code{\linkS4class{Clds}} in which the field
  'clustersSenators', 'clusters' and 'trajMeans' are now filled.
}

\examples{
###########
### Example

### Generating artificial data
nbLignes <- 20
trajG <- matrix(0,nbLignes,10)
for(i in 1:(nbLignes/2)){
   trajG[i,] <- dnorm(1:10,runif(1,3,8),1)*rnorm(1,10,0.1)
}
for(i in (nbLignes/2+1):nbLignes){
   trajG[i,] <- dnorm(1:10,runif(1,3,8),1)*rnorm(1,5,0.1)
}

myClds <- cldsWide(data.frame(1:20,trajG))
plot(myClds)

### kmlshape
par(ask=FALSE)
kmlShape(myClds,2)
par(ask=TRUE)
plot(myClds)



###########
### Example 2

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

myClds2 <- cldsWide(data.frame(1:60,trajH))
plot(myClds2)

### kmlshape
par(ask=FALSE)
kmlShape(myClds2,3)
par(ask=TRUE)
plot(myClds2)

}
