#File:Classifier.R


mean.stdv.CR <- as.data.frame(fromJSON(file = "MeanStdDevCR.json"))

mean.stdv.Country <- as.data.frame(fromJSON(file = "MeanStdDevCountry.json"))

mean.stdv.Classical <- as.data.frame(fromJSON(file = "MeanStdDevClassical.json"))

#All Prob functions find the likelihood of their parameter on the standard normal curve
danceProb <- function(danceValue = 0.0){dnorm(x=danceValue,mean=0, sd=1)}
energyProb <- function(energyValue = 0.0){dnorm(x=danceValue,mean=0, sd=1)}
loudnessProb <- function(loudnessValue = 0.0){dnorm(x=loudnessValue,mean=0, sd=1)} 
speechinessProb <- function(speechinessValue = 0.0){dnorm(x=speechinessValue,mean=0, sd=1)} 
acousticnessProb <- function(acousticnessValue = 0.0){dnorm(x=acousticnessValue,mean=0, sd=1)} 
livenessProb <- function(livenessValue = 0.0){dnorm(x=livenessValue,mean=0, sd=1)} 
valenceProb <- function(valenceValue = 0.0){dnorm(x=valenceValue,mean=0, sd=1)}
tempoProb <- function(tempoValue = 0.0){dnorm(x=tempoValue,mean=0, sd=1)}

#Standardize the attributes of a Classic Rock song to the standard normal distribution
stdAttrbCR <- function(song = NULL){
  if(is.null(song)){
    return(NULL)
  }
  song$dance <- (song$dance-mean.stdv.CR$danceMean)/(mean.stdv.CR$danceStdDev)
  song$energy <- (song$energy-mean.stdv.CR$energyMean)/(mean.stdv.CR$energyStdDev)
  song$loudness <- (song$loudness-mean.stdv.CR$loudnessMean)/(mean.stdv.CR$loudnessStdDev)
  song$speechiness <- (song$speechiness-mean.stdv.CR$speechinessMean)/(mean.stdv.CR$speechinessStdDev)
  song$acousticness <- (song$acousticness-mean.stdv.CR$acousticnessMean)/(mean.stdv.CR$acousticnessStdDev)
  song$liveness <- (song$liveness-mean.stdv.CR$livenessMean)/(mean.stdv.CR$livenessStdDev)
  song$valence <- (song$valence-mean.stdv.CR$valenceMean)/(mean.stdv.CR$valenceStdDev)
  song$tempo <- (song$tempo-mean.stdv.CR$tempoMean)/(mean.stdv.CR$tempoStdDev)
  return(song)
}

#Standardize the attributes of a Country song to the standard normal distribution
stdAttrbCountry <- function(song = NULL){
  if(is.null(song)){
    return(NULL)
  }
  song$dance <- (song$dance-mean.stdv.Country$danceMean)/(mean.stdv.Country$danceStdDev)
  song$energy <- (song$energy-mean.stdv.Country$energyMean)/(mean.stdv.Country$energyStdDev)
  song$loudness <- (song$loudness-mean.stdv.Country$loudnessMean)/(mean.stdv.Country$loudnessStdDev)
  song$speechiness <- (song$speechiness-mean.stdv.Country$speechinessMean)/(mean.stdv.Country$speechinessStdDev)
  song$acousticness <- (song$acousticness-mean.stdv.Country$acousticnessMean)/(mean.stdv.Country$acousticnessStdDev)
  song$liveness <- (song$liveness-mean.stdv.Country$livenessMean)/(mean.stdv.Country$livenessStdDev)
  song$valence <- (song$valence-mean.stdv.Country$valenceMean)/(mean.stdv.Country$valenceStdDev)
  song$tempo <- (song$tempo-mean.stdv.Country$tempoMean)/(mean.stdv.Country$tempoStdDev)
  return(song)
}

