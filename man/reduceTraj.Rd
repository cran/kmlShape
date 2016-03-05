\name{reduceTraj}
\alias{reduceTraj}

\title{~ Function: reduceTraj ~}
\description{
  This function 'summerize' a (big) population in a smaller groups of
  individual, then simplify the trajectories by reducing their number of
  points. It use \code{\link{reduceNbId}} and
  \code{\link{reduceNbTimes}}. Main difference with these two function,
  its applies on a \code{\linkS4class{Clds}} object.
}
\usage{
reduceTraj(myClds, nbSenators = NA, nbTimes = NA, spar = 0.5,
   imputationMethod = "linearInterpol")
}

\arguments{
  \item{myClds}{[\code{\linkS4class{Clds}}]: object holding the
  trajectories that should be simplified.}
  \item{nbSenators}{[\code{integer}] number of trajectories that will be
    use to represent the population (i.e., number of clusters used by
    k-means).}
  \item{nbTimes}{[\code{numeric}]: fixe the number of that the
    simplified trajectories should have.}
  \item{spar}{[\code{numeric}]: smoothing parameter that is used if the
    trajectories shall be smoothed before being simplified.}
  \item{imputationMethod}{[\code{character}]: Method that will be used to
    impute the missing values.}
}
\details{
  This function 'summerize' a (big) population in a smaller groups of
  individual, then simplify the trajectories by reducing their number of
  points. If 'nbSenators' is not NA, then \code{\link{reduceNbId}} is
  called. If 'nbTimes' is not NA, then \code{\link{reduceNbTimes}} is
  called. Note that 'nbSenators' and 'nbTimes' should not be both
  missing.

  If both are non-missing, \code{\link{reduceNbId}} is called first.
  The results is store in the field 'senators' of the \code{\linkS4class{Clds}} object.


}
\value{
  A \code{\linkS4class{Clds}} object in which the fields
  'senators', 'mySenators' and 'senatorsWeight' are now filled.
}


\examples{
### Generating artificial data
nbLignes <- 200
trajG <- matrix(0,nbLignes,51)
for(i in 1:(nbLignes/2)){
   trajG[i,] <- dnorm(0:50,runif(1,15,35),5)*rnorm(1,10,0.1)
}
for(i in (nbLignes/2+1):nbLignes){
   trajG[i,] <- dnorm(0:50,runif(1,15,35),5)*rnorm(1,5,0.1)
}
myClds <- cldsWide(data.frame(1:200,trajG))
plot(myClds)

### Reducing the number of time measurement
reduceTraj(myClds,nbTimes=7)
plotSenators(myClds)

### Reducing the number of individual
reduceTraj(myClds,nbSenators=32)
plotSenators(myClds)

### Reducing both
reduceTraj(myClds,nbSenators=32,nbTimes=7)
plotSenators(myClds)
}
