#Problem 1: Set-up Git
##Git was installed for the operating system,new project was created,git tab appeared.

#Problem 2:First commit
## Local copy of the code, make changes and commit: file intends to calculate average GC-contents for large-eared elves and small-eared elves 

#Problem 3:Importing data
##Download files, commit files, import file and commit changes
sequence_data<-read.csv('houseelf_earlength_dna_data.csv',header = TRUE)

#Problem 4:Multiple files, one commit
sequence_data<-read.csv('houseelf_earlength_dna_data1.csv',header = TRUE)

#Problem 5:Adding a remote
##Account was created on GitHub, Professor has created a repository

#Problem 6:Pushing changes
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

### Test function for sequences
get_gc_content("GGCAT")
get_gc_content(str_to_upper("ggcat"))

### Test function for a vector
sequences <- c("ttgaatgccttacaactgatcattacacaggcggcatgaagcaaaaatatactgtgaaccaatgcaggcg", "gauuauuccccacaaagggagugggauuaggagcugcaucauuuacaagagcagaauguuucaaaugcau", "gaaagcaagaaaaggcaggcgaggaagggaagaagggggggaaacc", "guuuccuacaguauuugaugagaaugagaguuuacuccuggaagauaauauuagaauguuuacaacugcaccugaucagguggauaaggaagaugaagacu", "gauaaggaagaugaagacuuucaggaaucuaauaaaaugcacuccaugaauggauucauguaugggaaucagccggguc")
get_gc_content(str_to_upper(sequences))


#Problem 7:Pulling and pushing
##Problem7.3: new function in my repository
get_size_class <- function(ear_length){
  # Calculate the size class for one or more earth lengths
  ear_lengths <- ifelse(ear_length > 10, "large", "small")
  return(ear_lengths)
}

##Test function
get_size_class(12.2)
get_size_class(5.1)

#Problem 7.4:create a data frame including ear length class and gccontent 
newdata <- sequence_data%>%
  rowwise()%>%
  mutate(ear_lengths= get_size_class(earlength), 
         gccontent = get_gc_content(dnaseq))

results <- select(newdata, id, earlength, gccontent)

#Problem 7.5:Save the data frame as a csv file
write.csv(results,"houseelf_analysis_data.csv")

