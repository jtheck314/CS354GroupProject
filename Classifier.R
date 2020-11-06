#File:Classifier.R


mean.stdv.frame <- as.data.frame(fromJSON(file = "MeanStdDevCR.json"))

#Vector of Functions for normal distribution
danceProb <- function(danceValue){
  dnorm(x=danceValue,
        mean=mean.stdv.frame$danceMean, 
        sd=mean.stdv.frame$danceStdDev)
}
energyProb <- function(energyValue){
  dnorm(x=danceValue,
        mean=mean.stdv.frame$energyMean, 
        sd=mean.stdv.frame$energyStdDev)
}
loudnessProb <- function(loudnessValue){
  dnorm(x=loudnessValue,
        mean=mean.stdv.frame$loudnessMean, 
        sd=mean.stdv.frame$loudnessStdDev)
} 
speechinessProb <- function(speechinessValue){
  dnorm(x=speechinessValue,
        mean=mean.stdv.frame$speechinessMean, 
        sd=mean.stdv.frame$speechinessStdDev)
} 
acousticnessProb <- function(acousticnessValue){
  dnorm(x=acousticnessValue,
        mean=mean.stdv.frame$acousticnessMean, 
        sd=mean.stdv.frame$acousticnessStdDev)
} 
livenessProb <- function(livenessValue){
  dnorm(x=livenessValue,
        mean=mean.stdv.frame$livenessMean, 
        sd=mean.stdv.frame$livenessStdDev)
} 
valenceProb <- function(valenceValue){
  dnorm(x=valenceValue,
        mean=mean.stdv.frame$valenceMean, 
        sd=mean.stdv.frame$valenceStdDev)
}
tempoProb <- function(tempoValue){
  dnorm(x=tempoValue,
        mean=mean.stdv.frame$tempoMean, 
        sd=mean.stdv.frame$tempoStdDev)
}

seqr <- seq(from=0,to=500,len=100)

plot(seqr,tempoProb(seqr))