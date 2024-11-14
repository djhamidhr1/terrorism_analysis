Copy# ============= CONFIGURATION SPARK =============
library(sparklyr)

# 1. Installation de Spark
print("Installation de Spark...")
spark_install(version = "3.5.1")

# 2. Configuration de Spark
configure_spark <- function() {
  config <- spark_config()
  config$`sparklyr.shell.driver-memory` <- "2G"
  config$`sparklyr.shell.executor-memory` <- "2G"
  return(config)
}

# 3. Connexion à Spark
connect_to_spark <- function() {
  config <- configure_spark()
  sc <- spark_connect(
    master = "local",
    version = "3.5.1",
    config = config
  )
  return(sc)
}

print("Configuration Spark terminée!")