#Standardize the attributes of a Classical song to the standard normal distribution
stdAttrbClassical <- function(song = NULL){
  if(is.null(song)){
    return(NULL)
  }
  song$dance <- (song$dance-mean.stdv.Classical$danceMean)/(mean.stdv.Classical$danceStdDev)
  song$energy <- (song$energy-mean.stdv.Classical$energyMean)/(mean.stdv.Classical$energyStdDev)
  song$loudness <- (song$loudness-mean.stdv.Classical$loudnessMean)/(mean.stdv.Classical$loudnessStdDev)
  song$speechiness <- (song$speechiness-mean.stdv.Classical$speechinessMean)/(mean.stdv.Classical$speechinessStdDev)
  song$acousticness <- (song$acousticness-mean.stdv.Classical$acousticnessMean)/(mean.stdv.Classical$acousticnessStdDev)
  song$liveness <- (song$liveness-mean.stdv.Classical$livenessMean)/(mean.stdv.Classical$livenessStdDev)
  song$valence <- (song$valence-mean.stdv.Classical$valenceMean)/(mean.stdv.Classical$valenceStdDev)
  song$tempo <- (song$tempo-mean.stdv.Classical$tempoMean)/(mean.stdv.Classical$tempoStdDev)
  return(song)
}

#Returns the classifier value given the song is Classic Rock
classifyCR <- function(CRPrior = NULL,song = NULL){
  if(is.null(song) | is.null(CRPrior)){
    return(0)
  }
  
  classifyValue <- 0
  song <- stdAttrbCR(song)
  if(!(is.null(song))){
    classifyValue <- log(CRPrior) +
                    log(danceProb(song$dance)) +
                    log(energyProb(song$energy)) +
                    log(loudnessProb(song$loudness)) +
                    log(speechinessProb(song$speechiness)) +
                    log(acousticnessProb(song$acousticness)) +
                    log(livenessProb(song$liveness)) +
                    log(valenceProb(song$valence)) +
                    log(tempoProb(song$tempo))
  }
  return(classifyValue)
}

#Returns the classifier value given the song is Country
classifyCountry <- function(CountryPrior = NULL,song = NULL){
  if(is.null(song) | is.null(CountryPrior)){
    return(0)
  }
  
  classifyValue <- 0
  song <- stdAttrbCountry(song)
  if(!(is.null(song))){
    classifyValue <- log(CountryPrior) +
                    log(danceProb(song$dance)) +
                    log(energyProb(song$energy)) +
                    log(loudnessProb(song$loudness)) +
                    log(speechinessProb(song$speechiness)) +
                    log(acousticnessProb(song$acousticness)) +
                    log(livenessProb(song$liveness)) +
                    log(valenceProb(song$valence)) +
                    log(tempoProb(song$tempo))
  }
  return(classifyValue)
}

#Returns the classifier value given the song is Classical
classifyClassical <- function(ClassicalPrior = NULL,song = NULL){
  if(is.null(song) | is.null(ClassicalPrior)){
    return(0)
  }
  
  classifyValue <- 0
  song <- stdAttrbClassical(song)
  if(!(is.null(song))){
    classifyValue <- log(ClassicalPrior) +
      log(danceProb(song$dance)) +
      log(energyProb(song$energy)) +
      log(loudnessProb(song$loudness)) +
      log(speechinessProb(song$speechiness)) +
      log(acousticnessProb(song$acousticness)) +
      log(livenessProb(song$liveness)) +
      log(valenceProb(song$valence)) +
      log(tempoProb(song$tempo))
  }
  return(classifyValue)
}

#Returns the classifier's determination
classify <- function(CRPrior = NULL, CountryPrior = NULL, ClassicalPrior = NULL, song = NULL){
  if(is.null(CRPrior) | is.null(CountryPrior) | is.null(ClassicalPrior) | is.null(song)){
    return(-1)
  }
  CR.result <- classifyCR(CRPrior = CRPrior, song = song)
  Country.result <- classifyCountry(CountryPrior = CountryPrior, song = song)
  Classical.result <- classifyClassical(ClassicalPrior = ClassicalPrior, song = song)
  result.list <- c(CR.result,Country.result,Classical.result)
  max.result <- max(result.list)

  selection.result <- NULL
  if(Country.result == max.result){
    selection.result <- "Country"
  }
  else if(CR.result == max.result){
    selection.result <- "Classic Rock"
  }
  else{
    selection.result <- "Classical"
  }

  return(selection.result)
}

#MONTE TESTING THE CLASSIFIER
# songCR <- list(dance = .46,energy = .77,loudness = -8.0,speechiness = .069,
#           acousticness = .137,liveness = .295,valence = .46,tempo = 122.0)
# 
# songCountry <- list(dance = .588,energy = .699,loudness = -5.74,speechiness = .045,
#                acousticness = .23,liveness = .166,valence = .544,tempo = 126.88)
# 
