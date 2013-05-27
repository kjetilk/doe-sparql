\name{loadexperiment}
\alias{loadexperiment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Load experiments from disk
}
\description{
This function loads the experiments from disk. For a user who wants to
just run the experiments that have already been designed, no interaction
should be necessary with this function. Modifications may be necessary
to support other types of experiments.
}
\usage{
loadexperiment(level, name, path)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{level}{
The level for this experiment.
}
  \item{name}{
The factor name for this experiment.
}
  \item{path}{
The prefix path to where the experiment resides on disk.
}
}
\details{
We store details about the experiment in files. This is to enable easy
modification of experiments, it should not be necessary to modify R code
to generate new experiments. That said, it is just a small number of
things that can be done with the current code: It supports the use of
different hostnames, different ports on those hosts, and SPARQL query
fragments that can be a part of a \code{GroupGraphPattern}, i.e. be in
the WHERE clause of a SELECT query.

The file name is constructed from the factor name and the level, e.g. if
the factor name is "Implement" and the level is "1", then the file name
containing the port will be "Implement-1".

To tell the experimental setup what kind of factor it is, use
\code{#~SPARQL} as the first line of a file that contains a
\code{GroupGraphPattern} part, \code{#~ENDPOINT~URL~HOST} for endpoint
hostnames and \code{#~ENDPOINT~URL~PORTPART}.

If none of these are found, this function will complain that it found no
valid file header.
}
\value{
Returns a list containing:
\item{content }{The contents of the corresponding file}
\item{query }{A boolean that is set to \code{true} if the contents is a
  query.}
\item{endpointhost }{A boolean that is set to \code{true} if the
  contents is the hostname of an endpoint.}
\item{endpointportpart }{A boolean that is set to \code{true} if the
  contents is part of the port number of and endpoint.}
\item{type}{A string with further information about the type of
  experiments. Not used anywhere currently.}
\item{level}{The level for this experiment.}
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
