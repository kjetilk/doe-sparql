sparqltest.design <- cross.design(
                                  fac.design(nlevels = 2, nfactors = 3,
                                             factor.names = c("Implement", "TripleC", "Machine"), randomize = F),
                                  fac.design(nlevels = 2, nfactors = 5,
                                             factor.names = c("BGPComp", "Lang", "Range", "Union", "Optional")),
                                  randomize = F)

sparqltest.sans.machine.design <- cross.design(
                                  fac.design(nlevels = 2, nfactors = 2,
                                             factor.names = c("Implement", "TripleC"), randomize = F),
                                  fac.design(nlevels = 2, nfactors = 5,
                                             factor.names = c("BGPComp", "Lang", "Range", "Union", "Optional")),
                                  randomize = F)

sparqltest.random.design <- fac.design(nlevels = 2, nfactors = 8,
                                             factor.names = c("Implement", "TripleC", "Machine", "BGPComp", "Lang", "Range", "Union", "Optional"))

frac32.design <- FrF2(nruns=32, factor.names=c("Implement", "TripleC", "Machine", "BGPComp", "Lang", "Range", "Union", "Optional"), estimable=formula("~Implement + TripleC+Machine+BGPComp+Lang+Range+Union+Optional + Implement:(TripleC+Machine+BGPComp+Lang+Range+Union+Optional)"), default.levels=c(1,2))

frac64.design <- FrF2(nruns=64, factor.names=c("Implement", "TripleC", "Machine", "BGPComp", "Lang", "Range", "Union", "Optional"), estimable=formula("~Implement + TripleC+Machine+BGPComp+Lang+Range+Union+Optional + Implement:(TripleC+Machine+BGPComp+Lang+Range+Union+Optional)"), default.levels=c(1,2))
