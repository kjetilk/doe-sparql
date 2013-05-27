\name{compose}
\alias{compose}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Help composing experiment.
}
\description{
This function just extracts the right part of the files. It is not of
interest to users.
}
\usage{
compose(factor, type)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{factor}{
The present factor.
}
  \item{type}{
The type of the experimental factor.
}
}
\value{
Returns the correct part of the file if it is of the right type, NA otherwise.
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
function (factor, type) 
{
    file <- factor$files[, unlist(factor$files["level", ]) == 
        factor$run]
    if (file[[type]]) {
        file$content[-1]
    }
    else {
        NA
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
