####. Spectral Clustering. ### 

# Cargamos las librerías necesarias
library(ggplot2)
library(cluster)

# Generamos datos de ejemplo biomédico (reemplaza esto con tus datos reales)
set.seed(123) # Para reproducibilidad
datos_biomédicos <- data.frame(
  Muestra = paste("Muestra", 1:100),
  Característica1 = rnorm(100, mean = 50, sd = 10),
  Característica2 = rnorm(100, mean = 30, sd = 5)
)

# Visualizamos los datos de ejemplo
ggplot(datos_biomédicos, aes(x = Característica1, y = Característica2)) +
  geom_point() +
  labs(title = "Datos Biomédicos", x = "Característica 1", y = "Característica 2")

# Estandarizamos los datos antes de aplicar K-Means (opcional pero recomendado)
datos_estandarizados <- scale(datos_biomédicos[, -1])

# Aplicamos el algoritmo de K-Means para encontrar 3 grupos (k = 3)
k <- 3
modelo_kmeans <- kmeans(datos_estandarizados, centers = k)

# Agregamos los grupos encontrados al dataframe original
datos_biomédicos$Grupo <- as.factor(modelo_kmeans$cluster)

# Visualizamos los resultados con colores que representan los grupos encontrados
ggplot(datos_biomédicos, aes(x = Característica1, y = Característica2, color = Grupo)) +
  geom_point() +
  labs(title = "K-Means en Datos Biomédicos", x = "Característica 1", y = "Característica 2")

# Resumen de los grupos y sus centroides
summary(modelo_kmeans)
