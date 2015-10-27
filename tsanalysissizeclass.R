get_data <- function(){
  data <- read.csv("surveys.csv")
  return(data)
}


git_size_class <- function(weight,data){
  if(weight>data){
    size_class <- "large"
  }
  else{
    size_class <- "small"
  }
  return(size_class)
}
