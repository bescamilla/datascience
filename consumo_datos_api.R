## Clase 2 de Importanción de datos
# 1) Hacer petición
res = GET("https://api.datos.gob.mx/v1/api-catalog")
res
## 200 OK
## 500, 503, 400, 404 BAD
# 2) Transformar la respuesta en datos
data = fromJSON(rawToChar(res$content))
data = data$results
# 3) Tener esos datos en un data frame
# Base del endpoint
base_endpoint = "https://api.datos.gob.mx/v2/"
res_a = GET(paste0(base_endpoint, data$endpoint[1]))
res_a
data = fromJSON(rawToChar(res_a$content))
data = data$results
## Datos banco mundial
# Obtener un CSV
data_csv = read.csv("https://finances.worldbank.org/resource/gsdw-avpz.csv")
res = GET("https://finances.worldbank.org/resource/gsdw-avpz.json")
data_wb = fromJSON(rawToChar(res$content))
base_url = "https://finances.worldbank.org/resource/gsdw-avpz.json?"
full_url = paste0(base_url, "member=Costa Rica")
full_url = URLencode(full_url)
# res = GET("https://finances.worldbank.org/resource/gsdw-avpz.json?member=Costa Rica")
data = fromJSON(getURL(full_url))
## Datos API CDMX
res2 = GET("https://datos.cdmx.gob.mx/api/v2/")
data = fromJSON(rawToChar(res2$content), flatten = TRUE)
res2 = GET("https://datos.cdmx.gob.mx/api/v2/opendatasoft/datasets")
data = fromJSON(rawToChar(res2$content), flatten = TRUE)
head(data$datasets$dataset.dataset_id)
data
dataset = data$datasets$dataset.dataset_id[3]
res3 = GET(paste0("https://datos.cdmx.gob.mx/api/v2/opendatasoft/datasets/", dataset))
data = fromJSON(rawToChar(res3$content))
data$links
records_endpoint = paste0(data$links$href[4], "/json?rows=100&pretty=false&timezone=UTC")
res3 = GET(records_endpoint)
data = fromJSON(rawToChar(res3$content))
team = fromJSON(data$team)
head(data)