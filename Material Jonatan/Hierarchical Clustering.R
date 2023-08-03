### Hierarchical Clustering

# Instala los paquetes necesarios (si no los tienes ya instalados)
install.packages("factoextra")  # Para visualizar el dendrograma
install.packages("cluster")     # Para realizar el clustering

# Carga los paquetes
library(factoextra)
library(cluster)

# Genera datos ficticios para el ejemplo médico
set.seed(123)  # Para reproducibilidad
pacientes <- paste("Paciente", 1:50, sep="_")
datos_medicos <- matrix(rnorm(50*5, mean = 70, sd = 10), ncol = 5)

# Asigna nombres a las columnas de las variables clínicas
colnames(datos_medicos) <- c("Presion_sistolica", "Presion_diastolica", "Frecuencia_cardiaca", "Temperatura", "Nivel_glucosa")

# Realiza el Hierarchical Clustering
distancia <- dist(datos_medicos)  # Calcula la matriz de distancias
hc_result <- hclust(distancia, method = "ward.D2")  # Aplica el algoritmo de clustering

# Visualiza el dendrograma
dend <- as.dendrogram(hc_result)
plot(dend, main = "Dendrograma del Hierarchical Clustering")

# Para mostrar los nombres de los pacientes en el dendrograma
labels(dend) <- pacientes
plot(dend, main = "Dendrograma del Hierarchical Clustering con Nombres de Pacientes", 
     edgePar = list(cex = 0.6, col = "blue"))

# Opcionalmente, también se pueden colorear los grupos formados
grupos <- cutree(hc_result, k = 3)  # Selecciona el número de grupos (en este caso, 3 grupos)
fviz_dend(dend, k = 3, main = "Dendrograma con Grupos Coloreados", 
          k_colors = c("blue", "green", "red"))

# Obtiene los grupos de cada paciente según el Hierarchical Clustering
grupos <- cutree(hc_result, k = 3)  # Selecciona el número de grupos (en este caso, 3 grupos)

# Agrega la columna de grupos al conjunto de datos original
datos_medicos_con_grupos <- data.frame(Paciente = pacientes, datos_medicos, Grupo = grupos)



