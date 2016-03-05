\name{DouglasPeucker}
\alias{DouglasPeucker}
\alias{DouglasPeuckerEpsilon}
\alias{DouglasPeuckerNbPoints}

\title{
  ~ Function: DouglasPeucker ~
}
\description{
  The Ramer-Douglas-Peucker algorithm (RDP) is an algorithm for reducing
  the number of points in a trajectory.
}
\usage{
  DouglasPeuckerEpsilon(trajx, trajy, epsilon, spar=NA)
  DouglasPeuckerNbPoints(trajx, trajy, nbPoints, spar=NA)
}
\arguments{
  \item{trajx}{[\code{vector(numeric)}]: abscissa of the trajectory.}
  \item{trajy}{[\code{vector(numeric)}]: ordinate of the trajectory.}
  \item{epsilon}{[\code{numeric}]: see details}
  \item{nbPoints}{[\code{numeric}]: see details}
  \item{spar}{[\code{numeric}]: smoothing parameter.}
}
\details{
  [extract from Wikipedia -begin-]

*** Idea ***

The purpose of the algorithm is, given a curve (trajectory) composed of line
segments, to find a similar curve with fewer points. The algorithm
defines 'dissimilar' based on the maximum distance between the original
curve and the simplified curve. The simplified trajectory consists of a
subset of the points that defined the original trajectory.

*** Algorithm with epsilon (function DouglasPeackerEpsilon) ***

The starting curve is an ordered set of points or lines. Let epsilon >
0 be the distance dimension.

The algorithm recursively divides the line. Initially it is given all
the points between the first and last point. It automatically marks the
first and last point to be kept. It then finds the point that is
furthest from the line segment with the first and last points as end
points (this point is obviously furthest on the curve from the
approximating line segment between the end points). If the point is
closer than epsilon to the line segment then any points not currently marked
to keep can be discarded without the simplified curve being worse than
epsilon.

If the point furthest from the line segment is greater than epsilon from the
approximation then that point must be kept. The algorithm recursively
calls itself with the first point and the worst point and then with the
worst point and the last point (which includes marking the worst point
being marked as kept).

When the recursion is completed a new output curve can be generated
consisting of all (and only) those points that have been marked as
kept.

[extract from Wikipedia -end-]

*** Algorithm with a fixed number of point (function DouglasPeackerNbPoints) ***

The previous algorithm stops when the simplified curve and the
real curve are at a distance less than epsilon. It gives
no control over the number of points which are in the simplified curve.

It is possible to change that by modifying the
stopping condition: instead of adding points 'until the
curves are close enough to each other', one can choose to add the farest points
until a a pre-determined number of
points is reach. This is what the function \code{DouglasPeackerNbPoints} does.

Note that \code{DouglasPeackerNbPoints} controls the number of points of the
simplified curve, but does not bound the distance between the originale curve and the simplified curve.

*** smoothing the curve ***

On unsmooth curves with a lot of small variations, the
Douglas-Peucker algorithm gives "strange" results (see example 3). It is therefor preferable to
smoothing the curved before simplifying it. The \code{spar} parameter allows
define the degree of smoothing that will be used. If set to \code{NA}, the
curve is not smoothed. Otherwise, it is smoothed using the function
\code{\link{smooth.spline}} with parameter \code{spar}.

*** missings values ***
They are removed from the trajectory.
}


\value{
   A \code{data.frame} with the new trajectory. The first (x) hold the
   abcsissa, the second (y) the ordinate.
}


\examples{
Px <- (1:100)/10
Py <- dnorm(Px,3,1)+dnorm(Px,7,1)+Px/10


### Example 1
### Simplification using epsilon

par(mfrow=c(2,2))
plot(Px,Py,type="l")
plot(DouglasPeuckerEpsilon(Px,Py,0.01),type="b",col=4)
plot(DouglasPeuckerEpsilon(Px,Py,0.04),type="b",col=3)
plot(DouglasPeuckerEpsilon(Px,Py,0.1),type="b",col=2)

### Example 2
### Simplification using nbPoints

par(mfrow=c(2,2))
plot(Px,Py,type="l")
plot(DouglasPeuckerNbPoints(Px,Py,20),type="b",col=4)
plot(DouglasPeuckerNbPoints(Px,Py,10),type="b",col=3)
plot(DouglasPeuckerNbPoints(Px,Py,5),type="b",col=2)


### Example 3
### Simplification with and without smoothing

Py <- dnorm(Px,3,1)+dnorm(Px,7,1)+Px/10+rnorm(100,,0.1)

par(mfrow=c(2,2))
plot(Px,Py,type="l")
plot(DouglasPeuckerNbPoints(Px,Py,20),type="b",col=4)
plot(DouglasPeuckerNbPoints(Px,Py,20,spar=0.5),type="b",col=3)
plot(DouglasPeuckerNbPoints(Px,Py,10,spar=0.5),type="b",col=2)
}
