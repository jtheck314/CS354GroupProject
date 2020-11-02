Sys.setenv(client_id = '')
Sys.setenv(client_secret = '')

#load(httr)
#load(stringr)
#load(DSpoty)
#load(jsonlite)


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


access_token <- DSpoty::get_spotify_access_token()

tracks <- list()
data <- list()


song_num <- 500

for (i in 0:(floor((song_num/100)))){
  tmp <- get_playlist_tracks("3QHlic6HbgnhbKnmLh2L9S", access_token, offset = i*100)
  for (row in tmp){
    tracks[row$track$id] <- row$track$name
  }
}


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
print(songTable.data)

write(toJSON(songTable.data, ), "data.json")