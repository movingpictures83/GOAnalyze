###################################################
### code chunk number 12: goanalysis
###################################################
library(gage)
library(gageData)
data(go.sets.hs)
data(go.subs.hs)

input <- function(inputfile) {
   cnts.norm <<- read.csv(inputfile)
}

run <- function() {}

output <- function(outputfile) {
	ref.idx=5:8
samp.idx=1:4

#write.csv(go.subs.hs, "subs.csv")
lapply(go.subs.hs, head)
#Molecular Function analysis is quicker, hence run as demo
cnts.mf.p <- gage(cnts.norm, gsets = go.sets.hs[go.subs.hs$MF],
    ref = ref.idx, samp = samp.idx, compare ="unpaired")
#Biological Process analysis takes a few minutes if you try it
#cnts.bp.p <- gage(cnts.norm, gsets = go.sets.hs[go.subs.hs$BP],
#    ref = ref.idx, samp = samp.idx, compare ="unpaired")


###################################################
### code chunk number 13: goresults
###################################################
for (gs in rownames(cnts.mf.p$less)[1:3]) {
    outname = paste(outputfile, gsub(" |:|/", "_", substr(gs, 12, 100)), sep="/")
    geneData(genes = go.sets.hs[[gs]], exprs = cnts.norm, ref = ref.idx,
        samp = samp.idx, outname = outname, txt = T, heatmap = T,
        limit = 3, scatterplot = T)
}
}
