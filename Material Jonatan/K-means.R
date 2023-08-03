### k-means

# Introducción del problema:
# En este ejemplo, utilizaremos un conjunto de datos ficticio que contiene información
# sobre pacientes con enfermedades cardíacas. Las características recopiladas incluyen 
# datos como la presión arterial sistólica (SBP), la presión arterial diastólica (DBP), 
# el nivel de colesterol (cholesterol), y el índice de masa corporal (BMI). 
# Queremos utilizar el algoritmo K-Means para agrupar a los pacientes en diferentes clusters,
# lo que podría ayudarnos a identificar diferentes perfiles de pacientes con enfermedades
# cardíacas y mejorar la personalización de los tratamientos.


# Cargamos las librerías necesarias
library(ggplot2)

# Generamos datos de ejemplo para enfermedades cardíacas (ficticios)
set.seed(123)  # Para reproducibilidad del resultado

# Generamos 100 pacientes con datos ficticios
num_pacientes <- 100
data <- data.frame(
  SBP = rnorm(num_pacientes, mean = 120, sd = 10),
  DBP = rnorm(num_pacientes, mean = 80, sd = 8),
  cholesterol = rnorm(num_pacientes, mean = 200, sd = 20),
  BMI = rnorm(num_pacientes, mean = 25, sd = 3)
)

# Visualización del conjunto de datos original (opcional)
print(ggplot(data, aes(x = SBP, y = DBP, color = BMI)) + geom_point())

# Extraemos las columnas relevantes para el clustering
X <- data[, c("SBP", "DBP")]

# Número de clusters que queremos encontrar
k <- 4

# Algoritmo K-Means
set.seed(42)  # Para reproducibilidad del resultado
kmeans_result <- kmeans(X, centers = k)

# Visualización de los clusters generados por K-Means
X$cluster <- as.factor(kmeans_result$cluster)
print(ggplot(X, aes(x = SBP, y = DBP, color = cluster)) + geom_point())

# Centroides de los clusters encontrados
centroids <- as.data.frame(kmeans_result$centers)
print(centroids)
