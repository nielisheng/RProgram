rankhospital <- function(state, outcome, num = "best") {
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
  ## Return hospital name in that state with the given rank
  if (outcome == "heart attack"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
  }
  if (outcome == "heart failure"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
  }
  if (outcome == "pneumonia"){
    x <- subset(oc, !is.na(oc$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  }
  ## 30-day death rate
  newx <- x[order(x[,2]),]

  if (num=="best"){
    newx[1,1]
  }
  else  
  if (num=="worst"){
    newx[nrow(newx),1]
  }
  else{
    newx[num,1]   
  }
}