\name{loadexperiment}
\alias{loadexperiment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
loadexperiment(level, name, path)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{level}{
%%     ~~Describe \code{level} here~~
}
  \item{name}{
%%     ~~Describe \code{name} here~~
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
function (level, name, path) 
{
    filename <- paste(path, name, "-", level, sep = "")
    expfile <- readLines(filename)
    query <- FALSE
    endpointhost <- FALSE
    endpointportpart <- FALSE
    type <- NA
    if (!(is.na(charmatch("# SPARQL", expfile[1])))) {
        query <- TRUE
        type <- substr(expfile[1], 10, 20)
    }
    else if (!(is.na(charmatch("# ENDPOINT URL HOST", expfile[1])))) {
        endpointhost <- TRUE
        type <- "HOST"
    }
    else if (!(is.na(charmatch("# ENDPOINT URL PORTPART", expfile[1])))) {
        endpointportpart <- TRUE
        type <- "PORTPART"
    }
    else {
        stop("No valid file header (SPARQL / ENDPOINT URL) found")
    }
    list(content = expfile, query = query, endpointhost = endpointhost, 
        endpointportpart = endpointportpart, type = type, level = level)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
