install.packages("spotifyr")
library(spotifyr)
library(tidyverse)
library(knitr)

spotify_songs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv')
help(spotifyr)
View(spotify_songs)

Sys.setenv(SPOTIFY_CLIENT_ID = '686823d109bc4ab39644deb31178c58f')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'a1e3aceb474243b7846cddc314e6c395')

access_token <- get_spotify_access_token()
library(lubridate)

get_my_recently_played(limit = 10) %>% 
  mutate(artist.name = map_chr(track.artists, function(x) x$name[1]),
         played_at = as_datetime(played_at)) %>% 
  select(track.name, artist.name, track.album.name, played_at) %>% 
  kable()
