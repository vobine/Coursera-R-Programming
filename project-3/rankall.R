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

  ## Convert outcome columns
  outcomes[, outcomeCol] <- as.numeric (outcomes[, outcomeCol]);

  ## Ranking function for each state
  rankEach <- function (data) {
    ## Rank outcomes
    ranks <- order (data[, outcomeCol], 
                    as.character (data$Hospital.Name), 
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
    return (data$Hospital.Name[ranks[index]])
  }
  
  # Rank each state
  ll <- lapply (split (outcomes, outcomes$State), rankEach)
  data.frame (hospital=unlist(ll), state=names(ll))
}
