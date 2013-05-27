fulllm <-
function(results) {
  lm(formula = experiments ~ Implement * TripleC * BGPComp * Lang * Range * Union * Optional * Machine, data = results)
}
