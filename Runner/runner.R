#file: runner.R

#Libraries
source(file="playlistDataGrabber.R")
source(file="getSongData.R")
source(file="Classifier.R")

#Asking the user if they want to go again
goAgain <- function (){
  cat("\n--------\nWould you like to go again? (y/n): ")
  user.choice <- readline()
  if (user.choice == "y"){
    return(0)
  }else{
    return(1)
  }
}

#The main dialogue 
mainDialog <- function(){
  cat("Welcome to the Spotify Naive Bayes Classifier! What mode would you like to run? \n 1: Data Grabber \n 2: Song Genre Guesser\n 3: Quit.\n")
  user.mode <- readline("What mode would you like to ")
  if (user.mode == "1"){
    cat("\n Please input a Spotify platylist id(example: 30gdZjDdQGUvBFe5XaT3XU): ")
    user.playlist.id <- readline()
    cat("\n How many songs are in this playlist? ")
    user.playlist.len <- strtoi(readline())
    cat("\n What should I call the file? ")
    user.playlist.name <- readline()
    compileData(user.playlist.id, user.playlist.len, user.playlist.name)
  }else if(user.mode == "2"){
    cat("\n Please input a Spotify song id(example: 6DtmnN7wK6m8dI8UNaz3sG): ")
    user.song.id <- readline()
    songData <- getSongDataAndFormat(user.song.id)
    result <- classify(CRPrior = (1/3),CountryPrior = (1/3),ClassicalPrior = (1/3), song = songData)
    cat(paste("\nGuess: ", result))
  }else{
    print("Quitting...")
    return(1)
  }
  return(goAgain())
}

#Running the two dialogues
choice <- mainDialog()
while(choice == 0){
  choice <- mainDialog()
}

cat("\nThank you for using our Spotify Naive Bayes Classifier.")
