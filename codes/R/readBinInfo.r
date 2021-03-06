#' import object of class binInfo.
#'
#' This is the function for importing object of class binInfo.
#' @param in_fn Required. Input file bin_info_*, generated by the main function of moaims when setting output_intmd=T(default).

#' @export
#' @author Yiqian Zhang
#' @examples
#' bin_info_obj=readBinInfo(in_fn = /absolute/path/to/bin_info_*.tsv)


readBinInfo <- function(in_fn=NULL){

  #check required parameters
  if ( is.null(in_fn) ) { stop( "File bin_info_* is required!" ) }
  
  df=read.delim(in_fn,header=F,sep="\t")
  df[,1]=as.character(df[,1])
  df[,2]=as.character(df[,2])
  df[,5]=as.character(df[,5])
  
  
  bin_info_obj <- new( "binInfo", 
                  bin_id=df[,1],
                  chrom=df[,2],
                  start=df[,3],
                  end=df[,4],
                  strand=df[,5]) 
  
  return(bin_info_obj)
  
}


