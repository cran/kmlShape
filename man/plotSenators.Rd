\name{plotSenators}
\alias{plotSenators}
\title{
  ~ Function: plotSenators ~
}
\description{
   Plot the senators hold a an \code{linkS4class{Clds}} object.
}
\usage{
   plotSenators(x, col = 2:7, lty = 1:5, lwd=1, add = FALSE,main="", xlab="Times",ylab="")
}

\arguments{
  \item{x}{[\code{\linkS4class{Clds}}] Object holding the senators.}
  \item{col}{[\code{vector(numeric)}] or [\code{vector(character)}]:
    vector that define the trajectories' colors. If the length of the
    vector is one, then its value is duplicated.}
  \item{lty}{[\code{numeric}]: lines type.}
  \item{lwd}{[\code{numeric}]: lines width.}
  \item{add}{[\code{logical}]: shall the function start a new graph
    (add=FALSE) or add the lines to the current graph (add=TRUE) ?}
  \item{main}{[\code{character}]: main title of the graphical display.}
  \item{xlab}{[\code{character}]: x label of the graphical display.}
  \item{ylab}{[\code{character}]: y label of the graphical display.}
}

\details{
   Plot the senators hold a an \code{linkS4class{Clds}} object.
}
\value{
  A graph.
}

\examples{
data(ictusShort)
myClds <- cldsWide(ictusShort)
reduceTraj(myClds,nbSenators=4)
plotSenators(myClds)
reduceTraj(myClds,nbSenators=32)
plotSenators(myClds)
}
