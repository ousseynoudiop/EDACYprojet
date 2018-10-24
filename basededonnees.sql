-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 24 Octobre 2018 à 16:01
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `banque`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `NumCompte` int(11) NOT NULL,
  `prénom` varchar(30) NOT NULL,
  `Nom` varchar(30) NOT NULL,
  `Sexe` varchar(15) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `solde` double NOT NULL,
  `decouvert` double NOT NULL,
  PRIMARY KEY (`NumCompte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`NumCompte`, `prénom`, `Nom`, `Sexe`, `adresse`, `pays`, `solde`, `decouvert`) VALUES
(4, 'ousseynou', 'Diop', 'homme', 'yeumbeul', 'senegal', 1000, 2000);
--
-- Base de données :  `ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `id_classe` int(100) NOT NULL AUTO_INCREMENT,
  `NomClasse` varchar(100) NOT NULL,
  `IndiceClasse` varchar(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  PRIMARY KEY (`id_classe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `NomClasse`, `IndiceClasse`, `id_user`) VALUES
(6, 'Terminale', 'S3', 0),
(8, 'Terminale', 'L1b', 0),
(9, 'Terminale', 'L1a', 0);

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE IF NOT EXISTS `eleves` (
  `id_eleve` int(100) NOT NULL AUTO_INCREMENT,
  `Prenom` varchar(100) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `DateNaissance` date NOT NULL,
  `LieuNaissance` varchar(100) NOT NULL,
  `Adresse` varchar(100) NOT NULL,
  `PrenomParent` varchar(100) NOT NULL,
  `NomParent` varchar(100) NOT NULL,
  `classe` varchar(100) NOT NULL,
  PRIMARY KEY (`id_eleve`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`id_eleve`, `Prenom`, `Nom`, `DateNaissance`, `LieuNaissance`, `Adresse`, `PrenomParent`, `NomParent`, `classe`) VALUES
(5, 'ousseynou', 'DIOP', '1993-01-03', 'Ndomor', 'Yeumbeul', 'Moussa', 'DIOP', '6'),
(6, 'Khadim', 'DIOP', '1990-12-31', 'Yeumbeul', 'Yeumbeul', 'Moussa', 'DIOP', '8');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Email` varchar(100) NOT NULL,
  `Prenom` varchar(100) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`Email`, `Prenom`, `Nom`, `Username`, `Password`) VALUES
('diop@gmail.com', 'Ousseynou', 'DIOP', 'diop@ecole.exellence', 'passer');
--
-- Base de données :  `employe`
--

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `Matle` varchar(20) NOT NULL,
  `Prenom` varchar(30) NOT NULL,
  `Nom` varchar(15) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `pays` varchar(20) NOT NULL,
  PRIMARY KEY (`Matle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `personnel`
--

INSERT INTO `personnel` (`Matle`, `Prenom`, `Nom`, `sexe`, `pays`) VALUES
('', '', '', 'homme', ''),
('106205/G', 'Ousseynou', 'Diop', '708942737', ''),
('14', 'kha', 'd', 'homme', 'senegal');
--
-- Base de données :  `fatou`
--

-- --------------------------------------------------------

--
-- Structure de la table `affecter`
--

CREATE TABLE IF NOT EXISTS `affecter` (
  `IDPERSONNEL` varchar(5) NOT NULL,
  `ATTRIBUT_8` varchar(5) NOT NULL,
  PRIMARY KEY (`IDPERSONNEL`,`ATTRIBUT_8`),
  KEY `FK_AFFECTER2` (`ATTRIBUT_8`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE IF NOT EXISTS `consultation` (
  `ATTRIBUT_8` varchar(5) NOT NULL,
  `IDPATIENT` varchar(5) NOT NULL,
  `IDFACTURE` varchar(5) DEFAULT NULL,
  `POIDS` int(11) DEFAULT NULL,
  `TEMPERATURE` varchar(5) DEFAULT NULL,
  `PRESSION` float DEFAULT NULL,
  `DIAGNOSTIC` varchar(300) DEFAULT NULL,
  `TRAITEMENT` varchar(80) DEFAULT NULL,
  `HORAIRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ATTRIBUT_8`),
  KEY `FK_AVOIR` (`IDPATIENT`),
  KEY `FK_CORRESPONDRE2` (`IDFACTURE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `IDFACTURE` varchar(5) NOT NULL,
  `ATTRIBUT_8` varchar(5) NOT NULL,
  `COUT` int(11) DEFAULT NULL,
  `_DATE_FACTURE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDFACTURE`),
  KEY `FK_CORRESPONDRE` (`ATTRIBUT_8`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `IDPATIENT` varchar(5) NOT NULL,
  `LOGIN` varchar(25) NOT NULL,
  `AGE` int(11) DEFAULT NULL,
  `SEXE` varchar(3) DEFAULT NULL,
  `ADRESSE` varchar(25) DEFAULT NULL,
  `TEL` varchar(10) DEFAULT NULL,
  `NOM_PATIENT` varchar(30) DEFAULT NULL,
  `PRENOM_PATIENT` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`IDPATIENT`),
  KEY `FK_ETRE` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `IDPERSONNEL` varchar(5) NOT NULL,
  `LOGIN` varchar(25) NOT NULL,
  `CATEGORIE` varchar(50) DEFAULT NULL,
  `SALAIRE` float DEFAULT NULL,
  `_NOM_PATIENT` varchar(25) DEFAULT NULL,
  `PRENOM_PERSONNEL` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IDPERSONNEL`),
  KEY `FK_POUVOIR` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rv`
--

CREATE TABLE IF NOT EXISTS `rv` (
  `IDRDV` varchar(5) NOT NULL,
  `IDPATIENT` varchar(5) NOT NULL,
  `NOMSERVICE` varchar(50) DEFAULT NULL,
  `DATE_RDV` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDRDV`),
  KEY `FK_PASSER` (`IDPATIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `LOGIN` varchar(25) NOT NULL,
  `PASSWD` varchar(25) DEFAULT NULL,
  `PROFIL_UTILISATEUR` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `affecter`
--
ALTER TABLE `affecter`
  ADD CONSTRAINT `FK_AFFECTER` FOREIGN KEY (`IDPERSONNEL`) REFERENCES `personnel` (`IDPERSONNEL`),
  ADD CONSTRAINT `FK_AFFECTER2` FOREIGN KEY (`ATTRIBUT_8`) REFERENCES `consultation` (`ATTRIBUT_8`);

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `FK_AVOIR` FOREIGN KEY (`IDPATIENT`) REFERENCES `patient` (`IDPATIENT`),
  ADD CONSTRAINT `FK_CORRESPONDRE2` FOREIGN KEY (`IDFACTURE`) REFERENCES `facture` (`IDFACTURE`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `FK_CORRESPONDRE` FOREIGN KEY (`ATTRIBUT_8`) REFERENCES `consultation` (`ATTRIBUT_8`);

--
-- Contraintes pour la table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `FK_ETRE` FOREIGN KEY (`LOGIN`) REFERENCES `utilisateurs` (`LOGIN`);

--
-- Contraintes pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `FK_POUVOIR` FOREIGN KEY (`LOGIN`) REFERENCES `utilisateurs` (`LOGIN`);

--
-- Contraintes pour la table `rv`
--
ALTER TABLE `rv`
  ADD CONSTRAINT `FK_PASSER` FOREIGN KEY (`IDPATIENT`) REFERENCES `patient` (`IDPATIENT`);
--
-- Base de données :  `jootali`
--

-- --------------------------------------------------------

--
-- Structure de la table `cni`
--

CREATE TABLE IF NOT EXISTS `cni` (
  `numCNI` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prénom` varchar(100) NOT NULL,
  `dateNaiss` date NOT NULL,
  `LieuNaiss` varchar(100) NOT NULL,
  `LocalisationCNI` varchar(100) NOT NULL,
  PRIMARY KEY (`numCNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Base de données :  `ndomor`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `NumCompte` int(100) NOT NULL AUTO_INCREMENT,
  `Prenom` varchar(100) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `DateNaissance` date NOT NULL,
  `LieuNaissance` varchar(100) NOT NULL,
  `Civilite` varchar(100) NOT NULL,
  `Matrimoniale` varchar(100) NOT NULL,
  `Conjoint` varchar(100) NOT NULL,
  `DateInscription` date NOT NULL,
  `TypePiece` varchar(100) NOT NULL,
  `NumPiece` varchar(100) NOT NULL,
  `Adresse` varchar(100) NOT NULL,
  `PersonneConctact` varchar(100) NOT NULL,
  `Solde` double NOT NULL,
  `TypeClient` varchar(100) NOT NULL,
  `EmailCaissier` varchar(100) NOT NULL,
  PRIMARY KEY (`NumCompte`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`NumCompte`, `Prenom`, `Nom`, `DateNaissance`, `LieuNaissance`, `Civilite`, `Matrimoniale`, `Conjoint`, `DateInscription`, `TypePiece`, `NumPiece`, `Adresse`, `PersonneConctact`, `Solde`, `TypeClient`, `EmailCaissier`) VALUES
(7, 'atoumane', 'sene', '2018-10-06', 'Yeumbeul', 'Monsieur', 'Celibataire', 'Neant', '2018-10-21', 'cni', '5421', 'Yeumbeul', 'Mbaye', 8566, 'particulier', 'pdf@pdf.pdf'),
(8, 'ousseynou', 'DIOP', '1993-01-03', 'Ndomor', 'Monsieur', 'Celibataire', 'Neant', '2018-10-21', 'carte national d&#039;identitÃ©', '1651199800320', 'Yeumbeul', 'Khadim DIOP', 98391, 'particulier', 'pdf@pdf.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

CREATE TABLE IF NOT EXISTS `credit` (
  `id_credit` int(100) NOT NULL AUTO_INCREMENT,
  `Montant` double NOT NULL,
  `DateReception` date NOT NULL,
  `DateLimite` date NOT NULL,
  `Interet` double NOT NULL,
  `Caution` double NOT NULL,
  `Frais` double NOT NULL,
  `NumCompte` int(100) NOT NULL,
  PRIMARY KEY (`id_credit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `credit`
--

INSERT INTO `credit` (`id_credit`, `Montant`, `DateReception`, `DateLimite`, `Interet`, `Caution`, `Frais`, `NumCompte`) VALUES
(1, 12000, '2018-10-05', '2018-11-27', 840, 1200, 120, 8);

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `id_operation` int(100) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) NOT NULL,
  `montant` double NOT NULL,
  `Date` date NOT NULL,
  `EmailCaissier` varchar(100) NOT NULL,
  `NumCompte` int(100) NOT NULL,
  PRIMARY KEY (`id_operation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `operation`
--

INSERT INTO `operation` (`id_operation`, `Type`, `montant`, `Date`, `EmailCaissier`, `NumCompte`) VALUES
(2, 'Retrait', 500, '2018-10-02', 'ale@ndomor.mutuel', 8),
(3, 'Remboursement de crÃ©dit', 1111, '2018-10-22', 'ale@ndomor.mutuel', 8),
(4, 'Remboursement de crÃ©dit', 5000, '2018-10-23', 'ale@ndomor.mutuel', 8),
(5, 'Remboursement de crÃ©dit', 3000, '2018-10-23', 'ale@ndomor.mutuel', 8);

-- --------------------------------------------------------

--
-- Structure de la table `remboursement`
--

CREATE TABLE IF NOT EXISTS `remboursement` (
  `id_remboursement` int(100) NOT NULL AUTO_INCREMENT,
  `Montant` double NOT NULL,
  `Date` date NOT NULL,
  `Mode` varchar(100) NOT NULL,
  `NumCompte` int(100) NOT NULL,
  `EmailCaissier` varchar(100) NOT NULL,
  `id_credit` int(100) NOT NULL,
  PRIMARY KEY (`id_remboursement`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `remboursement`
--

INSERT INTO `remboursement` (`id_remboursement`, `Montant`, `Date`, `Mode`, `NumCompte`, `EmailCaissier`, `id_credit`) VALUES
(1, 1111, '2018-10-22', '0', 8, 'ale@ndomor.mutuel', 1),
(2, 5000, '2018-10-23', 'espece', 8, 'ale@ndomor.mutuel', 1),
(3, 3000, '2018-10-23', 'espece', 8, 'ale@ndomor.mutuel', 1);

-- --------------------------------------------------------

--
-- Structure de la table `retrait`
--

CREATE TABLE IF NOT EXISTS `retrait` (
  `Id_retrait` int(100) NOT NULL AUTO_INCREMENT,
  `Montant` double NOT NULL,
  `Date` date NOT NULL,
  `Mode` varchar(100) NOT NULL,
  `NumCompte` int(100) NOT NULL,
  PRIMARY KEY (`Id_retrait`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `retrait`
--

INSERT INTO `retrait` (`Id_retrait`, `Montant`, `Date`, `Mode`, `NumCompte`) VALUES
(1, 500, '2018-10-22', 'espece', 8);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'AlÃ©', 'DIOP', 'ale@ndomor.mutuel', 'passer');

-- --------------------------------------------------------

--
-- Structure de la table `versement`
--

CREATE TABLE IF NOT EXISTS `versement` (
  `Id_versement` int(100) NOT NULL AUTO_INCREMENT,
  `Montant` double NOT NULL,
  `Date` date NOT NULL,
  `Mode` varchar(100) NOT NULL,
  `NumCompte` int(100) NOT NULL,
  PRIMARY KEY (`Id_versement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Base de données :  `playsms`
--

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureautoreply`
--

CREATE TABLE IF NOT EXISTS `playsms_featureautoreply` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `autoreply_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `autoreply_keyword` varchar(10) NOT NULL DEFAULT '',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreply_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `playsms_featureautoreply`
--

INSERT INTO `playsms_featureautoreply` (`c_timestamp`, `autoreply_id`, `uid`, `autoreply_keyword`, `smsc`) VALUES
(0, 1, 7321, 'COURS', 'smpp');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureautoreply_scenario`
--

CREATE TABLE IF NOT EXISTS `playsms_featureautoreply_scenario` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `autoreply_scenario_id` int(11) NOT NULL AUTO_INCREMENT,
  `autoreply_id` int(11) NOT NULL DEFAULT '0',
  `autoreply_scenario_param1` varchar(20) NOT NULL DEFAULT '',
  `autoreply_scenario_param2` varchar(20) NOT NULL DEFAULT '',
  `autoreply_scenario_param3` varchar(20) NOT NULL DEFAULT '',
  `autoreply_scenario_param4` varchar(20) NOT NULL DEFAULT '',
  `autoreply_scenario_param5` varchar(20) NOT NULL DEFAULT '',
  `autoreply_scenario_param6` varchar(20) NOT NULL DEFAULT '',
  `autoreply_scenario_param7` varchar(20) NOT NULL DEFAULT '',
  `autoreply_scenario_result` text NOT NULL,
  PRIMARY KEY (`autoreply_scenario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `playsms_featureautoreply_scenario`
--

INSERT INTO `playsms_featureautoreply_scenario` (`c_timestamp`, `autoreply_scenario_id`, `autoreply_id`, `autoreply_scenario_param1`, `autoreply_scenario_param2`, `autoreply_scenario_param3`, `autoreply_scenario_param4`, `autoreply_scenario_param5`, `autoreply_scenario_param6`, `autoreply_scenario_param7`, `autoreply_scenario_result`) VALUES
(1521044000, 1, 1, 'MARDI', '', '', '', '', '', '', 'système 10H-12H SALLE TR'),
(0, 2, 1, 'LUNDI', '', '', '', '', '', '', 'Réseau'),
(1521044045, 3, 1, 'MERCREDI', '', '', '', '', '', '', 'Base de Données 8H-11H'),
(1521044195, 4, 1, 'JEUDI', '', '', '', '', '', '', 'VoIP 9H-12H'),
(1521044230, 5, 1, 'VENDREDI', '', '', '', '', '', '', 'Sécurité  15H-19H'),
(1521044214, 6, 1, 'SAMEDI', '', '', '', '', '', '', 'Windows server 10H-13H');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureboard`
--

CREATE TABLE IF NOT EXISTS `playsms_featureboard` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `board_keyword` varchar(100) NOT NULL DEFAULT '',
  `board_reply` varchar(100) NOT NULL DEFAULT '',
  `board_forward_email` varchar(250) NOT NULL DEFAULT '',
  `board_css` varchar(250) NOT NULL DEFAULT '',
  `board_pref_template` text NOT NULL,
  `board_access_code` varchar(40) NOT NULL DEFAULT '',
  `board_reply_msg` varchar(140) NOT NULL DEFAULT '',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `playsms_featureboard`
--

INSERT INTO `playsms_featureboard` (`c_timestamp`, `board_id`, `uid`, `board_keyword`, `board_reply`, `board_forward_email`, `board_css`, `board_pref_template`, `board_access_code`, `board_reply_msg`, `smsc`) VALUES
(1521546435, 1, 7321, 'EMAIL', 'message transmis par email', 'ousseynou4.diop@ucad.edu.sn', 'http://196.1.97.236/playsms/index.php?app=webservices&amp;op=sms_board&amp;keyword=EMAIL&amp;type=html', '<div class="sms_board_row">\n	<div class="sender">{SENDER}</div>\n	<div class="datetime">{DATETIME}</div>\n	<div class="message">{MESSAGE}</div>\n</div>\n', '', '', 'smpp');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureboard_log`
--

CREATE TABLE IF NOT EXISTS `playsms_featureboard_log` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL DEFAULT '0',
  `in_gateway` varchar(100) NOT NULL DEFAULT '',
  `in_sender` varchar(20) NOT NULL DEFAULT '',
  `in_masked` varchar(20) NOT NULL DEFAULT '',
  `in_keyword` varchar(20) NOT NULL DEFAULT '',
  `in_msg` text NOT NULL,
  `in_reply` varchar(100) NOT NULL DEFAULT '',
  `in_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `playsms_featureboard_log`
--

INSERT INTO `playsms_featureboard_log` (`c_timestamp`, `in_id`, `board_id`, `in_gateway`, `in_sender`, `in_masked`, `in_keyword`, `in_msg`, `in_reply`, `in_datetime`) VALUES
(0, 1, 1, 'smpp', '221708942737', '22170894xxxx', 'EMAIL', 'test redirection', 'ousseynou4.diop@ucad.edu.sn', '2018-03-20 12:38:31'),
(0, 2, 1, 'smpp', '221708942737', '22170894xxxx', 'EMAIL', 'test redirection', 'ousseynou4.diop@ucad.edu.sn', '2018-03-20 12:43:54'),
(0, 3, 1, 'smpp', '221708942737', '22170894xxxx', 'EMAIL', 'test redirection', 'message transmis par email', '2018-03-20 12:47:38'),
(0, 4, 1, 'smpp', '221708942737', '22170894xxxx', 'EMAIL', 'test redirection', 'message transmis par email', '2018-03-20 16:45:18'),
(0, 5, 1, 'smpp', '221708942737', '22170894xxxx', 'EMAIL', 'test redirection', 'message transmis par email', '2018-03-20 16:58:09'),
(0, 6, 1, 'smpp', '221708942737', '22170894xxxx', 'EMAIL', 'test redirection', 'message transmis par email', '2018-03-20 17:08:27');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurecommand`
--

CREATE TABLE IF NOT EXISTS `playsms_featurecommand` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `command_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `command_keyword` varchar(10) NOT NULL DEFAULT '',
  `command_exec` text NOT NULL,
  `command_return_as_reply` int(11) NOT NULL DEFAULT '0',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`command_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurecredit`
--

CREATE TABLE IF NOT EXISTS `playsms_featurecredit` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_uid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(13,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(13,3) NOT NULL DEFAULT '0.000',
  `create_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delete_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `playsms_featurecredit`
--

INSERT INTO `playsms_featurecredit` (`c_timestamp`, `id`, `parent_uid`, `uid`, `username`, `status`, `amount`, `balance`, `create_datetime`, `delete_datetime`, `flag_deleted`) VALUES
(1511452996, 1, 0, 1, 'admin', 2, '1000.000', '0.000', '2017-11-23 16:25:24', '2017-11-23 17:03:16', 1),
(1511452132, 2, 0, 1, 'admin', 2, '1000.000', '0.000', '2017-11-23 16:48:39', '2017-11-23 16:48:52', 1),
(1511453736, 3, 0, 1, 'admin', 2, '1000.000', '0.000', '2017-11-23 17:04:59', '2017-11-23 17:15:36', 1),
(1511454076, 4, 0, 1, 'admin', 2, '500.000', '0.000', '2017-11-23 17:15:00', '2017-11-23 17:21:16', 1),
(1511454659, 5, 0, 1, 'admin', 2, '500.000', '0.000', '2017-11-23 17:19:11', '2017-11-23 17:30:59', 1),
(1511517069, 6, 0, 1, 'admin', 2, '1000.000', '0.000', '2017-11-23 17:31:32', '2017-11-24 10:51:09', 1),
(1511517973, 7, 0, 1, 'admin', 2, '500.000', '0.000', '2017-11-24 10:51:22', '2017-11-24 11:06:13', 1),
(1521564555, 8, 0, 1, 'admin', 2, '1000.000', '0.000', '2017-11-24 11:06:36', '2018-03-20 17:49:15', 1),
(1523357491, 9, 0, 2161, 'mpolle.gaye@ucad.edu.sn', 2, '1000.000', '0.000', '2018-01-17 10:37:38', '2018-04-10 12:51:31', 1),
(0, 10, 0, 1, 'admin', 2, '1000.000', '0.000', '2018-03-20 17:48:34', '0000-00-00 00:00:00', 0),
(0, 11, 0, 1, 'admin', 2, '1000.000', '0.000', '2018-03-20 17:50:08', '0000-00-00 00:00:00', 0),
(1521627917, 12, 0, 1, 'admin', 2, '-940.000', '0.000', '2018-03-21 10:49:10', '2018-03-21 11:25:17', 1),
(1535922792, 13, 1, 2161, 'mpolle.gaye', 4, '9000.000', '0.000', '2018-03-21 16:59:39', '2018-09-02 23:13:12', 1),
(0, 14, 0, 1, 'admin', 2, '9000.000', '0.000', '2018-03-21 17:00:37', '0000-00-00 00:00:00', 0),
(0, 15, 1, 7321, 'Ousseynou', 4, '1000.000', '0.000', '2018-04-06 00:49:06', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurecustom`
--

CREATE TABLE IF NOT EXISTS `playsms_featurecustom` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `service_name` varchar(255) NOT NULL DEFAULT '',
  `custom_keyword` varchar(255) NOT NULL DEFAULT '',
  `sms_receiver` varchar(20) NOT NULL DEFAULT '',
  `custom_url` text NOT NULL,
  `custom_return_as_reply` int(11) NOT NULL DEFAULT '0',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `playsms_featurecustom`
--

INSERT INTO `playsms_featurecustom` (`c_timestamp`, `custom_id`, `uid`, `service_name`, `custom_keyword`, `sms_receiver`, `custom_url`, `custom_return_as_reply`, `smsc`) VALUES
(1535920705, 1, 7321, 'valeur aléatoire', 'VALEUR', 'UCAD', 'http://localhost/random.php', 1, 'smpp');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurefirewall`
--

CREATE TABLE IF NOT EXISTS `playsms_featurefirewall` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureinboxgroup`
--

CREATE TABLE IF NOT EXISTS `playsms_featureinboxgroup` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `in_receiver` varchar(20) NOT NULL DEFAULT '',
  `keywords` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `creation_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclusive` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `playsms_featureinboxgroup`
--

INSERT INTO `playsms_featureinboxgroup` (`c_timestamp`, `id`, `uid`, `in_receiver`, `keywords`, `description`, `creation_datetime`, `exclusive`, `deleted`, `status`) VALUES
(1523376866, 1, 1, '221708942737', 'GROUP', 'test inboxgroup', '2018-03-20 13:53:08', 0, 1, 1),
(0, 2, 1, '21005', 'GRéVE', 'Alerte gréve', '2018-04-09 16:47:48', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureinboxgroup_catchall`
--

CREATE TABLE IF NOT EXISTS `playsms_featureinboxgroup_catchall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureinboxgroup_log_in`
--

CREATE TABLE IF NOT EXISTS `playsms_featureinboxgroup_log_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `sms_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sms_sender` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sms_receiver` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureinboxgroup_log_out`
--

CREATE TABLE IF NOT EXISTS `playsms_featureinboxgroup_log_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_in_id` int(11) NOT NULL DEFAULT '0',
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `catchall` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureinboxgroup_members`
--

CREATE TABLE IF NOT EXISTS `playsms_featureinboxgroup_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featuremsgtemplate`
--

CREATE TABLE IF NOT EXISTS `playsms_featuremsgtemplate` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `t_title` varchar(100) NOT NULL DEFAULT '',
  `t_text` text NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `playsms_featuremsgtemplate`
--

INSERT INTO `playsms_featuremsgtemplate` (`c_timestamp`, `tid`, `uid`, `t_title`, `t_text`) VALUES
(0, 1, 1, 'Good morning', 'Hi u there, good morning!!'),
(0, 2, 1, 'Good night have a sweet dream', 'Hi sweetheart, good night and have a sweet dream :*'),
(0, 3, 1, 'Meeting Now', 'Hello #NAME#, please hurry up, boss summons us !'),
(0, 4, 2161, 'Exemple', 'Bonjour #NAME# comment allez-vous'),
(0, 5, 7321, 'salutation', 'Bonjour #NAME# comment tu vas');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureoutgoing`
--

CREATE TABLE IF NOT EXISTS `playsms_featureoutgoing` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `dst` varchar(100) NOT NULL DEFAULT '',
  `prefix` text NOT NULL,
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurephonebook`
--

CREATE TABLE IF NOT EXISTS `playsms_featurephonebook` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) DEFAULT NULL,
  `mobile` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `tags` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurephonebook_group`
--

CREATE TABLE IF NOT EXISTS `playsms_featurephonebook_group` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `flag_sender` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurephonebook_group_contacts`
--

CREATE TABLE IF NOT EXISTS `playsms_featurephonebook_group_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gpid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `gpid` (`gpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurepoll`
--

CREATE TABLE IF NOT EXISTS `playsms_featurepoll` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `poll_title` varchar(250) NOT NULL DEFAULT '',
  `poll_keyword` varchar(10) NOT NULL DEFAULT '',
  `poll_enable` int(11) NOT NULL DEFAULT '0',
  `poll_option_vote` int(11) NOT NULL DEFAULT '0',
  `poll_message_valid` text NOT NULL,
  `poll_message_invalid` text NOT NULL,
  `poll_message_option` text NOT NULL,
  `poll_access_code` varchar(40) NOT NULL DEFAULT '',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `playsms_featurepoll`
--

INSERT INTO `playsms_featurepoll` (`c_timestamp`, `poll_id`, `uid`, `poll_title`, `poll_keyword`, `poll_enable`, `poll_option_vote`, `poll_message_valid`, `poll_message_invalid`, `poll_message_option`, `poll_access_code`, `smsc`) VALUES
(1521106597, 1, 7321, 'Resultat vote', 'VOTE', 1, 0, 'Votre vote est pris en compte', 'Votre vote est erroné ', 'Veuillez revoir l''option choisis', 'dc239e0d77091ee0d2a4c4cf7f493683', 'kannel');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurepoll_choice`
--

CREATE TABLE IF NOT EXISTS `playsms_featurepoll_choice` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `choice_title` varchar(250) NOT NULL DEFAULT '',
  `choice_keyword` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `playsms_featurepoll_choice`
--

INSERT INTO `playsms_featurepoll_choice` (`c_timestamp`, `choice_id`, `poll_id`, `choice_title`, `choice_keyword`) VALUES
(0, 1, 1, 'Liste Blanc', 'BLANC'),
(0, 2, 1, 'Liste Bleu', 'BLEU'),
(0, 3, 1, 'Liste Jaune', 'JAUNE');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurepoll_log`
--

CREATE TABLE IF NOT EXISTS `playsms_featurepoll_log` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `choice_id` int(11) NOT NULL DEFAULT '0',
  `poll_sender` varchar(20) NOT NULL DEFAULT '',
  `in_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `playsms_featurepoll_log`
--

INSERT INTO `playsms_featurepoll_log` (`c_timestamp`, `log_id`, `poll_id`, `choice_id`, `poll_sender`, `in_datetime`, `status`) VALUES
(0, 1, 1, 1, '221708942737', '2018-04-13 14:37:12', 1),
(0, 2, 1, 1, '221705128936', '2018-04-13 14:38:26', 1),
(0, 3, 1, 2, '221709497661', '2018-04-13 14:39:52', 1),
(0, 4, 1, 2, '221707985980', '2018-04-13 18:12:12', 1),
(0, 5, 1, 3, '221704905751', '2018-04-13 18:13:42', 1),
(0, 6, 1, 3, '221708942737', '2018-04-13 18:14:20', 2);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurequiz`
--

CREATE TABLE IF NOT EXISTS `playsms_featurequiz` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `quiz_keyword` varchar(20) NOT NULL DEFAULT '',
  `quiz_question` varchar(100) NOT NULL DEFAULT '',
  `quiz_answer` varchar(20) NOT NULL DEFAULT '',
  `quiz_msg_correct` varchar(100) NOT NULL DEFAULT '',
  `quiz_msg_incorrect` varchar(100) NOT NULL DEFAULT '',
  `quiz_enable` int(11) NOT NULL DEFAULT '0',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`quiz_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `playsms_featurequiz`
--

INSERT INTO `playsms_featurequiz` (`c_timestamp`, `quiz_id`, `uid`, `quiz_keyword`, `quiz_question`, `quiz_answer`, `quiz_msg_correct`, `quiz_msg_incorrect`, `quiz_enable`, `smsc`) VALUES
(1521198819, 1, 7321, 'SMS', 'Qui a envoyé le tout premier SMS ?', 'MERRY', 'Exellent c''était le 3 Décembre 1992', 'la réponse est incorrecte', 1, 'smpp');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurequiz_log`
--

CREATE TABLE IF NOT EXISTS `playsms_featurequiz_log` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `answer_id` int(4) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(4) NOT NULL DEFAULT '0',
  `quiz_answer` varchar(100) NOT NULL DEFAULT '',
  `quiz_sender` varchar(20) NOT NULL DEFAULT '',
  `in_datetime` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `playsms_featurequiz_log`
--

INSERT INTO `playsms_featurequiz_log` (`c_timestamp`, `answer_id`, `quiz_id`, `quiz_answer`, `quiz_sender`, `in_datetime`) VALUES
(0, 1, 1, 'MERRY CHRISTMAS', '+221783679196', '2018-03-14 16:49:45'),
(0, 2, 1, 'MERRY CHRISTMAS', '+221783679196', '2018-03-14 16:53:32'),
(0, 3, 1, 'MERRY CHRISTMAS', '+221783679196', '2018-03-14 16:55:50'),
(0, 4, 1, 'MERRYCHRISTMAS', '221708942737', '2018-03-16 12:10:38'),
(0, 5, 1, 'MERRYCHRISTMAS', '221708942737', '2018-03-16 12:11:17'),
(0, 6, 1, 'MERRYCHRISTMAS', '221708942737', '2018-03-16 12:12:08'),
(0, 7, 1, 'MERRYCHRISTMAS', '221708942737', '2018-03-16 12:12:55'),
(0, 8, 1, 'MERRY', '221708942737', '2018-03-16 12:13:57'),
(0, 9, 1, 'TEST', '221705168932', '2018-03-23 13:28:21');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureschedule`
--

CREATE TABLE IF NOT EXISTS `playsms_featureschedule` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `schedule_rule` int(11) NOT NULL DEFAULT '0',
  `flag_active` int(11) NOT NULL DEFAULT '0',
  `flag_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `playsms_featureschedule`
--

INSERT INTO `playsms_featureschedule` (`c_timestamp`, `id`, `uid`, `name`, `message`, `schedule_rule`, `flag_active`, `flag_deleted`) VALUES
(1523137232, 1, 2580, 'salutation', 'Bonjour', 0, 1, 0),
(1519724667, 2, 2580, 'tuto', 'comment écrire', 0, 2, 0),
(1521473646, 3, 2161, 'rendez-vous', 'UCAD vous convoque le 28/02/2018 à partir de 13H', 0, 1, 0),
(1521201716, 4, 1, 'mes', 'envoi automatique', 0, 1, 0),
(1523873237, 5, 7321, 'salutation', 'Bonjour comment tu vas', 0, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featureschedule_dst`
--

CREATE TABLE IF NOT EXISTS `playsms_featureschedule_dst` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL DEFAULT '0',
  `schedule` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(100) NOT NULL DEFAULT '',
  `destination` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `playsms_featureschedule_dst`
--

INSERT INTO `playsms_featureschedule_dst` (`c_timestamp`, `id`, `schedule_id`, `schedule`, `scheduled`, `name`, `destination`) VALUES
(1523865959, 7, 5, '2018-04-13 10:05:00', '2018-04-17 10:05:00', 'ousseynou', '221708942737'),
(1523865959, 8, 5, '2018-04-13 10:05:00', '2018-04-17 10:05:00', 'Pollé gaye', '221705168932');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featuresendfromfile`
--

CREATE TABLE IF NOT EXISTS `playsms_featuresendfromfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `sid` varchar(50) NOT NULL DEFAULT '',
  `sms_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sms_to` varchar(50) NOT NULL DEFAULT '',
  `sms_msg` text NOT NULL,
  `sms_username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featuresimplerate`
--

CREATE TABLE IF NOT EXISTS `playsms_featuresimplerate` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dst` varchar(100) NOT NULL DEFAULT '',
  `prefix` varchar(10) NOT NULL DEFAULT '',
  `rate` decimal(13,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `playsms_featuresimplerate`
--

INSERT INTO `playsms_featuresimplerate` (`c_timestamp`, `id`, `dst`, `prefix`, `rate`) VALUES
(1535922973, 1, 'Orange', '22177', '20.000'),
(1535922951, 2, 'Expresso', '22170', '20.000'),
(1535923005, 3, 'Tigo', '22176', '20.000'),
(1535922988, 4, 'Orange2', '22178', '20.000');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featuresmssysnc`
--

CREATE TABLE IF NOT EXISTS `playsms_featuresmssysnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `message_id` varchar(250) DEFAULT '',
  `recvsms_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featurestoplist`
--

CREATE TABLE IF NOT EXISTS `playsms_featurestoplist` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featuresubscribe`
--

CREATE TABLE IF NOT EXISTS `playsms_featuresubscribe` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `subscribe_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `subscribe_keyword` varchar(20) NOT NULL DEFAULT '',
  `subscribe_msg` varchar(140) NOT NULL DEFAULT '',
  `unsubscribe_msg` varchar(140) NOT NULL DEFAULT '',
  `subscribe_enable` int(11) NOT NULL DEFAULT '0',
  `subscribe_param` varchar(20) NOT NULL DEFAULT '',
  `unsubscribe_param` varchar(20) NOT NULL DEFAULT '',
  `forward_param` varchar(20) NOT NULL DEFAULT '',
  `unknown_format_msg` varchar(140) NOT NULL DEFAULT '',
  `already_member_msg` varchar(140) NOT NULL DEFAULT '',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '0',
  `expire_msg` varchar(140) NOT NULL DEFAULT '',
  PRIMARY KEY (`subscribe_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `playsms_featuresubscribe`
--

INSERT INTO `playsms_featuresubscribe` (`c_timestamp`, `subscribe_id`, `uid`, `subscribe_keyword`, `subscribe_msg`, `unsubscribe_msg`, `subscribe_enable`, `subscribe_param`, `unsubscribe_param`, `forward_param`, `unknown_format_msg`, `already_member_msg`, `smsc`, `duration`, `expire_msg`) VALUES
(1521201357, 1, 7321, 'CONFéRENCE', 'Votre demande a été bien prise en compte', 'Vous êtes supprimer dans la liste pour assister à une conférence', 1, 'ASSISTER', 'DEGISTER', 'BC', 'Veuillez revoir les paramètres d''abonnement ', 'Votre abonnement a été déjà enregistrer', 'smpp', 101, 'Votre abonnement à la conférence précdente est arrivé à terme');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featuresubscribe_member`
--

CREATE TABLE IF NOT EXISTS `playsms_featuresubscribe_member` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscribe_id` int(11) NOT NULL DEFAULT '0',
  `member_number` varchar(20) NOT NULL DEFAULT '',
  `member_since` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_featuresubscribe_msg`
--

CREATE TABLE IF NOT EXISTS `playsms_featuresubscribe_msg` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscribe_id` int(11) NOT NULL DEFAULT '0',
  `msg` varchar(200) NOT NULL DEFAULT '',
  `create_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `playsms_featuresubscribe_msg`
--

INSERT INTO `playsms_featuresubscribe_msg` (`c_timestamp`, `msg_id`, `subscribe_id`, `msg`, `create_datetime`, `update_datetime`, `counter`) VALUES
(0, 1, 1, 'conférence assister', '2018-03-05 17:16:36', '2018-03-05 17:16:36', 0),
(0, 2, 1, 'message 2', '2018-03-05 17:23:03', '2018-03-05 17:23:03', 0),
(0, 3, 1, 'm', '2018-03-05 17:24:02', '2018-03-05 17:24:02', 0);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaybulksms_apidata`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaybulksms_apidata` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `apidata_id` int(11) NOT NULL AUTO_INCREMENT,
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `apimsgid` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`apidata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaybulksms_config`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaybulksms_config` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `cfg_name` varchar(20) DEFAULT 'bulksms',
  `cfg_username` varchar(100) DEFAULT NULL,
  `cfg_password` varchar(100) DEFAULT NULL,
  `cfg_module_sender` varchar(20) DEFAULT NULL,
  `cfg_send_url` varchar(250) DEFAULT NULL,
  `cfg_incoming_path` varchar(250) DEFAULT NULL,
  `cfg_credit` int(11) NOT NULL DEFAULT '0',
  `cfg_additional_param` varchar(250) DEFAULT NULL,
  `cfg_datetime_timezone` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `playsms_gatewaybulksms_config`
--

INSERT INTO `playsms_gatewaybulksms_config` (`c_timestamp`, `cfg_name`, `cfg_username`, `cfg_password`, `cfg_module_sender`, `cfg_send_url`, `cfg_incoming_path`, `cfg_credit`, `cfg_additional_param`, `cfg_datetime_timezone`) VALUES
(0, 'bulksms', 'playsms', 'playsms', 'PlaySMS', 'http://bulksms.vsms.net:5567/eapi', '/var/spool/playsms', 5, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewayclickatell_apidata`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewayclickatell_apidata` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `apidata_id` int(11) NOT NULL AUTO_INCREMENT,
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `apimsgid` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`apidata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewayclickatell_config`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewayclickatell_config` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `cfg_name` varchar(20) DEFAULT 'clickatell',
  `cfg_api_id` varchar(20) DEFAULT NULL,
  `cfg_username` varchar(100) DEFAULT NULL,
  `cfg_password` varchar(100) DEFAULT NULL,
  `cfg_module_sender` varchar(20) DEFAULT NULL,
  `cfg_send_url` varchar(250) DEFAULT NULL,
  `cfg_incoming_path` varchar(250) DEFAULT NULL,
  `cfg_credit` int(11) NOT NULL DEFAULT '0',
  `cfg_additional_param` varchar(250) DEFAULT NULL,
  `cfg_datetime_timezone` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `playsms_gatewayclickatell_config`
--

INSERT INTO `playsms_gatewayclickatell_config` (`c_timestamp`, `cfg_name`, `cfg_api_id`, `cfg_username`, `cfg_password`, `cfg_module_sender`, `cfg_send_url`, `cfg_incoming_path`, `cfg_credit`, `cfg_additional_param`, `cfg_datetime_timezone`) VALUES
(0, 'clickatell', '123456', 'playsms', 'playsms', 'PlaySMS', 'https://api.clickatell.com/http', '/var/spool/playsms', 10, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaygeneric_log`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaygeneric_log` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_smslog_id` int(11) NOT NULL DEFAULT '0',
  `remote_smslog_id` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewayinfobip_apidata`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewayinfobip_apidata` (
  `c_timestamp` int(11) NOT NULL DEFAULT '0',
  `apidata_id` int(11) NOT NULL AUTO_INCREMENT,
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `apimsgid` varchar(100) NOT NULL DEFAULT '',
  `status` varchar(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`apidata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewayinfobip_config`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewayinfobip_config` (
  `c_timestamp` int(11) NOT NULL DEFAULT '0',
  `cfg_name` varchar(20) NOT NULL DEFAULT 'infobip',
  `cfg_username` varchar(100) NOT NULL DEFAULT '',
  `cfg_password` varchar(100) NOT NULL DEFAULT '',
  `cfg_module_sender` varchar(20) NOT NULL DEFAULT '',
  `cfg_send_url` varchar(250) NOT NULL DEFAULT '',
  `cfg_credit` int(11) NOT NULL DEFAULT '0',
  `cfg_additional_param` varchar(250) NOT NULL DEFAULT '',
  `cfg_datetime_timezone` varchar(30) NOT NULL DEFAULT '',
  `cfg_dlr_nopush` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `playsms_gatewayinfobip_config`
--

INSERT INTO `playsms_gatewayinfobip_config` (`c_timestamp`, `cfg_name`, `cfg_username`, `cfg_password`, `cfg_module_sender`, `cfg_send_url`, `cfg_credit`, `cfg_additional_param`, `cfg_datetime_timezone`, `cfg_dlr_nopush`) VALUES
(0, 'infobip', '', '', '', 'http://api.infobip.com/api/v3', 0, '', '', '1');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewayjasmin_log`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewayjasmin_log` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_smslog_id` int(11) NOT NULL DEFAULT '0',
  `remote_smslog_id` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaynexmo`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaynexmo` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_smslog_id` int(11) NOT NULL DEFAULT '0',
  `remote_smslog_id` varchar(40) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `network` varchar(20) NOT NULL DEFAULT '',
  `error_text` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaynexmo_config`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaynexmo_config` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `cfg_name` varchar(20) NOT NULL DEFAULT 'nexmo',
  `cfg_url` varchar(250) DEFAULT NULL,
  `cfg_api_key` varchar(100) DEFAULT NULL,
  `cfg_api_secret` varchar(100) DEFAULT NULL,
  `cfg_module_sender` varchar(20) DEFAULT NULL,
  `cfg_datetime_timezone` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `playsms_gatewaynexmo_config`
--

INSERT INTO `playsms_gatewaynexmo_config` (`c_timestamp`, `cfg_name`, `cfg_url`, `cfg_api_key`, `cfg_api_secret`, `cfg_module_sender`, `cfg_datetime_timezone`) VALUES
(0, 'nexmo', 'https://rest.nexmo.com/sms/json', '12345678', '87654321', 'playSMS', '');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewayplaynet_outgoing`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewayplaynet_outgoing` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `sender_id` varchar(100) NOT NULL DEFAULT '',
  `sms_to` varchar(100) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sms_type` int(11) NOT NULL DEFAULT '0',
  `unicode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaysmstools_dlr`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaysmstools_dlr` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `message_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `smslog_id` (`smslog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaytelerivet`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaytelerivet` (
  `c_timestamp` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_slid` int(11) NOT NULL DEFAULT '0',
  `remote_slid` varchar(40) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT '',
  `phone_id` varchar(40) NOT NULL DEFAULT '',
  `message_type` varchar(20) NOT NULL DEFAULT '',
  `source` varchar(20) NOT NULL DEFAULT '',
  `error_text` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaytelerivet_config`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaytelerivet_config` (
  `c_timestamp` int(11) NOT NULL DEFAULT '0',
  `cfg_name` varchar(20) NOT NULL DEFAULT 'telerivet',
  `cfg_url` varchar(250) DEFAULT NULL,
  `cfg_api_key` varchar(250) DEFAULT NULL,
  `cfg_project_id` varchar(250) DEFAULT NULL,
  `cfg_status_url` varchar(250) DEFAULT NULL,
  `cfg_status_secret` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `playsms_gatewaytelerivet_config`
--

INSERT INTO `playsms_gatewaytelerivet_config` (`c_timestamp`, `cfg_name`, `cfg_url`, `cfg_api_key`, `cfg_project_id`, `cfg_status_url`, `cfg_status_secret`) VALUES
(0, 'telerivet', 'https://api.telerivet.com/', '12345678', 'abc123cde456', 'https://localhost/plugin/gateway/telerivet/callback.php', 'myS3cr3t');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaytemplate_config`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaytemplate_config` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `cfg_name` varchar(20) NOT NULL DEFAULT 'template',
  `cfg_path` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `playsms_gatewaytemplate_config`
--

INSERT INTO `playsms_gatewaytemplate_config` (`c_timestamp`, `cfg_name`, `cfg_path`) VALUES
(0, 'template', '/usr/local');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaytwilio`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaytwilio` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_smslog_id` int(11) NOT NULL DEFAULT '0',
  `remote_smslog_id` varchar(40) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `error_text` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewaytwilio_config`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewaytwilio_config` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `cfg_name` varchar(20) NOT NULL DEFAULT 'twilio',
  `cfg_url` varchar(250) DEFAULT NULL,
  `cfg_callback_url` varchar(250) DEFAULT NULL,
  `cfg_account_sid` varchar(100) DEFAULT NULL,
  `cfg_auth_token` varchar(100) DEFAULT NULL,
  `cfg_module_sender` varchar(20) DEFAULT NULL,
  `cfg_datetime_timezone` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `playsms_gatewaytwilio_config`
--

INSERT INTO `playsms_gatewaytwilio_config` (`c_timestamp`, `cfg_name`, `cfg_url`, `cfg_callback_url`, `cfg_account_sid`, `cfg_auth_token`, `cfg_module_sender`, `cfg_datetime_timezone`) VALUES
(0, 'twilio', 'https://api.twilio.com', 'http://localhost/playsms/plugin/gateway/twilio/callback.php', '12345678', '87654321', '+10000000000', '');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewayuplink`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewayuplink` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `up_id` int(11) NOT NULL AUTO_INCREMENT,
  `up_local_smslog_id` int(11) NOT NULL DEFAULT '0',
  `up_remote_smslog_id` int(11) NOT NULL DEFAULT '0',
  `up_status` int(11) NOT NULL DEFAULT '0',
  `up_remote_queue_code` varchar(32) NOT NULL DEFAULT '',
  `up_dst` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_gatewayuplink_config`
--

CREATE TABLE IF NOT EXISTS `playsms_gatewayuplink_config` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `cfg_name` varchar(20) NOT NULL DEFAULT 'uplink',
  `cfg_master` varchar(250) DEFAULT NULL,
  `cfg_username` varchar(100) DEFAULT NULL,
  `cfg_password` varchar(100) DEFAULT NULL,
  `cfg_token` varchar(32) DEFAULT NULL,
  `cfg_module_sender` varchar(20) DEFAULT NULL,
  `cfg_incoming_path` varchar(250) DEFAULT NULL,
  `cfg_additional_param` varchar(250) DEFAULT NULL,
  `cfg_datetime_timezone` varchar(30) NOT NULL DEFAULT '',
  `cfg_try_disable_footer` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `playsms_gatewayuplink_config`
--

INSERT INTO `playsms_gatewayuplink_config` (`c_timestamp`, `cfg_name`, `cfg_master`, `cfg_username`, `cfg_password`, `cfg_token`, `cfg_module_sender`, `cfg_incoming_path`, `cfg_additional_param`, `cfg_datetime_timezone`, `cfg_try_disable_footer`) VALUES
(0, 'uplink', 'http://playsms.master.url', '', '', '', '', '/var/spool/playsms', '', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblacl`
--

CREATE TABLE IF NOT EXISTS `playsms_tblacl` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `acl_subuser` varchar(250) NOT NULL DEFAULT '',
  `url` text NOT NULL,
  `flag_disallowed` int(11) NOT NULL DEFAULT '0',
  `flag_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblbilling`
--

CREATE TABLE IF NOT EXISTS `playsms_tblbilling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `post_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `rate` decimal(13,3) NOT NULL DEFAULT '0.000',
  `credit` decimal(13,3) NOT NULL DEFAULT '0.000',
  `count` int(11) NOT NULL DEFAULT '0',
  `charge` decimal(13,3) NOT NULL DEFAULT '0.000',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Contenu de la table `playsms_tblbilling`
--

INSERT INTO `playsms_tblbilling` (`id`, `c_timestamp`, `post_datetime`, `smslog_id`, `rate`, `credit`, `count`, `charge`, `status`) VALUES
(28, 0, '2018-04-11 18:27:20', 103, '15.000', '0.000', 1, '15.000', 1),
(29, 0, '2018-04-11 18:32:30', 104, '15.000', '0.000', 1, '15.000', 1),
(30, 0, '2018-04-11 18:33:54', 105, '15.000', '0.000', 1, '15.000', 1),
(31, 0, '2018-04-11 18:36:13', 106, '15.000', '0.000', 1, '15.000', 1),
(32, 0, '2018-04-11 18:43:11', 107, '15.000', '0.000', 1, '15.000', 1),
(33, 0, '2018-04-12 08:24:08', 108, '15.000', '0.000', 1, '15.000', 1),
(34, 0, '2018-04-12 08:28:51', 112, '15.000', '0.000', 1, '15.000', 2),
(35, 0, '2018-04-12 08:42:32', 113, '15.000', '0.000', 1, '15.000', 1),
(36, 0, '2018-04-12 10:25:33', 110, '15.000', '0.000', 1, '15.000', 2),
(37, 0, '2018-04-12 10:27:46', 111, '15.000', '0.000', 1, '15.000', 2),
(38, 0, '2018-04-12 11:31:54', 114, '15.000', '0.000', 1, '15.000', 1),
(39, 0, '2018-04-12 12:07:59', 122, '15.000', '0.000', 1, '15.000', 2),
(40, 0, '2018-04-12 12:08:50', 123, '15.000', '0.000', 1, '15.000', 2),
(41, 0, '2018-04-12 12:32:03', 124, '15.000', '0.000', 1, '15.000', 1),
(42, 0, '2018-04-12 13:33:46', 116, '15.000', '0.000', 1, '15.000', 1),
(43, 0, '2018-04-12 13:47:35', 117, '15.000', '0.000', 1, '15.000', 1),
(44, 0, '2018-04-12 13:52:22', 118, '15.000', '0.000', 1, '15.000', 1),
(45, 0, '2018-04-12 13:53:22', 119, '15.000', '0.000', 1, '15.000', 1),
(46, 0, '2018-04-12 13:56:21', 120, '15.000', '0.000', 1, '15.000', 1),
(47, 0, '2018-04-12 13:57:53', 121, '15.000', '0.000', 1, '15.000', 1),
(48, 0, '2018-04-12 15:19:49', 128, '15.000', '0.000', 1, '15.000', 1),
(49, 0, '2018-04-12 15:22:37', 129, '15.000', '0.000', 1, '15.000', 1),
(50, 0, '2018-04-12 16:30:26', 130, '15.000', '0.000', 1, '15.000', 1),
(51, 0, '2018-04-12 17:41:36', 131, '15.000', '0.000', 1, '15.000', 1),
(52, 0, '2018-04-12 17:41:36', 132, '26.000', '0.000', 1, '26.000', 2),
(53, 0, '2018-04-12 17:41:36', 133, '15.000', '0.000', 1, '15.000', 1),
(54, 0, '2018-04-12 17:45:05', 134, '15.000', '0.000', 1, '15.000', 1),
(55, 0, '2018-04-13 10:05:59', 136, '15.000', '0.000', 1, '15.000', 1),
(56, 0, '2018-04-13 10:05:59', 135, '15.000', '0.000', 1, '15.000', 1),
(57, 0, '2018-04-13 14:37:12', 137, '15.000', '0.000', 1, '15.000', 1),
(58, 0, '2018-04-13 14:38:26', 138, '15.000', '0.000', 1, '15.000', 1),
(59, 0, '2018-04-13 14:39:52', 139, '15.000', '0.000', 1, '15.000', 1),
(60, 0, '2018-04-13 15:08:58', 140, '26.000', '0.000', 1, '26.000', 2),
(61, 0, '2018-04-13 15:08:58', 141, '26.000', '0.000', 1, '26.000', 2),
(62, 0, '2018-04-13 15:08:58', 142, '26.000', '0.000', 1, '26.000', 2),
(63, 0, '2018-04-13 15:08:58', 143, '26.000', '0.000', 1, '26.000', 2),
(64, 0, '2018-04-13 17:28:59', 147, '15.000', '0.000', 1, '15.000', 1),
(65, 0, '2018-04-13 17:28:59', 148, '26.000', '0.000', 1, '26.000', 2),
(66, 0, '2018-04-13 17:29:00', 149, '15.000', '0.000', 1, '15.000', 1),
(67, 0, '2018-04-13 18:12:12', 144, '15.000', '0.000', 1, '15.000', 1),
(68, 0, '2018-04-13 18:13:42', 145, '15.000', '0.000', 1, '15.000', 1),
(69, 0, '2018-04-13 18:14:20', 146, '15.000', '0.000', 1, '15.000', 1),
(70, 0, '2018-04-14 10:05:59', 151, '15.000', '0.000', 1, '15.000', 1),
(71, 0, '2018-04-14 10:05:59', 150, '15.000', '0.000', 1, '15.000', 1),
(72, 0, '2018-04-15 10:05:59', 152, '15.000', '0.000', 1, '15.000', 1),
(73, 0, '2018-04-15 10:05:59', 153, '15.000', '0.000', 1, '15.000', 1),
(74, 0, '2018-04-16 10:06:00', 155, '15.000', '0.000', 1, '15.000', 1),
(75, 0, '2018-04-16 10:06:00', 154, '15.000', '0.000', 1, '15.000', 1);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblcountry`
--

CREATE TABLE IF NOT EXISTS `playsms_tblcountry` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(200) NOT NULL DEFAULT '',
  `country_code` varchar(10) NOT NULL DEFAULT '',
  `country_prefix` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=206 ;

--
-- Contenu de la table `playsms_tblcountry`
--

INSERT INTO `playsms_tblcountry` (`c_timestamp`, `country_id`, `country_name`, `country_code`, `country_prefix`) VALUES
(0, 1, 'Afghanistan', 'af', '93'),
(0, 2, 'Albania', 'al', '355'),
(0, 3, 'Algeria', 'dz', '213'),
(0, 4, 'Andorra', 'ad', '376'),
(0, 5, 'Angola', 'ao', '244'),
(0, 6, 'Antarctica', 'aq', '672'),
(0, 7, 'Argentina', 'ar', '54'),
(0, 8, 'Armenia', 'am', '374'),
(0, 9, 'Aruba', 'aw', '297'),
(0, 10, 'Australia', 'au', '61'),
(0, 11, 'Austria', 'at', '43'),
(0, 12, 'Azerbaijan', 'az', '994'),
(0, 13, 'Bahrain', 'bh', '973'),
(0, 14, 'Bangladesh', 'bd', '880'),
(0, 15, 'Belarus', 'by', '375'),
(0, 16, 'Belgium', 'be', '32'),
(0, 17, 'Belize', 'bz', '501'),
(0, 18, 'Benin', 'bj', '229'),
(0, 19, 'Bhutan', 'bt', '975'),
(0, 20, 'Bolivia, Plurinational State Of', 'bo', '591'),
(0, 21, 'Bosnia And Herzegovina', 'ba', '387'),
(0, 22, 'Botswana', 'bw', '267'),
(0, 23, 'Brazil', 'br', '55'),
(0, 24, 'Brunei Darussalam', 'bn', '673'),
(0, 25, 'Bulgaria', 'bg', '359'),
(0, 26, 'Burkina Faso', 'bf', '226'),
(0, 27, 'Myanmar', 'mm', '95'),
(0, 28, 'Burundi', 'bi', '257'),
(0, 29, 'Cambodia', 'kh', '855'),
(0, 30, 'Cameroon', 'cm', '237'),
(0, 31, 'Canada', 'ca', '1'),
(0, 32, 'Cape Verde', 'cv', '238'),
(0, 33, 'Central African Republic', 'cf', '236'),
(0, 34, 'Chad', 'td', '235'),
(0, 35, 'Chile', 'cl', '56'),
(0, 36, 'China', 'cn', '86'),
(0, 37, 'Christmas Island', 'cx', '61'),
(0, 38, 'Cocos (keeling) Islands', 'cc', '61'),
(0, 39, 'Colombia', 'co', '57'),
(0, 40, 'Comoros', 'km', '269'),
(0, 41, 'Congo', 'cg', '242'),
(0, 42, 'Congo, The Democratic Republic Of The', 'cd', '243'),
(0, 43, 'Cook Islands', 'ck', '682'),
(0, 44, 'Costa Rica', 'cr', '506'),
(0, 45, 'Croatia', 'hr', '385'),
(0, 46, 'Cuba', 'cu', '53'),
(0, 47, 'Cyprus', 'cy', '357'),
(0, 48, 'Czech Republic', 'cz', '420'),
(0, 49, 'Denmark', 'dk', '45'),
(0, 50, 'Djibouti', 'dj', '253'),
(0, 51, 'Timor-leste', 'tl', '670'),
(0, 52, 'Ecuador', 'ec', '593'),
(0, 53, 'Egypt', 'eg', '20'),
(0, 54, 'El Salvador', 'sv', '503'),
(0, 55, 'Equatorial Guinea', 'gq', '240'),
(0, 56, 'Eritrea', 'er', '291'),
(0, 57, 'Estonia', 'ee', '372'),
(0, 58, 'Ethiopia', 'et', '251'),
(0, 59, 'Falkland Islands (malvinas)', 'fk', '500'),
(0, 60, 'Faroe Islands', 'fo', '298'),
(0, 61, 'Fiji', 'fj', '679'),
(0, 62, 'Finland', 'fi', '358'),
(0, 63, 'France', 'fr', '33'),
(0, 64, 'French Polynesia', 'pf', '689'),
(0, 65, 'Gabon', 'ga', '241'),
(0, 66, 'Gambia', 'gm', '220'),
(0, 67, 'Georgia', 'ge', '995'),
(0, 68, 'Germany', 'de', '49'),
(0, 69, 'Ghana', 'gh', '233'),
(0, 70, 'Gibraltar', 'gi', '350'),
(0, 71, 'Greece', 'gr', '30'),
(0, 72, 'Greenland', 'gl', '299'),
(0, 73, 'Guatemala', 'gt', '502'),
(0, 74, 'Guinea', 'gn', '224'),
(0, 75, 'Guinea-bissau', 'gw', '245'),
(0, 76, 'Guyana', 'gy', '592'),
(0, 77, 'Haiti', 'ht', '509'),
(0, 78, 'Honduras', 'hn', '504'),
(0, 79, 'Hong Kong', 'hk', '852'),
(0, 80, 'Hungary', 'hu', '36'),
(0, 81, 'India', 'in', '91'),
(0, 82, 'Indonesia', 'id', '62'),
(0, 83, 'Iran, Islamic Republic Of', 'ir', '98'),
(0, 84, 'Iraq', 'iq', '964'),
(0, 85, 'Ireland', 'ie', '353'),
(0, 86, 'Isle Of Man', 'im', '44'),
(0, 87, 'Israel', 'il', '972'),
(0, 88, 'Italy', 'it', '39'),
(0, 89, 'Côte D''ivoire', 'ci', '225'),
(0, 90, 'Japan', 'jp', '81'),
(0, 91, 'Jordan', 'jo', '962'),
(0, 92, 'Kazakhstan', 'kz', '7'),
(0, 93, 'Kenya', 'ke', '254'),
(0, 94, 'Kiribati', 'ki', '686'),
(0, 95, 'Kuwait', 'kw', '965'),
(0, 96, 'Kyrgyzstan', 'kg', '996'),
(0, 97, 'Lao People''s Democratic Republic', 'la', '856'),
(0, 98, 'Latvia', 'lv', '371'),
(0, 99, 'Lebanon', 'lb', '961'),
(0, 100, 'Lesotho', 'ls', '266'),
(0, 101, 'Liberia', 'lr', '231'),
(0, 102, 'Libya', 'ly', '218'),
(0, 103, 'Liechtenstein', 'li', '423'),
(0, 104, 'Lithuania', 'lt', '370'),
(0, 105, 'Luxembourg', 'lu', '352'),
(0, 106, 'Macao', 'mo', '853'),
(0, 107, 'Macedonia, The Former Yugoslav Republic Of', 'mk', '389'),
(0, 108, 'Madagascar', 'mg', '261'),
(0, 109, 'Malawi', 'mw', '265'),
(0, 110, 'Malaysia', 'my', '60'),
(0, 111, 'Maldives', 'mv', '960'),
(0, 112, 'Mali', 'ml', '223'),
(0, 113, 'Malta', 'mt', '356'),
(0, 114, 'Marshall Islands', 'mh', '692'),
(0, 115, 'Mauritania', 'mr', '222'),
(0, 116, 'Mauritius', 'mu', '230'),
(0, 117, 'Mayotte', 'yt', '262'),
(0, 118, 'Mexico', 'mx', '52'),
(0, 119, 'Micronesia, Federated States Of', 'fm', '691'),
(0, 120, 'Moldova, Republic Of', 'md', '373'),
(0, 121, 'Monaco', 'mc', '377'),
(0, 122, 'Mongolia', 'mn', '976'),
(0, 123, 'Montenegro', 'me', '382'),
(0, 124, 'Morocco', 'ma', '212'),
(0, 125, 'Mozambique', 'mz', '258'),
(0, 126, 'Namibia', 'na', '264'),
(0, 127, 'Nauru', 'nr', '674'),
(0, 128, 'Nepal', 'np', '977'),
(0, 129, 'Netherlands', 'nl', '31'),
(0, 130, 'New Caledonia', 'nc', '687'),
(0, 131, 'New Zealand', 'nz', '64'),
(0, 132, 'Nicaragua', 'ni', '505'),
(0, 133, 'Niger', 'ne', '227'),
(0, 134, 'Nigeria', 'ng', '234'),
(0, 135, 'Niue', 'nu', '683'),
(0, 136, 'Korea, Democratic People''s Republic Of', 'kp', '850'),
(0, 137, 'Norway', 'no', '47'),
(0, 138, 'Oman', 'om', '968'),
(0, 139, 'Pakistan', 'pk', '92'),
(0, 140, 'Palau', 'pw', '680'),
(0, 141, 'Panama', 'pa', '507'),
(0, 142, 'Papua New Guinea', 'pg', '675'),
(0, 143, 'Paraguay', 'py', '595'),
(0, 144, 'Peru', 'pe', '51'),
(0, 145, 'Philippines', 'ph', '63'),
(0, 146, 'Pitcairn', 'pn', '870'),
(0, 147, 'Poland', 'pl', '48'),
(0, 148, 'Portugal', 'pt', '351'),
(0, 149, 'Puerto Rico', 'pr', '1'),
(0, 150, 'Qatar', 'qa', '974'),
(0, 151, 'Romania', 'ro', '40'),
(0, 152, 'Russian Federation', 'ru', '7'),
(0, 153, 'Rwanda', 'rw', '250'),
(0, 154, 'Saint Barthélemy', 'bl', '590'),
(0, 155, 'Samoa', 'ws', '685'),
(0, 156, 'San Marino', 'sm', '378'),
(0, 157, 'Sao Tome And Principe', 'st', '239'),
(0, 158, 'Saudi Arabia', 'sa', '966'),
(0, 159, 'Senegal', 'sn', '221'),
(0, 160, 'Serbia', 'rs', '381'),
(0, 161, 'Seychelles', 'sc', '248'),
(0, 162, 'Sierra Leone', 'sl', '232'),
(0, 163, 'Singapore', 'sg', '65'),
(0, 164, 'Slovakia', 'sk', '421'),
(0, 165, 'Slovenia', 'si', '386'),
(0, 166, 'Solomon Islands', 'sb', '677'),
(0, 167, 'Somalia', 'so', '252'),
(0, 168, 'South Africa', 'za', '27'),
(0, 169, 'Korea, Republic Of', 'kr', '82'),
(0, 170, 'Spain', 'es', '34'),
(0, 171, 'Sri Lanka', 'lk', '94'),
(0, 172, 'Saint Helena, Ascension And Tristan Da Cunha', 'sh', '290'),
(0, 173, 'Saint Pierre And Miquelon', 'pm', '508'),
(0, 174, 'Sudan', 'sd', '249'),
(0, 175, 'Suriname', 'sr', '597'),
(0, 176, 'Swaziland', 'sz', '268'),
(0, 177, 'Sweden', 'se', '46'),
(0, 178, 'Switzerland', 'ch', '41'),
(0, 179, 'Syrian Arab Republic', 'sy', '963'),
(0, 180, 'Taiwan, Province Of China', 'tw', '886'),
(0, 181, 'Tajikistan', 'tj', '992'),
(0, 182, 'Tanzania, United Republic Of', 'tz', '255'),
(0, 183, 'Thailand', 'th', '66'),
(0, 184, 'Togo', 'tg', '228'),
(0, 185, 'Tokelau', 'tk', '690'),
(0, 186, 'Tonga', 'to', '676'),
(0, 187, 'Tunisia', 'tn', '216'),
(0, 188, 'Turkey', 'tr', '90'),
(0, 189, 'Turkmenistan', 'tm', '993'),
(0, 190, 'Tuvalu', 'tv', '688'),
(0, 191, 'United Arab Emirates', 'ae', '971'),
(0, 192, 'Uganda', 'ug', '256'),
(0, 193, 'United Kingdom', 'gb', '44'),
(0, 194, 'Ukraine', 'ua', '380'),
(0, 195, 'Uruguay', 'uy', '598'),
(0, 196, 'United States', 'us', '1'),
(0, 197, 'Uzbekistan', 'uz', '998'),
(0, 198, 'Vanuatu', 'vu', '678'),
(0, 199, 'Holy See (vatican City State)', 'va', '39'),
(0, 200, 'Venezuela, Bolivarian Republic Of', 've', '58'),
(0, 201, 'Viet Nam', 'vn', '84'),
(0, 202, 'Wallis And Futuna', 'wf', '681'),
(0, 203, 'Yemen', 'ye', '967'),
(0, 204, 'Zambia', 'zm', '260'),
(0, 205, 'Zimbabwe', 'zw', '263');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tbldlr`
--

CREATE TABLE IF NOT EXISTS `playsms_tbldlr` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_processed` int(11) NOT NULL DEFAULT '0',
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `p_status` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=177 ;

--
-- Contenu de la table `playsms_tbldlr`
--

INSERT INTO `playsms_tbldlr` (`c_timestamp`, `id`, `flag_processed`, `smslog_id`, `p_status`, `uid`) VALUES
(1523471240, 53, 2, 103, 0, 1),
(1523471240, 54, 2, 103, 1, 1),
(1523471244, 55, 2, 103, 3, 1),
(1523471550, 56, 2, 104, 0, 1),
(1523471551, 57, 2, 104, 1, 1),
(1523471556, 58, 2, 104, 3, 1),
(1523471634, 59, 2, 105, 0, 1),
(1523471634, 60, 2, 105, 1, 1),
(1523471773, 61, 2, 106, 0, 1),
(1523471774, 62, 2, 106, 1, 1),
(1523471778, 63, 2, 106, 3, 1),
(1523472191, 64, 2, 107, 0, 1),
(1523472192, 65, 2, 107, 1, 1),
(1523472196, 66, 2, 107, 3, 1),
(1523521448, 67, 2, 108, 0, 1),
(1523521448, 68, 2, 108, 1, 1),
(1523521453, 69, 2, 108, 3, 1),
(1523521731, 70, 2, 112, 0, 7321),
(1523521731, 71, 2, 112, 2, 7321),
(1523522552, 72, 2, 113, 0, 1),
(1523522552, 73, 2, 113, 1, 1),
(1523522555, 74, 2, 113, 3, 1),
(1523528733, 75, 2, 110, 0, 7321),
(1523528733, 76, 2, 110, 2, 7321),
(1523528866, 77, 2, 111, 0, 7321),
(1523528867, 78, 2, 111, 2, 7321),
(1523532714, 79, 2, 114, 0, 7321),
(1523532714, 80, 2, 114, 1, 7321),
(1523532718, 81, 2, 114, 3, 7321),
(1523534879, 82, 2, 122, 0, 7321),
(1523534880, 83, 2, 122, 2, 7321),
(1523534930, 84, 2, 123, 0, 1),
(1523534931, 85, 2, 123, 2, 1),
(1523536323, 86, 2, 124, 0, 7321),
(1523536324, 87, 2, 124, 1, 7321),
(1523536328, 88, 2, 124, 3, 7321),
(1523540026, 89, 2, 116, 0, 7321),
(1523540026, 90, 2, 116, 1, 7321),
(1523540032, 91, 2, 116, 3, 7321),
(1523540855, 92, 2, 117, 0, 7321),
(1523540856, 93, 2, 117, 1, 7321),
(1523540861, 94, 2, 117, 3, 7321),
(1523541142, 95, 2, 118, 0, 7321),
(1523541142, 96, 2, 118, 1, 7321),
(1523541202, 97, 2, 119, 0, 7321),
(1523541203, 98, 2, 119, 1, 7321),
(1523541381, 99, 2, 120, 0, 7321),
(1523541381, 100, 2, 120, 1, 7321),
(1523541388, 101, 2, 120, 3, 7321),
(1523541473, 102, 2, 121, 0, 7321),
(1523541474, 103, 2, 121, 1, 7321),
(1523541478, 104, 2, 121, 3, 7321),
(1523546389, 105, 2, 128, 0, 7321),
(1523546389, 106, 2, 128, 1, 7321),
(1523546557, 107, 2, 129, 0, 7321),
(1523546558, 108, 2, 129, 1, 7321),
(1523546561, 109, 2, 129, 3, 7321),
(1523550626, 110, 2, 130, 0, 7321),
(1523550626, 111, 2, 130, 1, 7321),
(1523550634, 112, 2, 130, 3, 7321),
(1523554896, 113, 2, 131, 0, 7321),
(1523554896, 114, 2, 132, 0, 7321),
(1523554896, 115, 2, 133, 0, 7321),
(1523554896, 116, 2, 131, 1, 7321),
(1523554897, 117, 2, 132, 2, 7321),
(1523554897, 118, 2, 133, 1, 7321),
(1523554901, 119, 2, 131, 3, 7321),
(1523555105, 120, 2, 134, 0, 7321),
(1523555106, 121, 2, 134, 1, 7321),
(1523555114, 122, 2, 134, 3, 7321),
(1523564411, 123, 2, 128, 2, 7321),
(1523582436, 124, 2, 133, 2, 7321),
(1523613959, 125, 2, 136, 0, 7321),
(1523613959, 126, 2, 135, 0, 7321),
(1523613961, 127, 2, 136, 1, 7321),
(1523613961, 128, 2, 135, 1, 7321),
(1523613963, 129, 2, 136, 3, 7321),
(1523613966, 130, 2, 135, 3, 7321),
(1523630232, 131, 2, 137, 0, 7321),
(1523630233, 132, 2, 137, 1, 7321),
(1523630306, 133, 2, 138, 0, 7321),
(1523630306, 134, 2, 138, 1, 7321),
(1523630392, 135, 2, 139, 0, 7321),
(1523630392, 136, 2, 139, 1, 7321),
(1523632138, 137, 2, 140, 0, 1),
(1523632138, 138, 2, 141, 0, 1),
(1523632138, 139, 2, 142, 0, 1),
(1523632138, 140, 2, 143, 0, 1),
(1523632138, 141, 2, 140, 2, 1),
(1523632138, 142, 2, 141, 2, 1),
(1523632138, 143, 2, 142, 2, 1),
(1523632138, 144, 2, 143, 2, 1),
(1523640539, 145, 2, 147, 0, 7321),
(1523640539, 146, 2, 148, 0, 7321),
(1523640540, 147, 2, 149, 0, 7321),
(1523640540, 148, 2, 147, 1, 7321),
(1523640541, 149, 2, 148, 2, 7321),
(1523640541, 150, 2, 149, 1, 7321),
(1523640545, 151, 2, 147, 3, 7321),
(1523643132, 152, 2, 144, 0, 7321),
(1523643132, 153, 2, 144, 1, 7321),
(1523643222, 154, 2, 145, 0, 7321),
(1523643222, 155, 2, 145, 1, 7321),
(1523643260, 156, 2, 146, 0, 7321),
(1523643261, 157, 2, 146, 1, 7321),
(1523646817, 158, 2, 149, 3, 7321),
(1523700359, 159, 2, 151, 0, 7321),
(1523700359, 160, 2, 150, 0, 7321),
(1523700360, 161, 2, 151, 1, 7321),
(1523700360, 162, 2, 150, 1, 7321),
(1523700362, 163, 2, 151, 3, 7321),
(1523700365, 164, 2, 150, 3, 7321),
(1523786759, 165, 2, 152, 0, 7321),
(1523786759, 166, 2, 153, 0, 7321),
(1523786760, 167, 2, 152, 1, 7321),
(1523786760, 168, 2, 153, 1, 7321),
(1523786763, 169, 2, 153, 3, 7321),
(1523786765, 170, 2, 152, 3, 7321),
(1523873160, 171, 2, 155, 0, 7321),
(1523873160, 172, 2, 154, 0, 7321),
(1523873161, 173, 2, 155, 1, 7321),
(1523873161, 174, 2, 154, 1, 7321),
(1523873163, 175, 2, 155, 3, 7321),
(1523873165, 176, 2, 154, 3, 7321);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblgateway`
--

CREATE TABLE IF NOT EXISTS `playsms_tblgateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(100) NOT NULL DEFAULT '',
  `gateway` varchar(100) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `playsms_tblgateway`
--

INSERT INTO `playsms_tblgateway` (`id`, `created`, `last_update`, `name`, `gateway`, `data`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'blocked', 'blocked', '[]'),
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'dev', 'dev', '[]'),
(3, '2017-11-23 07:19:23', '2018-03-30 14:56:50', 'kannel', 'kannel', '{"username":"kannel","password":"P@sser8102","module_sender":"+221776885655","module_timezone":"+0000","bearerbox_host":"localhost","sendsms_host":"localhost","sendsms_port":"14000","dlr_mask":"27","additional_param":"smsc=smpp","playsms_web":"http://localhost/playsms"}'),
(4, '2018-01-29 11:22:03', '2018-04-11 18:28:10', 'smpp', 'kannel', '{"username":"kannel","password":"P@sser8102","module_sender":"21005","module_timezone":"+0000","bearerbox_host":"196.1.97.236","sendsms_host":"196.1.97.236","sendsms_port":"14000","dlr_mask":"27","additional_param":"smsc=UCAD","playsms_web":"http://196.1.97.236/playsms"}');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblnotif`
--

CREATE TABLE IF NOT EXISTS `playsms_tblnotif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `last_update` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `label` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `flag_unread` int(11) NOT NULL DEFAULT '0',
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblrecvsms`
--

CREATE TABLE IF NOT EXISTS `playsms_tblrecvsms` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_processed` int(11) NOT NULL DEFAULT '0',
  `sms_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sms_sender` varchar(20) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sms_receiver` varchar(20) NOT NULL DEFAULT '',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `playsms_tblrecvsms`
--

INSERT INTO `playsms_tblrecvsms` (`c_timestamp`, `id`, `flag_processed`, `sms_datetime`, `sms_sender`, `message`, `sms_receiver`, `smsc`) VALUES
(0, 1, 2, '2018-04-11 09:53:38', '221707885980', 'cours mardi', '21005', 'smpp'),
(0, 3, 2, '2018-04-12 08:24:41', '221708942737', 'COURS MARDI', '21005', 'smpp'),
(0, 4, 2, '2018-04-12 08:25:32', '221708942737', 'COURS MARDI', '21005', 'smpp'),
(0, 5, 2, '2018-04-12 08:27:45', '221708942737', 'cours jeudi', '21005', 'smpp'),
(0, 6, 2, '2018-04-12 11:32:23', '221708942737', 'cours jeudi', '21005', 'smpp'),
(0, 7, 2, '2018-04-12 11:33:45', '221708942737', 'cours jeudi', '21005', 'smpp'),
(0, 8, 2, '2018-04-12 11:47:35', '221708942737', 'cours mardi', '21005', 'smpp'),
(0, 9, 2, '2018-04-12 11:52:21', '221708942737', 'cours mardi', '21005', 'smpp'),
(0, 10, 2, '2018-04-12 11:53:22', '221708942737', 'cours mardi', '21005', 'smpp'),
(0, 11, 2, '2018-04-12 11:56:20', '221708942737', 'cours mardi', '21005', 'smpp'),
(0, 12, 2, '2018-04-12 11:57:52', '221708942737', 'cours mardi', '21005', 'smpp'),
(0, 13, 2, '2018-04-12 12:36:15', '221708942737', 'cours mardi', '21005', 'smpp'),
(0, 14, 2, '2018-04-13 12:37:12', '221708942737', 'VOTE BLANC', '21005', 'smpp'),
(0, 15, 2, '2018-04-13 12:38:25', '221705128936', 'VOTE BLANC', '21005', 'smpp'),
(0, 16, 2, '2018-04-13 12:39:51', '221709497661', 'VOTE BLEU', '21005', 'smpp'),
(0, 17, 2, '2018-04-13 16:12:12', '221707985980', 'VOTE BLEU', '21005', 'smpp'),
(0, 18, 2, '2018-04-13 16:13:41', '221704905751', 'VOTE Jaune', '21005', 'smpp'),
(0, 19, 2, '2018-04-13 16:14:19', '221708942737', 'VOTE Jaune', '21005', 'smpp');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblregistry`
--

CREATE TABLE IF NOT EXISTS `playsms_tblregistry` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `registry_group` varchar(250) NOT NULL DEFAULT '',
  `registry_family` varchar(250) NOT NULL DEFAULT '',
  `registry_key` varchar(250) NOT NULL DEFAULT '',
  `registry_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=606 ;

--
-- Contenu de la table `playsms_tblregistry`
--

INSERT INTO `playsms_tblregistry` (`c_timestamp`, `id`, `uid`, `registry_group`, `registry_family`, `registry_key`, `registry_value`) VALUES
(0, 1, 1, 'core', 'config', 'playsms_version', '1.4'),
(1535920885, 2, 1, 'core', 'main_config', 'web_title', 'Plateforme SMS'),
(1535920885, 3, 1, 'core', 'main_config', 'email_service', 'diopousseynou1993@gmail.com'),
(1535920885, 4, 1, 'core', 'main_config', 'email_footer', 'plateforme SMS de diopousseynou1993@gmail.com'),
(1535920885, 5, 1, 'core', 'main_config', 'main_website_name', 'SMSMessageService'),
(1535920885, 6, 1, 'core', 'main_config', 'main_website_url', 'http://www.smsmessageservice.sn'),
(1535920885, 7, 1, 'core', 'main_config', 'gateway_number', '21005'),
(1535920885, 8, 1, 'core', 'main_config', 'gateway_timezone', '0000'),
(1535920885, 9, 1, 'core', 'main_config', 'default_rate', '75'),
(1535920885, 10, 1, 'core', 'main_config', 'gateway_module', 'smpp'),
(1535920885, 11, 1, 'core', 'main_config', 'themes_module', 'ubuntu'),
(1535920885, 12, 1, 'core', 'main_config', 'language_module', 'fr_FR'),
(1535920885, 13, 1, 'core', 'main_config', 'sms_max_count', '1000'),
(1535920886, 14, 1, 'core', 'main_config', 'default_credit', '0'),
(1535920886, 15, 1, 'core', 'main_config', 'enable_register', '0'),
(1535920886, 16, 1, 'core', 'main_config', 'enable_forgot', '1'),
(0, 17, 1, 'core', 'main_config', 'allow_custom_sender', '1'),
(0, 18, 1, 'core', 'main_config', 'allow_custom_footer', '0'),
(1535920886, 20, 1, 'core', 'main_config', 'default_user_status', '4'),
(1535920886, 21, 1, 'core', 'main_config', 'enable_logo', '1'),
(1535920886, 22, 1, 'core', 'main_config', 'logo_url', 'plugin/themes/common/images/SMSDiop.png'),
(1535920886, 23, 1, 'core', 'main_config', 'logo_replace_title', '0'),
(1535920886, 24, 1, 'core', 'main_config', 'layout_footer', 'Copyright@Ousseynou_Diop'),
(1404003472, 25, 1, 'core', 'main_config', 'buy_credit_page_title', 'Buy credit'),
(1404003472, 26, 1, 'core', 'main_config', 'buy_credit_page_content', 'Go to main configuration or manage site to edit this page'),
(1535920886, 27, 1, 'core', 'main_config', 'information_title', 'SMSMessageService'),
(1535920886, 28, 1, 'core', 'main_config', 'information_content', '<h1 class=''col-md-12 data_h1 color_blue''>NOTRE PLATEFORME SMS</h1>\r\n<div class=''col-md-6''>\r\n<ul class=''icons-list''><li> API PHP complète</li>\r\n<li> Jusqu''a 160 caractères par SMS</li>\r\n<li> Modéle de Message</li>\r\n<li> Message planifié</li>\r\n<li> Carnet d''adresses</li>\r\n<li> Envoi groupé ou envoi unitaire</li>\r\n<li> Envoi depuis un fichier CSV</li>\r\n</ul></div>\r\n<div class=''col-md-6''>\r\n<ul class=''icons-list''><li> Aucun frais de mise en service</li>\r\n<li> Historique complet des envois</li>\r\n<li> Monitoring et supervision 24/7</li>\r\n<li> Prix unique!</li>\r\n</ul></div>\r\n<div class=''col-md-12''>\r\n<ul class=''icons-list''><li> Service de réponse automatique</li>\r\n<li> Vote par SMS</li>\r\n<li> Service d''abonnement</li>\r\n<li> Service quiz</li>\r\n<li> Gestion des accusés de réception et suivi des statuts du SMS (LU,DELIVRE, EN ATTENTE, NON DELIVRE )</li>\r\n<li> Choisissez le leader !! Choisissez SMSMessageService<span class=''bold''> !</span></li>\r\n</ul></div>\r\n<div class=''col-md-12 hosteur_datacenter_p''> </div>\r\n<div class=''col-md-12 hosteur_datacenter_p''> </div>'),
(1535921042, 30, 1, 'core', 'user_config', 'enable_credit_unicode', '1'),
(1535920885, 31, 1, 'core', 'main_config', 'username_length', '100'),
(1535920885, 32, 1, 'core', 'main_config', 'plus_sign_remove', '1'),
(1535920885, 33, 1, 'core', 'main_config', 'plus_sign_add', '0'),
(1535920886, 34, 1, 'core', 'main_config', 'enable_credit_unicode', '1'),
(1535920886, 35, 1, 'core', 'main_config', 'brute_force_detection', '1'),
(1535920886, 36, 1, 'core', 'main_config', 'keyword_separator', ' '),
(1535920886, 37, 1, 'core', 'main_config', 'credit_lowest_limit', '10'),
(1535920886, 38, 1, 'core', 'main_config', 'sms_limit_per_hour', '9999'),
(1535920886, 39, 1, 'core', 'main_config', 'default_replace_zero', '221'),
(1535920886, 40, 1, 'core', 'main_config', 'default_parent', '0'),
(1535920886, 41, 1, 'core', 'main_config', 'default_acl', '0'),
(1535920886, 42, 1, 'core', 'main_config', 'disable_login_as', '0'),
(1535920886, 43, 1, 'core', 'main_config', 'enhance_privacy_subuser', '0'),
(1523362546, 44, 1, 'feature', 'incoming', 'incoming_match_username', '1'),
(1523362546, 45, 1, 'feature', 'incoming', 'incoming_match_groupcode', '1'),
(1523362546, 46, 1, 'feature', 'incoming', 'sandbox_match_sender_id', '0'),
(1523362546, 47, 1, 'feature', 'incoming', 'sandbox_prefix', ''),
(1523362546, 48, 1, 'feature', 'incoming', 'sandbox_forward_to', 'N;'),
(1523362546, 49, 1, 'feature', 'incoming', 'sandbox_forward_to_url', ''),
(1523362546, 50, 1, 'feature', 'incoming', 'settings_leave_copy_sandbox', '1'),
(1523362546, 51, 1, 'feature', 'incoming', 'settings_match_all_sender_id', '0'),
(1523464555, 55, 1, 'gateway', 'kannel', 'username', 'kannel'),
(1523464555, 56, 1, 'gateway', 'kannel', 'module_sender', 'P@sser8102'),
(1523464555, 57, 1, 'gateway', 'kannel', 'module_timezone', '0000'),
(1523464555, 58, 1, 'gateway', 'kannel', 'bearerbox_host', '196.1.97.236'),
(1523464555, 59, 1, 'gateway', 'kannel', 'sendsms_host', '196.1.97.236'),
(1523464555, 60, 1, 'gateway', 'kannel', 'sendsms_port', '14000'),
(1523464555, 61, 1, 'gateway', 'kannel', 'playsms_web', 'http://196.1.97.236/playsms'),
(1523464555, 62, 1, 'gateway', 'kannel', 'additional_param', 'smsc=smpp'),
(1523464555, 63, 1, 'gateway', 'kannel', 'dlr_mask', '27'),
(1523464555, 64, 1, 'gateway', 'kannel', 'admin_host', 'kannel                                          '),
(1523464555, 65, 1, 'gateway', 'kannel', 'admin_port', '13000'),
(1523464555, 66, 1, 'gateway', 'kannel', 'local_time', '1'),
(1523451218, 67, 1, 'gateway', 'kannel', 'password', 'kannel'),
(1523451244, 68, 1, 'gateway', 'kannel', 'admin_password', 'P@sser8102'),
(1521648037, 69, 1, 'feature', 'credit', 'lowest_limit_notif', ''),
(1511453032, 73, 1, 'features', 'sender_id_desc', '+00221776885655', '+00221776885655'),
(1519816546, 75, 1, 'features', 'sender_id_desc', '+221776885655', 'kannel'),
(1523873160, 77, 0, 'core', 'sendsms', 'throttle_start', '2018-04-16 10:06:00'),
(1523873160, 78, 0, 'core', 'sendsms', 'throttle_sum', '1'),
(1515752224, 96, 0, 'feature', 'firewall', '15f63320844d38fedb304000b850a5cb', '4'),
(1516117771, 113, 1, 'auth', 'login_session', 'b876c8fd7fc402e60530b64622320f7a', '{"ip":"10.152.1.137","last_update":"2018-01-16 16:49:31","http_user_agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","sid":"f4rvurkfqj4r0ivc7bp1torc30","uid":null}'),
(1516097636, 117, 0, 'feature', 'firewall', '793afb7f8e66cb31f3c32d8a8c3be19a', '1'),
(1516115521, 128, 0, 'feature', 'firewall', 'd6611928188359ee90cbc0762205d46b', '3'),
(1516117811, 131, 0, 'feature', 'firewall', 'ccdd67913da8ec2a6fde7d3058bb3f54', '2'),
(1516120558, 134, 0, 'feature', 'firewall', '9ff79e3984d23932bf576bc645aa404c', '4'),
(1516181782, 145, 2161, 'features', 'sender_id_desc', '776885655', 'kannel'),
(1516181831, 147, 2161, 'features', 'sender_id_desc', '+221776886555', 'kannel'),
(1521647979, 148, 2161, 'feature', 'credit', 'lowest_limit_notif', ''),
(1516187369, 153, 1, 'auth', 'login_session', 'ed2e15f08c6b6710b96a60e8df2c2c0a', '{"ip":"10.152.2.119","last_update":"2018-01-17 12:09:29","http_user_agent":"Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0","sid":"00l41vmh12d79ler83amoehrd1","uid":null}'),
(1516184171, 154, 1, 'auth', 'login_session', '66e1cec84d8202a4e5a46a1881959ec1', '{"ip":"10.152.2.63","last_update":"2018-01-17 11:16:11","http_user_agent":"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","sid":"1vuqsdh0afcep3ns7rq7su5087","uid":null}'),
(1516186032, 160, 3262, 'core', 'user_config', 'enable_credit_unicode', '0'),
(1516204360, 168, 0, 'feature', 'firewall', '83f11dfb507331db3d7d660703c9f5bc', '4'),
(1521549369, 212, 1, 'auth', 'tmp_password', 'mpolle.gaye', '6f10a388191f6a09d8e89220fa75d392'),
(1518784759, 215, 0, 'feature', 'firewall', '9b46b8475cfccf6fabf8515c92d105de', '2'),
(1518801231, 223, 0, 'feature', 'firewall', '483933e18cb6a48e7c94a6fc273529aa', '3'),
(1519301444, 228, 0, 'feature', 'firewall', '26a0c74dbaffe1b0472b01a83ad7a83d', '1'),
(1519301548, 231, 0, 'feature', 'firewall', '068de3e0a9ed63f8c5e90de78c24ed36', '2'),
(1519302060, 233, 0, 'feature', 'firewall', '58b4f65806cf92615eee24e5082d0f7f', '1'),
(1519658756, 297, 0, 'feature', 'firewall', '24509456be8164e3ff43e3216c2d3922', '1'),
(1519658799, 298, 0, 'feature', 'firewall', 'e7624cdc075203065d464d6bf9ac53c4', '1'),
(1519659336, 322, 2580, 'core', 'site_config', 'domain', 'ucad'),
(1519659336, 323, 2580, 'core', 'site_config', 'web_title', 'mon site'),
(1519659336, 324, 2580, 'core', 'site_config', 'email_service', ''),
(1519659336, 325, 2580, 'core', 'site_config', 'email_footer', ''),
(1519659336, 326, 2580, 'core', 'site_config', 'main_website_name', ''),
(1519659336, 327, 2580, 'core', 'site_config', 'main_website_url', ''),
(1519659336, 328, 2580, 'core', 'site_config', 'themes_module', 'ubuntu'),
(1519659336, 329, 2580, 'core', 'site_config', 'default_credit', ''),
(1519659336, 330, 2580, 'core', 'site_config', 'enable_register', '0'),
(1519659336, 331, 2580, 'core', 'site_config', 'enable_forgot', '0'),
(1519659336, 332, 2580, 'core', 'site_config', 'language_module', 'fr_FR'),
(1519659336, 333, 2580, 'core', 'site_config', 'enable_logo', '0'),
(1519659336, 334, 2580, 'core', 'site_config', 'logo_replace_title', '0'),
(1519659336, 335, 2580, 'core', 'site_config', 'logo_url', ''),
(1519659336, 336, 2580, 'core', 'site_config', 'layout_footer', ''),
(1519659336, 337, 2580, 'core', 'site_config', 'information_title', ''),
(1519659336, 338, 2580, 'core', 'site_config', 'information_content', '<p>bienvenu dans le site de abdou ba</p>'),
(1519659523, 343, 2580, 'features', 'sender_id_desc', 'abdou', 'sous utilisateur'),
(1523356941, 374, 2161, 'features', 'sender_id_desc', '21005', '21005'),
(1521538824, 385, 1, 'auth', 'login_session', '9d9821b11c22d79bac3d48c78214da00', '{"ip":"10.152.2.63","last_update":"2018-03-20 10:40:24","http_user_agent":"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36","sid":"6nmqp5dv4oqvcssr2hamlf7h67","uid":null}'),
(1521538821, 386, 1, 'auth', 'login_session', 'c40f98f4f0bffda78059ef8e58d95647', '{"ip":"10.152.59.200","last_update":"2018-03-20 10:40:21","http_user_agent":"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0","sid":"sn89cgc6qb7pt71b4r31ad8d75","uid":null}'),
(1535921635, 408, 0, 'features', 'mailsms', 'email', 'diopousseynou1993@gmail.com'),
(1535921635, 409, 0, 'features', 'mailsms', 'enable_fetch', '1'),
(1535921635, 410, 0, 'features', 'mailsms', 'fetch_interval', '60'),
(1535921635, 411, 0, 'features', 'mailsms', 'check_sender', '1'),
(1535921635, 412, 0, 'features', 'mailsms', 'protocol', 'imap'),
(1535921635, 413, 0, 'features', 'mailsms', 'ssl', '0'),
(1535921635, 414, 0, 'features', 'mailsms', 'novalidate_cert', '0'),
(1535921635, 415, 0, 'features', 'mailsms', 'port', '587'),
(1535921635, 416, 0, 'features', 'mailsms', 'server', 'smtp.gmail.com'),
(1535921635, 417, 0, 'features', 'mailsms', 'username', 'Ousseynou Diop'),
(1535921636, 418, 0, 'features', 'mailsms', 'hash', 'f40047b31e17edc61dab7c08439b5819'),
(1535921636, 419, 0, 'features', 'mailsms', 'password', 'P@sser123'),
(1535922684, 444, 1, 'features', 'sender_id_desc', '21005', 'Numéro court'),
(1535922684, 445, 1, 'features', 'sender_id', '21005', '1'),
(1522404130, 481, 0, 'gateway', 'jasmin', 'url', 'https://127.0.0.1:1401/send'),
(1522404130, 482, 0, 'gateway', 'jasmin', 'callback_url', 'http://196.1.97.236/playsms/plugin/gateway/jasmin/callback.php'),
(1522404130, 483, 0, 'gateway', 'jasmin', 'api_username', 'kannel'),
(1522404130, 484, 0, 'gateway', 'jasmin', 'module_sender', '21005'),
(1522404130, 485, 0, 'gateway', 'jasmin', 'datetime_timezone', '+0000'),
(1522404130, 486, 0, 'gateway', 'jasmin', 'api_password', 'P@sser123'),
(1523275423, 504, 7321, 'core', 'user_config', 'enable_credit_unicode', '0'),
(1522968546, 505, 7321, 'feature', 'credit', 'lowest_limit_notif', ''),
(1523133293, 508, 0, 'feature', 'firewall', 'af41c8b9cbf2ffb39be855f6d6a08e08', '1'),
(1523448774, 553, 0, 'feature', 'firewall', '66badb2192c59248f0d51ebc2c6fb723', '4'),
(1535933023, 603, 1, 'auth', 'login_session', '5700a68d1478f7e6cc95bc59ad2ac456', '{"ip":"::1","last_update":"2018-09-03 02:03:43","http_user_agent":"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","sid":"a464vriepd9gmdu7fi6tcqbi87","uid":"1"}'),
(1536951173, 604, 1, 'auth', 'login_session', '9a9bf1582e7d29fb2fc5329d045cf9e6', '{"ip":"::1","last_update":"2018-09-14 20:52:53","http_user_agent":"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36","sid":"p4orin1nemknpcv2ksmvvucqf6","uid":"1"}'),
(1537489848, 605, 1, 'auth', 'login_session', '7730e61ad29d4603a2c282e66ca69ab3', '{"ip":"::1","last_update":"2018-09-21 02:30:48","http_user_agent":"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","sid":"jqkbkp92kj8559ptb2fn0u9326","uid":"1"}');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblsmsinbox`
--

CREATE TABLE IF NOT EXISTS `playsms_tblsmsinbox` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_deleted` int(11) NOT NULL DEFAULT '0',
  `in_sender` varchar(20) NOT NULL DEFAULT '',
  `in_receiver` varchar(20) NOT NULL DEFAULT '',
  `in_uid` int(11) NOT NULL DEFAULT '0',
  `in_msg` text NOT NULL,
  `in_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reference_id` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`in_id`),
  KEY `in_uid` (`in_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `playsms_tblsmsinbox`
--

INSERT INTO `playsms_tblsmsinbox` (`c_timestamp`, `in_id`, `flag_deleted`, `in_sender`, `in_receiver`, `in_uid`, `in_msg`, `in_datetime`, `reference_id`) VALUES
(0, 17, 0, '@admin', '', 7321, 'Bienvenue dans notre plateforme Ousseynou', '2018-04-12 16:30:24', '');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblsmsincoming`
--

CREATE TABLE IF NOT EXISTS `playsms_tblsmsincoming` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_deleted` int(11) NOT NULL DEFAULT '0',
  `in_uid` int(11) NOT NULL DEFAULT '0',
  `in_feature` varchar(250) NOT NULL DEFAULT '',
  `in_gateway` varchar(100) NOT NULL DEFAULT '',
  `in_sender` varchar(100) NOT NULL DEFAULT '',
  `in_receiver` varchar(20) NOT NULL DEFAULT '',
  `in_keyword` varchar(100) NOT NULL DEFAULT '',
  `in_message` text NOT NULL,
  `in_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `in_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`in_id`),
  KEY `in_uid` (`in_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `playsms_tblsmsincoming`
--

INSERT INTO `playsms_tblsmsincoming` (`c_timestamp`, `in_id`, `flag_deleted`, `in_uid`, `in_feature`, `in_gateway`, `in_sender`, `in_receiver`, `in_keyword`, `in_message`, `in_datetime`, `in_status`) VALUES
(1523551382, 1, 1, 7321, 'sms_autoreply', 'smpp', '221707885980', '21005', 'COURS', 'mardi', '2018-04-11 09:53:38', 1),
(1523551382, 3, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'MARDI', '2018-04-12 08:24:41', 1),
(1523551382, 4, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'MARDI', '2018-04-12 08:25:32', 1),
(1523551382, 5, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'jeudi', '2018-04-12 08:27:45', 1),
(1523551382, 6, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'jeudi', '2018-04-12 11:32:23', 1),
(0, 7, 0, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'jeudi', '2018-04-12 11:33:45', 1),
(0, 8, 0, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'mardi', '2018-04-12 11:47:35', 1),
(1523551382, 9, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'mardi', '2018-04-12 11:52:21', 1),
(1523551382, 10, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'mardi', '2018-04-12 11:53:22', 1),
(1523551382, 11, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'mardi', '2018-04-12 11:56:20', 1),
(1523551382, 12, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'mardi', '2018-04-12 11:57:52', 1),
(1523551382, 13, 1, 7321, 'sms_autoreply', 'smpp', '221708942737', '21005', 'COURS', 'mardi', '2018-04-12 12:36:15', 1),
(0, 14, 0, 7321, 'sms_poll', 'smpp', '221708942737', '21005', 'VOTE', 'BLANC', '2018-04-13 12:37:12', 1),
(0, 15, 0, 7321, 'sms_poll', 'smpp', '221705128936', '21005', 'VOTE', 'BLANC', '2018-04-13 12:38:25', 1),
(0, 16, 0, 7321, 'sms_poll', 'smpp', '221709497661', '21005', 'VOTE', 'BLEU', '2018-04-13 12:39:51', 1),
(0, 17, 0, 7321, 'sms_poll', 'smpp', '221707985980', '21005', 'VOTE', 'BLEU', '2018-04-13 16:12:12', 1),
(0, 18, 0, 7321, 'sms_poll', 'smpp', '221704905751', '21005', 'VOTE', 'Jaune', '2018-04-13 16:13:41', 1),
(0, 19, 0, 7321, 'sms_poll', 'smpp', '221708942737', '21005', 'VOTE', 'Jaune', '2018-04-13 16:14:19', 1);

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblsmsoutgoing`
--

CREATE TABLE IF NOT EXISTS `playsms_tblsmsoutgoing` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smslog_id` int(11) DEFAULT NULL,
  `flag_deleted` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `parent_uid` int(11) NOT NULL DEFAULT '0',
  `p_gateway` varchar(250) NOT NULL DEFAULT '',
  `p_smsc` varchar(250) NOT NULL DEFAULT '',
  `p_src` varchar(100) NOT NULL DEFAULT '',
  `p_dst` varchar(100) NOT NULL DEFAULT '',
  `p_footer` varchar(30) NOT NULL DEFAULT '',
  `p_msg` text NOT NULL,
  `p_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `p_update` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `p_status` int(11) NOT NULL DEFAULT '0',
  `p_gpid` int(11) NOT NULL DEFAULT '0',
  `p_credit` decimal(13,3) NOT NULL DEFAULT '0.000',
  `p_sms_type` varchar(100) NOT NULL DEFAULT '',
  `unicode` int(11) NOT NULL DEFAULT '0',
  `queue_code` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `smslog_id` (`smslog_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=162 ;

--
-- Contenu de la table `playsms_tblsmsoutgoing`
--

INSERT INTO `playsms_tblsmsoutgoing` (`c_timestamp`, `id`, `smslog_id`, `flag_deleted`, `uid`, `parent_uid`, `p_gateway`, `p_smsc`, `p_src`, `p_dst`, `p_footer`, `p_msg`, `p_datetime`, `p_update`, `p_status`, `p_gpid`, `p_credit`, `p_sms_type`, `unicode`, `queue_code`) VALUES
(1535920300, 104, 103, 1, 1, 0, 'kannel', 'smpp', '21005', '221708942737', '', 'dcv', '2018-04-11 18:27:19', '2018-04-11 20:27:24', 3, 0, '0.000', 'text', 0, 'a53a8209a420b86dca69c93b15e1b9cc'),
(1535920300, 105, 104, 1, 1, 0, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonsoir', '2018-04-11 18:32:30', '2018-04-11 20:32:36', 3, 0, '0.000', 'text', 0, 'e57ec6a274431c017b24b28dd259d47b'),
(1535920300, 106, 105, 1, 1, 0, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonsoir', '2018-04-11 18:33:54', '2018-04-11 20:33:55', 1, 0, '0.000', 'text', 0, '4ed166d25821a9c21329eb5715e63e3e'),
(1535920322, 107, 106, 1, 1, 0, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonsoir', '2018-04-11 18:36:13', '2018-04-11 20:36:18', 3, 0, '0.000', 'text', 0, '3de4b320c35255122af5a6aa56b960fe'),
(1535920322, 108, 107, 1, 1, 0, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour', '2018-04-11 18:43:11', '2018-04-11 20:43:17', 3, 0, '0.000', 'text', 0, '0fb4563527d434c993166604ff7cad38'),
(1535920322, 109, 108, 1, 1, 0, 'kannel', 'smpp', '21005', '221708942737', '', 'Playsms', '2018-04-12 08:24:08', '2018-04-12 10:24:14', 3, 0, '0.000', 'text', 0, 'cc9e0d356a57b8e580d30960b9a51293'),
(1535920322, 110, 109, 1, 1, 0, 'kannel', 'smpp', 'UCAD', '221708942737', '', 'SVA Déliberation', '2018-04-12 08:27:07', '2018-04-12 08:27:07', 1, 0, '0.000', 'text', 0, '02a5eeadfd31104bdb0e02402567ac07'),
(1523532797, 111, 112, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour', '2018-04-12 08:28:51', '2018-04-12 10:28:52', 2, 0, '0.000', 'text', 0, 'e80247fb6e93e4abc42a3d5a352a525e'),
(1535920322, 112, 113, 1, 1, 0, 'kannel', 'smpp', '21005', '221705168932', '', 'Playsms', '2018-04-12 08:42:32', '2018-04-12 10:42:36', 3, 0, '0.000', 'text', 0, '034bddd4e4b237aca3eb481c7b2400f3'),
(1523532797, 114, 110, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'système 10H-12H SALLE TR', '2018-04-12 10:25:33', '2018-04-12 12:25:34', 2, 0, '0.000', 'text', 0, 'e6d188c3968bc58ffa183e03f74dda11'),
(1523532797, 115, 111, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'VoIP 9H-12H', '2018-04-12 10:27:46', '2018-04-12 12:27:47', 2, 0, '0.000', 'text', 0, 'b60d234027d80e3d3127df78b9a5d4ce'),
(1523532811, 116, 114, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour', '2018-04-12 11:31:54', '2018-04-12 13:31:59', 3, 0, '0.000', 'text', 0, 'd3566f955354a645cf031d52327fcc85'),
(1535920322, 117, 115, 1, 1, 0, 'kannel', 'smpp', 'UCAD', '221708942737', '', 'SVA Déliberation', '2018-04-12 11:59:13', '2018-04-12 11:59:13', 1, 0, '0.000', 'text', 0, 'd7306ef462c6ecbc5d23f209a7cedaeb'),
(1523550542, 118, 122, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour', '2018-04-12 12:07:59', '2018-04-12 14:08:00', 2, 0, '0.000', 'text', 0, '3152653a0f0a032b22d368b093a1122c'),
(1535920322, 119, 123, 1, 1, 0, 'kannel', 'smpp', '21005', '221708942737', '', 'Playsms', '2018-04-12 12:08:50', '2018-04-12 14:08:51', 2, 0, '0.000', 'text', 0, 'eee407e6ad4a8804df789ab390c95bd5'),
(1523550542, 120, 124, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour', '2018-04-12 12:32:03', '2018-04-12 14:32:08', 3, 0, '0.000', 'text', 0, '72020b3eafb9f8ce640e095a73485d5f'),
(1535920322, 121, 125, 1, 1, 0, 'kannel', 'smpp', 'UCAD', '221708942737', '', 'SVA Déliberation', '2018-04-12 12:35:32', '2018-04-12 12:35:32', 1, 0, '0.000', 'text', 0, '4660be687c6d2d8b5cd28c98638b6d21'),
(1535920322, 122, 126, 1, 1, 0, 'kannel', 'smpp', 'UCAD', '', '', 'Veuilliez commencer votre message par deliberation', '2018-04-12 13:17:12', '2018-04-12 13:17:12', 1, 0, '0.000', 'text', 0, '1648adea8b86332fe6a3cdba096fdc3d'),
(1535920322, 123, 127, 1, 1, 0, 'kannel', 'smpp', 'UCAD', '221708942737', '', 'Algebre 1:10.50 V Outils de bases:16.50 V Probabilites et Statistique:10.00 V Analyse 1:11.00 V Electricite 1:06.00 VC Mecanique 1:09.00 VC  moyen_sem:10.16 V credit:30', '2018-04-12 13:17:24', '2018-04-12 13:17:24', 1, 0, '0.000', 'text', 0, '2b5edad430a26ead4c58db87c0f8c49e'),
(1523550542, 125, 116, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'VoIP 9H-12H', '2018-04-12 13:33:46', '2018-04-12 15:33:52', 3, 0, '0.000', 'text', 0, '205c9600289284462cddb923c0c8d514'),
(1523550542, 126, 117, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'système 10H-12H SALLE TR', '2018-04-12 13:47:35', '2018-04-12 15:47:41', 3, 0, '0.000', 'text', 0, '814b003de6de6f35d12a7d3c781f1cca'),
(1523550542, 127, 118, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'système 10H-12H SALLE TR', '2018-04-12 13:52:22', '2018-04-12 15:52:22', 1, 0, '0.000', 'text', 0, '9af0743ac39ae54cd1e9615f3aff2ec8'),
(1523550542, 128, 119, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'système 10H-12H SALLE TR', '2018-04-12 13:53:22', '2018-04-12 15:53:24', 1, 0, '0.000', 'text', 0, '0e7e1f029e0b132f942e70c530e12cc1'),
(1523550542, 129, 120, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'système 10H-12H SALLE TR', '2018-04-12 13:56:21', '2018-04-12 15:56:28', 3, 0, '0.000', 'text', 0, '19b4ae1df7040824d9aa51110bbbada5'),
(1523550542, 130, 121, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'système 10H-12H SALLE TR', '2018-04-12 13:57:53', '2018-04-12 15:57:58', 3, 0, '0.000', 'text', 0, '2565e8a58df240f9e8b0dea0fe25207b'),
(1523564412, 134, 128, 1, 7321, 1, 'kannel', 'smpp', '21005', '221709497661', '', 'Message à partir d''un fichier CSV vers 221709497661', '2018-04-12 15:19:49', '2018-04-12 22:20:12', 2, 0, '0.000', 'text', 0, '33e5edeceb9d51bf43228814dba9f151'),
(1523550542, 135, 129, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'bon', '2018-04-12 15:22:37', '2018-04-12 17:22:41', 3, 0, '0.000', 'text', 0, '0fd0e2a1fbba9a4a8f5e475e65c734e7'),
(1523640422, 136, 130, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bienvenue dans notre plateforme Ousseynou administrateur (@admin)', '2018-04-12 16:30:26', '2018-04-12 18:30:34', 3, 0, '0.000', 'text', 0, '6e8ec287794bed609ed6118273133e88'),
(1523640422, 137, 131, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Message à partir d''un fichier CSV vers 221708942737', '2018-04-12 17:41:36', '2018-04-12 19:41:41', 3, 0, '0.000', 'text', 0, '1a900b601600aececbc42cf3ee922656'),
(1523640438, 138, 132, 1, 7321, 1, 'kannel', 'smpp', '21005', '221774156562', '', 'Message à partir d''un fichier CSV vers 221774156562', '2018-04-12 17:41:36', '2018-04-12 19:41:37', 2, 0, '0.000', 'text', 0, '1a900b601600aececbc42cf3ee922656'),
(1523640438, 139, 133, 1, 7321, 1, 'kannel', 'smpp', '21005', '221709497661', '', 'Message à partir d''un fichier CSV vers 221709497661', '2018-04-12 17:41:36', '2018-04-13 03:20:37', 2, 0, '0.000', 'text', 0, '1a900b601600aececbc42cf3ee922656'),
(1523640422, 140, 134, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour Abdalaye KABA comment tu vas', '2018-04-12 17:45:05', '2018-04-12 19:45:14', 3, 0, '0.000', 'text', 0, '9992057b009f57cfaec55c5b6082c72c'),
(1523640422, 141, 136, 1, 7321, 1, 'kannel', 'smpp', '21005', '221705168932', '', 'Bonjour comment tu vas', '2018-04-13 10:05:59', '2018-04-13 12:06:03', 3, 0, '0.000', 'text', 0, 'a2be0f0f95bd7405a9e7e08d1e728584'),
(1523640422, 142, 135, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour comment tu vas', '2018-04-13 10:05:59', '2018-04-13 12:06:06', 3, 0, '0.000', 'text', 0, '39af1c09fb9e7f02ef6fca94c093c8b3'),
(1523640422, 143, 137, 1, 7321, 1, 'kannel', 'kannel', '21005', '221708942737', '', 'Votre vote est pris en compte', '2018-04-13 14:37:12', '2018-04-13 16:37:13', 1, 0, '0.000', 'text', 0, '5af7347593a3d0de2bed1824265dcd9c'),
(1523640422, 144, 138, 1, 7321, 1, 'kannel', 'kannel', '21005', '221705128936', '', 'Votre vote est pris en compte', '2018-04-13 14:38:26', '2018-04-13 16:38:26', 1, 0, '0.000', 'text', 0, '9239acd0addf806b50503e8d7add4ea8'),
(1523640422, 145, 139, 1, 7321, 1, 'kannel', 'kannel', '21005', '221709497661', '', 'Votre vote est pris en compte', '2018-04-13 14:39:52', '2018-04-13 16:39:53', 1, 0, '0.000', 'text', 0, '61b1a5bfc6ab700b77ae69ed969e3e67'),
(1523640782, 146, 140, 1, 1, 0, 'kannel', 'smpp', '21005', '221775201784', '', 'SMS groupé', '2018-04-13 15:08:58', '2018-04-13 17:08:58', 2, 0, '0.000', 'text', 0, 'c8b840818b7b37f43df263f23dc85274'),
(1523640795, 147, 141, 1, 1, 0, 'kannel', 'smpp', '21005', '221774316778', '', 'SMS groupé', '2018-04-13 15:08:58', '2018-04-13 17:08:59', 2, 0, '0.000', 'text', 0, 'c8b840818b7b37f43df263f23dc85274'),
(1523640820, 148, 142, 1, 1, 0, 'kannel', 'smpp', '21005', '221774210431', '', 'SMS groupé', '2018-04-13 15:08:58', '2018-04-13 17:08:59', 2, 0, '0.000', 'text', 0, 'c8b840818b7b37f43df263f23dc85274'),
(1523640829, 149, 143, 1, 1, 0, 'kannel', 'smpp', '21005', '221772017647', '', 'SMS groupé', '2018-04-13 15:08:58', '2018-04-13 17:08:59', 2, 0, '0.000', 'text', 0, 'c8b840818b7b37f43df263f23dc85274'),
(1535920322, 150, 147, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Message groupé', '2018-04-13 17:28:59', '2018-04-13 19:29:06', 3, 0, '0.000', 'text', 0, 'c685b2789184221f0024a14272604216'),
(1535920340, 151, 148, 1, 7321, 1, 'kannel', 'smpp', '21005', '221774156562', '', 'Message groupé', '2018-04-13 17:28:59', '2018-04-13 19:29:01', 2, 0, '0.000', 'text', 0, 'c685b2789184221f0024a14272604216'),
(1535920340, 152, 149, 1, 7321, 1, 'kannel', 'smpp', '21005', '221709497661', '', 'Message groupé', '2018-04-13 17:29:00', '2018-04-13 21:13:37', 3, 0, '0.000', 'text', 0, 'c685b2789184221f0024a14272604216'),
(1535920322, 153, 144, 1, 7321, 1, 'kannel', 'kannel', '21005', '221707985980', '', 'Votre vote est pris en compte', '2018-04-13 18:12:12', '2018-04-13 20:12:13', 1, 0, '0.000', 'text', 0, 'd75e6329740945813987abd38ce3fc38'),
(1535920322, 154, 145, 1, 7321, 1, 'kannel', 'kannel', '21005', '221704905751', '', 'Votre vote est pris en compte', '2018-04-13 18:13:42', '2018-04-13 20:13:42', 1, 0, '0.000', 'text', 0, 'ad2daad5a986f43a686f2287934a1751'),
(1535920322, 155, 146, 1, 7321, 1, 'kannel', 'kannel', '21005', '221708942737', '', 'Veuillez revoir l''option choisis', '2018-04-13 18:14:20', '2018-04-13 20:14:22', 1, 0, '0.000', 'text', 0, '7aed770a9a0c20050c4a06c338b2e258'),
(1535920322, 156, 151, 1, 7321, 1, 'kannel', 'smpp', '21005', '221705168932', '', 'Bonjour comment tu vas', '2018-04-14 10:05:59', '2018-04-14 12:06:02', 3, 0, '0.000', 'text', 0, '1bd1718cd8778226431f092b15915ff1'),
(1535920322, 157, 150, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour comment tu vas', '2018-04-14 10:05:59', '2018-04-14 12:06:05', 3, 0, '0.000', 'text', 0, 'c1a803e4da3de538b91a4fc03efca98c'),
(1535920322, 158, 152, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour comment tu vas', '2018-04-15 10:05:59', '2018-04-15 12:06:05', 3, 0, '0.000', 'text', 0, 'bcaeb87169258b42869b5a12c9bdc0d3'),
(1535920322, 159, 153, 1, 7321, 1, 'kannel', 'smpp', '21005', '221705168932', '', 'Bonjour comment tu vas', '2018-04-15 10:05:59', '2018-04-15 12:06:04', 3, 0, '0.000', 'text', 0, '9ac0437b5e696b8d61ac9075ed33ae74'),
(1535920322, 160, 155, 1, 7321, 1, 'kannel', 'smpp', '21005', '221705168932', '', 'Bonjour comment tu vas', '2018-04-16 10:06:00', '2018-04-16 12:06:03', 3, 0, '0.000', 'text', 0, '6b68ec83c7e82ddd580a2a0761ed8943'),
(1535920322, 161, 154, 1, 7321, 1, 'kannel', 'smpp', '21005', '221708942737', '', 'Bonjour comment tu vas', '2018-04-16 10:06:00', '2018-04-16 12:06:06', 3, 0, '0.000', 'text', 0, '269072e2f45b3a0085f7f2ac7bf26008');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblsmsoutgoing_queue`
--

CREATE TABLE IF NOT EXISTS `playsms_tblsmsoutgoing_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_code` varchar(40) NOT NULL DEFAULT '',
  `datetime_entry` varchar(20) NOT NULL DEFAULT '000-00-00 00:00:00',
  `datetime_scheduled` varchar(20) NOT NULL DEFAULT '000-00-00 00:00:00',
  `datetime_update` varchar(20) NOT NULL DEFAULT '000-00-00 00:00:00',
  `flag` int(11) NOT NULL DEFAULT '0',
  `queue_count` int(11) NOT NULL DEFAULT '0',
  `sms_count` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `gpid` int(11) NOT NULL DEFAULT '0',
  `sender_id` varchar(100) NOT NULL DEFAULT '',
  `footer` varchar(30) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sms_type` varchar(100) NOT NULL DEFAULT '',
  `unicode` int(11) NOT NULL DEFAULT '0',
  `smsc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `queue_code` (`queue_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=147 ;

--
-- Contenu de la table `playsms_tblsmsoutgoing_queue`
--

INSERT INTO `playsms_tblsmsoutgoing_queue` (`id`, `queue_code`, `datetime_entry`, `datetime_scheduled`, `datetime_update`, `flag`, `queue_count`, `sms_count`, `uid`, `gpid`, `sender_id`, `footer`, `message`, `sms_type`, `unicode`, `smsc`) VALUES
(103, 'a53a8209a420b86dca69c93b15e1b9cc', '2018-04-11 18:27:19', '2018-04-11 18:27:19', '2018-04-11 18:27:20', 1, 1, 1, 1, 0, '21005', '', 'dcv', 'text', 0, ''),
(104, 'e57ec6a274431c017b24b28dd259d47b', '2018-04-11 18:32:30', '2018-04-11 18:32:30', '2018-04-11 18:32:30', 1, 1, 1, 1, 0, '21005', '', 'Bonsoir', 'text', 0, ''),
(105, '4ed166d25821a9c21329eb5715e63e3e', '2018-04-11 18:33:53', '2018-04-11 18:33:53', '2018-04-11 18:33:54', 1, 1, 1, 1, 0, '21005', '', 'Bonsoir', 'text', 0, ''),
(106, '3de4b320c35255122af5a6aa56b960fe', '2018-04-11 18:36:13', '2018-04-11 18:36:13', '2018-04-11 18:36:13', 1, 1, 1, 1, 0, '21005', '', 'Bonsoir', 'text', 0, ''),
(107, '0fb4563527d434c993166604ff7cad38', '2018-04-11 18:43:11', '2018-04-11 18:43:11', '2018-04-11 18:43:11', 1, 1, 1, 1, 0, '21005', '', 'Bonjour', 'text', 0, ''),
(108, 'cc9e0d356a57b8e580d30960b9a51293', '2018-04-12 08:24:07', '2018-04-12 08:24:07', '2018-04-12 08:24:08', 1, 1, 1, 1, 0, '21005', '', 'Playsms', 'text', 0, ''),
(109, '98629c5ee968cdbe257e1eeecc6c99fe', '2018-04-12 10:24:42', '2018-04-12 10:24:42', '2018-04-12 10:24:42', 1, 1, 1, 7321, 0, '21005', '', 'système 10H-12H SALLE TR', 'text', 0, 'smpp'),
(110, 'e6d188c3968bc58ffa183e03f74dda11', '2018-04-12 10:25:32', '2018-04-12 10:25:32', '2018-04-12 10:25:33', 1, 1, 1, 7321, 0, '21005', '', 'système 10H-12H SALLE TR', 'text', 0, 'smpp'),
(111, 'b60d234027d80e3d3127df78b9a5d4ce', '2018-04-12 10:27:46', '2018-04-12 10:27:46', '2018-04-12 10:27:46', 1, 1, 1, 7321, 0, '21005', '', 'VoIP 9H-12H', 'text', 0, 'smpp'),
(112, 'e80247fb6e93e4abc42a3d5a352a525e', '2018-04-12 08:28:49', '2018-04-12 08:28:49', '2018-04-12 08:28:51', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour', 'text', 0, ''),
(113, '034bddd4e4b237aca3eb481c7b2400f3', '2018-04-12 08:42:30', '2018-04-12 08:42:30', '2018-04-12 08:42:32', 1, 1, 1, 1, 0, '21005', '', 'Playsms', 'text', 0, ''),
(114, 'd3566f955354a645cf031d52327fcc85', '2018-04-12 11:31:53', '2018-04-12 11:31:53', '2018-04-12 11:31:54', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour', 'text', 0, ''),
(115, '58d5380478997fcfd719ca7ac6be9914', '2018-04-12 13:32:24', '2018-04-12 13:32:24', '2018-04-12 13:32:24', 1, 1, 1, 7321, 0, '21005', '', 'VoIP 9H-12H', 'text', 0, 'smpp'),
(116, '205c9600289284462cddb923c0c8d514', '2018-04-12 13:33:45', '2018-04-12 13:33:45', '2018-04-12 13:33:46', 1, 1, 1, 7321, 0, '21005', '', 'VoIP 9H-12H', 'text', 0, 'smpp'),
(117, '814b003de6de6f35d12a7d3c781f1cca', '2018-04-12 13:47:35', '2018-04-12 13:47:35', '2018-04-12 13:47:35', 1, 1, 1, 7321, 0, '21005', '', 'système 10H-12H SALLE TR', 'text', 0, 'smpp'),
(118, '9af0743ac39ae54cd1e9615f3aff2ec8', '2018-04-12 13:52:22', '2018-04-12 13:52:22', '2018-04-12 13:52:22', 1, 1, 1, 7321, 0, '21005', '', 'système 10H-12H SALLE TR', 'text', 0, 'smpp'),
(119, '0e7e1f029e0b132f942e70c530e12cc1', '2018-04-12 13:53:22', '2018-04-12 13:53:22', '2018-04-12 13:53:22', 1, 1, 1, 7321, 0, '21005', '', 'système 10H-12H SALLE TR', 'text', 0, 'smpp'),
(120, '19b4ae1df7040824d9aa51110bbbada5', '2018-04-12 13:56:20', '2018-04-12 13:56:20', '2018-04-12 13:56:21', 1, 1, 1, 7321, 0, '21005', '', 'système 10H-12H SALLE TR', 'text', 0, 'smpp'),
(121, '2565e8a58df240f9e8b0dea0fe25207b', '2018-04-12 13:57:53', '2018-04-12 13:57:53', '2018-04-12 13:57:53', 1, 1, 1, 7321, 0, '21005', '', 'système 10H-12H SALLE TR', 'text', 0, 'smpp'),
(122, '3152653a0f0a032b22d368b093a1122c', '2018-04-12 12:07:56', '2018-04-12 12:07:56', '2018-04-12 12:07:59', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour', 'text', 0, ''),
(123, 'eee407e6ad4a8804df789ab390c95bd5', '2018-04-12 12:08:48', '2018-04-12 12:08:48', '2018-04-12 12:08:50', 1, 1, 1, 1, 0, '21005', '', 'Playsms', 'text', 0, ''),
(124, '72020b3eafb9f8ce640e095a73485d5f', '2018-04-12 12:32:01', '2018-04-12 12:32:01', '2018-04-12 12:32:03', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour', 'text', 0, ''),
(125, '528492a6d59fd2d9a1edfe5f03b7ad70', '2018-04-12 14:36:16', '2018-04-12 14:36:16', '2018-04-12 14:36:16', 1, 1, 1, 7321, 0, '21005', '', 'système 10H-12H SALLE TR', 'text', 0, 'smpp'),
(126, '33e5edeceb9d51bf43228814dba9f151', '2018-04-12 15:19:48', '2018-04-12 15:19:48', '2018-04-12 15:19:49', 1, 3, 3, 7321, 0, '21005', '', 'Message à partir d''un fichier CSV vers #NUM#', 'text', 0, ''),
(127, '0fd0e2a1fbba9a4a8f5e475e65c734e7', '2018-04-12 15:22:36', '2018-04-12 15:22:36', '2018-04-12 15:22:37', 1, 1, 1, 7321, 0, '21005', '', 'bon', 'text', 0, ''),
(128, '6e8ec287794bed609ed6118273133e88', '2018-04-12 16:30:25', '2018-04-12 16:30:25', '2018-04-12 16:30:26', 1, 1, 1, 7321, 0, '21005', '', 'Bienvenue dans notre plateforme Ousseynou administrateur (@admin)', 'text', 0, ''),
(129, '1a900b601600aececbc42cf3ee922656', '2018-04-12 17:41:36', '2018-04-12 17:41:36', '2018-04-12 17:41:36', 1, 3, 3, 7321, 0, '21005', '', 'Message à partir d''un fichier CSV vers #NUM#', 'text', 0, ''),
(130, '9992057b009f57cfaec55c5b6082c72c', '2018-04-12 17:45:05', '2018-04-12 17:45:05', '2018-04-12 17:45:05', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour #NAME# comment tu vas', 'text', 0, ''),
(131, '39af1c09fb9e7f02ef6fca94c093c8b3', '2018-04-13 10:05:59', '2018-04-13 10:05:59', '2018-04-13 10:05:59', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour comment tu vas', 'text', 0, ''),
(132, 'a2be0f0f95bd7405a9e7e08d1e728584', '2018-04-13 10:05:59', '2018-04-13 10:05:59', '2018-04-13 10:05:59', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour comment tu vas', 'text', 0, ''),
(133, '5af7347593a3d0de2bed1824265dcd9c', '2018-04-13 14:37:12', '2018-04-13 14:37:12', '2018-04-13 14:37:12', 1, 1, 1, 7321, 0, '21005', '', 'Votre vote est pris en compte', 'text', 0, 'kannel'),
(134, '9239acd0addf806b50503e8d7add4ea8', '2018-04-13 14:38:26', '2018-04-13 14:38:26', '2018-04-13 14:38:26', 1, 1, 1, 7321, 0, '21005', '', 'Votre vote est pris en compte', 'text', 0, 'kannel'),
(135, '61b1a5bfc6ab700b77ae69ed969e3e67', '2018-04-13 14:39:52', '2018-04-13 14:39:52', '2018-04-13 14:39:52', 1, 1, 1, 7321, 0, '21005', '', 'Votre vote est pris en compte', 'text', 0, 'kannel'),
(136, 'c8b840818b7b37f43df263f23dc85274', '2018-04-13 15:08:57', '2018-04-13 15:08:57', '2018-04-13 15:08:58', 1, 4, 4, 1, 0, '21005', '', 'SMS groupé', 'text', 0, ''),
(137, 'd75e6329740945813987abd38ce3fc38', '2018-04-13 18:12:12', '2018-04-13 18:12:12', '2018-04-13 18:12:12', 1, 1, 1, 7321, 0, '21005', '', 'Votre vote est pris en compte', 'text', 0, 'kannel'),
(138, 'ad2daad5a986f43a686f2287934a1751', '2018-04-13 18:13:42', '2018-04-13 18:13:42', '2018-04-13 18:13:42', 1, 1, 1, 7321, 0, '21005', '', 'Votre vote est pris en compte', 'text', 0, 'kannel'),
(139, '7aed770a9a0c20050c4a06c338b2e258', '2018-04-13 18:14:20', '2018-04-13 18:14:20', '2018-04-13 18:14:20', 1, 1, 1, 7321, 0, '21005', '', 'Veuillez revoir l''option choisis', 'text', 0, 'kannel'),
(140, 'c685b2789184221f0024a14272604216', '2018-04-13 17:28:57', '2018-04-13 17:28:57', '2018-04-13 17:29:00', 1, 3, 3, 7321, 0, '21005', '', 'Message groupé', 'text', 0, ''),
(141, 'c1a803e4da3de538b91a4fc03efca98c', '2018-04-14 10:05:59', '2018-04-14 10:05:59', '2018-04-14 10:05:59', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour comment tu vas', 'text', 0, ''),
(142, '1bd1718cd8778226431f092b15915ff1', '2018-04-14 10:05:59', '2018-04-14 10:05:59', '2018-04-14 10:05:59', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour comment tu vas', 'text', 0, ''),
(143, 'bcaeb87169258b42869b5a12c9bdc0d3', '2018-04-15 10:05:59', '2018-04-15 10:05:59', '2018-04-15 10:05:59', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour comment tu vas', 'text', 0, ''),
(144, '9ac0437b5e696b8d61ac9075ed33ae74', '2018-04-15 10:05:59', '2018-04-15 10:05:59', '2018-04-15 10:05:59', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour comment tu vas', 'text', 0, ''),
(145, '269072e2f45b3a0085f7f2ac7bf26008', '2018-04-16 10:05:59', '2018-04-16 10:05:59', '2018-04-16 10:06:00', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour comment tu vas', 'text', 0, ''),
(146, '6b68ec83c7e82ddd580a2a0761ed8943', '2018-04-16 10:05:59', '2018-04-16 10:05:59', '2018-04-16 10:06:00', 1, 1, 1, 7321, 0, '21005', '', 'Bonjour comment tu vas', 'text', 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tblsmsoutgoing_queue_dst`
--

CREATE TABLE IF NOT EXISTS `playsms_tblsmsoutgoing_queue_dst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) NOT NULL DEFAULT '0',
  `chunk` int(11) NOT NULL DEFAULT '0',
  `smslog_id` int(11) NOT NULL DEFAULT '0',
  `flag` int(11) NOT NULL DEFAULT '0',
  `dst` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=156 ;

--
-- Contenu de la table `playsms_tblsmsoutgoing_queue_dst`
--

INSERT INTO `playsms_tblsmsoutgoing_queue_dst` (`id`, `queue_id`, `chunk`, `smslog_id`, `flag`, `dst`) VALUES
(103, 103, 0, 0, 1, '221708942737'),
(104, 104, 0, 0, 1, '221708942737'),
(105, 105, 0, 0, 1, '221708942737'),
(106, 106, 0, 0, 1, '221708942737'),
(107, 107, 0, 0, 1, '221708942737'),
(108, 108, 0, 0, 1, '221708942737'),
(109, 109, 0, 0, 2, '221708942737'),
(110, 110, 0, 0, 1, '221708942737'),
(111, 111, 0, 0, 1, '221708942737'),
(112, 112, 0, 0, 1, '221708942737'),
(113, 113, 0, 0, 1, '221705168932'),
(114, 114, 0, 0, 1, '221708942737'),
(115, 115, 0, 0, 2, '221708942737'),
(116, 116, 0, 0, 1, '221708942737'),
(117, 117, 0, 0, 1, '221708942737'),
(118, 118, 0, 0, 1, '221708942737'),
(119, 119, 0, 0, 1, '221708942737'),
(120, 120, 0, 0, 1, '221708942737'),
(121, 121, 0, 0, 1, '221708942737'),
(122, 122, 0, 0, 1, '221708942737'),
(123, 123, 0, 0, 1, '221708942737'),
(124, 124, 0, 0, 1, '221708942737'),
(125, 125, 0, 0, 2, '221708942737'),
(126, 126, 0, 0, 2, '221708942737'),
(127, 126, 0, 0, 2, '221774156562'),
(128, 126, 0, 0, 1, '221709497661'),
(129, 127, 0, 0, 1, '221708942737'),
(130, 128, 0, 0, 1, '221708942737'),
(131, 129, 0, 0, 1, '221708942737'),
(132, 129, 0, 0, 1, '221774156562'),
(133, 129, 0, 0, 1, '221709497661'),
(134, 130, 0, 0, 1, '221708942737'),
(135, 131, 0, 0, 1, '221708942737'),
(136, 132, 0, 0, 1, '221705168932'),
(137, 133, 0, 0, 1, '221708942737'),
(138, 134, 0, 0, 1, '221705128936'),
(139, 135, 0, 0, 1, '221709497661'),
(140, 136, 0, 0, 1, '221775201784'),
(141, 136, 0, 0, 1, '221774316778'),
(142, 136, 0, 0, 1, '221774210431'),
(143, 136, 0, 0, 1, '221772017647'),
(144, 137, 0, 0, 1, '221707985980'),
(145, 138, 0, 0, 1, '221704905751'),
(146, 139, 0, 0, 1, '221708942737'),
(147, 140, 0, 0, 1, '221708942737'),
(148, 140, 0, 0, 1, '221774156562'),
(149, 140, 0, 0, 1, '221709497661'),
(150, 141, 0, 0, 1, '221708942737'),
(151, 142, 0, 0, 1, '221705168932'),
(152, 143, 0, 0, 1, '221708942737'),
(153, 144, 0, 0, 1, '221705168932'),
(154, 145, 0, 0, 1, '221708942737'),
(155, 146, 0, 0, 1, '221705168932');

-- --------------------------------------------------------

--
-- Structure de la table `playsms_tbluser`
--

CREATE TABLE IF NOT EXISTS `playsms_tbluser` (
  `c_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `parent_uid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `token` varchar(32) NOT NULL DEFAULT '',
  `enable_webservices` int(11) NOT NULL DEFAULT '0',
  `webservices_ip` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `sender` varchar(16) NOT NULL DEFAULT '',
  `footer` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(250) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  `country` int(11) NOT NULL DEFAULT '0',
  `zipcode` varchar(10) NOT NULL DEFAULT '',
  `credit` decimal(13,3) NOT NULL DEFAULT '0.000',
  `adhoc_credit` decimal(13,3) NOT NULL DEFAULT '0.000',
  `datetime_timezone` varchar(30) NOT NULL DEFAULT '',
  `language_module` varchar(10) NOT NULL DEFAULT '',
  `fwd_to_mobile` int(11) NOT NULL DEFAULT '0',
  `fwd_to_email` int(11) NOT NULL DEFAULT '1',
  `fwd_to_inbox` int(11) NOT NULL DEFAULT '1',
  `replace_zero` varchar(5) NOT NULL DEFAULT '',
  `plus_sign_remove` int(11) NOT NULL DEFAULT '1',
  `plus_sign_add` int(11) NOT NULL DEFAULT '0',
  `send_as_unicode` int(11) NOT NULL DEFAULT '0',
  `local_length` int(11) NOT NULL DEFAULT '9',
  `register_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastupdate_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7323 ;

--
-- Contenu de la table `playsms_tbluser`
--

INSERT INTO `playsms_tbluser` (`c_timestamp`, `parent_uid`, `uid`, `status`, `acl_id`, `username`, `password`, `token`, `enable_webservices`, `webservices_ip`, `name`, `mobile`, `email`, `sender`, `footer`, `address`, `city`, `state`, `country`, `zipcode`, `credit`, `adhoc_credit`, `datetime_timezone`, `language_module`, `fwd_to_mobile`, `fwd_to_email`, `fwd_to_inbox`, `replace_zero`, `plus_sign_remove`, `plus_sign_add`, `send_as_unicode`, `local_length`, `register_datetime`, `lastupdate_datetime`, `flag_deleted`) VALUES
(1523956319, 0, 1, 2, 0, 'admin', 'd34b6d9d0f596870252db80806ee5aea', '', 1, '*.*.*.*', 'administrateur', '21005', 'diopousseynou1993@gmail.com', '21005', '@servicesmsmessage', 'Yeumbeul Nord Darou Salame 6', 'Dakar', 'Sénégal', 159, '', '10445.000', '10445.000', '0000', 'fr_FR', 0, 0, 0, '', 1, 0, 0, 9, '2018-03-20 10:40:24', '2018-09-02 22:46:38', 0),
(1523357452, 1, 2161, 4, 0, 'mpolle.gaye', '67e2a36b975e50da2948c7bc3f98b0ea', '451ce59a2668c6525a8221f474dd7106', 1, '*.*.*.*', 'Mpolle Gaye ', '774210431', 'mpolle.gaye@ucad.edu.sn', '', '', '', '', '', 159, '', '9985.000', '9985.000', '0000', 'fr_FR', 0, 1, 1, '', 1, 0, 0, 9, '2018-03-21 10:33:22', '2018-03-21 10:33:22', 1),
(1523956319, 1, 7321, 4, 0, 'Ousseynou', 'd34b6d9d0f596870252db80806ee5aea', '785b800445778089770aa1df93b6a302', 1, '*.*.*.*', 'Ousseynou Diop', '708942737', 'ousseynou4.diop@ucad.edu.sn', '', '', '', '', '', 159, '', '550.000', '550.000', '0000', 'fr_FR', 1, 1, 1, '', 1, 0, 0, 9, '2018-04-06 00:44:12', '2018-04-10 14:00:15', 0),
(1523956319, 0, 7322, 4, 0, 'diop', '37af1914a777f6161166795396225177', 'd576d31edb10f10fb40be8a259fff359', 1, '*.*.*.*', 'diop diop', '783679196', 'diop@ucad.edu.sn', '', '@diop', '', '', '', 0, '', '0.000', '0.000', '0000', 'fr_FR', 0, 1, 1, '', 1, 0, 0, 9, '2018-04-10 12:56:04', '2018-04-10 12:56:04', 0);
--
-- Base de données :  `test`
--
--
-- Base de données :  `xeweul_transfert`
--

-- --------------------------------------------------------

--
-- Structure de la table `beneficiaire`
--

CREATE TABLE IF NOT EXISTS `beneficiaire` (
  `cni` int(14) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  PRIMARY KEY (`cni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `beneficiaire`
--

INSERT INTO `beneficiaire` (`cni`, `nom`, `prenom`) VALUES
(12, 'faye', 'demba'),
(21, 'diop', 'ousseynou'),
(23, 'NDIAYE', 'abdoulaye'),
(32, 'ka', 'ali'),
(34, 'FALL', 'birane'),
(1223456788, 'LO', 'HOULD'),
(2147483647, 'saware', 'kabe');

-- --------------------------------------------------------

--
-- Structure de la table `caissier`
--

CREATE TABLE IF NOT EXISTS `caissier` (
  `mot_pass` varchar(8) NOT NULL,
  `nom_caissier` varchar(20) NOT NULL,
  `prenom_caissier` varchar(20) NOT NULL,
  `login` varchar(30) NOT NULL,
  `telephone` int(12) NOT NULL,
  `etat` int(1) NOT NULL,
  PRIMARY KEY (`mot_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `caissier`
--

INSERT INTO `caissier` (`mot_pass`, `nom_caissier`, `prenom_caissier`, `login`, `telephone`, `etat`) VALUES
('123', 'wade', 'dha', 'dha@gmail.com', 768905432, 0),
('diop', 'diop', 'ousseynou', 'DIOP@gmail.com', 708942737, 1),
('fer', 'diobay', 'hio', 'dof@gmail.com', 760987543, 1),
('kabe', 'saware', 'kabe', 'kabe@gmail.com', 769893456, 1),
('ouz', 'ousseynou', 'ndiaye', 'ndiaye@gmail.com', 708942737, 2),
('wade', 'ka', 'sadio', 'ka@boeuf.php', 2147483647, 1);

-- --------------------------------------------------------

--
-- Structure de la table `envoi`
--

CREATE TABLE IF NOT EXISTS `envoi` (
  `cni` int(14) NOT NULL,
  `mot_pass` varchar(8) NOT NULL,
  `montant` int(10) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `telephone` int(14) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `localite` varchar(20) NOT NULL,
  `question` text NOT NULL,
  `reponse` text NOT NULL,
  `code` varchar(8) NOT NULL,
  `date_heure` datetime NOT NULL,
  `lieu_envoi` varchar(10) NOT NULL,
  `taxe` int(6) NOT NULL,
  `type` varchar(20) NOT NULL,
  `gain_soc` int(10) NOT NULL,
  `gain_cai_exp` int(10) NOT NULL,
  `gain_cai_ben` int(10) NOT NULL,
  `gain_etat` int(10) NOT NULL,
  PRIMARY KEY (`cni`,`mot_pass`),
  KEY `mot_pass` (`mot_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `envoi`
--

INSERT INTO `envoi` (`cni`, `mot_pass`, `montant`, `nom`, `prenom`, `telephone`, `adresse`, `localite`, `question`, `reponse`, `code`, `date_heure`, `lieu_envoi`, `taxe`, `type`, `gain_soc`, `gain_cai_exp`, `gain_cai_ben`, `gain_etat`) VALUES
(14567963, 'kabe', 10000, 'saware', 'kabe', 787657544, 'diofior', 'thies', 'DSE', 'ESD', '55539323', '2015-12-18 15:50:00', 'ucad', 0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `expediteur`
--

CREATE TABLE IF NOT EXISTS `expediteur` (
  `cni` int(14) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  PRIMARY KEY (`cni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `expediteur`
--

INSERT INTO `expediteur` (`cni`, `nom`, `prenom`) VALUES
(1, 'faye', 'demba'),
(2, 'diop', 'moussa'),
(3, 'sow', 'djily'),
(4, 'ndir', 'matar'),
(5, 'ka', 'ale'),
(1234567, 'diop', 'ousseynou'),
(14567963, 'ba', 'papa'),
(1223456788, 'TAFF TAFF', 'TRANS'),
(2147483647, 'saware', 'kabe');

-- --------------------------------------------------------

--
-- Structure de la table `retrait`
--

CREATE TABLE IF NOT EXISTS `retrait` (
  `cni` int(14) NOT NULL,
  `mot_pass` varchar(8) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `montant_recu` int(10) NOT NULL,
  `question` text NOT NULL,
  `reponse` text NOT NULL,
  `code` varchar(8) NOT NULL,
  `date_heure_ret` datetime NOT NULL,
  `lieu_retrait` varchar(20) NOT NULL,
  `telephone` int(14) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  PRIMARY KEY (`cni`,`mot_pass`),
  KEY `mot_pass` (`mot_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `retrait`
--

INSERT INTO `retrait` (`cni`, `mot_pass`, `nom`, `prenom`, `montant_recu`, `question`, `reponse`, `code`, `date_heure_ret`, `lieu_retrait`, `telephone`, `adresse`) VALUES
(1223456788, 'kabe', 'LO', 'HOULD', 10000, 'zertyu', 'fghjk', '89716209', '2015-12-18 18:34:35', 'ucad', 13456789, 'yembeul'),
(2147483647, 'kabe', 'saware', 'kabe', 10000, 'DSE', 'ESD', '55539323', '2015-12-19 00:41:12', 'MBELEUKHE', 78904037, 'DIOKH');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `envoi`
--
ALTER TABLE `envoi`
  ADD CONSTRAINT `envoi_ibfk_1` FOREIGN KEY (`cni`) REFERENCES `expediteur` (`cni`),
  ADD CONSTRAINT `envoi_ibfk_2` FOREIGN KEY (`mot_pass`) REFERENCES `caissier` (`mot_pass`);

--
-- Contraintes pour la table `retrait`
--
ALTER TABLE `retrait`
  ADD CONSTRAINT `retrait_ibfk_1` FOREIGN KEY (`cni`) REFERENCES `beneficiaire` (`cni`),
  ADD CONSTRAINT `retrait_ibfk_2` FOREIGN KEY (`mot_pass`) REFERENCES `caissier` (`mot_pass`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
