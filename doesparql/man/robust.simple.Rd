\name{robust.simple}
\alias{robust.simple}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
robust.simple(model, control = "Implement", inactive = c("Machine", "Range"), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
%%     ~~Describe \code{model} here~~
}
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{inactive}{
%%     ~~Describe \code{inactive} here~~
}
  \item{pairwise}{
%%     ~~Describe \code{pairwise} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
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
function (model, control = "Implement", inactive = c("Machine", 
    "Range"), pairwise = FALSE, ...) 
{
    fm <- as.formula(paste("experiments ~", control, " * ", paste(inactive, 
        collapse = " * ")))
    allmeans <- aggregate(fm, data = model, mean)
    t.test(allmeans[allmeans[control] == 2, ]$experiments, allmeans[allmeans[control] == 
        1, ]$experiments, alternative = "less")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
