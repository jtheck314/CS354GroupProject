Sys.setenv(client_id = 'b1d493d5a2dc49e7901d8ecb84fe7fb8')
Sys.setenv(client_secret = '338d52ce3d5b4df680e14d2e4ff2e6db')

#Libraries
library(httr)
library(stringr)
library(DSpoty)
library(jsonlite)

#Variable setup
dance <- c()
energy <- c()
key <- c()
loudness <- c()
mode <- c()
speechiness <- c()
acousticness <- c()
liveness <- c()
valence <- c()
tempo <- c()
id <- c()
name <- c()

#This function will get the analysis for a spotify track given an ID
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

#This function will get the analysis for a back of spotify tracks given an ID
get_tracks_analysis <- function(tracks, access_token){
  res <- GET(
    url = "https://api.spotify.com/v1/audio-features",
    query = list(
      ids=tracks,
      access_token = access_token
    )
  )
  cont <- content(res, as = "parsed", type = "application/json")

  return(cont$audio_features)
}

#This function will return all songs found in a playlist given the playlist ID
get_playlist_tracks <- function(playlist_id, access_token, limit = 100, offset = 0){
  tracks <- list()
  res <- GET(
    url = str_glue(paste(c("https://api.spotify.com/v1/playlists/",playlist_id,"/tracks/"), collapse = "")),
    query = list(
      market="US",
      fields="items(track(name,id))",
      limit = limit,
      offset = offset,
      access_token = access_token
    )
  )
  cont <- content(res, as = "parsed", type = "application/json")

  return(cont$items)
}



#This function will combine all top functions and create a json file with all songs from a given playlist.
compileData <- function (playlistid, len, fileName){
  access_token <- DSpoty::get_spotify_access_token()
  print("Successfully Grabbed Access Token")
  tracks <- list()
  data <- list()


  for (i in 0:(floor((len/100)))){
    tmp <- get_playlist_tracks(playlistid, access_token, offset = i*100)
    for (row in tmp){
      tracks[row$track$id] <- row$track$name
    }
  }

  print("Successfully Grabbed Playlist Data.")

  #Getting All the data
  for (song in names(tracks)){
    data <- get_track_analysis(song, access_token)

    dance <- append(dance, data$danceability)
    energy <- append(energy, data$energy)
    key <- append(key, data$key)
    loudness <- append(loudness, data$loudness)
    mode <- append(mode, data$mode)
    speechiness <- append(speechiness, data$speechiness)
    acousticness<- append(acousticness, data$acousticness)
    liveness <- append(liveness, data$liveness)
    valence <- append(valence, data$valence)
    tempo <- append(tempo, data$tempo)
    id <- append(id, data$id)
    name <- append(name, tracks[[data$id]])

    Sys.sleep(.25)
  }

  print("Successfully Grabbed Song Data.")

  # Create the data frame.
  songTable.data <- data.frame(
      id = id,
      name = name,
      dance = dance,
      energy = energy,
      key = key,
      loudness = loudness,
      mode = mode,
      speechiness = speechiness,
      acousticness = acousticness,
      liveness = liveness,
      valence = valence,
      tempo = tempo,
      stringsAsFactors = FALSE
  )
  # Get the structure of the data frame.
  print("Successfully Formatted Data Frame")

  write(toJSON(songTable.data, ), fileName)

  print("JSON File Successfully Made.")
}
