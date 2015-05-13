-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 17 Avril 2015 à 13:41
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `ipssi`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

CREATE TABLE IF NOT EXISTS `actualite` (
  `id_actualite` int(11) NOT NULL AUTO_INCREMENT,
  `titre_actualite` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `actualite` text COLLATE utf8_unicode_ci NOT NULL,
  `date_validite` timestamp NULL DEFAULT NULL,
  `principale_actualite` bit(1) NOT NULL,
  `url_photo_actualite` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_actualite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `administration`
--

CREATE TABLE IF NOT EXISTS `administration` (
  `id_administration` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_statut` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rang` int(11) NOT NULL,
  PRIMARY KEY (`id_administration`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `administration`
--

INSERT INTO `administration` (`id_administration`, `libelle_statut`, `rang`) VALUES
(1, 'Rédacteur', 1),
(2, 'Collaborateur', 2),
(3, 'RH', 3),
(4, 'Manager', 4),
(5, 'Superviseur', 5),
(6, 'Administrateur', 6);

-- --------------------------------------------------------

--
-- Structure de la table `administration_sous_menu`
--

CREATE TABLE IF NOT EXISTS `administration_sous_menu` (
  `id_droit_administration_sous_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_droit` int(11) NOT NULL,
  `id_administration` int(11) NOT NULL,
  `id_sous_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_droit_administration_sous_menu`),
  KEY `id_droit` (`id_droit`),
  KEY `id_statut` (`id_administration`),
  KEY `id_sous_menu` (`id_sous_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `administration_utilisateur`
--

CREATE TABLE IF NOT EXISTS `administration_utilisateur` (
  `id_administration` int(11) NOT NULL,
  `id_utlisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_administration`,`id_utlisateur`),
  KEY `fk_utilisateur_statut` (`id_utlisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE IF NOT EXISTS `candidature` (
  `id_candidature` int(11) NOT NULL AUTO_INCREMENT,
  `id_poste_candidature` int(11) DEFAULT NULL,
  `nom_candidature` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom_candidature` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `adresse_candidature` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cp_candidature` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ville_candidature` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pays_candidature` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mail_candidature` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telephone_candidature` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_naissance` timestamp NOT NULL,
  `url_cv_candidature` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `url_lettre_candidature` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_photo_candidature` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_candidature`),
  KEY `id_poste_candidature` (`id_poste_candidature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `candidature_competence`
--

CREATE TABLE IF NOT EXISTS `candidature_competence` (
  `id_competence` int(11) NOT NULL AUTO_INCREMENT,
  `id_candidature` int(11) NOT NULL,
  `libelle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_competence`),
  KEY `id_candidature` (`id_candidature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `candidature_experience`
--

CREATE TABLE IF NOT EXISTS `candidature_experience` (
  `id_experience` int(11) NOT NULL AUTO_INCREMENT,
  `id_candidature` int(11) NOT NULL,
  `poste` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `experience` int(11) NOT NULL,
  `etablissement` int(11) NOT NULL,
  `date_debut` timestamp NOT NULL,
  `date_fin` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_experience`),
  KEY `id_candidature` (`id_candidature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `candidature_formation`
--

CREATE TABLE IF NOT EXISTS `candidature_formation` (
  `id_formation` int(11) NOT NULL AUTO_INCREMENT,
  `id_candidature` int(11) NOT NULL,
  `formation` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `etablissement` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `date_debut` timestamp NOT NULL,
  `date_fin` timestamp NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_formation`),
  KEY `id_candidature` (`id_candidature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `candidature_loisir`
--

CREATE TABLE IF NOT EXISTS `candidature_loisir` (
  `id_loisir` int(11) NOT NULL AUTO_INCREMENT,
  `id_candidature` int(11) NOT NULL,
  `loisir` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_loisir`),
  KEY `id_candidature` (`id_candidature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `conges`
--

CREATE TABLE IF NOT EXISTS `conges` (
  `id_conges` int(11) NOT NULL AUTO_INCREMENT,
  `id_type_conges` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `lieu_intervention` varchar(250) DEFAULT NULL,
  `date_debut_conges` timestamp NOT NULL,
  `date_fin_conges` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nb_jours_conges` float NOT NULL,
  `etat_conges` tinyint(4) NOT NULL DEFAULT '0',
  `date_demande` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reponse_responsable` bit(1) DEFAULT NULL,
  `reponse_dirigeant` bit(1) DEFAULT NULL,
  `commentaire` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_conges`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_type_conges` (`id_type_conges`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `id_contact_type` int(11) NOT NULL,
  `id_contact_demande` int(11) NOT NULL,
  `id_sexe` int(11) NOT NULL,
  `nom_contact` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `prenom_contact` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fonction_contact` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `societe_contact` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_contact` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `telephone_contact` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_contact` text COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_contact`),
  KEY `id_type_contact` (`id_contact_type`),
  KEY `id_type_demande` (`id_contact_demande`),
  KEY `id_sexe` (`id_sexe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contact_demande`
--

CREATE TABLE IF NOT EXISTS `contact_demande` (
  `id_contact_demande` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_contact_demande` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_contact_demande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contact_type`
--

CREATE TABLE IF NOT EXISTS `contact_type` (
  `id_contact_type` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_contact_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_contact_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `detail_note_frais`
--

CREATE TABLE IF NOT EXISTS `detail_note_frais` (
  `id_detail_note_frais` int(11) NOT NULL AUTO_INCREMENT,
  `id_note_frais` int(11) NOT NULL,
  `id_type_detail_note_frais` int(11) NOT NULL,
  `date_detail_note_frais` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `prix_detail_note_frais` float NOT NULL,
  PRIMARY KEY (`id_detail_note_frais`),
  KEY `id_type_detail_note_frais` (`id_type_detail_note_frais`),
  KEY `id_note_frais` (`id_note_frais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

CREATE TABLE IF NOT EXISTS `droit` (
  `id_droit` int(11) NOT NULL AUTO_INCREMENT,
  `diminutif_droit` varchar(10) NOT NULL,
  `libelle_droit` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_droit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `droit`
--

INSERT INTO `droit` (`id_droit`, `diminutif_droit`, `libelle_droit`) VALUES
(1, 'T', 'Tous les droits (voir + modifier) sur N, N+ et N-'),
(2, 'V', 'Visualisation N et N-'),
(3, 'M', 'Visualisaion et modification N et N-'),
(4, 'P', 'Visualisation et modification N (personnelle)');

-- --------------------------------------------------------

--
-- Structure de la table `etat_demande`
--

CREATE TABLE IF NOT EXISTS `etat_demande` (
  `id_etat_demande` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_etat_demande` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_etat_demande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_menu` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_presence` int(11) NOT NULL,
  `tri` int(11) NOT NULL,
  `lien` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `id_presence` (`id_presence`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `menu`
--

INSERT INTO `menu` (`id_menu`, `libelle_menu`, `id_presence`, `tri`, `lien`) VALUES
(1, 'Actualités', 1, 1, NULL),
(2, 'Ressources Humaines', 1, 2, NULL),
(3, 'Boîte à outils', 1, 3, NULL),
(4, 'Paramétrage', 1, 4, NULL),
(5, 'Administration', 1, 5, NULL),
(6, 'Le groupe', 2, 1, NULL),
(7, 'L''activité', 2, 2, NULL),
(8, 'Nous Rejoindre', 2, 3, NULL),
(9, 'L''Espace collaborateur', 2, 4, NULL),
(10, 'Contact', 2, 5, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `note_frais`
--

CREATE TABLE IF NOT EXISTS `note_frais` (
  `id_note_frais` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `validation` tinyint(1) NOT NULL,
  `date_depot` timestamp NULL DEFAULT NULL,
  `date_modification` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `etat_note_frais` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_note_frais`),
  KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE IF NOT EXISTS `poste` (
  `id_poste` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(250) NOT NULL,
  PRIMARY KEY (`id_poste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `poste_candidature`
--

CREATE TABLE IF NOT EXISTS `poste_candidature` (
  `id_poste` int(11) NOT NULL AUTO_INCREMENT,
  `titre_poste` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accroche_poste` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `entreprise_poste` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_depot` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_debut_poste` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remuneration_poste` float NOT NULL,
  PRIMARY KEY (`id_poste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `presence`
--

CREATE TABLE IF NOT EXISTS `presence` (
  `id_presence` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_presence` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_presence`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `presence`
--

INSERT INTO `presence` (`id_presence`, `libelle_presence`) VALUES
(1, 'ERP'),
(2, 'Internet'),
(3, 'ERP + Internet');

-- --------------------------------------------------------

--
-- Structure de la table `sexe`
--

CREATE TABLE IF NOT EXISTS `sexe` (
  `id_sexe` int(11) NOT NULL AUTO_INCREMENT,
  `raccourci_sexe` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `libelle_sexe` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_sexe`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `sexe`
--

INSERT INTO `sexe` (`id_sexe`, `raccourci_sexe`, `libelle_sexe`) VALUES
(1, 'M.', 'Monsieur'),
(2, 'Mme', 'Madame'),
(3, 'Mlle', 'Mademoiselle');

-- --------------------------------------------------------

--
-- Structure de la table `sous_menu`
--

CREATE TABLE IF NOT EXISTS `sous_menu` (
  `id_sous_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `libelle_sous_menu` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tri` int(11) NOT NULL,
  `lien` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_sous_menu`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `sous_menu`
--

INSERT INTO `sous_menu` (`id_sous_menu`, `id_menu`, `libelle_sous_menu`, `tri`, `lien`) VALUES
(1, 2, 'CRA', 1, NULL),
(2, 2, 'Note de Frais', 2, NULL),
(3, 2, 'Demande de congés', 3, NULL),
(4, 2, 'CVThèque', 4, NULL),
(5, 2, 'Offre de poste', 5, NULL),
(6, 2, 'Candidatures', 6, NULL),
(7, 2, 'Collaborateurs', 7, NULL),
(8, 3, 'Certifications', 1, NULL),
(9, 3, 'Documents de travail', 2, NULL),
(10, 4, 'RH', 1, NULL),
(11, 4, 'CRM', 2, NULL),
(12, 5, 'Gestion des utilisateurs', 1, NULL),
(13, 5, 'Application', 2, NULL),
(14, 6, 'Présentation', 1, NULL),
(15, 6, 'Chiffre clés', 2, NULL),
(16, 6, 'Notre expertise', 3, NULL),
(17, 6, 'Les valeurs du groupe', 4, NULL),
(18, 7, 'Nos métiers', 1, NULL),
(19, 7, 'Nos secteurs d''activités', 2, NULL),
(20, 7, 'Ils nous font confiance', 3, NULL),
(21, 8, 'Les postes à pourvoir', 1, NULL),
(22, 8, 'Postuler', 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sous_sous_menu`
--

CREATE TABLE IF NOT EXISTS `sous_sous_menu` (
  `id_sous_sous_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_sous_menu` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `tri` int(11) DEFAULT NULL,
  `lien` varchar(50) NOT NULL,
  PRIMARY KEY (`id_sous_sous_menu`),
  KEY `id_sous_menu` (`id_sous_menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `sous_sous_menu`
--

INSERT INTO `sous_sous_menu` (`id_sous_sous_menu`, `id_sous_menu`, `libelle`, `tri`, `lien`) VALUES
(1, 14, 'La société', 1, ''),
(2, 15, 'Détails', 1, ''),
(3, 16, 'Présentaion des expertises', 1, ''),
(4, 16, 'Assistance technique', 2, ''),
(5, 16, 'Formation', 3, ''),
(6, 16, 'Forfait', 4, ''),
(7, 17, 'Les valeurs du groupe', 1, ''),
(8, 18, 'Présentation', 1, ''),
(9, 19, 'Présentation des secteurs', 1, ''),
(10, 19, 'Energie', 2, ''),
(11, 19, 'Défence', 3, ''),
(12, 19, 'Chimie, Pétrochimie, Pharmacie', 4, ''),
(13, 19, 'Industrie lourde', 5, ''),
(14, 19, 'Transports', 6, ''),
(15, 20, 'Clients', 1, ''),
(16, 21, 'Détails', 1, ''),
(17, 22, 'Formulaire', 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE IF NOT EXISTS `statut` (
  `id_statut` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_statut` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_statut`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `statut`
--

INSERT INTO `statut` (`id_statut`, `libelle_statut`) VALUES
(1, 'Collaborateur (pré-embauche)'),
(2, 'salarié'),
(3, 'ancien salarié');

-- --------------------------------------------------------

--
-- Structure de la table `type_conges`
--

CREATE TABLE IF NOT EXISTS `type_conges` (
  `id_type_conges` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type_conges`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `type_conges`
--

INSERT INTO `type_conges` (`id_type_conges`, `libelle`) VALUES
(1, 'Congés payés'),
(2, 'Congé sans solde'),
(3, 'Congé maladie'),
(4, 'Congé maternité'),
(5, 'Congé pour catastrophe naturelle'),
(6, 'RTT'),
(7, 'Congé exceptionnel'),
(8, 'Congé paternité'),
(9, 'Congé pour examen');

-- --------------------------------------------------------

--
-- Structure de la table `type_detail_note_frais`
--

CREATE TABLE IF NOT EXISTS `type_detail_note_frais` (
  `id_type_detail_note_frais` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_note_frais` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type_detail_note_frais`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `type_detail_note_frais`
--

INSERT INTO `type_detail_note_frais` (`id_type_detail_note_frais`, `libelle_note_frais`) VALUES
(1, 'Transports en commun'),
(2, 'Hébergement'),
(3, 'Restauration'),
(4, 'Frais kilométriques');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `id_statut` int(11) NOT NULL,
  `id_poste` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `mdp` varchar(50) NOT NULL,
  `date_mdp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `adresse` varchar(200) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`),
  KEY `id_statut` (`id_statut`),
  KEY `id_poste` (`id_poste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `administration_sous_menu`
--
ALTER TABLE `administration_sous_menu`
  ADD CONSTRAINT `administration_sous_menu_ibfk_2` FOREIGN KEY (`id_sous_menu`) REFERENCES `sous_menu` (`id_sous_menu`),
  ADD CONSTRAINT `administration_sous_menu_ibfk_3` FOREIGN KEY (`id_droit`) REFERENCES `droit` (`id_droit`),
  ADD CONSTRAINT `administration_sous_menu_ibfk_4` FOREIGN KEY (`id_administration`) REFERENCES `administration` (`id_administration`);

--
-- Contraintes pour la table `administration_utilisateur`
--
ALTER TABLE `administration_utilisateur`
  ADD CONSTRAINT `administration_utilisateur_ibfk_1` FOREIGN KEY (`id_administration`) REFERENCES `administration` (`id_administration`),
  ADD CONSTRAINT `fk_utilisateur_statut` FOREIGN KEY (`id_utlisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `candidature_ibfk_1` FOREIGN KEY (`id_poste_candidature`) REFERENCES `poste_candidature` (`id_poste`);

--
-- Contraintes pour la table `candidature_competence`
--
ALTER TABLE `candidature_competence`
  ADD CONSTRAINT `candidature_competence_ibfk_1` FOREIGN KEY (`id_candidature`) REFERENCES `candidature` (`id_candidature`);

--
-- Contraintes pour la table `candidature_experience`
--
ALTER TABLE `candidature_experience`
  ADD CONSTRAINT `fk_candidature_experience` FOREIGN KEY (`id_candidature`) REFERENCES `candidature` (`id_candidature`);

--
-- Contraintes pour la table `candidature_formation`
--
ALTER TABLE `candidature_formation`
  ADD CONSTRAINT `candidature_formation_ibfk_1` FOREIGN KEY (`id_candidature`) REFERENCES `candidature` (`id_candidature`);

--
-- Contraintes pour la table `candidature_loisir`
--
ALTER TABLE `candidature_loisir`
  ADD CONSTRAINT `fk_candidature_loisir` FOREIGN KEY (`id_candidature`) REFERENCES `candidature` (`id_candidature`);

--
-- Contraintes pour la table `conges`
--
ALTER TABLE `conges`
  ADD CONSTRAINT `conges_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`idUtilisateur`),
  ADD CONSTRAINT `conges_ibfk_2` FOREIGN KEY (`id_type_conges`) REFERENCES `type_conges` (`id_type_conges`);

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`id_contact_type`) REFERENCES `contact_type` (`id_contact_type`),
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`id_contact_demande`) REFERENCES `contact_demande` (`id_contact_demande`),
  ADD CONSTRAINT `contact_ibfk_3` FOREIGN KEY (`id_sexe`) REFERENCES `sexe` (`id_sexe`);

--
-- Contraintes pour la table `detail_note_frais`
--
ALTER TABLE `detail_note_frais`
  ADD CONSTRAINT `detail_note_frais_ibfk_1` FOREIGN KEY (`id_note_frais`) REFERENCES `note_frais` (`id_note_frais`),
  ADD CONSTRAINT `detail_note_frais_ibfk_2` FOREIGN KEY (`id_type_detail_note_frais`) REFERENCES `type_detail_note_frais` (`id_type_detail_note_frais`);

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_presence`) REFERENCES `presence` (`id_presence`);

--
-- Contraintes pour la table `note_frais`
--
ALTER TABLE `note_frais`
  ADD CONSTRAINT `note_frais_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `sous_menu`
--
ALTER TABLE `sous_menu`
  ADD CONSTRAINT `fk_menu_sous_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Contraintes pour la table `sous_sous_menu`
--
ALTER TABLE `sous_sous_menu`
  ADD CONSTRAINT `sous_sous_menu_ibfk_1` FOREIGN KEY (`id_sous_menu`) REFERENCES `sous_menu` (`id_sous_menu`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`),
  ADD CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`id_poste`) REFERENCES `poste` (`id_poste`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
