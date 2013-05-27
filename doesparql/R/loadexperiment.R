loadexperiment <-
function(level, name, path) {
  filename <- paste(path, name, "-", level, sep="")
  expfile <- readLines(filename)
  query <- FALSE
  endpointhost <- FALSE
  endpointportpart <- FALSE
  type <- NA
  if(!(is.na(charmatch("# SPARQL", expfile[1])))) {
    query <- TRUE
    type <- substr(expfile[1], 10, 20)
  }
  else if(!(is.na(charmatch("# ENDPOINT URL HOST", expfile[1])))) {
    endpointhost <- TRUE
    type <- "HOST"
  }
    else if(!(is.na(charmatch("# ENDPOINT URL PORTPART", expfile[1])))) {
    endpointportpart <- TRUE
    type <- "PORTPART"
  }
  else {
    stop("No valid file header (SPARQL / ENDPOINT URL) found")
  }
  list(content = expfile, query = query, endpointhost = endpointhost, endpointportpart=endpointportpart, type = type, level = level)
}
