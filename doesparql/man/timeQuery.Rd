\name{timeQuery}
\alias{timeQuery}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Use curl to time a query against a certain SPARQL endpoint.
}
\description{
This function acts as an SPARQL client and sends a HTTP request with a
query to a SPARQL endpoint, and uses facilities provided by the RCurl
library to time the query.
}
\usage{
timeQuery(endpoint, query, ..., curlh = getCurlHandle())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{endpoint}{
The URL of the SPARQL Query Endpoint Service.
}
  \item{query}{
A string with the full query.
}
  \item{\dots}{
Any other arguments to pass to RCurl's \code{getForm} function. 
}
\item{curlh}{
  \code{curlh} is set by default to \code{getCurlHandle()}. It is unlikely that
  this should change.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  A list with the following elements:
\item{endpoint}{The time from the DNS lookup finishes to the full body
  of the message has been returned to the client. This best represents
  the full work of the endpoint, but has the weakness of being sensitive
to network latency and speed.}
\item{connection }{The time from the DNS lookup finishes to the
  connection has been established. This is mostly interesting to see if
  an endpoint is slow to make a first response.}
\item{firstbyte }{The time from the connection is established to data is
starting to be returned. In a streaming environment, that the endpoint
starts the response before having computed the entire result set might
be interesting.}
\item{alldata}{The time between the first data is returned to the whole
  result is returned. This measures the data transfer, and not
  necessarily the endpoint performance as it depends highly on the network.}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Kjetil Kjernsmo
}
\note{
RCurl/curl provides facilities for reading other timings than have been
returned here. These are believed by the author to be the most relevant
to the problem, but others may be considered for inclusion if needed by others.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
timeQuery("http://dbpedia.org/sparql", "SELECT * WHERE { ?concept a skos:Concept } LIMIT 100")
}
