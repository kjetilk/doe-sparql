\name{timeQuery}
\alias{timeQuery}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
timeQuery(endpoint, query, ..., curlh = getCurlHandle())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{endpoint}{
%%     ~~Describe \code{endpoint} here~~
}
  \item{query}{
%%     ~~Describe \code{query} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
  \item{curlh}{
%%     ~~Describe \code{curlh} here~~
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
function (endpoint, query, ..., curlh = getCurlHandle()) 
{
    getForm(c(endpoint), query = query, ..., curl = curlh)
    info <- getCurlInfo(curlh)
    list(endpoint = info$total.time - info$namelookup.time, connection = info$connect.time - 
        info$namelookup.time, firstbyte = info$starttransfer.time - 
        info$connect.time, alldata = info$total.time - info$starttransfer.time)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
