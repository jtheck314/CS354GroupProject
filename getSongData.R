Sys.setenv(client_id = '')
Sys.setenv(client_secret = '')

#Libraries
#load(httr)
#load(stringr)
#load(DSpoty)
#load(jsonlite)


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


song_id <- "6H725KQnIbXVkRPrapOTXZ"

access_token <- DSpoty::get_spotify_access_token()

#Get The Song
data <- get_track_analysis(song_id, access_token)

#Format The Data
song <- list(dance = data$danceability, energy = data$energy, loudness = data$loudness, speechiness = data$speechiness,
          acousticness = data$acousticness, liveness = data$liveness, valence = data$valence, tempo = data$tempo)
