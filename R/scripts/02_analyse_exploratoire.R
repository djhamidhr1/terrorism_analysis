# ======= ANALYSE EXPLORATOIRE DES DONNÉES DU TERRORISME =======
library(tidyverse)
library(ggplot2)
library(dplyr)
library(lubridate)

# 1. Chargement des données
print("Chargement des données...")
terrorism_data <- read_csv("data/raw/globalterrorismdb_0718dist.csv")

# 2. Aperçu des données
print("Résumé des données :")
glimpse(terrorism_data)

# 3. Analyses temporelles
analyse_temporelle <- function(data) {
  # Tendances annuelles
  tendances <- data %>%
    group_by(iyear) %>%
    summarise(
      nb_attaques = n(),
      total_victimes = sum(nkill, na.rm = TRUE)
    )
  
  # Visualisation
  ggplot(tendances, aes(x = iyear)) +
    geom_line(aes(y = nb_attaques, color = "Nombre d'attaques")) +
    geom_line(aes(y = total_victimes, color = "Nombre de victimes")) +
    theme_minimal() +
    labs(title = "Évolution des attaques terroristes",
         x = "Année",
         y = "Nombre",
         color = "Indicateur")
}

# 4. Analyses géographiques
analyse_geographique <- function(data) {
  # Top 10 des pays les plus touchés
  top_pays <- data %>%
    group_by(country_txt) %>%
    summarise(
      nb_attaques = n(),
      total_victimes = sum(nkill, na.rm = TRUE)
    ) %>%
    arrange(desc(nb_attaques)) %>%
    head(10)
  
  # Visualisation
  ggplot(top_pays, aes(x = reorder(country_txt, nb_attaques), y = nb_attaques)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    coord_flip() +
    theme_minimal() +
    labs(title = "Top 10 des pays les plus touchés",
         x = "Pays",
         y = "Nombre d'attaques")
}

# 5. Types d'attaques
analyse_types <- function(data) {
  # Distribution des types d'attaques
  types <- data %>%
    group_by(attacktype1_txt) %>%
    summarise(
      nb_attaques = n(),
      moy_victimes = mean(nkill, na.rm = TRUE)
    ) %>%
    arrange(desc(nb_attaques))
  
  # Visualisation
  ggplot(types, aes(x = reorder(attacktype1_txt, nb_attaques), y = nb_attaques)) +
    geom_bar(stat = "identity", fill = "darkred") +
    coord_flip() +
    theme_minimal() +
    labs(title = "Types d'attaques terroristes",
         x = "Type d'attaque",
         y = "Nombre d'attaques")
}

# Exécution des analyses
main <- function() {
  print("Début de l'analyse exploratoire...")
  
  # Analyses temporelles
  print("Analyse des tendances temporelles...")
  p1 <- analyse_temporelle(terrorism_data)
  ggsave("visualizations/tendances_temporelles.png", p1)
  
  # Analyses géographiques
  print("Analyse de la répartition géographique...")
  p2 <- analyse_geographique(terrorism_data)
  ggsave("visualizations/distribution_geographique.png", p2)
  
  # Analyse des types d'attaques
  print("Analyse des types d'attaques...")
  p3 <- analyse_types(terrorism_data)
  ggsave("visualizations/types_attaques.png", p3)
  
  print("Analyse exploratoire terminée !")
}

# Lancement de l'analyse
main()



install.packages("arrow")
library(arrow)