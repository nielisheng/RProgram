getwd()
setwd("C:/R/RProgram")
dir()

outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
head(outcome)
ncol(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
outcome[, 11]
hist(outcome[, 11])

x <- outcome[, 7]
y <- "TX"
y %in% x

oc <- read.csv("outcome-of-care-measures.csv", colClasses="character", na.strings="Not Available")

x <- subset(oc, oc[, 7]=="TX", select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
x <- subset(oc, oc[, 7]=="NY", select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
x <- subset(oc, !is.na("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"),select=c(Hospital.Name, State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))

y <- !is.na(x$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")

y
x

head(x, 1)
x <- sort(x, partial=c(1), decreasing=FALSE)
require(stats)
x <- sort(x, method="sh", index.return=TRUE)
newx <- x[order(x[,2]),]
newx[1,1]
names(x)
