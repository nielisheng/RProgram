source("submitscript3.R")
submit(manual=TRUE)


source("best.R")

best("NY", "pneumonia")
newx
x

source("rankhospital.R")
rankhospital("TX", "heart failure", 4)

source("rankall.R")
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
rankall("pneumonia", "worst")
