sparqlEval <-
function(design, path = "experiment/") {
  if (!inherits(design, "design")) {
    stop("Argument 'design' has to be a design object or an object of a subclass")
  }
  facnames <- factor.names(design)
  files <- lapply(seq_along(facnames), function(i, factors, justnames) {
                    sapply(factors[[i]], loadexperiment, name=justnames[i], path=path)
                  },
                  factor=facnames, justnames=names(facnames))
  experiments <- apply(design, 1, experiment, files=files)
  cbind(design, experiments)
}
