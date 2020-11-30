library(rjson)

#Returns the percent accuracy of the classifier on the given test file
classifier.acc.percent <- function(test.filename = NULL, playlist.genre = NULL){
  if(is.null(test.filename) | is.null(playlist.genre)){
    return(NULL)
  }
  
  resultCR <- rjson::fromJSON(file = test.filename)
  
  total.songs <- 0
  classifier.results <- c()
  
  for (song in resultCR){
    classifier.results <- append(classifier.results, classify(CRPrior = (1/3),CountryPrior = (1/3),ClassicalPrior = (1/3), song = song))
    total.songs <- total.songs + 1
  }
  
  total.correct <- 0
  for (classification in classifier.results){
    if(classification == playlist.genre){
      total.correct <- total.correct + 1
    }
  }
  
  return((total.correct/total.songs) * 100)
}

my.testCR.filename <- "TestingCR.json"
print("Classic Rock Accuracy: ")
print(classifier.acc.percent(test.filename = my.testCR.filename,playlist.genre = "Classic Rock"))

print("Country Accuracy: ")
my.testCountry.filename <- "TestingCountry.json"
print(classifier.acc.percent(test.filename = my.testCountry.filename,playlist.genre = "Country"))

print("Classical Accuracy: ")
my.testClassical.filename <- "TestingClassicdata.json"
print(classifier.acc.percent(test.filename = my.testClassical.filename,playlist.genre = "Classical"))