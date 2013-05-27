\name{experiment}
\alias{experiment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
experiment(run, files)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{run}{
%%     ~~Describe \code{run} here~~
}
  \item{files}{
%%     ~~Describe \code{files} here~~
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
function (run, files) 
{
    thisexperiment <- cbind(run, files)
    querypattern <- apply(thisexperiment, 1, compose, type = "query")
    ret <- apply(thisexperiment, 1, compose, type = "endpointhost")
    host <- ret[!is.na(ret)]
    if (length(host) == 0) {
        host <- "10.72.1.180"
    }
    if (length(host) > 1) {
        stop("We need exactly one host")
    }
    ports <- apply(thisexperiment, 1, compose, type = "endpointportpart")
    endpointurl <- paste("http://", host, ":80", paste(unlist(ports[!is.na(ports)]), 
        collapse = ""), "/sparql/", sep = "")
    query <- paste("PREFIX dbo: <http://dbpedia.org/ontology/> PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> PREFIX foaf: <http://xmlns.com/foaf/0.1/> PREFIX dbpprop: <http://dbpedia.org/property/> PREFIX skos: <http://www.w3.org/2004/02/skos/core#> PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#> SELECT * WHERE {", 
        paste(unlist(querypattern[!is.na(querypattern)]), collapse = " "), 
        "}")
    while (!(url.exists(endpointurl))) {
        cat("Previous Endpoint URL", endpointurl, "returned error\n")
        ask("Press <RETURN> to test again")
    }
    cat(date(), " Sending ", run, " to ", endpointurl, "\n")
    timeQuery(endpointurl, query)$endpoint
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
