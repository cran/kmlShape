\name{reduceNbTimes}
\alias{reduceNbTimes}

\title{
  ~ Function: reduceNbTimes ~
}
\description{
  \code{reduceNbTimes} simplify some trajectories (in long format) by reducing their number of points.
}
\usage{
  reduceNbTimes(trajLong, nbPoints, spar=NA)
}

\arguments{
    \item{trajLong}{[\code{data.frame}]: \code{data.frame} that hold the
    trajectories in long format. The data.frame has to be
    (no choice!) in the following format: the first column should be the individual
    indentifiant. The second should be the times at which the measurement
    are made. The third one should be the measurement.}
%  \item{idCol}{[\code{character}]: Name of the column that hold the
%    individual's indentifiant.}
%  \item{timesCol}{[\code{character}]: Name of the column that hold the
%    times at which the measurement are made.}
%  \item{varyingCol}{[\code{character}]: Name of the column that hold the
%    measurement.}
  \item{nbPoints}{[\code{numeric}]: fixe the number of that the
    simplified trajectories should have.}
  \item{spar}{[\code{numeric}]: smoothing parameter that is used if the
    trajectories shall be smoothed before being simplified.}
}
\details{
  \code{reduceNbTimes} simplify some trajectories by reducing their number of points.
  The trajectories should be in long format.
  If a value is given to \code{spar} (different from NA), trajectories are smoothed using \code{\link[stats]{smooth.spline}}.

  The reduction of the number of point is done using a variation of
  \link[=DouglasPeucker]{Douglas-Peucker} algorithme based on the number of points
  instead of an epsilon.
}

\value{
    A \code{data.frame} holding the simplified trajectories, in long format.
}

\author{
Christophe Genolini
}

\seealso{
  \code{\link{reduceNbTimes}},  \code{\link{DouglasPeuckerEpsilon}}, \code{\link{DouglasPeuckerNbPoints}}
}

\examples{
  require(lattice)

  ### Some artificial data
  g <- function(x)dnorm(x,3)+dnorm(x,7)+x/10
  dn <- data.frame(id=rep(1:20,each=101),
    times=rep((0:100)/10,times=20),
    traj=rep(g((0:100)/10),20)+rep(runif(20),each=101)+rnorm(20*101,,0.1))

  xyplot(traj ~ times, data=dn, groups=id,type="l")

  ### Reduction to 50 points
  dn2 <- reduceNbTimes(trajLong=dn,nbPoints=50)
  xyplot(traj ~ times, data=dn2, groups=id,type="l")

  ### Reduction to 20 points
  dn3 <- reduceNbTimes(trajLong=dn,nbPoints=20)
  xyplot(traj ~ times, data=dn3, groups=id,type="l")

  ### Smoothing then reduction to 20 points
  dn4 <- reduceNbTimes(trajLong=dn,nbPoints=20,spar=0.5)
  xyplot(traj ~ times, data=dn4, groups=id,type="l")
}