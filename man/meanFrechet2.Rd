\name{meanFrechet2}
\alias{meanFrechet2}

\title{~ Function: meanFrechet2 ~}

\description{Compute the Frechet mean between two curves.}

\usage{
meanFrechet2(Px, Py, Qx, Qy, timeScale = 0.1, FrechetSumOrMax = "sum", weightPQ = c(1,1))
}

\arguments{
  \item{Px}{[\code{vector(numeric)}] Times (abscisse) of the first trajectories.}
  \item{Py}{[\code{vector(numeric)}] Values of the first trajectories.}
  \item{Qx}{[\code{vector(numeric)}] Times of the second trajectories.}
  \item{Qy}{[\code{vector(numeric)}] Values of the second trajectories.}
  \item{timeScale}{[\code{numeric}]: allow to modify the time scale,
    increasing or decreasing the cost of the horizontal shift. If timeScale is
    very big, then the Frechet's mean is equal to the
    euclidienne distance. If timeScale is very slow, then it is equal to
    the Dynamic Time Warping.}
  \item{FrechetSumOrMax}{[\code{character}]: Like Frechet's distance,
    Frechet's mean can
    be define using the 'sum' function or the 'max' function. This option
    let the user to chose one or the other.}
  \item{weightPQ}{[\code{couple(numeric)}]: respective weight of the two trajectories
    (for a weighted mean).}
}
\details{
  Given two curve P and Q
  \itemize{
    \item{The Frechet distance between P and Q is define as
  \code{distFrechet(P,Q)=inf_{a,b} max_{t} d(P(a(t)),Q(b(t)))}.}

    \item{The Frechet path is the couple of function \code{(a(t),b(t))}  that
       realize the equality of the Frechet distance:
       \code{distFrechet(P,Q)=max_{t} d(P(a(t)),Q(b(t)))}}

      \item{Frechet mean is the curve define by the
        sequence of all the center of the segments define by the Frechet
        path \code{[a(t),b(t)]}. If P and
        Q have respectively weight p and q, the center is the weighted mean of
        the segments : $c(t)=(p.a(t)+q.b(t))/(p+q)$.}
  }

  The Frechet distance, path and means can also be define using a sum instead of a max.
}

\value{
  A numeric value.
}

\examples{
traj <- matrix(0,4,5)
traj[1,2] <- 10
traj[2,3] <- 11
traj[3,4] <- 10
traj[4,2] <- 8

matplot(x=1:5,y=t(traj),type="l",col=2:5,lty=1)
m12 <- meanFrechet2(Px=1:5,Py=traj[1,],Qx=1:5,Qy=traj[2,])
m34 <- meanFrechet2(Px=1:5,Py=traj[3,],Qx=1:5,Qy=traj[4,])
lines(m12,col=2,lwd=3)
lines(m34,col=2,lwd=3)

m1234 <- meanFrechet2(Px=m12$times,Py=m12$traj,Qx=m34$times,Qy=m34$traj)
lines(m1234,col=1,lwd=5)
}

