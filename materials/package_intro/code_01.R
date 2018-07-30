library(DESeq2)
library(ggplot2)
library(cowplot)

dds <- makeExampleDESeqDataSet(betaSD=1)
rld <- rlog(dds)
plotPCA(rld)

d <- dist( t( assay(rld) ) )
mdsResult <- cmdscale( d )
mdsResult <- as.data.frame( mdsResult )
colnames( mdsResult ) <- sprintf( "coord%d", seq_len(ncol(mdsResult)))
mdsResult$condition <- colData(rld)$condition
pl <- ggplot( mdsResult, aes(coord1, coord2, col=condition)) +
  geom_point() + labs(x="Coordinate 1", y="Coordinate 2")
pl
