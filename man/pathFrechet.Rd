\name{pathFrechet}
\alias{pathFrechet}
\alias{pathFrechetR}

\title{~ Function: Frechet distance ~}

\description{
Compute Frechet distance and Frechet path between two trajectories.
}
\usage{
pathFrechet(Px,Py,Qx,Qy,timeScale=0.1,FrechetSumOrMax = "sum")
%pathFrechetR(Px,Py,Qx,Qy,timeScale=0.1,FrechetSumOrMax = "sum")
}

\arguments{
  \item{Px}{[vector(numeric)] Times (abscisse) of the first trajectories.}
  \item{Py}{[vector(numeric)] Values of the first trajectories.}
  \item{Qx}{[vector(numeric)] Times of the second trajectories.}
  \item{Qy}{[vector(numeric)] Values of the second trajectories.}
  \item{timeScale}{[\code{numeric}]: allow to modify the time scale,
    increasing or decreasing the cost of the horizontal shift. If timeScale is
    very big, then the Frechet path is only a set of vertical segment.
    If timeScale is very small, then it is equal to
    the path find by Dynamic Time Warping.}
  \item{FrechetSumOrMax}{[\code{character}]: Like Frechet's distance,
    the Frechet's path can
    be define using the 'sum' function or the 'max' function. This option
    let the user to chose one or the other.}
}
\details{
  Given two curve P and Q, Frechet distance between P and Q is define as
  \code{distFrechet(P,Q)=inf_{a,b} max_{t} d(P(a(t)),Q(b(t)))}.

  The Frechet path is the couple of function \code{(a(t),b(t))}  that
  realize the previous equality :
  \code{distFrechet(P,Q)=max_{t} d(P(a(t)),Q(b(t)))}

  It's computation is a NP-complex problem. When P and Q are
  trajectories (discrete curve), the problem is polynomial.

  The Frechet path can also be define using a sum instead of a max:
  \code{inf_{a,b} sum_{t} d(P(a(t)),Q(b(t)))}

  The function \code{pathFrechet} is C compiled whereas the function
  \code{pathFrechetR} is in R.
}

\value{
  A numeric value and the Frechet path in a matrix.
}


\section{Author}{
Christophe Genolini \& Elie Guichard\cr
1. UMR U1027, INSERM, Université Paul Sabatier / Toulouse III / France\cr
2. CeRSME, EA 2931, UFR STAPS, Université de Paris Ouest-Nanterre-La Défense / Nanterre / France
}

\references{
  Thomas Eiter & Heikki Mannila: "Computing Discrete Fr´echet Distance"\cr

  [1] C. Genolini and B. Falissard\cr
  "KmL: k-means for longitudinal data"\cr
  Computational Statistics, vol 25(2), pp 317-328, 2010\cr

  [2] C. Genolini and B. Falissard\cr
  "KmL: A package to cluster longitudinal data"\cr
  Computer Methods and Programs in Biomedicine, 104, pp e112-121, 2011\cr
}

\seealso{distFrechet}

\examples{
   Px <- 1:20
   Py <- dnorm(1:20,12,2)
   Qx <- 1:20
   Qy <- dnorm(1:20,8,2)

   ### Function from Eiter and Mannila compiled in C
   system.time(pathFrechet(Px,Py,Qx,Qy))

   ### Same thing in R
   system.time(pathFrechet(Px,Py,Qx,Qy))

   ### Frechet using sum instead of max.
   pathFrechet(Px,Py,Qx,Qy,FrechetSumOrMax="sum")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
