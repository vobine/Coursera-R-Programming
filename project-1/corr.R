corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  coco = complete (directory)
  result = numeric (sum (coco[, "nobs"] > threshold))
  files = coco[coco[, "nobs"] > threshold, "id"]
  for (f in seq_along (files)) {
    data = read.csv (file.path (directory, sprintf ("%03d.csv", files[f])))
    cleanData = data[complete.cases(data),]
    result[f] = cor(cleanData[,"sulfate"], cleanData[,"nitrate"])
  }
  
  return (result)
}
