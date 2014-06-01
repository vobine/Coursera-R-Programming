best <- function(state, outcome) {
  ## Read outcome data
  outcomes <- read.csv ('ProgAssignment3-data/outcome-of-care-measures.csv',
                        colClasses = 'character');

  ## Check that state and outcome are valid
  myOutcomes <- outcomes[outcomes$State == state,];
  if (nrow (myOutcomes) < 1) {
    stop ('invalid state');
  }
  
  outcomeCodes = list ('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23);
  outcomeCol = outcomeCodes[[outcome]];
  if (is.null (outcomeCol)) {
    stop ('invalid outcome');
  }

  ## Convert the outcome column
  myOutcomes[, outcomeCol] <- as.numeric (myOutcomes[, outcomeCol]);

  ## Return hospital name in that state with lowest 30-day death rate
  minimum <- min (myOutcomes[, outcomeCol], na.rm=TRUE)
  candidates <- myOutcomes[myOutcomes[, outcomeCol] == minimum, ];
  return (min (as.character (candidates$Hospital.Name[!is.na (myOutcomes[, outcomeCol])]),
               na.rm=TRUE))
}