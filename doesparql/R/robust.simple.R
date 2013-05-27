robust.simple <-
function(model, control = "Implement",
                   inactive = c("Machine", "Range"),
                   pairwise=FALSE, ...) {
  fm <- as.formula(paste("experiments ~", control, " * ", paste(inactive, collapse=" * ")))
  allmeans <- aggregate(fm, data=model, mean)
  t.test(allmeans[allmeans[control] == 2,]$experiments,
         allmeans[allmeans[control] == 1,]$experiments,
         alternative="less")
}
