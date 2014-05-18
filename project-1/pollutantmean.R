pollutantmean <- function(directory, pollutant, id = 1:332) {
  dataSum = 0
  dataCount = 0
  for (i in id) {
    data = read.csv (file.path (directory, sprintf ('%03d.csv', i)))
    dataMask = ! is.na (data[, pollutant])
    dataSum = dataSum + sum (data[dataMask, pollutant])
    dataCount = dataCount + sum (dataMask)
  }
  
  return (dataSum / dataCount)
}