biocLite("ShortRead")
library("ShortRead")

install.packages("stringr")
library("stringr")

install.packages("dplyr")
library("dplyr")

##determine GC contents
get_gc_content <- function(dnaseq){
  
  # gs and cs are the number of gs and cs in the given sequence
  gs <- str_count(dnaseq,'G')
  cs <- str_count(dnaseq,'C')
  
  # gc content is the percentage of bases that are gs or cs   
  gccontent <- (((gs+cs)/str_count(dnaseq))*100)
  return(gccontent)
}



