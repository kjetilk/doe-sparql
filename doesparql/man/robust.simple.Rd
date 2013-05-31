\name{robust.simple}
\alias{robust.simple}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Perform a single t-test for the entire experiment
}
\description{
This function takes as arguments the \code{data.frame} containing the
results of simulations, the name of the factor that we control, and the
names of the factors we have deemed to be inactive and performs a t-test
under the assumption that we can treat the experiment as a smaller experiment
replicated on the inactive factors.
}
\usage{
robust.simple(model, control = "Implement", inactive = c("Machine", "Range"), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
    A \code{data.frame} containing the results of the experiment.
}
  \item{control}{
    The name of the factor that we control. The default is \code{"Implement"}.
}
  \item{inactive}{
A vector with names of the factors that are deemed to be
inactive. Defaults to \code{c("Machine", "Range")}.

}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Runs a \code{\link{t.test}} which returns a list with class \code{"htest"}.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Kjetil Kjernsmo
}
\note{

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
