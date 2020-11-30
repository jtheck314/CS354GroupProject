Sys.setenv(client_id = 'b1d493d5a2dc49e7901d8ecb84fe7fb8')
Sys.setenv(client_secret = '338d52ce3d5b4df680e14d2e4ff2e6db')

#Libraries
library(httr)
library(stringr)
library(DSpoty)
library(jsonlite)


#Grab Song Data
get_track_analysis <- function(track, access_token){
  res <- GET(
    url = paste("https://api.spotify.com/v1/audio-features/", track, sep = ""),
    query = list(
      access_token = access_token
    )
  )
  cont <- content(res, as = "parsed", type = "application/json")

  return(cont)
}


getSongDataAndFormat <- function (songID){
  access_token <- DSpoty::get_spotify_access_token()

  #Get The Song
  data <- get_track_analysis(songID, access_token)

  #Format The Data
  song <- list(dance = data$danceability, energy = data$energy, loudness = data$loudness, speechiness = data$speechiness,
            acousticness = data$acousticness, liveness = data$liveness, valence = data$valence, tempo = data$tempo)

  return(song)
}