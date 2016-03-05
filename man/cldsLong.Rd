\name{cldsLong}
\alias{cldsLong}

\title{
  ~ Function: cldsLong ~
}
\description{
  Turn trajectories in long format into an object of class \code{\linkS4class{Clds}}.
}
\usage{
  cldsLong(trajLong)
}
\arguments{
  \item{trajLong}{\code{[data.frame]}: the trajectories, in long
    format. The trajectories have to have (no choice) th following format:
    the first column is the identifier; the second is the time measurement
    ; the third is the values.
  }
}

\details{
  Turn trajectories in long format into an object of class
  \code{\link{Clds-class}}.
}

\value{
  Object of class \code{\linkS4class{Clds}}.
}

\examples{

### Some artificial data
g <- function(x)dnorm(0:100,runif(1,25,75),10)*rnorm(1,5,1)
dn <- data.frame(id=rep(1:200,each=101),
   times=rep((0:100)/10,times=20),
   traj=as.numeric(sapply(1:200,g))
)

### clds format
myClds <- cldsLong(dn)
plotTraj(myClds)

}
