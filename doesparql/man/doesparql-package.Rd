\name{doesparql-package}
\alias{doesparql-package}
\alias{doesparql}
\docType{package}
\title{SPARQL Evaluations using Design of Experiments}
\description{The R code needed to run the experiments in the study titled "Introducing Statistical Design of Experiments to SPARQL Endpoint Evaluation" by Kjernsmo & Tyssedal, to reproduce the study. It also contains some utility functions, as well as code to do the actual timings.}
\details{
\tabular{ll}{
Package: \tab doesparql\cr
Type: \tab Package\cr
Version: \tab 1.01\cr
Date: \tab 2013-05-31\cr
License: \tab MIT\cr
}
At present, quite a lot of manual interaction with computer systems is
required to run the experiment. This is due to the fact that several
endpoints has to be set up, which possibly required building and
configuration. This has not yet been automated to any great extent.

However, not a lot of this interaction happens in R. In the examples
below, the experiment is designed, and then only
\code{\link{sparqlEval}} is needed to actually run the experiment once
the endpoints are running.

For the details beyond the R package, see
\url{https://github.com/kjetilk/doe-sparql/blob/master/README.md}

Once the experiment is finished, hypothesis tests can be run with
\code{\link{robust.simple}} and \code{\link{robust.pairwise}}. Then,
plots can be made with \code{DanielPlot}, which can be found in the FrF2
package. Note that we made some changes to the latter function, but have
not yet found a good way to publish that patch.

The above code is of general interest, it is likely to work well with
much larger experiments than the present. 

However, functions such as \code{\link{fulllm}} (to create a linear
model with the 8 factors we used),
\code{\link{implementation.coef}} and to a lesser extent
\code{\link{coefsorted}} are shortcuts for this particular experiment
and is unlikely to be very useful for other studies.

The \code{\link{timeQuery}} function, on the other hand, is likely to be
of use in studies that time queries, also in other cases than DoE.

In the below examples, we show the basic operation of the R code.


}
\author{
Kjetil Kjernsmo

Maintainer: Kjetil Kjernsmo <kjekje@ifi.uio.no>
}
\references{
}
\keyword{ DoE }
\seealso{
}
\examples{
library(DoE.base)
sparqltest.random.design <- fac.design(nlevels = 2, nfactors = 8,
                                             factor.names = c("Implement", "TripleC", "Machine", "BGPComp", "Lang", "Range", "Union", "Optional"))
library(FrF2)
frac32.design <- FrF2(nruns=32, factor.names=c("Implement", "TripleC", "Machine", "BGPComp", "Lang", "Range", "Union", "Optional"), estimable=formula("~Implement + TripleC+Machine+BGPComp+Lang+Range+Union+Optional + Implement:(TripleC+Machine+BGPComp+Lang+Range+Union+Optional)"), default.levels=c(1,2))

frac64.design <- FrF2(nruns=64, factor.names=c("Implement", "TripleC", "Machine", "BGPComp", "Lang", "Range", "Union", "Optional"), estimable=formula("~Implement + TripleC+Machine+BGPComp+Lang+Range+Union+Optional + Implement:(TripleC+Machine+BGPComp+Lang+Range+Union+Optional)"), default.levels=c(1,2))

\dontrun{
fullexperiment <- sparqlEval(sparqltest.random.design)
run64experiment <- sparqlEval(frac64.design)
run32experiment <- sparqlEval(frac32.design)
robust.single(run32experiment)
run32experimentlm <- fulllm(run32experiment)
DanielPlot(run32experimentlm)
}
}
