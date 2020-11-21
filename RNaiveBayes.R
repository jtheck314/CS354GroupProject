# Title     : TODO
# Objective : TODO
# Created by: Justin
# Created on: 11/16/2020
library(e1071)

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

df <- data.frame("Genre" = c(genreCR, genreCountry), "Danceability" = c(danceDataCR, danceDataCountry), "Energy" = c(energyDataCR, energyDataCountry),
                 "Loudness" = c(loudnessDataCR, loudnessDataCountry), "Speechiness" = c(speechinessDataCR, speechinessDataCountry),
                 "Acousticness" = c(acousticnessDataCR, acousticnessDataCountry), "Liveness" = c(livenessDataCR, livenessDataCountry),
                 "Valence" = c(valenceDataCR, valenceDataCountry), "Tempo" = c(tempoDataCR, tempoDataCountry))

# The sample needs to have the same structure as the data frame used for creating the model
#     Genre, Danceability, Energy, Loudness, Speechiness, Acousticness, Liveness, Valence, Tempo
sample <- df[sample(1:1000, 10,replace=FALSE),]

(model <- naiveBayes(Genre ~ ., data = df))
(predict(model, sample))
(predict(model, sample, type = "raw"))
(pred <- predict(model, df))
table(pred, df$genre)
print(sample)