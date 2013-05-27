implementation.coef <-
function(model) {
  coef(model)[grep("Implement", names(coef(model)))]
}
