coef.sorted <-
function(model) {
  sort(abs(coef(model)))
}
