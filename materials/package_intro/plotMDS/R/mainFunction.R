#' Plots the results of a multidimensional scaling analysis for a DESeqTransform object.
#'
#' @description
#' This function inputs a \code{\link{DESeqTransform}} object, runs an MDS analysis
#' and plots the result.
#' @param rld A \code{\link{DESeqTransform}} object.
#' @export
#' @import DESeq2
#' @importFrom SummarizedExperiment assay
#' @importFrom ggplot2 ggplot aes geom_point labs
#' @author Alejandro Reyes
#' @keywords MDS
#' @return A \code{\link{ggplot}} object.
#' @examples
#' library(DESeq2)
#' dds <- makeExampleDESeqDataSet(betaSD=1)
#' rld <- rlog(dds)
#' plotMDS(rld)

plotMDS <- function( rld ){
  stopifnot( is( rld, "DESeqTransform" ) )
  d <- dist( t( assay(rld) ) )
  mdsResult <- cmdscale( d )
  mdsResult <- as.data.frame( mdsResult )
  colnames( mdsResult ) <- sprintf( "coord%d", seq_len(ncol(mdsResult)))
  mdsResult$condition <- colData(rld)$condition
  pl <- ggplot( mdsResult, aes(coord1, coord2, col=condition)) +
    geom_point() + labs(x="Coordinate 1", y="Coordinate 2")
  pl
}

