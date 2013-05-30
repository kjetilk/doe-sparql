coefsorted <-
function(model) {
  sort(abs(coef(model)))
}
