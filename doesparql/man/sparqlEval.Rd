\name{sparqlEval}
\alias{sparqlEval}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
sparqlEval(design, path = "experiment/")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{design}{
%%     ~~Describe \code{design} here~~
}
  \item{path}{
%%     ~~Describe \code{path} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
function (design, path = "experiment/") 
{
    if (!inherits(design, "design")) {
        stop("Argument 'design' has to be a design object or an object of a subclass")
    }
    facnames <- factor.names(design)
    files <- lapply(seq_along(facnames), function(i, factors, 
        justnames) {
        sapply(factors[[i]], loadexperiment, name = justnames[i], 
            path = path)
    }, factor = facnames, justnames = names(facnames))
    experiments <- apply(design, 1, experiment, files = files)
    cbind(design, experiments)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
