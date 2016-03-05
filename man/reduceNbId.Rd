\name{reduceNbId}
\alias{reduceNbId}

\title{~ Function: reduceNbId ~}

\description{
  This function 'summerize' a (big) population in a smaller groups of
  individual. Hopefully, the smaller groups will have the same
  properties than the whole population. The trajectories of the smaller
  groups are called
  the 'senator' (since they are representing the whole population).
  The 'election' is done using the classical k-means
  algorithm. The trajectories should be in 'wide' format.
}


\usage{
reduceNbId(id, trajWide, nbSenators = 64, imputationMethod = "linearInterpol")
}

\arguments{
  \item{id}{\code{[vector(factor)]}: unique identifier for each trajectories.}
  \item{trajWide}{[\code{data.frame}]: \code{data.frame} that hold the
    trajectories (in wide format).}
  \item{nbSenators}{[\code{integer}] number of trajectories that will be
    use to represent the population (i.e., number of clusters used by
    k-means).}
  \item{imputationMethod}{[\code{character}]: Method that will be used to
    impute the missing values.}
}

\details{
  This function 'summerize' a (big) population in a smaller groups of
  individual. Hopefully, the smaller groups will have the same
  properties than the whole population. The trajectories of the smaller
  groups are called
  the 'senator' (since they are representing the whole population).
  The 'election' is done using the classical k-means
  algorithm. The trajectories should be in 'wide' format.
}

\value{A list with three fields:
  \itemize{
    \item{mySenator:}{ \code{[data.frame]} whose first column is the individual
      identifier and whose second column is the 'senator' that represent
      the individual of the first column.}
    \item{senatorsWide}{ \code{[matrix]} containing the trajectories of the senators,
     in wide format. The first column is an unique identifier for each senators.}
    \item{senatorsWeight}{\code{[vector(numeric)]} Number of individual that a senator is representing
      (i.e. number of individual that are in the cluster whose senator is the mean.)}
  }
}




\examples{
  par(mfrow=c(1,3))
  ### Some artificial data
  myTraj <- t(sapply(1:1000,function(x)dnorm(1:200,runif(1,50,150),20)*rnorm(1,10,2)))
  matplot(t(myTraj),type="l",ylim=c(0,0.33))

  ### Election of 64 senator
  ### All individual is closed to one senators. Senators are representatives.
  election64 <- reduceNbId(id=1:1000,myTraj,nbSenators=64)
  matplot(t(election64$senatorsWide[,-1]),type="l",ylim=c(0,0.33))

  ### Election of 4 senators. They are not representatives.
  election4 <- reduceNbId(id=1:1000,myTraj,nbSenators=4)
  matplot(t(election4$senatorsWide[,-1]),type="l",ylim=c(0,0.33))
}
