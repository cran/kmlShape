\name{Clds-class}
\Rdversion{1.1}
\docType{class}
\alias{Clds-class}
\alias{show,Clds-method}
\alias{[,Clds-method}
\alias{[<-,Clds,ANY,ANY,ANY-method}

\title{~ Class \code{"Clds"} ~}
\description{
  \code{Clds} (or ClusterLongDataShape) is a class used to prepared the
  trajectories that will be cluster by the function
  \code{\link{kmlShape}} and to store the result of the clustering.
  According to the data simplification that the
  user may perform, it may containt the trajectories in wide format, in
  long format, the simplified trajectories (called 'senators'), the
  partition found and the mean's trajectories of the cluster find by
  \code{kmlShape}.
}

\section{Objects from the Class}{
  Objects can be created by calls of the form \code{new("Clds", ...)} or
  using the constructor \code{\link{cldsWide}} and \code{\link{cldsLong}}.
}

\section{Slots}{
  \describe{
    \item{\code{steps}:}{\code{[vector(logical)]} summarizes what data
      are available and the transformation
      that the data had already undergone. The first value is TRUE if
      the data has been generated from a data.frame in a wide
      format. The second is TRUE if the data are available in wide
      format. The third is TRUE if the data in long format are available. The fourth is
      TRUE if
      the function \code{\link{reduceNbId}} has been used. The fitfh is TRUE if
      the function \code{\link{reduceNbTimes}} has been used. The
       sixth is TRUE if \code{\link{kmlShape}} has been used.
    }
    \item{\code{id}:}{\code{[vector(factor)]} Unique identifier, one for each trajectories.}
    \item{\code{nbId}:}{\code{[integer]} Number of trajectories.}
    \item{\code{nbCol}:}{\code{[integer]} Number of times measurement (if the
      trajectories are in wide format).}
    \item{\code{trajWide}:}{\code{[matrix]} Trajectories in wide
      format. Each line is an individual, each column is a specific
      time.}
    \item{\code{times}:}{\code{[vector(numeric)]} Times at which measures
      are made.}
    \item{\code{trajLong}:}{\code{[data.frame]} Trajectories in long
      format. The first column hold the identifiers ; in the second are
      the times ; the third coutain the values.}
    \item{\code{senators}:}{\code{[data.frame]} The 'senatorsMeans' are the
      trajectories get by reducing the number
      of individual (using \code{\link{reduceNbId}}).
      The 'senatorShort' are the population after reduction of the
      number of time (using \code{\link{reduceNbTimes}}).
      'senatorsMeansShort' are the trajectories get by using both. The
      field 'senators' hold either the 'senatorMeans', the
      'senatorShort' or the 'senatorMeansShort', according to the
      reduction that has been used.}
    \item{\code{mySenator}:}{\code{[data.frame]} In the fisrt
      column are all the individual indentifier. The second hold the
      identifier of the senators that represent the individual}
    \item{\code{senatorsWeight}:}{\code{[integer]} If the procedure
      \code{\link{reduceNbId}} has been used, each senators is the
      mean of a clusters. His \code{senatorsWeight} is the number of individual
      that are in his clusters. If \code{\link{reduceNbId}} has not been
      used (and thus, only \code{\link{reduceNbTimes}} has been used),
      each senators has weight 1.}
    \item{\code{clustersSenators}:}{\code{[factor]} Clusters of each
      senators after the used of \code{\link{kmlShape}}.}
    \item{\code{clusters}:}{\code{[factor]} Clusters of each
      individual after the used of \code{\link{kmlShape}}. The clusters
      of an individual is the cluters of its senators.}
    \item{\code{trajMeans}:}{\code{[data.frame]} Means' trajectories of
      each clusters after the use of \code{\link{kmlShape}}.}
  }
}
\section{Methods}{
  \describe{
    \item{[}{: Get the value of the field asked. Possible values are
      'step', 'wideAvailable', 'longAvailable', 'senatorsAvailable',
      'reduceId', 'reduceTimes', 'kmlShape', 'nbClusters', 'id', 'nbId',
      'nbCol', 'trajWide', 'times', 'trajLong', 'senators', 'mySenator',
      'senatorsWeight', 'clustersSenators', 'clusters', 'trajMeans'}
    \item{[<-}{: Set the selected field to value.}
    \item{show}{: Display the
      object. Since many fields can be empty, it display only the field
      that ar not empty.}
  }
}

\examples{
data(ictusShort)
cldsWide(ictusShort)
}
\keyword{classes}
