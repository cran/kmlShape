\name{kmlShape-package}
\alias{kmlShape-package}
\docType{package}
\title{~ Package: kmlShape ~}
\description{
  KmlShape is a package design to cluster longitudinal data according to their shape.
}
\details{
  \tabular{ll}{
    Package: \tab KmlShape\cr
    Type: \tab Package\cr
    Version: \tab 0.9.5\cr
    Date: \tab 2016-03-04\cr
    License: \tab GPL >2.0\cr
  }
  kmlShape cluster longitudinal data according to their shape: instead of
  merging individual whose trajectories are closed in term of euclidienne
  distance, it groups the individual that are closed according Frechet's
  distance.

  Since k-means using Frechet has a complexity in O(n^2t^2), KmlShape also
  provide some function to reduce the size of the data without changing
  the result:

  \itemize{
    \item \code{\link{reduceNbId}} reduce the number of individual, by
    merging them using a classical k-means on many centers.
    \item \code{\link{reduceNbTimes}} reduce the number of measurement, by
    (optionaly) smoothing the curve then by applying the Douglas-Peuker
    algorithms.
  }
}


\author{Christophe Genolini <christophe.genolini@u-paris10.fr>}


\keyword{package}

\examples{
\donttest{
#########
### Real example, on ictus data

### Preparing the data
set.seed(1)
data(ictusShort)
myClds <- cldsWide(ictusShort)

### Reducing the data size
reduceTraj(myClds,nbSenators=64,nbTimes=5)

### Clustering using shape
kmlShape(myClds,4)

plotMeans(myClds)
}
}
