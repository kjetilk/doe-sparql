\name{robust.pairwise}
\alias{robust.pairwise}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Performs t-tests for each pair of the control factor
}
\description{
This function takes as arguments the \code{data.frame} containing the
results of simulations, the name of the factor that we control, and the
names of the factors that are active, but not controlable. For each
combination of latter factors we do a
t-test between the control levels based on the remaining data. 
}
\usage{
robust.pairwise(model, control = "Implement", noise = c("TripleC", "BGPComp", "Lang", "Union", "Optional"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
    A \code{data.frame} containing the results of the experiment.
}
  \item{control}{
    The name of the factor that we control. The default is \code{"Implement"}.
}
  \item{noise}{
A vector with names of the factors that are active but
uncontrollable. Defaults to \code{c("TripleC", "BGPComp", "Lang",
  "Union", "Optional")}. Such factors may also be called noise or
environmental factors.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Runs a \code{\link{t.test}} for every possible combination and returns a
list of list with class  \code{"htest"}.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (model, control = "Implement", noise = c("TripleC", 
    "BGPComp", "Lang", "Union", "Optional")) 
{
    fm <- as.formula(paste("~", paste(noise, collapse = " * ")))
    dlply(model, fm, function(subset) {
        t.test(subset[subset[control] == 2, ]$experiments, subset[subset[control] == 
            1, ]$experiments, alternative = "less")
    })
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
