#Problem 2
## REVIEW with House-elves:calcuatae average GC-contents for large-eared elves and small-eared elves 
biocLite("ShortRead")
library("ShortRead")

install.packages("stringr")
library("stringr")


sequence_data<-read.csv('houseelf_earlength_dna_data.csv',header = TRUE)


install.packages("dplyr")
library("dplyr")

##determine size category
get_ear_size <- function(earlength){
  if (earlength <= 10){
    earsize <- "small"
  }else if (earlength > 10){
    earsize <- "large"
  }
  return(earsize) 
}

### Test function
get_ear_size(12.2)
get_ear_size(5.1)


##determine GC contents
get_gc_content <- function(dnaseq){
  
  # gs and cs are the number of gs and cs in the given sequence
  gs <- str_count(dnaseq,'G')
  cs <- str_count(dnaseq,'C')
  
  # gc content is the percentage of bases that are gs or cs   
  gccontent <- (((gs+cs)/str_count(dnaseq))*100)
  return(gccontent)
}

### Test function
get_gc_content("GGCAT")


## Store infomation in a table by creating a new dataframe including earsize and gccontent 
newdata <- sequence_data %>%
  rowwise()%>%
  mutate(earsize = get_ear_size(earlength),
         gccontent = get_gc_content(dnaseq))

results1 <- select(newdata, id, earsize, gccontent)


##Exports this table to a CSV 

write.csv(results1,"grangers_analysis.csv")

## Print average GC contents for large-eared elves and small-eared elves 
by_earsize <- group_by(results1,earsize)
avg_gc_content <- summarize(by_earsize,avg_gc_content = mean(gccontent))
avg_gc_content
