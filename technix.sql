-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 07, 2011 at 09:38 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `technix`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(1, 0, 'Events', '', 'events', '', '1', 'left', '<p>Events</p>', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(2, 0, 'header', '', 'header', '', '2', 'left', '<p>header pics</p>', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(3, 0, '404', '', 'error-404', '', '3', 'left', '<p>404 error page</p>', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=0\nfilter_tags=\nfilter_attritbutes=\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Home', 'home', '', '<p style="text-align: center;">"Technology is a gift of God. After the gift of life it is perhaps the greatest of God''s gifts. It is the mother of civilizations, of arts and of sciences." <strong>Freeman Dyson</strong></p>\r\n<p><strong>Technix</strong>, the annual technical festival of<strong> Goa College of Engineering</strong>, aims to provide a platform for the brightest minds in the country to showcase their talent and ingenuity.</p>\r\n<p>Within four years, Technix, organized by the <strong>Computer Students'' Organisation</strong> (<strong>CURSOR</strong>), has managed to carve a niche for itself as the premier technical festival in Goa.</p>\r\n<p>This year, Technix 5.0 promises to be even bigger! More events, more prizes, and of course a lot more competition! Besides tonnes of competitions, Technix 5.0 also offers a set of Workshops, conducted by reputed individuals and institutes from around the country over three days aimed at expanding your knowledge and firing up your imagination.</p>\r\n<p>With loads of prizes up for grabs and a chance to compete with some of the best minds in the country, this is your chance to unleash your element!</p>', '', 1, 0, 0, 0, '2011-05-05 15:47:45', 62, '', '2011-05-07 15:33:54', 62, 62, '2011-06-28 13:42:56', '2011-05-05 15:47:45', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 60, 0, 10, '', '', 0, 39, 'robots=\nauthor='),
(2, 'Rules', 'rules', '', '<p>Rules</p>', '', 0, 0, 0, 0, '2011-05-05 15:48:01', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-05 15:48:01', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 16, '', '', 0, 8, 'robots=\nauthor='),
(3, 'Agnee', 'agnee', '', '<p>agnee</p>', '', -2, 0, 0, 0, '2011-05-05 17:36:45', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-05 17:36:45', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 5, 'robots=\nauthor='),
(4, 'Prithvi', 'prithvi', '', '<p style="text-align: center;"><strong> <img src="images/eventcat/prt.png" border="0" alt="Agnee" width="400" height="67" style="float: left;" /></strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: left;"><strong>A structure is only as strong as it''s foundation.  How strong is your technical foundation?</strong></p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;">Do you think in C++? Do you believe that the world was created in binary? Can you see the matrix?</p>\r\n<p style="text-align: left;">Think you can compete with the finest computer geeks in the country? Do you see a mouse as an extension of your body?</p>\r\n<p style="text-align: left;">Then Prithvi is your element.... All your base are belong to us!<strong> </strong></p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"><strong>“What springs from earth dissolves to earth again”-Marcus Aurelius</strong></p>', '', 1, 0, 0, 0, '2011-05-05 17:37:00', 62, '', '2011-06-16 00:48:04', 62, 62, '2011-06-17 12:50:40', '2011-05-05 17:37:00', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 14, '', '', 0, 174, 'robots=\nauthor='),
(5, 'Vaayu', 'vaayu', '', '<p style="text-align: center;"><strong> <img src="images/eventcat/vyu.png" border="0" alt="Vaayu" width="400" height="67" style="float: left;" /></strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: left;"><strong>Run like the wind, work against time,think at  godspeed, and fly higher than you can imagine.</strong></p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;">It is said that Intelligence Quotient (IQ) is what differentiates humans from other animals.</p>\r\n<p style="text-align: left;">Can you think under pressure? Can you put your best foot forward when crunch time arrives?</p>\r\n<p style="text-align: left;">Can you work against the clock, without compromising your skill?</p>\r\n<p style="text-align: left;">Then Vaayu is your element..... Blow the competition away!</p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"><strong>“Never laugh at the breeze because one day, it may become the storm” - John McGraw</strong></p>', '', 1, 0, 0, 0, '2011-05-05 17:37:14', 62, '', '2011-06-16 00:48:51', 62, 62, '2011-06-16 00:48:51', '2011-05-05 17:37:14', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 13, '', '', 0, 152, 'robots=\nauthor='),
(6, 'Jal', 'jal', '', '<p style="text-align: center;"><strong> <img src="images/eventcat/jal.png" border="0" alt="Jal" width="400" height="67" style="float: left;" /></strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: left;"><strong>Empty your mind, be formless, shapeless.  Follow the flow, or resist and be washed away.</strong></p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;">It is said that the only constant in life is change. How deeply do you believe in this?</p>\r\n<p style="text-align: left;">Are you open to change? Can you alter your thought process to a given situation?</p>\r\n<p style="text-align: left;">Do you believe that you can decrypt codes using only logic?</p>\r\n<p style="text-align: left;">Then Jal is your element... Flow where noone else dares!</p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"><strong>“Water is life''s mater and matrix, mother and medium.   There is no life without water.” </strong></p>\r\n<p style="text-align: left;"><strong>-Albert Szent-Gyorgyi</strong></p>', '', 1, 0, 0, 0, '2011-05-05 17:37:28', 62, '', '2011-06-16 00:49:48', 62, 0, '0000-00-00 00:00:00', '2011-05-05 17:37:28', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 12, '', '', 0, 175, 'robots=\nauthor='),
(7, 'Antariksha', 'antariksha', '', '<p style="text-align: center;"><strong> <img src="images/eventcat/atx.png" border="0" alt="Antariksha" width="400" height="67" style="float: left;" /></strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: left;"><strong>Explore the infinite, challenge the limits,  break the perceptions and take on the universe</strong></p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;">Ideas are boundless, shapeless, almost magical! From the tiniest spark, a fire greater than our wildest dreams can grow!</p>\r\n<p style="text-align: left;">Think you have an idea that fits the description? Can you present yourself to the world?</p>\r\n<p style="text-align: left;">Then Antariksha is your element... to infinity and beyond!</p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"><strong>“Ideas are infinite, original, and lively divine thoughts” -Karl Wilhelm Schlegel</strong></p>', '', 1, 0, 0, 0, '2011-05-05 17:37:41', 62, '', '2011-06-16 00:50:43', 62, 0, '0000-00-00 00:00:00', '2011-05-05 17:37:41', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 11, '', '', 0, 207, 'robots=\nauthor='),
(8, 'Socialize', 'socialize', '', '<p style="text-align: center;"><a href="http://www.facebook.com/gectechnix"> <img src="templates/technix/images/socmed3/facebook.png" border="0" /> </a><a href="http://www.twitter.com/gectechnix"> <img src="templates/technix/images/socmed3/twitter.png" border="0" /> </a><a href="http://www.youtube.com/user/TeamCURSOR"><img src="templates/technix/images/socmed3/youtube.png" border="0" /></a></p>', '', 1, 0, 0, 0, '2011-05-03 14:30:18', 62, '', '2011-06-17 10:32:48', 62, 62, '2011-06-17 10:32:48', '2011-05-03 14:30:18', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 14, 0, 17, '', '', 0, 32, 'robots=\nauthor='),
(9, 'Hospitality', 'hospitality', '', '<p><u><b>Location</b></u></p>\r\n<p>Goa Engineering College is located on the lush hilltop in Farmagudi, Ponda. It is easily accessible by multiple modes of transport at almost all times of the day. The distances from other important cities and locations is as follows:</p>\r\n<ul>\r\n<li>Panaji - 28 Kms (Connected by NH-4A) </li>\r\n<li>Margao - 19 Kms Vasco - 40 Kms </li>\r\n<li>Ponda Bus Station - 1.5 Kms</li>\r\n<li>Karmali Railway Station - 17 Kms</li>\r\n<li>Margao Railway Station - 20 Kms</li>\r\n<li>Dabolim Airport - 40 Kms</li>\r\n</ul>\r\n<p>\r\n<iframe marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Engineering+College,+Goa,+India&amp;aq=1&amp;sll=37.0625,-95.677068&amp;sspn=31.23349,86.572266&amp;ie=UTF8&amp;hq=Engineering+College,&amp;hnear=Goa,+India&amp;cid=12851243738651322540&amp;t=h&amp;ll=15.424972,73.981547&amp;spn=0.019857,0.027466&amp;iwloc=A&amp;output=embed" mce_src="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Engineering+College,+Goa,+India&amp;aq=1&amp;sll=37.0625,-95.677068&amp;sspn=31.23349,86.572266&amp;ie=UTF8&amp;hq=Engineering+College,&amp;hnear=Goa,+India&amp;cid=12851243738651322540&amp;t=h&amp;ll=15.424972,73.981547&amp;spn=0.019857,0.027466&amp;iwloc=A&amp;output=embed" width="425" scrolling="no" frameborder="0" height="350"></iframe><br /><small><a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Engineering+College,+Goa,+India&amp;aq=1&amp;sll=37.0625,-95.677068&amp;sspn=31.23349,86.572266&amp;ie=UTF8&amp;hq=Engineering+College,&amp;hnear=Goa,+India&amp;cid=12851243738651322540&amp;t=h&amp;ll=15.424972,73.981547&amp;spn=0.019857,0.027466&amp;iwloc=A" mce_href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Engineering+College,+Goa,+India&amp;aq=1&amp;sll=37.0625,-95.677068&amp;sspn=31.23349,86.572266&amp;ie=UTF8&amp;hq=Engineering+College,&amp;hnear=Goa,+India&amp;cid=12851243738651322540&amp;t=h&amp;ll=15.424972,73.981547&amp;spn=0.019857,0.027466&amp;iwloc=A" style="color:#0000FF;text-align:left" mce_style="color:#0000FF;text-align:left">View Larger Map</a></small></p>\r\n<p><u><b>Accommodation</b></u></p>\r\n<p>Participants attending Technix 5.0 have the option of staying at the GTDC Farmagudi Hill Retreat at a special discounted rate. Participants arriving in groups will be offered higher discounts on accomodation. However, accomodation at the Farmagudi Hill Retreat is limited, and will be filled on First Come, First Serve basis. For more information, contact hospitality@gectechnix.in</p>\r\n<p><u><b>Sight Seeing</b></u></p>\r\n<p>Ponda, the cultural capital of Goa, is a stones throw away from Farmagudi. Ancient temples like Ramnathi and Shantadurga are definitely worth seeing in Ponda. Die-hard wildlife enthusiasts need look no further than the Bondla Wildlife Sanctuary, located on the outskirts of Ponda. The multiple Spice plantations within Ponda are also worth visiting.</p>\r\n<p><br /></p>', '', 1, 0, 0, 0, '2011-05-08 09:08:20', 62, '', '2011-06-17 13:22:12', 62, 0, '0000-00-00 00:00:00', '2011-05-08 09:08:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 11, 0, 9, '', '', 0, 603, 'robots=\nauthor='),
(10, 'Sponsors', 'sponsors', '', '<p>Technix 5.0 promises to be the largest technical festival organised by any Goan college, both in terms of prizes and participation. And it is our honour to mention the names of the  people/companies who have sponsored the event, and provided us with  their undying support.</p>\r\n<p style="text-align: center;"><strong>Co-Sponsor</strong></p>\r\n<p style="text-align: center;"><a href="http://www.persistentsys.com/" target="_blank" title="Persistent Systems"><strong><img src="images/sponsors/pspl.jpg" border="0" alt="Persistent Systems" width="247" height="201" style="vertical-align: middle;" /></strong></a></p>\r\n<p style="text-align: center;"><strong><img src="images/sponsors/ns.jpg" border="0" alt="Mrs. Nirmala Samant" width="247" height="201" style="vertical-align: middle;" /></strong></p>\r\n<p style="text-align: center;"><strong>Associate Sponsor</strong></p>\r\n<p style="text-align: center;"><strong><a href="http://www.sesagoa.com" target="_blank" title="SESA"><img src="images/sponsors/sesa.jpg" border="0" alt="SESA" width="223" height="50" style="vertical-align: middle;" /></a><br /></strong></p>\r\n<p style="text-align: center;"><strong><br /></strong></p>\r\n<p style="text-align: center;"><strong>Event Partner</strong></p>\r\n<p style="text-align: center;"><strong><a href="http://www.gigabyte.in/" target="_blank" title="Gigabyte"><img src="images/sponsors/gigabyte.jpg" border="0" alt="Gigabyte" width="217" height="28" style="vertical-align: middle;" /></a><br /></strong></p>\r\n<p style="text-align: center;"><strong><br /></strong></p>\r\n<p style="text-align: center;"><strong>Merchandise Partner:</strong></p>\r\n<p style="text-align: center;"><a href="http://esparsha.com" target="_blank" title="eSparSha"><strong><img src="images/sponsors/esparsha.jpg" border="0" alt="eSparSha" width="135" height="126" /></strong></a></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"><strong>Hospitality Partner</strong></p>\r\n<p style="text-align: center;"><strong><img src="images/sponsors/goatourism.jpg" border="0" alt="Goa Tourism" width="175" height="111" style="vertical-align: middle;" /></strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"><strong>Media Partners:</strong></p>\r\n<p style="text-align: center;"><strong>Television Partner<br /></strong></p>\r\n<p style="text-align: center;"><strong><img src="images/sponsors/prudent.jpg" border="0" alt="Prudent Media" width="113" height="47" style="vertical-align: middle;" /></strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"><strong>Radio Partner</strong></p>\r\n<p style="text-align: center;"><a href="http://www.big927fm.com/" target="_blank" title="BIG 92.7 FM"><img src="images/sponsors/big.jpg" border="0" alt="BIG 92.7 FM" width="160" height="83" style="vertical-align: middle;" /></a></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"><strong>Newsprint Partner</strong></p>\r\n<p style="text-align: center;"><strong><a href="http://www.navhindtimes.in/" target="_blank" title="Navhind Times"><img src="images/sponsors/navhind.jpg" border="0" alt="Navhind Times" width="158" height="61" style="border: 0;" /></a><br /></strong></p>\r\n<p style="text-align: center;"><strong>Online Publicity Partner</strong></p>\r\n<p style="text-align: center;"><strong><a href="http://www.twenty19.com" target="_blank" title="Twenty19"><img src="images/sponsors/twenty19.jpg" border="0" alt="Twenty19" width="162" height="60" style="vertical-align: middle;" /></a><br /></strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"><strong>Workshop Partners</strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"><a href="http://www.ablab.in" target="_blank" title="ABLab"><strong><img src="images/sponsors/ablab.jpg" border="0" alt="ABLab" width="206" height="35" style="vertical-align: middle;" /></strong></a></p>\r\n<p style="text-align: center;"><a href="http://www.yogiki.com/" target="_blank" title="Yogiki Inc."><strong><img src="images/sponsors/yogiki.jpg" border="0" alt="Yogiki Inc." style="vertical-align: middle;" /></strong></a></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;"><strong>Event Partners</strong></p>\r\n<p style="text-align: center;"><a href="http://www.anandboseconstructions.com/" target="_blank" title="Anand Bose Constructions"><strong><img src="images/sponsors/ab.jpg" border="0" alt="Anand Bose Constructions" width="178" height="51" style="vertical-align: middle;" /></strong></a></p>\r\n<p style="text-align: center;"><strong>Mr. Sankalp Amonkar</strong></p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;">We thank each sponsor for the time, resources and moral support they have provided us in the runup to Technix 5.0</p>\r\n<p style="text-align: center;"> </p>', '', 1, 0, 0, 0, '2011-05-08 09:42:11', 62, '', '2011-08-05 05:16:44', 62, 0, '0000-00-00 00:00:00', '2011-05-08 09:42:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 17, 0, 8, '', '', 0, 579, 'robots=\nauthor='),
(11, 'CodeRunner', 'coderunner', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/coderunner.png" border="0" alt="Coderunner" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">He came, He saw, He coded...</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Be it a simple console app, or an OS kernel, C/C++ have  constantly proved to be one of the programmers'' most preferred  programming languages for over 2 decades. </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">And we give C/C++ it''s  deserved dues.</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">CodeRunner, which is a flagship event at Technix, tests participants’<strong> ability to code in C/C++</strong>, both semantically and syntactically. </span></p>', '', 1, 1, 0, 1, '2011-05-13 15:35:19', 62, '', '2011-06-26 12:44:04', 62, 0, '0000-00-00 00:00:00', '2011-05-13 15:35:19', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 21, '', '', 0, 306, 'robots=\nauthor='),
(12, 'Events', 'events', '', '<p>Events at Technix 5.0 are split elementally into the following categories:</p>\r\n<p style="padding-left: 240px;"><a href="agnee" title="Agnee"><strong><img src="images/eventcat/agn.png" border="0" alt="Agnee" style="vertical-align: middle;" /></strong></a></p>\r\n<ul style="padding-left: 240px;">\r\n<li><a href="nfs"><strong>Need For Speed: Most Wanted</strong></a></li>\r\n<li><a href="fifa"><strong>FIFA 2010</strong></a></li>\r\n<li><a href="checkmate"><strong>CheckMate</strong></a></li>\r\n<li><strong><a href="army-of-one" title="Army Of One">Army Of One</a><br /></strong></li>\r\n</ul>\r\n<p style="padding-left: 240px;"> </p>\r\n<p style="padding-left: 240px;"><a href="index.php?option=com_content&amp;view=article&amp;id=26"></a><a href="prithvi" title="Prithvi"><strong><img src="images/eventcat/prt.png" border="0" alt="Prithvi" style="vertical-align: middle;" /></strong></a></p>\r\n<ul style="padding-left: 240px;">\r\n<li><a href="windows-masters"><strong>Windows Masters</strong></a></li>\r\n<li><a href="ascii"><strong>ASCII</strong></a></li>\r\n<li><a href="imagician"><strong>Image-ician</strong></a></li>\r\n<li><a href="coderunner"><strong>CodeRunner</strong></a></li>\r\n</ul>\r\n<p style="padding-left: 240px;"><strong> </strong></p>\r\n<p style="padding-left: 240px;"> </p>\r\n<p style="padding-left: 240px;"><a href="jal" title="Jal"><strong><img src="images/eventcat/jal.png" border="0" alt="Jal" style="vertical-align: middle;" /></strong></a></p>\r\n<ul style="padding-left: 240px;">\r\n<li><a href="unventor"><strong>The Unventor</strong></a></li>\r\n<li><a href="quizdom"><strong>Quizdom</strong></a></li>\r\n<li><a href="literati"><strong>Literati</strong></a></li>\r\n<li><a href="pirates-curse"><strong>Pirates'' Curse</strong></a></li>\r\n</ul>\r\n<p> </p>\r\n<p style="padding-left: 240px;"><strong> </strong></p>\r\n<p style="padding-left: 240px;"><a href="vaayu" title="Vaayu"><strong><img src="images/eventcat/vyu.png" border="0" alt="Vaayu" style="vertical-align: middle;" /></strong></a></p>\r\n<ul style="padding-left: 240px;">\r\n<li><a href="bluffmaster"><strong>Bluffmaster</strong></a></li>\r\n<li><a href="sharpshooter"><strong>Sharpshooter</strong></a></li>\r\n<li><a href="adiction"><strong>Ad-iction</strong></a></li>\r\n<li><a href="klueless"><strong>Klueless</strong></a></li>\r\n</ul>\r\n<p> </p>\r\n<p style="padding-left: 240px;"><a href="antariksha" title="Antariksha"><strong><img src="images/eventcat/atx.png" border="0" alt="Antariksha" style="vertical-align: middle;" /></strong></a></p>\r\n<ul style="padding-left: 240px;">\r\n<li><a href="eureka"><strong>Eureka</strong></a></li>\r\n<li><a href="blogsopedia"><strong>Blogsopedia</strong></a></li>\r\n<li><a href="techczar"><strong>Tech Czar</strong></a></li>\r\n<li><a href="two-face"><strong>Two-Face</strong></a></li>\r\n</ul>\r\n<p style="padding-left: 240px;"><strong> </strong></p>\r\n<p style="padding-left: 240px;"> </p>', '', 1, 0, 0, 0, '2011-05-13 15:47:38', 62, '', '2011-07-17 14:58:05', 62, 62, '2011-07-21 20:31:24', '2011-05-13 15:47:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 39, 0, 7, '', '', 0, 2564, 'robots=\nauthor='),
(13, 'Windows Masters', 'windows-masters', '', '<p><span class="testimonials_title"> <img src="images/eventheader/winmasters.png" border="0" alt="Windows Masters" width="498" height="83" style="vertical-align: baseline;" /></span></p>\r\n<p style="padding-left: 30px;"><span class="testimonials_title">For two decades, Microsoft has  maintained a stronghold over the desktop OS industry, with it''s Windows  series of Operating Systems.<br /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">And despite it''s popularity, very few people actually know how to get the best out of their OS. </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">How well have you <strong>explored the features of your OS</strong>.</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">How broad is your Vista? How XP-rienced  are you? Is 7 your lucky number?<br /> </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Put those skills to work and see if you have what it takes to be a Windows Master! </span></p>', '', 1, 1, 0, 1, '2011-05-13 16:42:43', 62, '', '2011-06-26 12:48:02', 62, 0, '0000-00-00 00:00:00', '2011-05-13 16:42:43', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 20, '', '', 0, 300, 'robots=\nauthor='),
(14, 'Header1', 'header1', '', '<p><img src="images/header/1.png" border="0" alt="Technix 5.0" style="vertical-align: middle;" /></p>', '', 1, 2, 0, 2, '2011-05-13 16:48:51', 62, '', '2011-05-13 16:56:53', 62, 0, '0000-00-00 00:00:00', '2011-05-13 16:48:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(15, 'Header2', 'header2', '', '<p><img src="images/header/2.png" border="0" alt="Technix 5.0" style="vertical-align: middle;" /></p>', '', 1, 2, 0, 2, '2011-05-13 16:49:22', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-13 16:49:22', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(16, 'Header3', 'header3', '', '<p><img src="images/header/3.png" border="0" alt="Technix 5.0" style="vertical-align: middle;" /></p>', '', 1, 2, 0, 2, '2011-05-13 16:49:43', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-13 16:49:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(17, 'Header4', 'header4', '', '<p><img src="images/header/4.png" border="0" alt="Technix 5.0" style="vertical-align: middle;" /></p>', '', 1, 2, 0, 2, '2011-05-13 16:50:09', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-13 16:50:09', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(18, 'Header5', 'header5', '', '<p><img src="images/header/5.png" border="0" alt="Technix 5.0" style="vertical-align: middle;" /></p>', '', 1, 2, 0, 2, '2011-05-13 16:50:35', 62, '', '2011-05-18 04:01:47', 62, 0, '0000-00-00 00:00:00', '2011-05-13 16:50:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(19, 'Workshops', 'workshops', '', '<p>It is said that Technology cannot be explained, but can only be experienced!</p>\r\n<p>And what better way to experience the joys of technology than by  actually getting into a 100% hands-on workshops, and learning the  wonders of computers, guided by some of the finest people from the IT industry. From Adobe Photoshop to Ethical Hacking, from Game development to Artificial Intelligence, workshops at Technix have seen them all, and every year, we explore new dimensions in the field of technology.</p>\r\n<p>And this year shall be no different! Technix 5.0 offers you an opportunity to learn, and and broaden your technical horizons through a series of workshops.</p>\r\n<p>At Technix 5.0, we present hand picked workshops, conducted by the finest trainers in the country to provide you with the edge that you need.</p>\r\n<p><strong><br /></strong></p>\r\n<p style="padding-left: 30px;"><strong>WORKSHOPS AT TECHNIX 5.0</strong></p>\r\n<ul>\r\n<li><a href="arduino-workshop" target="_self" title="Robotics with Arduino">Workshop on Robotics with Arduino</a> (<strong>28-29 July 2011</strong>)</li>\r\n<li><a href="android-workshop" target="_self" title="Android Workshop">Workshop on Android Development</a> (<strong>29-30 July 2011</strong>)</li>\r\n</ul>\r\n<p> </p>\r\n<p>To register, contact:</p>\r\n<p>Ms. Pranali Naik: <strong>+91 9822983697</strong></p>\r\n<p>Mr. Anamay Tengse: <strong>+91 9637386555</strong></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>', '', 1, 0, 0, 0, '2011-05-13 17:34:58', 62, '', '2011-07-13 18:35:34', 62, 0, '0000-00-00 00:00:00', '2011-05-13 17:34:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 6, '', '', 0, 956, 'robots=\nauthor='),
(20, 'Tech Czar', 'techczar', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/techczar.png" border="0" alt="Tech Czar" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Do you think you have what it takes to survive in the industry?</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Are you in touch with the latest trends in the world of computers? </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Answer  the aptitude tests and speak out at the interviews organized by members  of prominent IT companies and find out where you stand. </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Get a feel of  what the industry demands! </span></p>', '', 1, 1, 0, 1, '2011-05-13 20:17:09', 62, '', '2011-06-26 12:43:16', 62, 0, '0000-00-00 00:00:00', '2011-05-13 20:17:09', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 19, '', '', 0, 382, 'robots=\nauthor='),
(21, 'Eureka', 'eureka', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/eureka.png" border="0" alt="Eureka" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Think you have a researchers mindset? Ready to research a topic from A to Z, and present a paper on your findings?<br /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Want  the opinions of industry experts on your presentation abilities?  Present your paper at Technix 5.0 and prove yourself worthy of the top  spot! </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Topics for Eureka:</span></p>\r\n<ul>\r\n<li><strong><span class="testimonials_title">Mobile Computing</span></strong></li>\r\n<li><strong><span class="testimonials_title">Wireless Communication</span></strong></li>\r\n<li><strong><span class="testimonials_title">Cloud Computing</span></strong></li>\r\n<li><strong><span class="testimonials_title">Parallel/Distributed Computing</span></strong></li>\r\n<li><span class="testimonials_title"><strong>The Internet and Society</strong></span></li>\r\n</ul>\r\n<p style="padding-left: 30px;">Papers on other topics will be preliminarily accepted, though preference will be given to papers on the aforementioned topics.</p>\r\n<p style="padding-left: 30px;">Abstract of the paper to be presented must be sent to <a href="mailto:eureka@gectechnix.in" target="_blank" title="Eureka Paper Submission">eureka@gectechnix.in</a></p>\r\n<p style="padding-left: 30px;">Submitted papers MUST comply with <a href="../IEEE.pdf" target="_blank" title="IEEE Format">IEEE standards</a></p>\r\n<p style="padding-left: 30px;">Please go through the <strong><a href="rulebooks/eureka.pdf" target="_blank" title="Eureka Rulebook">complete rulebook for Eureka</a></strong>, and ensure your entry fulfils all the required criteria for participation.</p>\r\n<p style="padding-left: 30px;">Last date for submission of papers is <strong>16th July 2011</strong></p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"><strong>UPDATE: LIST OF <a href="rulebooks/SHORTLISTED.pdf" target="_blank" title="EUREKA shortlisted candidates">SHORTLISTED PAPERS FOR EUREKA</a>. </strong></p>\r\n<p style="padding-left: 30px;"><strong>Congratulations to shortlisted participants<br /></strong></p>\r\n<p> </p>\r\n<p style="padding-left: 30px;">Important Dates:</p>\r\n<ul>\r\n<li>Call For Papers Opens: <strong>4th July 2011</strong></li>\r\n<li>Call For Papers Closes: <span style="text-decoration: line-through;"><strong>Midnight of 14th July 2011</strong></span><strong> </strong><strong>Midnight of 16th July 2011</strong></li>\r\n<li>List of selected papers announced on website:<strong> 17th July 2011</strong></li>\r\n<li>Personal intimation to selected teams through email/phone:<strong> 17-18 July 2011</strong></li>\r\n<li>Final paper presentation:<strong> 29th July 2011</strong></li>\r\n</ul>\r\n<p> </p>\r\n<p style="padding-left: 30px;"> </p>', '', 1, 1, 0, 1, '2011-05-13 20:18:08', 62, '', '2011-07-17 09:33:37', 62, 62, '2011-07-17 09:33:38', '2011-05-13 20:18:08', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 16, 0, 18, '', '', 0, 688, 'robots=\nauthor='),
(22, 'Quizdom', 'quizdom', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/quizdom.png" border="0" alt="Quizdom" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Who? What? Why? Where? How?</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Are these questions that you are always asking? Do you take pride in being a know-it-all?</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Think  you know about the world? Come and prove it to us! </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Take a shot at the  quiz, and pray that you know, or can work out, or guess, the right answer before somebody else beats you to it!<br /></span></p>', '', 1, 1, 0, 1, '2011-05-13 20:18:58', 62, '', '2011-06-26 12:42:03', 62, 0, '0000-00-00 00:00:00', '2011-05-13 20:18:58', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 17, '', '', 0, 390, 'robots=\nauthor='),
(23, 'Ad-iction', 'ad-iction', '', '<p style="text-align: center; padding-left: 30px;"><img src="images/eventheader/adiction.png" border="0" alt="Ad-iction" width="600" height="100" style="vertical-align: baseline;" /></p>\r\n<p style="text-align: left; padding-left: 30px;">They say 90% of all products sell only because of good advertising! Think you can sell an unsellable product?</p>\r\n<p style="text-align: left; padding-left: 30px;">Can you convince a person that the most useless piece of crap is actually a good buy?</p>\r\n<p style="text-align: left; padding-left: 30px;"><strong>Test your advertising skills</strong> at Technix 5.0, and we promise we''ll keep you Ad-icted!</p>', '', 1, 1, 0, 1, '2011-05-13 20:20:07', 62, '', '2011-06-26 12:41:28', 62, 0, '0000-00-00 00:00:00', '2011-05-13 20:20:07', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 16, '', '', 0, 272, 'robots=\nauthor='),
(24, 'Pirates'' Curse', 'pirates-curse', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/pircurse.png" border="0" alt="Pirates'' Curse" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Arrrrrr Mateys.... Capt. Bitbeard  buried his loot somewhere within our computers, just before he suffered a  massive viral attack!</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">His crew claim they don''t know where the Cap''n  hid the chest, so it''s now up to you to <strong>figure out where he buried it</strong>,  and then locate it!</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Will you be a true sea dog, or end up as shark bait? Only time will tell!</span></p>', '', 1, 1, 0, 1, '2011-05-13 20:21:27', 62, '', '2011-06-26 12:40:52', 62, 0, '0000-00-00 00:00:00', '2011-05-13 20:21:27', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 15, '', '', 0, 337, 'robots=\nauthor='),
(25, 'Sharpshooter', 'sharpshooter', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/sharpshooter.png" border="0" alt="Sharpshooter" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">A true photographer possesses a  sharpened capability to observe his environment and the ability to make  that split second decision which tells him whether what he sees is worth  capturing. </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">If you''ve been bitten by the photography bug, Then here’s a chance to showcase your best shots! </span></p>', '', 1, 1, 0, 1, '2011-05-13 20:22:34', 62, '', '2011-06-26 12:40:09', 62, 0, '0000-00-00 00:00:00', '2011-05-13 20:22:34', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 14, '', '', 0, 297, 'robots=\nauthor='),
(26, 'Army Of One', 'army-of-one', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/armyofone.png" border="0" alt="Army Of One" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Actions speak louder than words they say, yet very few people have the perseverance to push that extra mile to get something done. There is only so much you can mentally do, in the end, it all comes down to physical endurance! </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Do you have adventure in your soul? Are you willing to walk the path less travelled?<br /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Then this event is just for you.</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title"><br /> Battle the rains and winds, and complete all the Herculean tasks we throw at you to take the crown. <strong>Are you the Army of One</strong>? </span></p>', '', 1, 1, 0, 1, '2011-05-13 20:23:13', 62, '', '2011-06-26 12:39:24', 62, 0, '0000-00-00 00:00:00', '2011-05-13 20:23:13', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 13, '', '', 0, 297, 'robots=\nauthor='),
(27, 'Agnee', 'agnee', '', '<p><strong> <img src="images/eventcat/agn.png" border="0" alt="Agnee" width="400" height="67" style="float: left;" /></strong></p>\r\n<p style="text-align: left; padding-left: 30px;"> </p>\r\n<p style="text-align: left; padding-left: 30px;"> </p>\r\n<p style="text-align: left; padding-left: 30px;"> </p>\r\n<p style="text-align: left;"><strong>Where aggression is vital, and only the strongest shall survive, that is where Agnee shall blaze</strong></p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;">Think you can take on some of the best gamers in the country? Are you Messi in the virtual world?</p>\r\n<p style="text-align: left;">Think you can withstand tremendous physical and mental pressures just for the sake of upholding pride?</p>\r\n<p style="text-align: left;">Then Agnee is your element.... Blaze On!</p>\r\n<p style="text-align: left;"> </p>\r\n<p style="text-align: left;"><strong>"Fire is the test of Gold; Adversity, of strong men" -Martha Graham<br /></strong></p>', '', 1, 0, 0, 0, '2011-05-13 20:33:26', 62, '', '2011-06-16 00:47:48', 62, 62, '2011-07-14 14:22:43', '2011-05-13 20:33:26', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 15, 0, 15, '', '', 0, 416, 'robots=\nauthor='),
(28, 'Contact Us', 'contact-us', '', '<p style="padding-left: 90px;"><strong>Mr. Navin Pai</strong></p>\r\n<p style="padding-left: 90px;">General Secretary, Team CURSOR</p>\r\n<p style="padding-left: 90px;">+91 8806724128 | <a href="mailto:navin@gectechnix.in" target="_blank">navin@gectechnix.in</a></p>\r\n<p style="padding-left: 90px;"> </p>\r\n<p style="padding-left: 90px;"><strong>Mr. Rohan Hodarkar</strong></p>\r\n<p style="padding-left: 90px;">Treasurer, Team CURSOR</p>\r\n<p style="padding-left: 90px;">+91 9823533069| <a href="mailto:rohan@gectechnix.in" target="_blank">rohan@gectechnix.in</a></p>\r\n<p style="padding-left: 90px;"> </p>\r\n<p style="padding-left: 90px;"><strong>Ms. Sonal Rivonkar</strong></p>\r\n<p style="padding-left: 90px;">Public Relations Head, Team CURSOR</p>\r\n<p style="padding-left: 90px;">+91 9823611450 | <a href="mailto:sonal@gectechnix.in" target="_blank">sonal@gectechnix.in</a></p>\r\n<p style="padding-left: 90px;"> </p>\r\n<p style="padding-left: 90px;">Contact us through Twitter: Tweet to <a href="http://twitter.com/#!/TeamCURSOR" target="_blank">@TeamCURSOR</a> or <a href="http://twitter.com/#!/GECTechnix" target="_blank">@GECTechnix</a></p>\r\n<p style="padding-left: 90px;">Or leave us a comment on <a href="http://www.facebook.com/gectechnix" target="_blank">our Facebook Page</a></p>\r\n<p style="padding-left: 90px;"> </p>\r\n<p style="padding-left: 90px;"> </p>\r\n<p style="padding-left: 90px;"> </p>\r\n<p style="padding-left: 90px;"> </p>\r\n<p style="padding-left: 90px;"> </p>\r\n<p style="padding-left: 90px;"> </p>', '', 1, 0, 0, 0, '2011-05-18 16:04:09', 62, '', '2011-06-28 07:17:42', 62, 0, '0000-00-00 00:00:00', '2011-05-18 16:04:09', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 5, '', '', 0, 462, 'robots=\nauthor='),
(29, 'Two-Face', 'two-face', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/twoface.png" border="0" alt="Two Face" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Given any topic, it''s hard not to have an opinion on it. However, is it possible to have 2 conflicting opinions for the same topic? </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">At Technix 5.0, participants will have to do just that, speaking FOR as well as AGAINST a given topic. </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Think being the Devil''s advocate was tough? Think again...</span></p>\r\n<p style="text-align: left; padding-left: 30px;"> </p>\r\n<p> </p>', '', 1, 1, 0, 1, '2011-05-18 20:06:40', 62, '', '2011-06-26 12:38:46', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:06:40', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 12, '', '', 0, 340, 'robots=\nauthor='),
(30, 'The Unventor', 'unventor', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/unventor.png" border="0" alt="The Unventor" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">If you have a leaky tap to fix, would you go the "<em>normal</em>" (<strong>read: boring</strong>) way and tighten a valve or do you come up with a elaborate solution that involves the usage of dynamite, a Cathode Ray Tube and a can of catfood? Or something even whackier?</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Can you <strong>find a ridiculously stupid solution to a realistic problem</strong> plaguing the world today? </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">If yes, then this is the platform to show off your skills as The Unventor!</span></p>\r\n<p style="text-align: left; padding-left: 30px;"> </p>', '', 1, 1, 0, 1, '2011-05-18 20:10:09', 62, '', '2011-06-26 12:38:14', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:10:09', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 11, '', '', 0, 372, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(31, 'Need For Speed: Most Wanted', 'nfsmw', '', '<p style="text-align: center; padding-left: 30px;"><img src="images/eventheader/nfs.png" border="0" alt="Need For Speed" width="504" height="84" style="vertical-align: baseline;" /></p>\r\n<p style="text-align: left; padding-left: 30px;">"<span class="testimonials_title"><strong>Need For Speed: Most Wanted</strong>"</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">The  mere mention of these five words sends gamers across the globe into a  frenzy! </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">And at Technix 5.0, we give you the opportunity to battle it out  with some of the best gamers in town for the crown of Pro Racer! </span></p>', '', 1, 1, 0, 1, '2011-05-18 20:17:09', 62, '', '2011-06-26 12:51:58', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:17:09', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 10, '', '', 0, 250, 'robots=\nauthor='),
(32, 'FIFA 2010', 'fifa', '', '<p style="text-align: center; padding-left: 30px;"><span class="testimonials_title"><img src="images/eventheader/fifa.png" border="0" alt="FIFA" width="600" height="100" style="vertical-align: baseline;" /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">FIFA 10 is widely regarded as a  revolutionary step in the long running EA series of soccer games. </span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title">Improved ball dynamics, better player control and pitch response, make FIFA 10  an exhilarating experience.</span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title"> <br />Think you can rule the the roost in the online battlefield?<br /></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span class="testimonials_title"> Then FIFA 10 at Technix 5.0 is the event to be at! </span></p>', '', 1, 1, 0, 1, '2011-05-18 20:18:36', 62, '', '2011-06-26 12:37:00', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:18:36', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 9, '', '', 0, 205, 'robots=\nauthor='),
(33, 'Defence Of The Ancients', 'dota', '', '<p style="padding-left: 30px; text-align: center;"><img src="images/eventheader/dota.png" border="0" alt="DoTA" style="vertical-align: baseline;" /></p>\r\n<p style="padding-left: 30px;">World Of Warcraft: Defence Of The Ancients truly is a mouthful to say, but witness anybody immersed in the world of DoTA and he''s bound to appear spellbound.</p>\r\n<p style="padding-left: 30px;">DoTA is not just a game, it''s a lifestyle, and at Technix 5.0, we challenge you to come forth and <strong>showcase your finest skills in the DoTA battlefield</strong>!</p>', '', 1, 1, 0, 1, '2011-05-18 20:19:41', 62, '', '2011-06-26 12:36:19', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:19:41', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 8, '', '', 0, 79, 'robots=\nauthor='),
(34, 'ASCII', 'ascii', '', '<p style="padding-left: 30px; text-align: center;"><img src="images/eventheader/ascii.png" border="0" alt="ASCII" style="vertical-align: baseline;" /></p>\r\n<p style="padding-left: 30px;">Ever tried using your computer without a mouse? Ever wondered if it''s possible to use a word processing software without a keyboard?</p>\r\n<p style="padding-left: 30px;">If you have, then ASCII is the event to be at for you!</p>', '', 1, 1, 0, 1, '2011-05-18 20:20:58', 62, '', '2011-06-26 12:35:47', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:20:58', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 7, '', '', 0, 289, 'robots=\nauthor='),
(35, 'CheckMate', 'checkmate', '', '<p style="padding-left: 30px; text-align: center;"><img src="images/eventheader/checkmate.png" border="0" alt="Check-mate" width="600" height="100" style="vertical-align: baseline;" /></p>\r\n<p style="padding-left: 30px;">So you spent whole life learning to play Chess eh? Think you''re a regular Kasparov or Anand by now?</p>\r\n<p style="padding-left: 30px;">Well, let''s change the rules shall we? Antichess is a variant of chess in which a <strong>player wins by losing all his pieces</strong>.</p>\r\n<p style="padding-left: 30px;">So, think you''re the expert in Kamikaze? Then this is the event for you to kill yourself at!</p>', '', 1, 1, 0, 1, '2011-05-18 20:21:32', 62, '', '2011-06-26 12:35:15', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:21:32', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 6, '', '', 0, 274, 'robots=\nauthor='),
(36, 'Bluffmaster', 'bluffmaster', '', '<p style="padding-left: 30px; text-align: center;"><strong><img src="images/eventheader/bluffmaster.png" border="0" alt="Bluffmaster" width="600" height="100" style="vertical-align: baseline;" /></strong></p>\r\n<p style="padding-left: 30px;"><strong>The Greatest trick the devil ever pulled was convincing the world that he doesn''t exist!</strong></p>\r\n<p style="padding-left: 30px;">Satyameva Jayate can go down the drain at Technix 5.0. Go ahead and lie to the fullest... Convince everyone of your innocence! Play the blame game, attack your opponents, and try to stand your ground as you try to prove that you are the Bluffmaster!</p>\r\n<p style="padding-left: 30px;"><strong>Lie. Cheat.  Win<br /></strong></p>\r\n<p style="padding-left: 30px;"> </p>', '', 1, 1, 0, 1, '2011-05-18 20:22:25', 62, '', '2011-06-26 12:34:31', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:22:25', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 5, '', '', 0, 294, 'robots=\nauthor='),
(37, 'Blogsopedia', 'blogsopedia', '', '<p style="padding-left: 30px; text-align: center;"><img src="images/eventheader/blogsopedia.png" border="0" alt="Blogsopedia" width="600" height="100" style="vertical-align: baseline;" /></p>\r\n<p style="padding-left: 30px;">They say a pen is mightier than a sword, but the keyboard is the weapon that we choose to use!</p>\r\n<p style="padding-left: 30px;">A blog is a way of communication with the world, a medium for transfer of information as well as a sneekpeek into another persons mind!</p>\r\n<p style="padding-left: 30px;">At Technix 5.0, we want to see how good you are at putting forward your ideas through the blogging medium!</p>\r\n<p style="padding-left: 30px;">Think you have it in you to <strong>maintain a full-fledged blog</strong>? Well, then this is the event for you!</p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"> </p>', '', 1, 1, 0, 1, '2011-05-18 20:23:03', 62, '', '2011-06-26 12:32:49', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:23:03', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 4, '', '', 0, 314, 'robots=\nauthor='),
(38, 'Image-ician', 'imagician', '', '<p style="padding-left: 30px; text-align: center;"><img src="images/eventheader/imagician.png" border="0" alt="Image-ician" width="600" height="100" style="vertical-align: baseline;" /></p>\r\n<p style="padding-left: 30px;">Adobe Photoshop is not just a image editing software... It is considered by many to be the single most important software since the internet browser!</p>\r\n<p style="padding-left: 30px;">Working in Photoshop is nothing short of working with magic. The vast array of tools, settings and options can be a godsend when used correctly, but can just as easily backfire badly under other circumstances!</p>\r\n<p style="padding-left: 30px;">Think you <strong>know how to use Adobe Photoshop</strong>? Why don''t you come prove to us that you truly are an Image-ician!</p>', '', 1, 1, 0, 1, '2011-05-18 20:24:20', 62, '', '2011-06-26 12:32:10', 62, 62, '2011-07-21 20:20:00', '2011-05-18 20:24:20', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 3, '', '', 0, 281, 'robots=\nauthor='),
(39, 'Klueless', 'klueless', '', '<p style="padding-left: 30px; text-align: center;"><img src="images/eventheader/klueless.png" border="0" alt="Klueless" width="600" height="100" style="vertical-align: middle;" /></p>\r\n<p style="padding-left: 30px;">An event exclusively for Engicos! Think you know your campus well enough? Think you can find your way from the ''<em>prison of knowledge</em>'' to the place where <em>''one fell down</em>''?</p>\r\n<p style="padding-left: 30px;">With over 200 acres to explore, how much have you actually seen?</p>\r\n<p style="padding-left: 30px;">This Technix 5.0, we''ll show you the <strong>best way to explore the campus</strong>, through Klueless, a campus-wide treasure hunt!</p>', '', 1, 1, 0, 1, '2011-05-18 20:36:49', 62, '', '2011-07-01 18:00:46', 62, 0, '0000-00-00 00:00:00', '2011-05-18 20:36:49', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=0\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 2, '', '', 0, 275, 'robots=\nauthor='),
(40, 'Nostalgia', 'nostalgia', '', '<p>A Recap of Technix 4.0, held in July 2010</p>\r\n<p>{artsexylightbox path="images/nostalgia"<strong> previewWidth="100" previewHeight="100"</strong>/}</p>', '', 1, 0, 0, 0, '2011-06-15 23:27:11', 62, '', '2011-06-15 23:32:44', 62, 0, '0000-00-00 00:00:00', '2011-06-15 23:27:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 4, '', '', 0, 578, 'robots=\nauthor='),
(41, 'Error 404', 'error-404', '', '<p style="text-align: center;"><strong>Sorry</strong>, The page you were looking for cannot be found!</p>\r\n<p style="text-align: center;">Perhaps you''re followed a non-existent link!</p>\r\n<p style="text-align: center;"> </p>\r\n<p style="text-align: center;">Would you just like to get back to the <a href="../" target="_self" title="Home Page">Home Page</a>?</p>', '', 1, 0, 0, 0, '2011-06-17 18:14:19', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-06-17 18:14:19', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 115, 'robots=\nauthor='),
(42, '1', '404-1', '', '<p style="text-align: center;"><img src="images/404/1.jpg" border="0" alt="404 Error" style="vertical-align: middle;" /></p>', '', 1, 3, 0, 3, '2011-06-17 18:42:53', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-06-17 18:42:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(43, '2', '404-2', '', '<p style="text-align: center;"><img src="images/404/2.jpg" border="0" alt="404 Error" style="vertical-align: middle;" /></p>', '', 1, 3, 0, 3, '2011-06-17 19:09:24', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-06-17 19:09:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(44, '3', '404-3', '', '<p style="text-align: center;"><img src="images/404/3.jpg" border="0" alt="404 Error" style="vertical-align: middle;" /></p>', '', 1, 3, 0, 3, '2011-06-17 20:01:49', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-06-17 20:01:49', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(45, '4', '404-4', '', '<p style="text-align: center;"><img src="images/404/4.jpg" border="0" alt="404 Error" style="vertical-align: middle;" /></p>', '', 1, 3, 0, 3, '2011-06-17 20:02:37', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-06-17 20:02:37', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(46, '5', '404-5', '', '<p style="text-align: center;"><img src="images/404/5.jpg" border="0" alt="404 Error" style="vertical-align: middle;" /></p>', '', 1, 3, 0, 3, '2011-06-17 20:04:15', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-06-17 20:04:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(47, 'Android Development', 'android', '', '<p><strong>Android</strong> is an open-source software stack for mobile devices that includes an                  operating system, middleware and key applications. Google Inc. purchased the                  initial developer of the software, Android Inc., in 2005. Android''s mobile                  operating system is based upon a modified version of the Linux kernel. Google                  and other members of the Open Handset Alliance collaborated on Android''s                  development and release.</p>\r\n<p>According to statistics, <strong>180 million</strong> new Android phones are activated <strong>every year</strong>, and this makes Android development an integral tool for any engineer.</p>\r\n<p>Android has a large community of developers writing apps that extend the functionality of the devices. There are currently over          150,000 apps available for Android. Come join us at Technix 5.0, to unravel the mysteries behind the elusive droid!</p>\r\n<p> </p>\r\n<div style="-moz-border-radius: 15px; border-radius: 15px; outline: 2px solid #;         outline-offset: 10px; border: solid 2px black; padding: 10px;">\r\n<p>Workshop Details:</p>\r\n<p>Duration: <strong>29-30 July 2011</strong> (2 days)</p>\r\n<p>Trainers: <strong><a href="http://www.ablab.in/web/index.php" target="_blank" title="ABlab solution">ABlab Solutions</a></strong>, <strong>Bhubaneshwar</strong></p>\r\n<p>Fees: <strong>Students of Goa Engg. College</strong>: <strong>Rs. 500 /-</strong></p>\r\n<p style="padding-left: 30px;"><strong> Students of Other Colleges</strong>: <strong>Rs. 1000 /-</strong></p>\r\n<p>Other Details:</p>\r\n<ul>\r\n<li>Workshop registration will be on a first come, first serve basis</li>\r\n<li>Students from any branch can attend the workshop. All participants are requested                  to bring their laptops to derive maximum benefit from the workshop. </li>\r\n<li>At the end of the workshop, the candidates will receive <strong>Certification of Participation</strong> along with <strong>Toolkit</strong> containing <strong>app development software</strong>, and <strong>Course Material</strong>.</li>\r\n<li>Accommodation can be arranged for outstation participants (on first come, first server basis). For details, see our <a href="hospitality" target="_self" title="Hospitality"><strong>hospitality</strong> page</a></li>\r\n</ul>\r\n</div>\r\n<p> </p>\r\n<p>To register, contact:</p>\r\n<p>Ms. Pranali Naik: <strong>+91 9822983697</strong></p>\r\n<p>Mr. Anamay Tengse: <strong>+91 9637386555</strong></p>\r\n<p> </p>', '', 1, 0, 0, 0, '2011-07-13 17:21:52', 62, '', '2011-07-13 18:37:07', 62, 62, '2011-07-13 18:59:08', '2011-07-13 17:21:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 2, '', '', 0, 285, 'robots=\nauthor='),
(48, 'Robotics with Arduino', 'arduino', '', '<p><strong><a href="http://arduino.cc/en/" target="_blank" title="Arduino">Arduino</a></strong> is an open-source electronics prototyping platform based on flexible, easy-to-use hardware and software. It''s intended for artists, designers, hobbyists, and anyone interested in creating interactive objects or environments.</p>\r\n<p>Arduino can sense the environment by receiving input from a variety of sensors and can affect its surroundings by controlling lights, motors, and other actuators. The microcontroller on the board is programmed using the <strong>Arduino programming language</strong> and the <strong>Arduino development environment</strong>. Arduino projects can be stand-alone or they can communicate with software running on a computer (e.g. Flash, Processing, MaxMSP).</p>\r\n<p>The power of Arduino lies in it''s simplicity, and it''s extendability, and the ease of it''s usage in interdisciplinary projects. For a sneek peak at the variations of Arduino, see <strong><a href="http://hacknmod.com/hack/top-40-arduino-projects-of-the-web/" target="_blank" title="Arduino Projects">Top 40 Arduino projects</a></strong>.</p>\r\n<p>It is only befitting that at Technix 5.0, we unleash the power of Arduino!</p>\r\n<p> </p>\r\n<div style="-moz-border-radius: 15px; border-radius: 15px; outline: 2px solid #;         outline-offset: 10px; border: solid 2px black; padding: 10px;">\r\n<p>Workshop Details:</p>\r\n<p>Duration: <strong>28-29 July 2011</strong> (2 days)</p>\r\n<p>Trainers: <strong><a href="http://www.yogiki.com/" target="_blank" title="Yogiki Inc.">Yogiki Inc.</a>, Chennai</strong><strong> </strong></p>\r\n<p>Fees: <strong>Students of Goa Engg. College</strong>: <strong>Rs. 2000 /- </strong>(For a <strong>Team of 4</strong>)<strong><br /></strong></p>\r\n<p style="padding-left: 30px;"><strong> Students of Other Colleges</strong>: <strong>Rs. 4000 /-</strong> (For a <strong>Team of 4</strong>)</p>\r\n<p>Other Details:</p>\r\n<ul>\r\n<li>Workshop registration will be on a first come, first serve basis</li>\r\n<li>Students from any branch can attend the workshop. </li>\r\n<li>Workshop will contain a take-away kit which will consist of the following parts:   \r\n<ul>\r\n<li>Arduino Board</li>\r\n<li>CNC cut acrylic chassis</li>\r\n<li>Two DC motors</li>\r\n<li>Two nylon wheels</li>\r\n<li>One castor wheel</li>\r\n<li>USB Burner</li>\r\n<li>Motor Driver</li>\r\n<li>Adaptor</li>\r\n<li>Batteries</li>\r\n<li>Basic Tools</li>\r\n<li>Manual and CD</li>\r\n<li>Workshop Participation Certificate</li>\r\n</ul>\r\n</li>\r\n<li>Accommodation can be arranged for outstation participants (on first come, first server basis). For details, see our <a href="hospitality" target="_self" title="Hospitality"><strong>hospitality</strong> page</a></li>\r\n</ul>\r\n</div>\r\n<p> </p>\r\n<p>To register, contact:</p>\r\n<p>Ms. Pranali Naik: <strong>+91 9822983697</strong></p>\r\n<p>Mr. Anamay Tengse: <strong>+91 9637386555</strong></p>\r\n<p> </p>', '', 1, 0, 0, 0, '2011-07-13 17:55:12', 62, '', '2011-07-13 18:38:11', 62, 0, '0000-00-00 00:00:00', '2011-07-13 17:55:12', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 1, '', '', 0, 318, 'robots=\nauthor='),
(49, 'Literati', 'literati', '', '<p style="padding-left: 30px; text-align: center;"><span class="testimonials_title"><img src="images/eventheader/literati.png" border="0" alt="Literati" width="600" height="100" style="vertical-align: middle;" /></span></p>\r\n<p style="padding-left: 30px;"><span class="testimonials_title">The English language is full of rules, exceptions to the rules, idiosyncrasies, and plain weirdness. Think your grasp of the language matches that of Shakespeare or Tolstoy? </span></p>\r\n<p style="padding-left: 30px;"><span class="testimonials_title">Whether you call it a word scramble, a  word jumble, an anagram or just mixed-up words, you''re sure to have fun  trying to untangle the letters in these challenging word puzzles… </span></p>\r\n<p style="padding-left: 30px;"><span class="testimonials_title">This  classic event is surely going to deliver tonnes of brain teasing fun! </span></p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"> </p>\r\n<p style="padding-left: 30px;"><span class="testimonials_title"><br /></span></p>', '', 1, 1, 0, 1, '2011-07-17 13:49:18', 62, '', '2011-07-17 17:11:20', 62, 62, '2011-07-17 17:11:20', '2011-07-17 13:49:18', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 1, '', '', 0, 178, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(1, 1),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=Ultim8_InferNix.png\nsecure=0\n\n', 0, 0, 0),
(2, 'topmenu', 'Agnee', 'agni', 'index.php?option=com_content&view=article&id=1', 'component', -2, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(3, 'topmenu', 'Prithvi', 'prithvi', 'index.php?option=com_content&view=article&id=2', 'component', -2, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(4, 'mainmenu', 'Test', 'tete', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(5, 'Elements', 'Agnee', 'agnee', 'index.php?option=com_content&view=article&id=27', 'component', -2, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(6, 'Elements', 'Antariksha', 'antariksha', 'index.php?option=com_content&view=article&id=7', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(7, 'Elements', 'Prithvi', 'prithvi', 'index.php?option=com_content&view=article&id=4', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=Ultim8_RokNix.png\nsecure=0\n\n', 0, 0, 0),
(8, 'Elements', 'Vaayu', 'vaayu', 'index.php?option=com_content&view=article&id=5', 'component', 1, 0, 20, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=Ultim8_GaleNix.png\nsecure=0\n\n', 0, 0, 0),
(9, 'Elements', 'Jal', 'jal', 'index.php?option=com_content&view=article&id=6', 'component', 1, 0, 20, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=Ultim8_HydraNix.png\nsecure=0\n\n', 0, 0, 0),
(10, 'topmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(11, 'topmenu', 'Events', 'events', 'index.php?option=com_content&view=article&id=12', 'component', 1, 0, 20, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(12, 'topmenu', 'Workshops', 'workshops', 'index.php?option=com_content&view=article&id=19', 'component', 1, 0, 20, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(13, 'topmenu', 'Hospitality', 'hospitality', 'index.php?option=com_content&view=article&id=9', 'component', 1, 0, 20, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(14, 'topmenu', 'Nostalgia', 'nostalgia', 'index.php?option=com_content&view=article&id=40', 'component', 1, 0, 20, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(15, 'topmenu', 'Us', 'about-us', '', 'separator', 1, 0, 0, 0, 10, 62, '2011-05-18 16:03:48', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(16, 'topmenu', 'Contact', 'contact', 'index.php?option=com_content&view=article&id=28', 'component', 1, 15, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(17, 'topmenu', 'Sponsors', 'sponsors', 'index.php?option=com_content&view=article&id=10', 'component', 1, 0, 20, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(18, 'topmenu', 'Nostalgia', 'nostalgia2', '', 'separator', -2, 0, 0, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(19, 'mainmenu', 'Sponsors', 'sponsors2', 'index.php?option=com_content&view=article&id=10', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(20, 'Elements', 'Agnee', 'agnee', 'index.php?option=com_content&view=article&id=27', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(21, 'Agneemenu', 'NFS : MW', 'nfs', 'index.php?option=com_content&view=article&id=31', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(22, 'Agneemenu', 'FIFA', 'fifa', 'index.php?option=com_content&view=article&id=32', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(23, 'topmenu', 'Prithvi', 'prithvi', 'index.php?option=com_content&view=article&id=4', 'component', 0, 11, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(24, 'Agneemenu', 'CheckMate', 'checkmate', 'index.php?option=com_content&view=article&id=35', 'component', 1, 0, 20, 0, 3, 62, '2011-07-17 14:36:27', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(25, 'Agneemenu', 'Army Of One', 'army-of-one', 'index.php?option=com_content&view=article&id=26', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(26, 'prithvimenu', 'Windows Masters', 'windows-masters', 'index.php?option=com_content&view=article&id=13', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(27, 'prithvimenu', 'ASCII', 'ascii', 'index.php?option=com_content&view=article&id=34', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(28, 'prithvimenu', 'Image-ician', 'imagician', 'index.php?option=com_content&view=article&id=38', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(29, 'prithvimenu', 'CodeRunner', 'coderunner', 'index.php?option=com_content&view=article&id=11', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(30, 'jalevents', 'The Unventor', 'unventor', 'index.php?option=com_content&view=article&id=30', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(31, 'jalevents', 'Quizdom', 'quizdom', 'index.php?option=com_content&view=article&id=22', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(32, 'jalevents', 'Literati', 'literati', 'index.php?option=com_content&view=article&id=49', 'component', 1, 0, 20, 0, 3, 62, '2011-07-17 17:11:04', 0, 0, 0, 0, 'show_noauth=0\nshow_title=0\nlink_titles=0\nshow_intro=0\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(33, 'jalevents', 'Pirates'' Curse', 'pirates-curse', 'index.php?option=com_content&view=article&id=24', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(34, 'vaayuevents', 'Bluffmaster', 'bluffmaster', 'index.php?option=com_content&view=article&id=36', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(35, 'vaayuevents', 'Sharpshooter', 'sharpshooter', 'index.php?option=com_content&view=article&id=25', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(36, 'vaayuevents', 'Ad-iction', 'adiction', 'index.php?option=com_content&view=article&id=23', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(37, 'vaayuevents', 'Klueless', 'klueless', 'index.php?option=com_content&view=article&id=39', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(38, 'antarikshaevents', 'Eureka', 'eureka', 'index.php?option=com_content&view=article&id=21', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(39, 'antarikshaevents', 'Blogsopedia', 'blogsopedia', 'index.php?option=com_content&view=article&id=37', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(40, 'antarikshaevents', 'Tech Czar', 'techczar', 'index.php?option=com_content&view=article&id=20', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(41, 'antarikshaevents', 'Two Face', 'two-face', 'index.php?option=com_content&view=article&id=29', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(42, 'mainmenu', 'Error 404', 'error-404', 'index.php?option=com_content&view=article&id=41', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=0\nlink_titles=0\nshow_intro=0\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(43, 'Workshops', 'Arduino Robotics', 'arduino-workshop', 'index.php?option=com_content&view=article&id=48', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=1\nshow_title=1\nlink_titles=0\nshow_intro=0\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(44, 'Workshops', 'Android Workshop', 'android-workshop', 'index.php?option=com_content&view=article&id=47', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(45, 'Elements', 'Arduino Robotics', 'arduino', 'index.php?option=com_content&view=article&id=48', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'topmenu', 'topmenu', 'Top Menu'),
(3, 'Elements', 'elements', 'Elements'),
(4, 'Agneemenu', 'Agnee Events', 'agneemenu'),
(5, 'prithvimenu', 'Prithvi Events', 'prithvi'),
(6, 'jalevents', 'Jal Events', 'jalevents'),
(7, 'vaayuevents', 'Vaayu Events', 'Vaayu Events'),
(8, 'antarikshaevents', 'Antariksha Events', 'antarikshaevents'),
(9, 'Workshops', 'workshops', 'workshops');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Manu', '', 0, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=mainmenu\nmenu_style=list_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=1\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'topmenu', '', 0, 'menu', 62, '2011-05-18 20:01:29', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=topmenu\nmenu_style=list\nstartLevel=0\nendLevel=3\nshowAllChildren=1\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=1\nactivate_parent=1\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(17, 'elements', '', 1, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 1, 0, 'menutype=Elements\nmenu_style=horiz_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=1\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(19, 'Sliding Image Links', '', 0, 'contenttop', 62, '2011-06-17 10:21:10', 1, 'mod_sliding_image_links', 0, 0, 0, 'height=189\nopen_width=300\nclose_width=100\npanel_image_path1=images/stories/soon/1.png\npanel_url1=agnee\npanel_image_path2=images/stories/soon/2.png\npanel_url2=antariksha\npanel_image_path3=images/stories/soon/3.png\npanel_url3=prithvi\npanel_image_path4=images/stories/soon/4.png\npanel_url4=jal\npanel_image_path5=images/stories/soon/5.png\npanel_url5=vaayu\npanel_image_path6=\npanel_url6=\npanel_image_path7=\npanel_url7=\npanel_image_path8=\npanel_url8=\nmoduleclass_sfx=\n\n', 0, 0, ''),
(20, 'Footer', '', 1, 'footer', 0, '0000-00-00 00:00:00', 0, 'mod_footer', 0, 0, 1, 'cache=1\n\n', 0, 0, ''),
(27, 'YOOcarousel', '', 0, 'topblock', 62, '2011-05-18 04:02:03', 1, 'mod_yoo_carousel', 0, 0, 0, 'catid=2\nstyle=slideshow\nmodule_width=800\nmodule_height=250\ntab_width=0\nautoplay=on\nslide_interval=7000\ntransition_duration=1000\ntransition_effect=crossfade\ncontrol_panel=right\nrotate_action=click\nrotate_duration=1000\nrotate_effect=crossfade\nbuttons=1\norder=o_asc\nreadmore=0\nitems=5\nmoduleclass_sfx=-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(30, 'YOOaccordion', '', 0, 'contentbottom', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_accordion', 0, 0, 0, 'catid=1\nstyle=default\nopen=first\nmultiple_open=0\norder=o_asc\nreadmore=0\nitems=4\nmoduleclass_sfx=-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(31, 'Prithvi Events', '', 6, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=prithvimenu\nmenu_style=list\nstartLevel=0\nendLevel=3\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(29, 'Agnee Events', '', 7, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=Agneemenu\nmenu_style=list\nstartLevel=0\nendLevel=3\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(32, 'Jal Events', '', 5, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=jalevents\nmenu_style=list\nstartLevel=0\nendLevel=3\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(33, 'Vaayu Events', '', 4, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=vaayuevents\nmenu_style=list\nstartLevel=0\nendLevel=3\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(34, 'Antariksha Events', '', 2, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=antarikshaevents\nmenu_style=list\nstartLevel=0\nendLevel=3\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(36, '404', '', 0, 'breadcrumbs', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_carousel', 0, 0, 0, 'catid=3\nstyle=slideshow\nmodule_width=500\nmodule_height=300\ntab_width=200\nautoplay=on\nslide_interval=5000\ntransition_duration=700\ntransition_effect=fade\ncontrol_panel=top\nrotate_action=click\nrotate_duration=200\nrotate_effect=fade\nbuttons=1\norder=rnd\nreadmore=0\nitems=5\nmoduleclass_sfx=-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(38, 'Workshops', '', 3, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=Workshops\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 11),
(16, 0),
(17, 11),
(19, 1),
(19, 10),
(20, 0),
(27, 0),
(29, 20),
(29, 21),
(29, 22),
(29, 24),
(29, 25),
(30, 11),
(31, 7),
(31, 26),
(31, 27),
(31, 28),
(31, 29),
(32, 9),
(32, 30),
(32, 31),
(32, 32),
(32, 33),
(33, 8),
(33, 34),
(33, 35),
(33, 36),
(33, 37),
(34, 6),
(34, 38),
(34, 39),
(34, 40),
(34, 41),
(36, 42),
(38, 12),
(38, 43),
(38, 44);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\nblockquote=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', 'mode=wysiwyg\nwrap=0\n\n'),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 8, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'Content - Sliding Image Links', 'slidingimagelinks', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(36, 'Art Sexy Lightbox', 'artsexylightbox', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'color=black\nshowDuration=200\ncloseDuration=400\nmoveDuration=800\nresizeDuration=800\npreviewWidth=200\npreviewHeight=\nflickrApiKey=\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(1, 'Events', '', 'events', '', 'content', 'left', '<p>Events</p>', 1, 0, '0000-00-00 00:00:00', 1, 0, 1, ''),
(2, 'Header', '', 'header', '', 'content', 'left', '<p>header</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 1, ''),
(3, '404', '', 'error-404', '', 'content', 'left', '<p>404 images</p>', 1, 0, '0000-00-00 00:00:00', 3, 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1323290262', '6h22j1to4uudusaingjodc12k7', 1, 0, '', 0, 0, '__default|a:7:{s:15:"session.counter";i:2;s:19:"session.timer.start";i:1323290025;s:18:"session.timer.last";i:1323290025;s:17:"session.timer.now";i:1323290262;s:22:"session.client.browser";s:70:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:68:"C:\\xampp\\htdocs\\Technix\\main\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}}'),
('', '1323289846', 'j1r40ato97kikj64a90lh2h417', 1, 0, '', 0, 0, '__default|a:7:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1323289846;s:18:"session.timer.last";i:1323289846;s:17:"session.timer.now";i:1323289846;s:22:"session.client.browser";s:70:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:68:"C:\\xampp\\htdocs\\Technix\\main\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}}'),
('', '1323289848', 'jqhofsl2rm369g83ot9ljdhp10', 1, 0, '', 0, 0, '__default|a:7:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1323289848;s:18:"session.timer.last";i:1323289848;s:17:"session.timer.now";i:1323289848;s:22:"session.client.browser";s:70:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:68:"C:\\xampp\\htdocs\\Technix\\main\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}}'),
('', '1323290281', 'srjnhmg3i1fl0ru648mkfj82v3', 1, 0, '', 0, 1, '__default|a:8:{s:15:"session.counter";i:2;s:19:"session.timer.start";i:1323290271;s:18:"session.timer.last";i:1323290271;s:17:"session.timer.now";i:1323290276;s:22:"session.client.browser";s:70:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:68:"C:\\xampp\\htdocs\\technix\\main\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"eb539882b4100c625f3f1cd38ee00518";}'),
('admin', '1323290307', 'rnim6d6f68ter9b2pavb8frj51', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:8;s:19:"session.timer.start";i:1323290271;s:18:"session.timer.last";i:1323290306;s:17:"session.timer.now";i:1323290307;s:22:"session.client.browser";s:70:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:3:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:10:"com_cpanel";a:1:{s:4:"data";O:8:"stdClass":1:{s:9:"mtupgrade";O:8:"stdClass":1:{s:7:"checked";b:1;}}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":25:{s:2:"id";i:62;s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:19:"admin@gectechnix.in";s:8:"password";s:65:"48199584112ca79cf428fe3034f42dfa:76IjNcVy7qnW0h0MCqe0lqOA5oJSV8Ze";s:14:"password_clear";s:5:"admin";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2011-01-29 20:05:35";s:13:"lastvisitDate";s:19:"2011-12-07 20:38:02";s:10:"activation";s:0:"";s:6:"params";s:75:"admin_language=en-GB\nlanguage=en-GB\neditor=tinymce\nhelpsite=\ntimezone=5.5\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:68:"C:\\xampp\\htdocs\\technix\\main\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:5:"en-GB";s:8:"language";s:5:"en-GB";s:6:"editor";s:7:"tinymce";s:8:"helpsite";s:0:"";s:8:"timezone";s:3:"5.5";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}s:9:"password2";s:5:"admin";s:3:"cid";a:1:{i:0;s:2:"62";}s:6:"option";s:9:"com_users";s:4:"task";s:4:"save";s:10:"contact_id";s:0:"";s:32:"e381a9ceae77f7925cb67a90bdcebda0";s:1:"1";}s:13:"session.token";s:32:"eb539882b4100c625f3f1cd38ee00518";}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('technix', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'admin@gectechnix.in', '48199584112ca79cf428fe3034f42dfa:76IjNcVy7qnW0h0MCqe0lqOA5oJSV8Ze', 'Super Administrator', 0, 1, 25, '2011-01-29 20:05:35', '2011-12-07 20:38:02', '', 'admin_language=en-GB\nlanguage=en-GB\neditor=tinymce\nhelpsite=\ntimezone=5.5\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
