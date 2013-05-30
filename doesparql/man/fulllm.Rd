\name{fulllm}
\alias{fulllm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Shortcut to create a linear model with all factors.
}
\description{
This is a simple shortcut function to create a linear model with all
factors of the original experiment with all interactions. This is
specific to the published experiment and there are
probably more elegant ways of doing this, but it is included for completeness.
}
\usage{
fulllm(results)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{results}{
The \code{data.frame} containing the results from \code{sparqlEval}.
}
}

\value{
A linear model for the experiment.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Kjetil Kjernsmo
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
function (results) 
{
    lm(formula = experiments ~ Implement * TripleC * BGPComp * 
        Lang * Range * Union * Optional * Machine, data = results)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
