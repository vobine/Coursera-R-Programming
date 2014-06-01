rankall <- function(outcome, num='best') {
  ## Read outcome data
  outcomes <- read.csv ('ProgAssignment3-data/outcome-of-care-measures.csv',
                        colClasses = 'character');

  ## Check that outcome is valid
  outcomeCodes = list ('heart attack' = 11, 
                       'heart failure' = 17,
                       'pneumonia' = 23);
  outcomeCol = outcomeCodes[[outcome]];
  if (is.null (outcomeCol)) {
    stop ('invalid outcome');
  }

  ## Convert state and outcome columns
  outcomes$State <- as.factor (outcomes$State)
  outcomes[, outcomeCol] <- as.numeric (outcomes[, outcomeCol]);

  ## Rank outcomes
  ranks <- order (outcomes[, outcomeCol], 
                  as.character (outcomes$Hospital.Name), 
                  na.last=NA)

  ## Convert special-case rank values
  if (num == 'best') {
    index <- 1
  } else if (num == 'worst') {
    index <- length (ranks)
  } else {
    index <- as.numeric (num)
  }
  
  # Release the result
  return (outcomes$Hospital.Name[ranks[index]])
}
