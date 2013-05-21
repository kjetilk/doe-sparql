library(RCurl)

#h = getCurlHandle()

timeQuery <- function(endpoint, query, ..., curlh = getCurlHandle()) {
  getForm(c(endpoint), query=query, ..., curl = curlh)
  info <- getCurlInfo(curlh)
  list(
       endpoint = info$total.time - info$namelookup.time,
       connection = info$connect.time - info$namelookup.time,
       firstbyte = info$starttransfer.time - info$connect.time,
       alldata = info$total.time - info$starttransfer.time
       )
}

#timeQuery("http://dbpedia.org/sparql", "SELECT * WHERE { ?concept a skos:Concept } LIMIT 100");
#timeQuery("http://kjekje-vm:8890/sparql", "SELECT * WHERE { ?concept a skos:Concept } LIMIT 100");

    
