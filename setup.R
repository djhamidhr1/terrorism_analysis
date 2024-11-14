# Installation et configuration initiale
print("Début de la configuration du projet d'analyse du terrorisme...")

# 1. Packages essentiels
packages <- c(
  "tidyverse",  # Pour la manipulation de données
  "sparklyr",   # Pour Spark
  "shiny",      # Pour le dashboard
  "plotly",     # Visualisations interactives
  "leaflet",    # Pour les cartes
  "rmarkdown",  # Pour les rapports
  "caret",      # Pour le machine learning
  "DT",         # Tables interactives
  "viridis"     # Palettes de couleurs
)

# Installation des packages manquants
for(p in packages) {
  if(!require(p, character.only = TRUE)) {
    install.packages(p)
    library(p, character.only = TRUE)
  }
}

# 2. Création de la structure des dossiers
dirs <- c(
  "data/raw",           # Données brutes
  "data/processed",     # Données traitées
  "R/scripts",          # Scripts R
  "reports",           # Rapports
  "visualizations",    # Visualisations
  "models"            # Modèles
)

# Création des dossiers
for(d in dirs) {
  if(!dir.exists(d)) {
    dir.create(d, recursive = TRUE)
    print(paste("Création du dossier:", d))
  }
}

# 3. Installation de Spark
sparklyr::spark_install()

print("Configuration terminée !")