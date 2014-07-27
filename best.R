best <- function(state, outcome) {
  ## Read outcome data
  oc <- read.csv("outcome-of-care-measures.csv", colClasses="character", na.strings="Not Available")
  ## Check that state and outcome are valid
  sn <- oc[, 7]
  if (!(state %in% sn)){
    stop("invalid state")
  }
  
  if ((outcome != "heart attack") & (outcome != "heart failure") & (outcome != "pneumonia")){
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  if (outcome == "heart attack"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
  }
  if (outcome == "heart failure"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
  }
  if (outcome == "pneumonia"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  }
  ## rate
  if (nrow(x) == 0){
    
  }
  newx <- x[order(x[,2]),]
  newx[1,1]  
}
