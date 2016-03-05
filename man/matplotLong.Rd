\name{matplotLong}
\alias{matplotLong}
\title{~ Function: matplotLong ~}
\description{
Plot some longitudinal data in long format.
}
\usage{
  matplotLong(trajLong, col = 1:6, lty = 1:5, lwd=1, add = FALSE,
     main="", xlab="Times",ylab="",pourcent=NA)
}

\arguments{
  \item{trajLong}{[\code{data.frame}]:
    trajectories in long format. The \code{data.frame} has to be
    (no choice!) in the following format: the first column should be the individual
    indentifiant. The second should be the times at which the measurement
    are made. The third one should be the measurement.}
  \item{col}{[\code{vector(numeric)}] or [\code{vector(character)}]:
    vector that define the trajectories' colors. If the length of the
    vector is one, \code{col} is duplicated.}
  \item{lty}{[\code{numeric}]: lines type.}
  \item{lwd}{[\code{numeric}]: lines width.}
  \item{add}{[\code{logical}]: shall the function start a new graph
    (add=FALSE) or add the lines to the current graph (add=TRUE) ?}
  \item{main}{[\code{character}]: main title.}
  \item{xlab}{[\code{character}]: x label.}
  \item{ylab}{[\code{character}]: y label.}
  \item{pourcent}{[\code{numeric}]: if pourcent is not NA, then a legend
  is added on the top of the graph. The legend takes the values given by
  the vecteur \code{pourcent}.}
}

\details{
    Plot some longitudinal data in long format. Only the color and the
    lines width can be modifid by the user.
}
\value{
    A graph.
}

\examples{
### Preparing data
g <- function(x)dnorm(x,3)+dnorm(x,7)+x/10
dn <- data.frame(id=rep(1:20,each=101),
    times=rep((0:100)/10,times=20),
    traj=rep(g((0:100)/10),20)+rep(runif(20),each=101)+rnorm(20*101,,0.1))

### matplotLong
matplotLong(dn)

### matplotLong with a legend
matplotLong(dn,col=2:3,pourcent=c(0.50,0.50))
}