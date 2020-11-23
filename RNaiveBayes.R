# Title     : TODO
# Objective : TODO
# Created by: Justin
# Created on: 11/16/2020
library(e1071)

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
  genreClassic <- append(genreClassic, "Classical")
  danceDataClassic <- append(danceDataClassic, song$dance)
  energyDataClassic <- append(energyDataClassic, song$energy)
  loudnessDataClassic <- append(loudnessDataClassic, song$loudness)
  speechinessDataClassic <- append(speechinessDataClassic, song$speechiness)
  acousticnessDataClassic <- append(acousticnessDataClassic, song$acousticness)
  livenessDataClassic <- append(livenessDataClassic, song$liveness)
  valenceDataClassic <- append(valenceDataClassic, song$valence)
  tempoDataClassic <- append(tempoDataClassic, song$tempo)
}

df <- data.frame("Genre" = c(genreCR, genreCountry, genreClassic),
                 "Danceability" = c(danceDataCR, danceDataCountry, danceDataClassic),
                 "Energy" = c(energyDataCR, energyDataCountry, energyDataClassic),
                 "Loudness" = c(loudnessDataCR, loudnessDataCountry, loudnessDataClassic),
                 "Speechiness" = c(speechinessDataCR, speechinessDataCountry, speechinessDataClassic),
                 "Acousticness" = c(acousticnessDataCR, acousticnessDataCountry, acousticnessDataClassic),
                 "Liveness" = c(livenessDataCR, livenessDataCountry, livenessDataClassic),
                 "Valence" = c(valenceDataCR, valenceDataCountry, valenceDataClassic),
                 "Tempo" = c(tempoDataCR, tempoDataCountry, tempoDataClassic))

# The sample needs to have the same structure as the data frame used for creating the model
#     Genre, Danceability, Energy, Loudness, Speechiness, Acousticness, Liveness, Valence, Tempo
sample <- df[sample(1:1500, 10,replace=FALSE),]

(model <- naiveBayes(Genre ~., data = df))
(predict(model, sample, type = "raw"))
print(sample)