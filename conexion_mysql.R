#load packs
library(DBI)
library(RMySQL)

#open connection
con <- dbConnect(
    RMySQL::MySQL(), 
    dbname = 'tweater',
    host = 'courses.csrrinzqubik.us-east-1.rds.amazonaws.com',
    port = 3306,
    user = 'student',
    password = 'datacamp'
    )

tables <- dbListTables(con)

users <- dbReadTable(con, 'registro_apoyo')
users_aux <- dbReadTable(con, tables[3])

all_tables <- lapply(tables, dbReadTable, conn = con)
comments <- all_tables[[1]]
