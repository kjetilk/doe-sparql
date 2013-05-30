\name{robust.simple}
\alias{robust.simple}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Perform a single t-test for the entire experiment
}
\description{
This function takes as arguments the \code{data.frame} containing the
results of simulations, the name of the factor that we control, and the
names of the factors we have deemed to be inactive and performs a t-test
under the assumption that we can treat the experiment as a smaller experiment
replicated on the inactive factors.
}
\usage{
robust.simple(model, control = "Implement", inactive = c("Machine", "Range"), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
    A \code{data.frame} containing the results of the experiment.
}
  \item{control}{
    The name of the factor that we control. The default is \code{"Implement"}.
}
  \item{inactive}{
A vector with names of the factors that are deemed to be
inactive. Defaults to \code{c("Machine", "Range")}.

}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Runs a \code{\link{t.test}} which returns a list with class \code{"htest"}.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{

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
function (model, control = "Implement", inactive = c("Machine", 
    "Range"), pairwise = FALSE, ...) 
{
    fm <- as.formula(paste("experiments ~", control, " * ", paste(inactive, 
        collapse = " * ")))
    allmeans <- aggregate(fm, data = model, mean)
    t.test(allmeans[allmeans[control] == 2, ]$experiments, allmeans[allmeans[control] == 
        1, ]$experiments, alternative = "less")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
