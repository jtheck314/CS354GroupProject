# Title     : TODO
# Objective : TODO
# Created by: Justin
# Created on: 11/16/2020
library(e1071)

makePlot<-function(countryX, countryY, CRx, CRy, classicX, classicY, xLabel, yLabel){
  plot(x=countryX, y=countryY, xlab=xLabel, ylab=yLabel, pch=20, col="red")
  points(x=CRx, y=CRy, pch=20, col="blue")
  points(x=classicX, y=classicY, pch=20, col="green")
  points(x=mean(countryX), y=mean(countryY), pch=0, col="red", cex=6)
  points(x=mean(CRx), y=mean(CRy), pch=0, col="blue", cex=6)
  points(x=mean(classicX), y=mean(classicY), pch=0, col="green", cex=6)
  legend("bottomright", legend=c("Country", "Country Mean", "Classic Rock", "Classic Rock Mean",
                                 "Classical", "Classical Mean"),
       col=c("red", "red", "blue", "blue", "green", "green"), pch=c(16,0,16,0,16,0), cex=0.8)
}

trainingCR <- "TrainingCR"
trainingCountry <- "TrainingCountry"
trainingClassic <- "TrainingClassicData"

resultCR <- rjson::fromJSON(file = paste(c(trainingCR, ".json"), collapse = ""))
resultCountry <- rjson::fromJSON(file = paste(c(trainingCountry, ".json"), collapse = ""))
resultClassic <- rjson::fromJSON(file = paste(c(trainingClassic, ".json"), collapse = ""))


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

genreClassic <- c()
danceDataClassic <- c()
energyDataClassic <- c()
loudnessDataClassic <- c()
speechinessDataClassic <- c()
acousticnessDataClassic <- c()
livenessDataClassic <- c()
valenceDataClassic <- c()
tempoDataClassic <- c()

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

for(song in resultClassic){
  genreClassic <- append(genreClassic, "Country")
  danceDataClassic <- append(danceDataClassic, song$dance)
  energyDataClassic <- append(energyDataClassic, song$energy)
  loudnessDataClassic <- append(loudnessDataClassic, song$loudness)
  speechinessDataClassic <- append(speechinessDataClassic, song$speechiness)
  acousticnessDataClassic <- append(acousticnessDataClassic, song$acousticness)
  livenessDataClassic <- append(livenessDataClassic, song$liveness)
  valenceDataClassic <- append(valenceDataClassic, song$valence)
  tempoDataClassic <- append(tempoDataClassic, song$tempo)
}

# The first two parameters are the X and Y for Country
# The second two parameters are the X and Y for Classic Rock
# The third two parameters are the X and Y for Classical
makePlot(danceDataCountry, energyDataCountry,
         danceDataCR, energyDataCR,
         danceDataClassic, energyDataClassic,
         "Danceability", "Energy")