\name{sparqlEval}
\alias{sparqlEval}
\title{
Evaluate the SPARQL performance experiment
}
\description{
This function evaluates the experiment, i.e. runs the design supplied
across a directory that contains files that details the actual
experiment that will run.
}
\usage{
sparqlEval(design, path = "experiment/")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{design}{
    The \code{design} object must be supplied results from generating a
    design using DoE.base or FrF2 or some other package generating a
    \code{design} object or subclass thereof.
}
  \item{path}{
    Contains the path prefix to the directory that contains files that
    contain the actual experiment.
}
}
\details{
  This is the main function that is would be run for a user to run the
  experiment. This calls many other functions in the package to do the
  actual work.

  First, it loads the experimental setup from files in the given
  directory. To do this, the files must be named with the factor names
  given in the design, with the level name (normally just a number),
  appended with a dash between.

  For further details on the file format, see \code{loadexperiment}.

  Once the experiments are loaded, this function iterates over the
  design, launching queries and collecting runtimes for each design. For
  more details on the SPARQL query construction, see \code{experiment}. 

}
\value{
  Returns a \code{data.frame} with the design and the timed results in a
  column called \code{experiments}.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Kjetil Kjernsmo
}
\note{
The evaluation will prompt the user if an endpoint defined in the
experimental files is not returning a valid response to allow for
external setup on runtime.

However, since it is awkward to manually intervene for every run, we had
all endpoints running at the same time. This is a weakness of the setup,
as it could cause unexpected side effects. This is a topic that should
be fixed in the future.

The present code is quite flexible, and should extend to larger and more
advanced experiments quite easily, but some changes would be necessary.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
