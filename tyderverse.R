# Instalar los paquetes (si no los tenemos ya)
install.packages("tidyverse") # Manipulación de datos
install.packages("nycflights13") # Set de datos precargado en R

# Cargar los paquetes en nuestro entorno
library(tidyverse)
library(nycflights13)

# Observamos la estructura de la base de datos 'iris'
str(iris)

names(flights)
# Convertimos el Data Frame a Tibble
iris <- as_tibble(iris)
# guarda en una variable
dates <- select(flights, year, month, day)
# obtiene columnas desde year hasta day
select(flights, year:day)
# obtiene todas las columnas excepto estas
select(flights, -(year:day))

# Convertirmos a iris en tibble
iris <- as_tibble(iris)
iris

# Selecciona todas las columna que empiezan con "Petal"
select(iris, starts_with("Petal"))

# Selecciona todas las columnas que terminan con "Width"
select(iris, ends_with("Width"))

# Selecciona todas las columnas que contengan la cadena "etal"
select(iris, contains("etal"))

# Selecciona la columna Species y luego el resto de las columnas
select(iris, Species, everything())

# Visualizamos la structura de mtcars
str(mtcars)

# Selecciona solo las observaciones con cyl igual a 8
filter(mtcars, cyl == 8)

# Selecciona solo las observaciones con cyl menor que 6
filter(mtcars, cyl < 6)

# Menor que 6  y  vs igual a 1
filter(mtcars, cyl < 6 & vs == 1)

# Multiples agumentos separados por como es como si fuera & 
filter(mtcars, cyl < 6, vs == 1)

# Ejemplo: Menor que 6 o vs igual a 1
filter(mtcars, cyl < 6 | vs == 1)

# Filtramos los vuelos ya sea que hayan ocurrido en Noviembre o Diciembre
flights_nov_dec <- filter(flights, month %in% c(11, 12))

# Visualizamos la estructura de mtcars
str(mtcars)

# Ordena los carros por cyl y disp de forma ascendente
arrange(mtcars, cyl, disp)

# Si queremos una variable de forma descendente usamos desc()
arrange(mtcars, cyl, desc(disp) )



# Visualizamos nuestro data frame 'flights'
flights

# Seleccionamos solo un par de columans de nuestra base flights
flights_sml <- select(flights,   year:day,   ends_with("delay"),   distance,   air_time)

# Agregamos al final del dataset dos columans nuevas - gain y speed 
mutate(flights_sml,  gain = arr_delay - dep_delay,  speed = distance / air_time * 60)

# Si queremos quedarnos solo con las columnas creadas, usamos transmute
transmute(flights,  gain = arr_delay - dep_delay,  hours = air_time / 60,  gain_per_hour = gain / hours)



# Incluimos la libreria plyr para importar la base de datos baseball
library(plyr) 

# Vemos la información de la base de datos
??baseball

# Almacenamos la base de datos como tibble
baseball <- as_tibble(baseball)

# Hemos modificado en data frame, así que tenemos que volver a cargarlo
# Quitamos el paquete plry
detach(package:plyr)

# Volvemos a activar el paquete dplyr
library(dplyr)

# Vemos la estructura de baseball
str(baseball)

# Vemos los datos de la columna year
summary(baseball$year)

# Calculamos el número de equipos únicos en la base de datos y su duración en años
summarise(baseball,duration = max(year) - min(year), nteams = length(unique(team)))


# Total de hits por jugador
by_player <- group_by(baseball, id)
summarise(group_by(baseball, id), mean_hits = mean(h, na.rm = TRUE))

# Total de hits por jugador por año
by_player_year <- group_by(baseball, id, year)
summarise(by_player_year, mean_hits = mean(h, na.rm = TRUE))

# Total de hits por jugador por año y por equipo
by_player_year_team <- group_by(baseball, id, year, team)
summarise(by_player_year_team, mean_hits = mean(h, na.rm = TRUE))



################ practica ###################

dataset_adult <- read_csv('~/datascience/adult.data')

colnames(dataset_adult) <- c('age',
                             'workclass',
                             'fnlwgt',
                             'education',
                             'education-num',
                             'marital-status',
                             'occupation',
                             'relationship',
                             'race',
                             'sex',
                             'capital-gain',
                             'capital-loss',
                             'hours-per-week',
                             'native-country', '50K')

dataset_adult <- as_tibble(dataset_adult)

hombres <- filter(dataset_adult, sex == "Male")

hombres

select(dataset_adult, age, education, 'native-country')

arrange(dataset_adult, "native-country")

arrange(dataset_adult, desc(age))


dataset_sexo_pais <- summarise(group_by(dataset_adult, sex, 'native-country'), count = n())
dataset_sexo_pais