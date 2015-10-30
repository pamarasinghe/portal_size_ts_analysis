# local copy of the code, did changess and commit
get_data <- function(){
  data <- read.csv("surveys1.csv")
  return(data)
}


git_size_class <- function(weight){
  if(weight>50){
    size_class <- "large"
  }
  else{
    size_class <- "small"
  }
  return(size)
}


git_size_class <- function(weight,threshold){
  if(weight>threshold){
    size_class <- "large"
    


  }
  else{
    size_class <- "small"
  }
  return(size)
}

add_size_class <- function(df){
  data_w_size_class <-
  df%>%
  na.omit()%>%
  rowwise()%>%
  mutate(size_clas=get_size_class(weight,50))
return(data_w_size_class)
}


