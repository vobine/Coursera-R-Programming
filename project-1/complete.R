complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  coco = data.frame ()
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  for (i in seq_along (id)) {
    data = read.csv (file.path (directory, sprintf ('%03d.csv', id[i])))
    coco[i, "id"] = id[i]
    coco[i, "nobs"] = sum (complete.cases (data))
  }
  
  return (coco)
}
