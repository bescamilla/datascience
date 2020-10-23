read.csv('~/datascience/data.csv')

install.packages(c("httr", "jsonlite"))
library(httr)
library(jsonlite)
res = GET("http://api.open-notify.org/astros.json")

data = fromJSON(rawToChar(res$content))

data$people

res = GET("http://api.open-notify.org/iss-pass.json",
          query = list(lat = 40.7, lon = -74))

data = fromJSON(rawToChar(res$content))

data$response

res = GET("https://swapi.dev/api/people/1")