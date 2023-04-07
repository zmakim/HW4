library(tidyverse)
library(babynames)

starwars$name
glimpse(starwars)
starwars$"name"
starwars$hair_color

starwars[1,1]
starwars[1,]
starwars[,1]

#numeric filter
slice(starwars, 1)

a <- 1:10
b <- 5
c <- a * b
c


d <- c(1,100)
a*d

fivenames <- babynames |> 
  filter(name == c("Walter", "Saul", "Skylar", "Jessie", "Mike")) 

fivenames <- babynames |> 
  filter(name %in% c("Walter", "Saul", "Skylar", "Jessie", "Mike")) 

fivenames <- babynames |> 
  filter(name == "Walter" |name == "Saul" |name== "Skylar" |name== "Jessie" |name== "Mike") 
