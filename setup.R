# ============= CONFIGURATION INITIALE =============
print("Début de la configuration du projet d'analyse du terrorisme...")

# 1. Installation des packages essentiels
packages <- c(
  "tidyverse",  # Pour la manipulation de données
  "sparklyr",   # Pour Spark
  "shiny",      # Pour le dashboard
  "plotly",     # Visualisations interactives
  "leaflet",    # Pour les cartes
  "rmarkdown",  # Pour les rapports
  "caret",      # Pour le machine learning
  "DT",         # Tables interactives
  "viridis",    # Palettes de couleurs
  "arrow"       # Stockage efficace des données
)

# Fonction d'installation des packages
install_packages <- function(packages) {
  for(p in packages) {
    if(!require(p, character.only = TRUE)) {
      print(paste("Installation du package:", p))
      install.packages(p)
      library(p, character.only = TRUE)
    }
  }
}

# Exécution de l'installation
install_packages(packages)

# 2. Création de la structure des dossiers
create_project_structure <- function() {
  dirs <- c(
    "data/raw",        # Données brutes
    "data/processed",  # Données traitées
    "R/scripts",       # Scripts R
    "reports",         # Rapports
    "visualizations",  # Visualisations
    "models"           # Modèles
  )
  
  for(d in dirs) {
    if(!dir.exists(d)) {
      dir.create(d, recursive = TRUE)
      print(paste("Création du dossier:", d))
    }
  }
}

create_project_structure()

print("Structure du projet créée avec succès!")
