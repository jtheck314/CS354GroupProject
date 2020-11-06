# Title     : TODO
# Objective : TODO
# Created by: donww
# Created on: 11/1/2020

file <- "TestingCR"

result <- rjson::fromJSON(file = paste(c(file, ".json"), collapse = ""))

danceData <- c()
energyData <- c()
loudnessData <- c()
speechinessData <- c()
acousticnessData <- c()
livenessData <- c()
valenceData <- c()
tempoData <- c()

len <- length(result)

for(song in result){
  print(song$name)
  danceData <- append(danceData, song$dance)
  energyData <- append(energyData, song$energy)
  loudnessData <- append(loudnessData, song$loudness)
  speechinessData <- append(speechinessData, song$speechiness)
  acousticnessData <- append(acousticnessData, song$acousticness)
  livenessData <- append(livenessData, song$liveness)
  valenceData <- append(valenceData, song$valence)
  tempoData <- append(tempoData, song$tempo)
}


# Create the data frame.
dataTable.data <- data.frame(
    danceMean = mean(danceData),
    danceStdDev = sd(danceData),
    energyMean = mean(energyData),
    energyStdDev = sd(energyData),
    loudnessMean = mean(loudnessData),
    loudnessStdDev = sd(loudnessData),
    speechinessMean = mean(speechinessData),
    speechinessStdDev = sd(speechinessData),
    acousticnessMean = mean(acousticnessData),
    acousticnessStdDev = sd(acousticnessData),
    livenessMean = mean(livenessData),
    livenessStdDev = sd(livenessData),
    valenceMean = mean(valenceData),
    valenceStdDev = sd(valenceData),
    tempoMean = mean(tempoData),
    tempoStdDev = sd(tempoData),
    stringsAsFactors = FALSE
)
#paste(c(file, "Data", ".json"), collapse = "")

write(rjson::toJSON(dataTable.data, ), file = "MeanStdDevCR.json")