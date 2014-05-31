best <- function(state, outcome) {
  ## Read outcome data
  outcomes <- read.csv ('ProgAssignment3-data/outcome-of-care-measures.csv');

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

  ## Return hospital name in that state with lowest 30-day death rate
  ## return (myOutcomes[[which.min (myOutcomes[, outcomeCol]), 1]])
  return (as.character (myOutcomes$Hospital.Name[which.min (myOutcomes[, outcomeCol])]))
}