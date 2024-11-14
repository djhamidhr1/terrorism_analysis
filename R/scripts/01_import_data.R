# ============= IMPORT DES DONNÉES =============
library(tidyverse)
library(readr)
library(sparklyr)
library(dplyr)

# 1. Configuration des chemins
DATA_PATH <- "data/raw/globalterrorismdb_0718dist.csv"
PROCESSED_PATH <- "data/processed/terrorism_processed.parquet"

# 2. Fonction d'import des données
import_terrorism_data <- function(file_path) {
  print("Importation des données...")
  data <- read_csv(file_path)
  return(data)
}

# 3. Fonction d'aperçu des données
examine_data <- function(data) {
  print("Aperçu des données:")
  glimpse(data)
  
  print("\nRésumé statistique:")
  summary(data)
  
  print("\nValeurs manquantes par colonne:")
  colSums(is.na(data))
}

# 4. Exécution
main <- function() {
  # Import des données
  terrorism_data <- import_terrorism_data(DATA_PATH)
  
  # Examen des données
  examine_data(terrorism_data)
  
  # Sauvegarde en format parquet
  write_parquet(terrorism_data, PROCESSED_PATH)
  
  print("Import et analyse initiale terminés!")
}

# Lancement du script
main()