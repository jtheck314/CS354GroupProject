#File:Classifier.R


mean.variance.frame <- as.data.frame(fromJSON(file = "MeanVariance.json"))

#Vector of Functions for normal distribution
danceProb <- function(danceValue){
  pnorm(q=danceValue,
        mean=mean.variance.frame$danceMean, 
        sd=mean.variance.frame$danceVariance,
        lower.tail = TRUE)
}
energyProb <- function(energyValue){
  pnorm(q=danceValue,
        mean=mean.variance.frame$energyMean, 
        sd=mean.variance.frame$energyVariance,
        lower.tail = TRUE)
}
loudnessProb <- function(loudnessValue){
  pnorm(q=loudnessValue,
        mean=mean.variance.frame$loudnessMean, 
        sd=mean.variance.frame$loudnessVariance,
        lower.tail = TRUE)
} 
speechinessProb <- function(speechinessValue){
  pnorm(q=speechinessValue,
        mean=mean.variance.frame$speechinessMean, 
        sd=mean.variance.frame$speechinessVariance,
        lower.tail = TRUE)
} 
acousticnessProb <- function(acousticnessValue){
  pnorm(q=acousticnessValue,
        mean=mean.variance.frame$acousticnessMean, 
        sd=mean.variance.frame$acousticnessVariance,
        lower.tail = TRUE)
} 
livenessProb <- function(livenessValue){
  pnorm(q=livenessValue,
        mean=mean.variance.frame$livenessMean, 
        sd=mean.variance.frame$livenessVariance,
        lower.tail = TRUE)
} 
valenceProb <- function(valenceValue){
  pnorm(q=valenceValue,
        mean=mean.variance.frame$valenceMean, 
        sd=mean.variance.frame$valenceVariance,
        lower.tail = TRUE)
}
tempoProb <- function(tempoValue){
  pnorm(q=tempoValue,
        mean=mean.variance.frame$tempoMean, 
        sd=mean.variance.frame$tempoVariance,
        lower.tail = TRUE)
}

print(tempoProb(1000))