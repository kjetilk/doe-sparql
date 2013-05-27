compose <-
function(factor, type) {
  file <- factor$files[,unlist(factor$files["level",]) == factor$run]
  if(file[[type]]) {
    file$content[-1]
  } else {
    NA
  }
}
