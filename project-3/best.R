best <- function(state, outcome) {
  ## Read outcome data
  outcomes <- read.csv ('ProgAssignment3-data/outcome-of-care-measures.csv');

  ## Check that state and outcome are valid
  myOutcomes <- outcomes[outcomes[,7] == state,];
  if (nrow (myOutcomes) < 1) {
    stop ('invalid state');
  }
  
  outcomeCodes = list ('heart attack' = 1, 'heart failure' = 2, 'pneumonia' = 3);
  outcomeCol = outcomeCodes[[outcome]];
  if (is.null (outcomeCol)) {
    stop ('invalid outcome');
  }

  ## Return hospital name in that state with lowest 30-day death rate
  
}