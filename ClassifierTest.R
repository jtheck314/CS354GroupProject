#Returns the percent accuracy of the classifier on the given test file
classifier.acc.percent <- function(test.filename = NULL, playlist.genre = NULL){
  if(is.null(test.filename) | is.null(playlist.genre)){
    return(NULL)
  }
  
  resultCR <- rjson::fromJSON(file = test.filename)
  
  total.songs <- 0
  classifier.results <- c()
  
  for (song in resultCR){
    classifier.results <- append(classifier.results, classify(CRPrior = .5,CountryPrior = .5, song = song))
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

my.test.filename <- "TestingCR.json"
print(classifier.acc.percent(test.filename = my.test.filename,playlist.genre = "Classic Rock"))
