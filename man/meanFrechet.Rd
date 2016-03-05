\name{meanFrechet}
\alias{meanFrechet}
\title{~ Function: meanFrechet ~}

\description{
Compute the Frechet mean
}
\usage{
meanFrechet(trajLong, timeScale = 0.1, FrechetSumOrMax = "sum",
   aggregationMethod = "all", shuffle = TRUE, sampleSize = NA, methodHclust = "average")

}
\arguments{
  \item{trajLong}{[\code{data.frame}]:
    trajectories in long format. The data.frame has to be
   (no choice!) in the following format: the first column should be the individual
    indentifiant. The second should be the times at which the measurement
    are made. The third one should be the measurements.}

  \item{timeScale}{[\code{numeric}]: allow to modify the time scale,
    increasing or decreasing the cost of the horizontal shift. If timeScale is
    very big, then the Frechet mean tends to the
    euclidienne distance. If timeScale is very small, then it tends to
    the Dynamic Time Warping.}

  \item{FrechetSumOrMax}{[\code{character}]: Like Frechet's distance,
    the Frechet Mean can
    be define using the 'sum' function or the 'max' function. This option
    let the user to chose one or the other.}

  \item{aggregationMethod}{[\code{character}]: define the agglomerative method used
    to compute the mean. Three methods are
    curently available: "all", "sample" and "hierarchical". See detail.}

  \item{shuffle}{[\code{logical}]: shall the order of the agglomeration
    should be randomly chosen? (only for methods "all" and "sample")}


  \item{sampleSize}{[\code{integer}]: define the size of the sample (for
    method 'sample' only). }

  \item{methodHclust}{[\code{character}]: define the distance between
    two clusters used by the hierarchical clustering. The methods
    available are the one usable by the function
    \code{\link[=stats]{hclust}}}
%  \item{reroll}{[\code{numeric}]: number of time that
%    \code{meansFrechet} shall compute the Frechet's mean. See details.}
%  \item{toPlot}{[\code{logical}]: shall all the curves find by
%    \code{meansFrechet} be graphicaly displayed?}
}

\details{
  Compute the Frechet mean, as define in [1]. The main idea of the algorithm is the following:

The Frechet mean of two trajectories can be easely define as the middle
of the leash that joint the two trajectories (see
\code{\link{meanFrechet2}}).
Then the mean of n individual can be obtain by merging the individual trajectories two by two, then merging
the resulting trajectories and so on until there is only one trajectory
left. This last trajectory is the Frechet mean. Theoriticaly, the final result depend of the order of agglomeration.
In practice, on large sample, this order has little impact on the final result (see [1] for detail).

So far, three agglomeration methods are availables:

  \itemize{
   \item{\code{all}: the n individuals are scattered (randomly if \code{shuffle=TRUE}) on the leaves of a complete binary tree (all the knots have zero or two leaves)
having depth h with 2^h <= n <2^{h+1}. The value of each non-terminal leaf is the Frechet mean for two trajectories of the two children leaves. Frechet mean is thus the value of
the tree root. (Informally, this structure is close to that of a tennis
   tournament). The complexity of this method is  O(nt^2)}.
  \item {\code{sample}: This method is the method \code{all} applied only to a sample of \code{sampleSize} trajectories. The complexity of the method is
  $O(n^0t^2)$, $n^0$ being the size of the random sample.}

\item {\code{hierarchical}: the combination order between individuals is fixed in a deterministic way through an ascending hierarchical classification;
  the closest individuals being combined first. The complexity of this method is $O(n^2t^2)$. }


%\code{meanFrechet} compute the strange mean only once while
 % \code{meansFrechet} compute it several times and select the best results.
}
}

\value{A \code{data.frame} holding a trajectory.}

\seealso{\code{\link{meanFrechet2}}, \code{\link{pathFrechet}}}

\examples{
require(lattice)

### Define artificial data
g <- function(x)dnorm(0:20,runif(1,5,15),2)*rnorm(1,5,1)
dn <- data.frame(id=rep(1:20,each=21),
   times=rep((0:20),times=20),
   traj=as.numeric(sapply(1:20,g)),
   weight=1
)

xyplot(traj ~ times, data=dn, groups=id,type="l",ylim=c(0,1.4))
plot(meanFrechet(dn),ylim=c(0,1.4))
plot(meanFrechet(dn,0.001),ylim=c(0,1.4))
plot(meanFrechet(dn,10),ylim=c(0,1.4))
}

