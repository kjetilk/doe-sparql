coef.sorted <- function(model) {
  sort(abs(coef(model)))
}

implementation.coef <- function(model) {
  coef(model)[grep("Implement", names(coef(model)))]
}

fulllm <- function(results) {
  lm(formula = experiments ~ Implement * TripleC * BGPComp * Lang * Range * Union * Optional * Machine, data = results)
}

robust.simple <- function(model, control = "Implement",
                   inactive = c("Machine", "Range"),
                   pairwise=FALSE, ...) {
  fm <- as.formula(paste("experiments ~", control, " * ", paste(inactive, collapse=" * ")))
  allmeans <- aggregate(fm, data=model, mean)
  t.test(allmeans[allmeans[control] == 2,]$experiments,
         allmeans[allmeans[control] == 1,]$experiments,
         alternative="less")
}

robust.pairwise <- function(model, control = "Implement", 
                            noise = c("TripleC", "BGPComp", "Lang", "Union", "Optional")) {
  fm <- as.formula(paste("~", paste(noise, collapse=" * ")))
  dlply(model, fm, function(subset) {
    t.test(subset[subset[control] == 2,]$experiments,
           subset[subset[control] == 1,]$experiments,
           alternative="less")
  })
}
 
