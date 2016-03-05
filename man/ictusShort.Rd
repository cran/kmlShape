\name{ictusShort}
\alias{ictusShort}
\docType{data}

\title{~ Data: ictusShort ~}

\description{A subset of the longitudinal study ICTUS}

\usage{data("ictusShort")}
\format{
  A data frame with 1374 observations on the following 16 variables.
  \describe{
    \item{\code{id}}{Unique identifier}
    \item{\samp{MMS-1}}{Mini Mental Score at time 1}
    \item{\samp{MMS-2}}{Mini Mental Score at time 2}
    \item{\samp{MMS-3}}{Mini Mental Score at time 3}
    \item{\samp{MMS-4}}{Mini Mental Score at time 4}
    \item{\samp{MMS-5}}{Mini Mental Score at time 5}
    \item{\samp{MMS-6}}{Mini Mental Score at time 6}
    \item{\samp{MMS-7}}{Mini Mental Score at time 7}
    \item{\samp{MMS-8}}{Mini Mental Score at time 8}
    \item{\samp{MMS-9}}{Mini Mental Score at time 9}
    \item{\samp{MMS-10}}{Mini Mental Score at time 10}
    \item{\samp{MMS-11}}{Mini Mental Score at time 11}
    \item{\samp{MMS-12}}{Mini Mental Score at time 12}
    \item{\samp{MMS-13}}{Mini Mental Score at time 13}
    \item{\samp{MMS-14}}{Mini Mental Score at time 14}
    \item{\samp{MMS-15}}{Mini Mental Score at time 15}
  }
}
\details{
Ictus [1, 2] is a cohort of 1380 patients with Alzheimer disease followed-up
in 12 European countries. These patients were included between February 2003
and July 2005 in 29 centres specialized in neurology, geriatrics, psychiatry, or
psycho-geriatrics with a recognized experience in the diagnosis and management
of Alzheimer disease. Most of these patients were seen during memory consultations
and included consecutively. These patients were examined at six-month
intervals over two years. Each examination included (though not exclusively) an
Mini Mental Score (MMS) assessment.

The dataset "ictusShort" is a subset of the cohort Ictus. Since the acces to Ictus is submited to conditions, the original data have been transform before inclusion in the package, but the 
results of the analysis using kmlShape are the same on the real Ictus and ictusShort. 
} 

\references{
\describe{
  \item{[1]}{Reynish, E., Cortes, F., Andrieu, S., Cantet, C., Olde Rikkert, M., Melis,
	R., Froelich, L., Frisoni, G., Jonsson, L., Visser, P., et al., 2007. The ictus
	study: A prospective longitudinal observational study of 1,380 ad patients in
	europe. Neuroepidemiology 29 (1-2), 29-38}
  \item{[2]}{Vellas, B., Hausner, L., Frolich, L., Cantet, C., Gardette, V., Reynish, E.,
	Gillette, S., Aguera-Morales, E., Auriacombe, S., Boada, M., et al., 2012.
	Progression of alzheimer disease in europe: Data from the european ictus
	study. Current Alzheimer Research 9 (8), 902-912.}
  }
}
\examples{
data(ictusShort)
summary(ictusShort)
matplot(t(ictusShort),type="l")
}

\keyword{datasets}
