# workshop-bdd
Système de gestion d'un centre médical

### Objectifs du workshop :

Comprendre les bases de données relationnelles et le langage SQL.

Apprendre à manipuler une base de données en utilisant SQL pour interagir avec des données.

Créer une base de données et travailler sur des cas pratiques de gestion de données dans un système médical.

### Programme du workshop
# Introduction à SQL et aux bases de données relationnelles

## Qu'est-ce que SQL ?

SQL (Structured Query Language) est un langage standard utilisé pour interagir avec des bases de données relationnelles.

Il permet de créer, manipuler et interroger les données stockées dans des bases de données.

## Pourquoi utiliser SQL ?

SQL est essentiel pour interagir avec des systèmes de gestion de bases de données (SGBD) comme MySQL, PostgreSQL, ou SQLite.

## Structure d'une base de données relationnelle :

Tables : Contiennent les données sous forme de lignes (enregistrements) et de colonnes (attributs).

Clés primaires et étrangères : Assurent l'intégrité des données et les relations entre les tables.

Relations entre les utilisateurs : Les patients et les médecins sont considérés comme des utilisateurs, mais ils sont gérés dans des tables distinctes pour éviter les redondances.


## Contexte du Projet - Système de gestion d'un centre médical

# Exemple de projet basé sur un centre médical :

### Tables principales à créer :

Utilisateurs (pour patients et médecins) : id_utilisateur, nom, prenom, type_utilisateur (patient ou médecin).

Rendez-vous : id_rdv, id_patient, id_medecin, date_rdv, status (ex. confirmé, non confirmé).

Factures : id_facture, id_rdv, montant, date_facture.


### Création de la base de données et insertion des données

## Exercice 1 : Création de la base de données

# Créez les tables suivantes :

Utilisateurs : Pour stocker les informations des patients et des médecins.

Rendez-vous : Pour gérer les rendez-vous entre patients et médecins.

Factures : Pour suivre les paiements.

Reliez les tables entre elles avec des clés primaires et étrangères.

## Exercice 2 : Insertion des données

# Insérez au moins 5 exemples de rendez-vous avec les différents statuts (confirmé, non confirmé).


Requêtes SQL pour interroger les données

## Exercice 3 : Sélection de données avec jointures

# Écrivez des requêtes SQL pour :

Afficher tous les rendez-vous d'un patient particulier.

Afficher tous les rendez-vous confirmés ou non confirmés.

Afficher le détail des rendez-vous avec les informations sur les utilisateurs et les médecins (utilisation de jointures).

## Exercice 4 : Mise à jour des données

Écrivez une requête SQL pour modifier le statut d'un rendez-vous, par exemple pour passer de "non confirmé" à "confirmé".

## Exercice 5 : Suppression des données

Écrivez une requête SQL pour supprimer un rendez-vous ou un utilisateur (patient ou médecin).


## Exercice 6 : Utilisation des fonctions d'agrégation

Calcul du nombre total de rendez-vous par patient :

Écrivez une requête SQL pour compter combien de rendez-vous ont été pris par chaque patient.

Somme des montants des factures par patient :

Écrivez une requête SQL pour afficher la somme totale des montants facturés pour chaque patient.

Moyenne des montants des factures pour tous les rendez-vous confirmés :

Écrivez une requête SQL pour calculer la moyenne des montants des factures où le statut du rendez-vous est "confirmé".

Rendez-vous les plus récents et les plus anciens :

Écrivez une requête SQL pour trouver la date du rendez-vous le plus récent et du plus ancien.

Top des médecins avec le plus de rendez-vous confirmés :

Écrivez une requête SQL pour afficher les médecins qui ont le plus de rendez-vous confirmés (avec un classement optionnel par ordre décroissant).

