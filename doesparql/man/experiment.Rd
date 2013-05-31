\name{experiment}
\alias{experiment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Run a single experiment
}
\description{
Run a single experiment for a certain factor with a certain level and
return the time it took from the DNS lookup finished to the data was
completely transferred. 
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
This function is probably not something one would wish to call directly,
but it is useful to use in iteration of across the design.

At present, it will create a SELECT query, and the prefixes used are hardcoded.
}
\value{
It returns the time it took from the DNS lookup finished to the data was
completely transferred. 
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Kjetil Kjernsmo
}
\note{
It will pause if the endpoint it has been set up to request does not
return anything. It will also log what it does.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
