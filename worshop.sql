-- table users
CREATE OR REPLACE TABLE users(
	id_users INT AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(20),
	prenom VARCHAR(20),
	type_user ENUM('patient', 'médcin')
);
-- table rendez vous
CREATE TABLE rdv(
	id_rdv INT AUTO_INCREMENT PRIMARY KEY,
	id_patient INT NOT NULL,
	id_medcin INT NOT NULL ,
	date_rdv DATE NOT NULL ,
	statut ENUM('Confirmée', 'Non Confirmée') DEFAULT 'Non Confirmée',
	FOREIGN KEY (id_patient) REFERENCES users(id_users) 
	 ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_medcin) REFERENCES users(id_users)
	ON DELETE CASCADE ON UPDATE CASCADE
);
-- table factures
CREATE TABLE facture(
	id_facture int AUTO_INCREMENT PRIMARY KEY,
	id_redv INT NOT NULL ,
	montant DOUBLE NOT NULL,
	date_facture DATE NOT NULL ,
	FOREIGN KEY (id_redv) REFERENCES rdv(id_rdv) ON DELETE CASCADE ON UPDATE CASCADE 
); 


-- insertions de donnes 
INSERT INTO users (nom, prenom, type_user) VALUES ('Dupont', 'Marie', 'patient');
INSERT INTO users (nom, prenom, type_user) VALUES ('Durand', 'Paul', 'médcin');
INSERT INTO users (nom, prenom, type_user) VALUES ('Lemoine', 'Clara', 'patient');
INSERT INTO users (nom, prenom, type_user) VALUES ('Bernard', 'Hugo', 'médcin');
INSERT INTO users (nom, prenom, type_user) VALUES ('Martin', 'Sophie', 'patient');
INSERT INTO users (nom, prenom, type_user) VALUES ('Rousseau', 'Jean', 'médcin');

INSERT INTO rdv (id_patient, id_medcin, date_rdv, statut) VALUES (1, 2, '2024-01-10', 'Confirmée');
INSERT INTO rdv (id_patient, id_medcin, date_rdv, statut) VALUES (3, 4, '2024-01-15', 'Non Confirmée');
INSERT INTO rdv (id_patient, id_medcin, date_rdv, statut) VALUES (5, 2, '2024-01-20', 'Confirmée');
INSERT INTO rdv (id_patient, id_medcin, date_rdv, statut) VALUES (1, 4, '2024-01-25', 'Non Confirmée');
INSERT INTO rdv (id_patient, id_medcin, date_rdv, statut) VALUES (3, 6, '2024-01-30', 'Confirmée');
INSERT INTO rdv (id_patient, id_medcin, date_rdv, statut) VALUES (5, 6, '2024-02-05', 'Non Confirmée');

INSERT INTO facture (id_redv, montant, date_facture) VALUES (1, 650.00, '2024-01-11');
INSERT INTO facture (id_redv, montant, date_facture) VALUES (2, 775.50, '2024-01-16');
INSERT INTO facture (id_redv, montant, date_facture) VALUES (3, 460.00, '2024-01-21');
INSERT INTO facture (id_redv, montant, date_facture) VALUES (4, 380.00, '2024-01-26');
INSERT INTO facture (id_redv, montant, date_facture) VALUES (5, 870.00, '2024-01-31');
INSERT INTO facture (id_redv, montant, date_facture) VALUES (6, 1100.00, '2024-02-06');

-- Exercice 3 : Sélection de données avec jointures
--Afficher tous les rendez-vous d'un patient particulier.
SELECT * FROM rdv 
WHERE id_patient=5;

SELECT * FROM rdv  JOIN users ON rdv.id_patient=users.id_users
WHERE nom="Martin";
 -- Afficher tous les rendez-vous confirmés ou non confirmés.
SELECT * FROM rdv  ;
-- Afficher le détail des rendez-vous avec les informations sur les utilisateurs et les médecins (utilisation de jointures).
SELECT 
    p.nom AS patient_nom,
    p.prenom AS patient_prenom,
    m.nom AS medcin_nom,
    m.prenom AS medcin_prenom,
    r.date_rdv,
    r.statut
FROM 
    rdv r
JOIN 
    users p ON r.id_patient = p.id_users
JOIN 
    users m ON r.id_medcin = m.id_users;

-- Exercice 4 : Mise à jour des données
-- Écrivez une requête SQL pour modifier le statut d'un rendez-vous, par exemple pour passer de "non confirmé" à "confirmé".

UPDATE rdv 
SET statut="Confirmée"
WHERE statut="Non Confirmée";

-- Exercice 5 : Suppression des données

-- Écrivez une requête SQL pour supprimer un rendez-vous ou un utilisateur (patient ou médecin).
DELETE FROM rdv WHERE id_patient=5 ;

-- Exercice 6 : Utilisation des fonctions d'agrégation

-- Calcul du nombre total de rendez-vous par patient :
-- Écrivez une requête SQL pour compter combien de rendez-vous ont été pris par chaque patient.
SELECT id_patient,COUNT(id_rdv)
FROM rdv
GROUP BY id_patient;
-- Somme des montants des factures par patient :

-- Écrivez une requête SQL pour afficher la somme totale des montants facturés pour chaque patient.
SELECT rdv.id_patient,SUM(facture.montant)
FROM rdv JOIN facture ON rdv.id_rdv =facture.id_redv
GROUP BY rdv.id_patient;
-- Moyenne des montants des factures pour tous les rendez-vous confirmés :

-- Écrivez une requête SQL pour calculer la moyenne des montants des factures où le statut du rendez-vous est "confirmé".

SELECT AVG(facture.montant) AS moyenne_montant
FROM rdv 
JOIN facture ON rdv.id_rdv = facture.id_redv
WHERE rdv.statut = 'Confirmée';

-- Rendez-vous les plus récents et les plus anciens :

-- Écrivez une requête SQL pour trouver la date du rendez-vous le plus récent et du plus ancien.
SELECT Max(date_rdv) AS plus_ancien_date
FROM rdv 
;
SELECT Min(date_rdv) AS plus_ancien_date
FROM rdv 
;

-- Top des médecins avec le plus de rendez-vous confirmés :

-- Écrivez une requête SQL pour afficher les médecins qui ont le plus de rendez-vous confirmés (avec un classement optionnel par ordre décroissant).

SELECT 
    u.nom AS nom_med, 
    u.prenom AS prenom_med, 
    COUNT(r.id_rdv) AS nb_rdv_confirmes
FROM rdv r
JOIN users u ON r.id_medcin = u.id_users
WHERE r.statut = 'Confirmée'
GROUP BY u.id_users, u.nom, u.prenom
ORDER BY nb_rdv_confirmes DESC;
