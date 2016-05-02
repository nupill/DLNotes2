-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 08-Abr-2016 às 14:14
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


--
-- Estrutura da tabela `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_user` int(11) NOT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `ref_ontology` int(11) DEFAULT NULL,
  `special_purpose` int(3) DEFAULT NULL,
  `remote_key` varchar(256) DEFAULT NULL,
  `remote_id` varchar(256) DEFAULT NULL,
  `shared_knowledge_base` int(11) NOT NULL DEFAULT '0',
  `full_graph_view` int(11) NOT NULL DEFAULT '0',
  `single_knowledge_base` int(11) NOT NULL DEFAULT '0',
  `show_document_title` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref_ontology` (`ref_ontology`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


-- --------------------------------------------------------

--
-- Estrutura da tabela `activity_permissions`
--

CREATE TABLE IF NOT EXISTS `activity_permissions` (
  `ref_activity` int(11) NOT NULL,
  `ref_classroom_group` int(11) NOT NULL,
  `create_annotations` tinyint(1) NOT NULL,
  `create_replies` tinyint(1) NOT NULL,
  `visible_everybody` tinyint(1) NOT NULL,
  `visible_groups` tinyint(1) NOT NULL,
  `visible_private` tinyint(1) NOT NULL,
  `edit_annotations` tinyint(1) DEFAULT NULL,
  `edit_replies` tinyint(1) DEFAULT NULL,
  `see_all_semantic` int(11) NOT NULL DEFAULT '0',
  `create_free` tinyint(1) NOT NULL DEFAULT '1',
  `create_semantic` tinyint(1) NOT NULL,
  `filter_by_user` tinyint(1) NOT NULL,
  PRIMARY KEY (`ref_activity`,`ref_classroom_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Estrutura da tabela `activity_system_permissions`
--

