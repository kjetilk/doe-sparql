robust.pairwise <-
function(model, control = "Implement", 
                            noise = c("TripleC", "BGPComp", "Lang", "Union", "Optional")) {
  fm <- as.formula(paste("~", paste(noise, collapse=" * ")))
  dlply(model, fm, function(subset) {
    t.test(subset[subset[control] == 2,]$experiments,
           subset[subset[control] == 1,]$experiments,
           alternative="less")
  })
}
