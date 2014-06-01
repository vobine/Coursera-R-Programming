rankhospital <- function(state, outcome, num='best') {
  ## Read outcome data
  outcomes <- read.csv ('ProgAssignment3-data/outcome-of-care-measures.csv',
                        colClasses = 'character');

  ## Check that state and outcome are valid
  outcomeCodes = list ('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23);
  outcomeCol = outcomeCodes[[outcome]];
  if (is.null (outcomeCol)) {
    stop ('invalid outcome');
  }

  myOutcomes <- outcomes[outcomes$State == state,];
  if (nrow (myOutcomes) < 1) {
    stop ('invalid state');
  }
  
  ## Convert the outcome column
  myOutcomes[, outcomeCol] <- as.numeric (myOutcomes[, outcomeCol]);

  ## Rank outcomes
  ranks <- order (myOutcomes[, outcomeCol], as.character (myOutcomes$Hospital.Name))

  ## Convert special-case rank values
  if (num == 'best') {
    index <- 1
  } else if (num == 'worst') {
    index <- length (ranks)
  } else {
    index <- as.numeric (num)
  }
  
  # Release the result
  return (myOutcomes$Hospital.Name[ranks[index]])
}
