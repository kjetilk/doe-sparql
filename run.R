sparqlEval <- function(design, path = "experiment/") {
  if (!inherits(design, "design")) {
    stop("Argument 'design' has to be a design object or an object of a subclass")
  }
  # First get all from files
  facnames <- factor.names(design)
  files <- lapply(seq_along(facnames), function(i, factors, justnames) {
                    sapply(factors[[i]], loadexperiment, name=justnames[i], path=path)
                  },
                  factor=facnames, justnames=names(facnames))
  # Run the experiment by iterating design matrix
  experiments <- apply(design, 1, experiment, files=files)
  cbind(design, experiments)
}

loadexperiment <-  function(level, name, path) {
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

experiment <- function(run, files) {
  thisexperiment <- cbind(run, files)
  # One pass should really suffice here
  querypattern <- apply(thisexperiment, 1, compose, type="query")
  ret <- apply(thisexperiment, 1, compose, type="endpointhost")
  host <- ret[!is.na(ret)]
  if(length(host) == 0) {
    host <- "10.72.1.180"
  }
  if(length(host) > 1) {
    stop("We need exactly one host")
  }
  ports <- apply(thisexperiment, 1, compose, type="endpointportpart")
  endpointurl <- paste('http://', host, ":80", paste(unlist(ports[!is.na(ports)]), collapse=""), "/sparql/", sep="")

  query <- paste("PREFIX dbo: <http://dbpedia.org/ontology/> PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> PREFIX foaf: <http://xmlns.com/foaf/0.1/> PREFIX dbpprop: <http://dbpedia.org/property/> PREFIX skos: <http://www.w3.org/2004/02/skos/core#> PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#> SELECT * WHERE {", paste(unlist(querypattern[!is.na(querypattern)]), collapse=" "), "}")

  while(!(url.exists(endpointurl))) {
    cat("Previous Endpoint URL", endpointurl, "returned error\n")
    ask("Press <RETURN> to test again")
  }
  cat(date(), " Sending ", run, " to ", endpointurl, "\n") 
  timeQuery(endpointurl, query)$endpoint
}

compose <- function(factor, type) {
  file <- factor$files[,unlist(factor$files["level",]) == factor$run]
  if(file[[type]]) {
    file$content[-1]
  } else {
    NA
  }
}
