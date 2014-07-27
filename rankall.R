rankall <- function(outcome, num = "best") {
  ## Read outcome data
  oc <- read.csv("outcome-of-care-measures.csv", colClasses="character", na.strings="Not Available")
  ## Check that state and outcome are valid
  
  if ((outcome != "heart attack") & (outcome != "heart failure") & (outcome != "pneumonia")){
    stop("invalid outcome")
  }
  ## For each state, find the hospital of the given rank
  if (outcome == "heart attack"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
  }
  if (outcome == "heart failure"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
  }
  if (outcome == "pneumonia"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  }
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  newx <- x[order(x[,2]),]
  #names(newx) <- c("hospital", "state", "rank")
  if (num=="best"){
    t <- data.frame(newx[,1], newx[,2])
  }
  else  
    if (num=="worst"){
      t <- data.frame(newx[,1], newx[,2])
    }
  else{
    t <- data.frame(newx[,1], newx[,2])
  }
  names(t) = c("hospital", "state")
  t
}