CREATE TABLE IF NOT EXISTS `activity_system_permissions` (
  `ref_activity` int(11) NOT NULL,
  `ref_user` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ref_activity`,`ref_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Estrutura da tabela `annotations`
--

CREATE TABLE IF NOT EXISTS `annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_context` int(11) NOT NULL,
  `ref_user` int(11) NOT NULL,
  `visibility` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `creation_time` datetime NOT NULL,
  `first_word` bigint(20) NOT NULL,
  `last_word` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `annotations_context` (`ref_context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `classroom_groups`
--

CREATE TABLE IF NOT EXISTS `classroom_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `classroom_groups`
--

INSERT INTO `classroom_groups` (`id`, `name`) VALUES
(1, 'Moderators'),
(2, 'Students');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contexts`
--

CREATE TABLE IF NOT EXISTS `contexts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_activity` int(11) NOT NULL,
  `ref_document` int(11) NOT NULL,
  `lti_secret` varchar(256) DEFAULT NULL,
  `lti_key` varchar(256) DEFAULT NULL,
  `ref_knowledge_base` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


-- --------------------------------------------------------

--
-- Estrutura da tabela `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `last_word` bigint(20) DEFAULT NULL,
  `style` int(11) NOT NULL DEFAULT '1',
  `hide` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `domain_classes`
--

CREATE TABLE IF NOT EXISTS `domain_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_ontology` int(11) NOT NULL,
  `resource` varchar(256) DEFAULT NULL,
  `label` varchar(1024) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `unselectable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref_ontology` (`ref_ontology`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=693 ;


-- --------------------------------------------------------

--
-- Estrutura da tabela `domain_classes_properties`
--

CREATE TABLE IF NOT EXISTS `domain_classes_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_class` int(11) DEFAULT NULL,
  `ref_property` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=135 ;

--
-- Extraindo dados da tabela `domain_classes_properties`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `domain_ontologies`
--

CREATE TABLE IF NOT EXISTS `domain_ontologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `domain_ontologies`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `domain_properties`
--

CREATE TABLE IF NOT EXISTS `domain_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_ontology` int(11) NOT NULL,
  `resource` varchar(256) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `prop_range` varchar(256) DEFAULT NULL,
  `max_cardinality` int(11) DEFAULT NULL,
  `auto_fill` int(3) DEFAULT NULL,
  `auto_gen` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=135 ;

--
-- Extraindo dados da tabela `domain_properties`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `domain_properties_defaults`
--

CREATE TABLE IF NOT EXISTS `domain_properties_defaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_property` int(11) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=169 ;

--
-- Extraindo dados da tabela `domain_properties_defaults`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `free_annotations`
--

CREATE TABLE IF NOT EXISTS `free_annotations` (
  `ref_annotation` int(11) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`ref_annotation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `general_system_permissions`
--

CREATE TABLE IF NOT EXISTS `general_system_permissions` (
  `ref_user` int(11) NOT NULL,
  `create_users` tinyint(1) NOT NULL DEFAULT '0',
  `create_activities` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `general_system_permissions`
--

INSERT INTO `general_system_permissions` (`ref_user`, `create_users`, `create_activities`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `kb_instances`
--

CREATE TABLE IF NOT EXISTS `kb_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_class` int(11) NOT NULL,
  `identifier` varchar(128) DEFAULT NULL,
  `ref_user` int(11) DEFAULT NULL,
  `ref_knowledge_base` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_class` (`ref_class`),
  KEY `ref_user` (`ref_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kb_properties`
--

CREATE TABLE IF NOT EXISTS `kb_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_instance` int(11) NOT NULL,
  `ref_property` int(11) NOT NULL,
  `text_value` text,
  `choice_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_instance` (`ref_instance`),
  KEY `ref_property` (`ref_property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kb_properties_instances`
--

CREATE TABLE IF NOT EXISTS `kb_properties_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_property` int(11) DEFAULT NULL,
  `ref_instance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_property` (`ref_property`),
  KEY `ref_instance` (`ref_instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `knowledge_bases`
--

CREATE TABLE IF NOT EXISTS `knowledge_bases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_activity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_activity` (`ref_activity`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


-- --------------------------------------------------------

--
-- Estrutura da tabela `lti_license`
--

CREATE TABLE IF NOT EXISTS `lti_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_consumer_key` varchar(100) NOT NULL,
  `secret` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `recent_instances`
--

CREATE TABLE IF NOT EXISTS `recent_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_user` int(11) NOT NULL,
  `ref_knowledge_base` int(11) NOT NULL,
  `ref_class` int(11) NOT NULL,
  `ref_instance` int(11) NOT NULL,
  `last_used` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_user` (`ref_user`),
  KEY `ref_instance` (`ref_instance`),
  KEY `ref_knowledge_base` (`ref_knowledge_base`),
  KEY `ref_class` (`ref_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `replies`
--

CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_user` int(11) NOT NULL,
  `ref_annotation` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `content` longtext,
  `visibility` int(11) DEFAULT NULL,
  `creation_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `semantic_annotations`
--

CREATE TABLE IF NOT EXISTS `semantic_annotations` (
  `ref_annotation` int(11) NOT NULL DEFAULT '0',
  `ref_instance` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref_annotation`),
  KEY `ref_instance` (`ref_instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_groups`
--

CREATE TABLE IF NOT EXISTS `system_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `system_groups`
--

INSERT INTO `system_groups` (`id`, `name`) VALUES
(1, 'Administrators'),
(2, 'Teachers'),
(3, 'Students');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_system_group` int(11) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `reset_code` varchar(128) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `fewer_popups` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `ref_system_group`, `email`, `password`, `full_name`, `reset_code`, `last_login`, `fewer_popups`) VALUES
(1, 1, 'admin', 'dbb2d4551c75ccee1c310485ee37ff2a7ac4ce532e5a228fea', 'Administrator', '8e99eda36f6f0cd3576256e0debffd61', '2016-03-29 12:06:44', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_activities`
--

CREATE TABLE IF NOT EXISTS `users_activities` (
  `ref_user` int(11) NOT NULL,
  `ref_activity` int(11) NOT NULL,
  `ref_classroom_group` int(11) NOT NULL,
  PRIMARY KEY (`ref_activity`,`ref_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_activities`
--


--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`ref_ontology`) REFERENCES `domain_ontologies` (`id`);

--
-- Limitadores para a tabela `annotations`
--
ALTER TABLE `annotations`
  ADD CONSTRAINT `annotations_context` FOREIGN KEY (`ref_context`) REFERENCES `contexts` (`id`);

--
-- Limitadores para a tabela `domain_classes`
--
ALTER TABLE `domain_classes`
  ADD CONSTRAINT `domain_classes_ibfk_1` FOREIGN KEY (`ref_ontology`) REFERENCES `domain_ontologies` (`id`);

--
-- Limitadores para a tabela `kb_instances`
--
ALTER TABLE `kb_instances`
  ADD CONSTRAINT `kb_instances_ibfk_1` FOREIGN KEY (`ref_class`) REFERENCES `domain_classes` (`id`),
  ADD CONSTRAINT `kb_instances_ibfk_3` FOREIGN KEY (`ref_user`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `kb_properties`
--
ALTER TABLE `kb_properties`
  ADD CONSTRAINT `kb_properties_ibfk_1` FOREIGN KEY (`ref_instance`) REFERENCES `kb_instances` (`id`),
  ADD CONSTRAINT `kb_properties_ibfk_2` FOREIGN KEY (`ref_property`) REFERENCES `domain_properties` (`id`);

--
-- Limitadores para a tabela `kb_properties_instances`
--
ALTER TABLE `kb_properties_instances`
  ADD CONSTRAINT `kb_properties_instances_ibfk_1` FOREIGN KEY (`ref_property`) REFERENCES `kb_properties` (`id`),
  ADD CONSTRAINT `kb_properties_instances_ibfk_2` FOREIGN KEY (`ref_instance`) REFERENCES `kb_instances` (`id`);

--
-- Limitadores para a tabela `recent_instances`
--
ALTER TABLE `recent_instances`
  ADD CONSTRAINT `recent_instances_ibfk_1` FOREIGN KEY (`ref_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `recent_instances_ibfk_2` FOREIGN KEY (`ref_instance`) REFERENCES `kb_instances` (`id`),
  ADD CONSTRAINT `recent_instances_ibfk_3` FOREIGN KEY (`ref_knowledge_base`) REFERENCES `knowledge_bases` (`id`),
  ADD CONSTRAINT `recent_instances_ibfk_4` FOREIGN KEY (`ref_class`) REFERENCES `domain_classes` (`id`);

--
-- Limitadores para a tabela `semantic_annotations`
--
ALTER TABLE `semantic_annotations`
  ADD CONSTRAINT `semantic_annotations_ibfk_1` FOREIGN KEY (`ref_annotation`) REFERENCES `annotations` (`id`),
  ADD CONSTRAINT `semantic_annotations_ibfk_2` FOREIGN KEY (`ref_instance`) REFERENCES `kb_instances` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
