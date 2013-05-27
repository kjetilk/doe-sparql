experiment <-
function(run, files) {
  thisexperiment <- cbind(run, files)
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
