# Title     : TODO
# Objective : TODO
# Created by: Justin
# Created on: 11/16/2020
library(e1071)

makePlot<-function(countryX, countryY, CRx, CRy, xLabel, yLabel){
  plot(x=countryX, y=countryY, xlab=xLabel, ylab=yLabel, pch=20, col="red")
  points(x=CRx, y=CRy, pch=20, col="blue")
  points(x=mean(countryX), y=mean(countryY), pch=0, col="red", cex=6)
  points(x=mean(CRx), y=mean(CRy), pch=0, col="blue", cex=6)
  legend("bottomright", legend=c("Country", "Country Mean", "Classic Rock", "Classic Rock Mean"),
       col=c("red", "red", "blue", "blue"), pch=c(16,0,16,0), cex=0.8)
}

trainingCR <- "TrainingCR"
trainingCountry <- "TrainingCountry"

resultCR <- rjson::fromJSON(file = paste(c(trainingCR, ".json"), collapse = ""))
resultCountry <- rjson::fromJSON(file = paste(c(trainingCountry, ".json"), collapse = ""))

genreCR <- c()
danceDataCR <- c()
energyDataCR <- c()
loudnessDataCR <- c()
speechinessDataCR <- c()
acousticnessDataCR <- c()
livenessDataCR <- c()
valenceDataCR <- c()
tempoDataCR <- c()

genreCountry <- c()
danceDataCountry <- c()
energyDataCountry <- c()
loudnessDataCountry <- c()
speechinessDataCountry <- c()
acousticnessDataCountry <- c()
livenessDataCountry <- c()
valenceDataCountry <- c()
tempoDataCountry <- c()

len <- length(resultCR)

for(song in resultCR){
  genreCR <- append(genreCR, "Classic Rock")
  danceDataCR <- append(danceDataCR, song$dance)
  energyDataCR <- append(energyDataCR, song$energy)
  loudnessDataCR <- append(loudnessDataCR, song$loudness)
  speechinessDataCR <- append(speechinessDataCR, song$speechiness)
  acousticnessDataCR <- append(acousticnessDataCR, song$acousticness)
  livenessDataCR <- append(livenessDataCR, song$liveness)
  valenceDataCR <- append(valenceDataCR, song$valence)
  tempoDataCR <- append(tempoDataCR, song$tempo)
}

for(song in resultCountry){
  genreCountry <- append(genreCountry, "Country")
  danceDataCountry <- append(danceDataCountry, song$dance)
  energyDataCountry <- append(energyDataCountry, song$energy)
  loudnessDataCountry <- append(loudnessDataCountry, song$loudness)
  speechinessDataCountry <- append(speechinessDataCountry, song$speechiness)
  acousticnessDataCountry <- append(acousticnessDataCountry, song$acousticness)
  livenessDataCountry <- append(livenessDataCountry, song$liveness)
  valenceDataCountry <- append(valenceDataCountry, song$valence)
  tempoDataCountry <- append(tempoDataCountry, song$tempo)
}

# The first two parameters are the X and Y for Country
# The second two parameters are the X and Y for Classic Rock
makePlot(danceDataCountry, energyDataCountry, danceDataCR, energyDataCR, "Danceability", "Energy")