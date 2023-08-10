-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB-1:10.4.28+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vduorihkjyyzempkrcfbcxoysjoicmvrekzh` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_viujtytmrtcufxuvzuanjtuvbzrkhoqtltja` (`dateRead`),
  KEY `fk_aezawohziipehugavzretvukypcfdkfcxyko` (`pluginId`),
  CONSTRAINT `fk_aezawohziipehugavzretvukypcfdkfcxyko` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_azsvsegorzxbgvjiuyiqvtejarskxiaxmfre` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bhlffbnjimvbwxijfisjaqvpcavlcsjcobks` (`sessionId`,`volumeId`),
  KEY `idx_bukaxpeyjxynvjzczbsvbnesbraoaiwslflo` (`volumeId`),
  CONSTRAINT `fk_zktwxiqvavgfimslzkhzvivrgsdqtrgfhkil` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_akdtllqawctlwvipgregbgasopttsvaebnoe` (`filename`,`folderId`),
  KEY `idx_tcjmekuekxkigxdsdmsgldnyauzwyragqrcl` (`folderId`),
  KEY `idx_zsuljebjbgbcozzvbfzsqccaivgqqisoorsk` (`volumeId`),
  KEY `fk_lryhukqntnfnjmmmumgctwunckcobelwbkcz` (`uploaderId`),
  CONSTRAINT `fk_ilmgnpdzzqhyzkxbylnyfpwjfmaabegiywmn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lryhukqntnfnjmmmumgctwunckcobelwbkcz` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ubnbuvrlrnnhvhtpptszycoouuirnameyeeb` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vdfvnnexdwxjedrprjwgvgcbbiwvcfenmolq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wquwqtcmbmfwxuduwtrewtqhzzssrdvndqjs` (`volumeId`,`assetId`,`location`),
  KEY `idx_scrpurtdpliqhvyalkvxjwrrdbvaausoqywl` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pixtxcojyxunktccpqijhymmdbynrfahowvx` (`name`),
  KEY `idx_dzwqikzkrbzalxixmikakggofzhhlnbsmcpi` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lwvvndgoybyjfclwtdifgwjjgxyjpgdciwsq` (`groupId`),
  KEY `fk_padxsbskhurrjshufztzjczaunmshuelijro` (`parentId`),
  CONSTRAINT `fk_fzcikfdwivbbcchidpelyjrayktekgsfquek` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mhcbjdasxkoyxzyzwfmxqeasfmvzqosddcfc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_padxsbskhurrjshufztzjczaunmshuelijro` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_efkjmmuksvqltvuklpcnlouyuqizjkbzxhyo` (`name`),
  KEY `idx_lerkzxdgzdvlbaghofuzykukhpukwznxkhiq` (`handle`),
  KEY `idx_wjrsbeynisjxfaoxmaalsdbxwpaylvavtttt` (`structureId`),
  KEY `idx_ifgeqmpmlrmpxutmdollpujyghnndmvniwrj` (`fieldLayoutId`),
  KEY `idx_akoqxtvtsqimxlgfjadtnvrygtmyaozldvdf` (`dateDeleted`),
  CONSTRAINT `fk_aqynhscrbjsffglidsnxtexyotbssvxvnodt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hkufzyavnqxwiufetztoouvchntkipcmoxzo` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lydorwqwrpygdnxgdznxcokxgexecgzbuxxt` (`groupId`,`siteId`),
  KEY `idx_cuswrfhfrjesrfyaxjevenjddfovypvfgtom` (`siteId`),
  CONSTRAINT `fk_mpozhkyzzqmsvevbusijivfurxetcbrhxahc` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzittditjnnskpbtdhnldxzemysbbbghltoz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_hfsnxilqxhbpkrvkdrhjbxlaxxumwihkslas` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_dbleihbwuyhghevjxbapiujbzoqqlljefuhy` (`siteId`),
  KEY `fk_kakyrsxqymtfehfvunuvrkdpyszpyxshzuvh` (`userId`),
  CONSTRAINT `fk_dbleihbwuyhghevjxbapiujbzoqqlljefuhy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kakyrsxqymtfehfvunuvrkdpyszpyxshzuvh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qjrhqyyggcmjtfmnzlamhfvavrlihnxvngir` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_chkrdqchmfwjsiunrpzptlihogtqiibikhmm` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_eqmdsxuusjyhyhqcrxbrklwhasxlbvrzpiqa` (`siteId`),
  KEY `fk_ghfankiriywacacayybtgjqmnssrofcrwhxm` (`fieldId`),
  KEY `fk_qcbxarkpnteegjkzgqlhnprxlxoxzryganhy` (`userId`),
  CONSTRAINT `fk_eqmdsxuusjyhyhqcrxbrklwhasxlbvrzpiqa` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ghfankiriywacacayybtgjqmnssrofcrwhxm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qcbxarkpnteegjkzgqlhnprxlxoxzryganhy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_vzftlqhrevrlnzjthuubehvbkumbttyacmvt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_addresses`
--

DROP TABLE IF EXISTS `commerce_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryId` int(11) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  `isStoreLocation` tinyint(1) NOT NULL DEFAULT 0,
  `attention` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `alternativePhone` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `businessName` varchar(255) DEFAULT NULL,
  `businessTaxId` varchar(255) DEFAULT NULL,
  `businessId` varchar(255) DEFAULT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `custom1` varchar(255) DEFAULT NULL,
  `custom2` varchar(255) DEFAULT NULL,
  `custom3` varchar(255) DEFAULT NULL,
  `custom4` varchar(255) DEFAULT NULL,
  `isEstimated` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_giucgektugvsfqydjzufqroroclkyakejfhe` (`countryId`),
  KEY `idx_uexvqeefaolzdmitbobahtsznfufbertbijl` (`stateId`),
  KEY `idx_ypzafqpcrgxxodgzxgfoqkekrmyimhponois` (`isStoreLocation`),
  CONSTRAINT `fk_gehdudqcpfhvivymnsycqzeatxkklmzqqgpl` FOREIGN KEY (`stateId`) REFERENCES `commerce_states` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mcpsyjtvodrlwtxpjyjnqtdujmdvvbykdegm` FOREIGN KEY (`countryId`) REFERENCES `commerce_countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_countries`
--

DROP TABLE IF EXISTS `commerce_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `iso` varchar(2) NOT NULL,
  `isStateRequired` tinyint(1) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rmyjzkuggdxhguyzyrovoxqrijimmtbdflah` (`name`),
  UNIQUE KEY `idx_wfnapebjgkvajjejpuhpgmbuuyimrtjhhlgo` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customer_discountuses`
--

DROP TABLE IF EXISTS `commerce_customer_discountuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_customer_discountuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `uses` int(11) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_phbniswvajejydpuaiiinfldvpljhurlhwbq` (`customerId`,`discountId`),
  KEY `idx_hjhpdweczcesilihfmbxjzhnzcxollyrncda` (`discountId`),
  CONSTRAINT `fk_jjfnycseydixfgxlnjosbmyocagzuskiojht` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vsnzcxgxdgcixnzbpihwihmqvsezbglbbnfy` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customers`
--

DROP TABLE IF EXISTS `commerce_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `primaryBillingAddressId` int(11) DEFAULT NULL,
  `primaryShippingAddressId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yyfmafsejxwaujnyvvevwsturioitxruzrhn` (`userId`),
  KEY `idx_wbmryfljxwmtxgkjbxoggtgfiozzjoucgxvf` (`primaryBillingAddressId`),
  KEY `idx_mpikrpfgzgdqsxfyskzxextyllllfdsvemdg` (`primaryShippingAddressId`),
  CONSTRAINT `fk_ghugmglxhlwemekfsmwcuwrdrmjtjyyzyzra` FOREIGN KEY (`primaryBillingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jvueemwqgtxwsclepaqbnxjdglttjexcawix` FOREIGN KEY (`primaryShippingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_poofptpelrwzcfnzwkznxqfgrfipkthnopgz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customers_addresses`
--

DROP TABLE IF EXISTS `commerce_customers_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_customers_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vnnqtoxznlkbfwczkgvcatbakhegqvxxuuot` (`customerId`,`addressId`),
  KEY `fk_knvqahwtzefpnkkzkmxtmjpdfkhmozneavcv` (`addressId`),
  CONSTRAINT `fk_knvqahwtzefpnkkzkmxtmjpdfkhmozneavcv` FOREIGN KEY (`addressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_svgkbykbogopvxrvbplkudcnecamomeawvrp` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_categories`
--

DROP TABLE IF EXISTS `commerce_discount_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discount_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_btjoapfxmxwbobyfaznyfheuqcvntautnwuw` (`discountId`,`categoryId`),
  KEY `idx_ubzrtrxwotnhuuhdsiclarilsfoykwwkxnbj` (`categoryId`),
  CONSTRAINT `fk_efswsrvocwkdnmrqgscorprnrrsisavrname` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pneixuwrtvpctquhonrwkdzekshnaoaakvig` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_purchasables`
--

DROP TABLE IF EXISTS `commerce_discount_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discount_purchasables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `purchasableId` int(11) NOT NULL,
  `purchasableType` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unbmkwipmhnnuxneixcdzuotfxtlqddyguxm` (`discountId`,`purchasableId`),
  KEY `idx_ztjxmoppxwbpbbpjrgqfjkukbtgbxjgvjwdq` (`purchasableId`),
  CONSTRAINT `fk_lgvpgxwitcdtcldnbrbyndfinwswwerwtlel` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uxluqgmjzsmitetxztfrybenhamqlhtqxhpg` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_usergroups`
--

DROP TABLE IF EXISTS `commerce_discount_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discount_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `userGroupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vvlvofuorswekntpswztiungvgduffufoomo` (`discountId`,`userGroupId`),
  KEY `idx_totjvymupkjodzcjalvpnrelivfaekonnkpw` (`userGroupId`),
  CONSTRAINT `fk_ixicpxmszztstvybnmpkaqedjuvszehjggzm` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ltbnbgtyelerluerxaybsziipkdabwzjfprs` FOREIGN KEY (`userGroupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discounts`
--

DROP TABLE IF EXISTS `commerce_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `perUserLimit` int(11) unsigned NOT NULL DEFAULT 0,
  `perEmailLimit` int(11) unsigned NOT NULL DEFAULT 0,
  `totalDiscountUses` int(11) unsigned NOT NULL DEFAULT 0,
  `totalDiscountUseLimit` int(11) unsigned NOT NULL DEFAULT 0,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `purchaseTotal` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `purchaseQty` int(11) NOT NULL DEFAULT 0,
  `maxPurchaseQty` int(11) NOT NULL DEFAULT 0,
  `baseDiscount` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `baseDiscountType` enum('value','percentTotal','percentTotalDiscounted','percentItems','percentItemsDiscounted') NOT NULL DEFAULT 'value',
  `perItemDiscount` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `percentDiscount` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `percentageOffSubject` enum('original','discounted') NOT NULL,
  `excludeOnSale` tinyint(1) DEFAULT NULL,
  `hasFreeShippingForMatchingItems` tinyint(1) DEFAULT NULL,
  `hasFreeShippingForOrder` tinyint(1) DEFAULT NULL,
  `userGroupsCondition` varchar(255) DEFAULT 'userGroupsAnyOrNone',
  `allPurchasables` tinyint(1) DEFAULT NULL,
  `allCategories` tinyint(1) DEFAULT NULL,
  `appliedTo` enum('matchingLineItems','allLineItems') NOT NULL DEFAULT 'matchingLineItems',
  `categoryRelationshipType` enum('element','sourceElement','targetElement') NOT NULL DEFAULT 'element',
  `orderConditionFormula` text DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `stopProcessing` tinyint(1) DEFAULT NULL,
  `ignoreSales` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nrnnhomvmiaihmdjhmthpfvaqzgnhnabavgc` (`code`),
  KEY `idx_wapszeqpcqsfowmtqpczpoyixjbecsvrlomv` (`dateFrom`),
  KEY `idx_ozzpnqvnavdgigfyoyzuhechprqarjmubvbz` (`dateTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_donations`
--

DROP TABLE IF EXISTS `commerce_donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `availableForPurchase` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_ruvdwtrlkjexwpihohsewbespxlabswahguy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_email_discountuses`
--

DROP TABLE IF EXISTS `commerce_email_discountuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_email_discountuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `uses` int(11) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nyrdqxeaxvlhmaemymycycihxhgohtcyoxeb` (`email`,`discountId`),
  KEY `idx_ompwcvtwjndgophbuhgerfcfbtuoppvlsvux` (`discountId`),
  CONSTRAINT `fk_ejecondfwiwszioayubvgsbxzqxezghbjloe` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_emails`
--

DROP TABLE IF EXISTS `commerce_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `recipientType` enum('customer','custom') DEFAULT 'custom',
  `to` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `templatePath` varchar(255) NOT NULL,
  `plainTextTemplatePath` varchar(255) DEFAULT NULL,
  `pdfId` int(11) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_dphcsqpvdpietwaukamryqkgaifirkjboecq` (`pdfId`),
  CONSTRAINT `fk_dphcsqpvdpietwaukamryqkgaifirkjboecq` FOREIGN KEY (`pdfId`) REFERENCES `commerce_pdfs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_gateways`
--

DROP TABLE IF EXISTS `commerce_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `paymentType` enum('authorize','purchase') NOT NULL DEFAULT 'purchase',
  `isFrontendEnabled` tinyint(1) DEFAULT NULL,
  `isArchived` tinyint(1) DEFAULT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poiseliyovkjxddomuryxupheursdfzrqfpx` (`handle`),
  KEY `idx_kioswviuqvflkmafpxznpzunphosmihueggh` (`isArchived`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_lineitems`
--

DROP TABLE IF EXISTS `commerce_lineitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_lineitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `purchasableId` int(11) DEFAULT NULL,
  `taxCategoryId` int(11) NOT NULL,
  `shippingCategoryId` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `options` text DEFAULT NULL,
  `optionsSignature` varchar(255) NOT NULL,
  `price` decimal(14,4) unsigned NOT NULL,
  `saleAmount` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `salePrice` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `sku` varchar(255) DEFAULT NULL,
  `weight` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `height` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `length` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `width` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `subtotal` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `total` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `qty` int(11) unsigned NOT NULL,
  `note` text DEFAULT NULL,
  `privateNote` text DEFAULT NULL,
  `snapshot` longtext DEFAULT NULL,
  `lineItemStatusId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eapxuqodopdtbmexgwdytbydtwhrayiiazty` (`orderId`,`purchasableId`,`optionsSignature`),
  KEY `idx_yynhmdbcugckxcckrrgkzocrkzixgirfqbhk` (`purchasableId`),
  KEY `idx_ixhtdckkstuwkasldccxblvqqeowjyfmwqvg` (`taxCategoryId`),
  KEY `idx_szsjixjmzhfxzfyxltejfpamebgivhnhzxlh` (`shippingCategoryId`),
  CONSTRAINT `fk_avjqtdbywxfzhobchuwushlrhxksdhajlylt` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kpovcdgdavpudacwgvelycgorjczqygwlhsc` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sldxstgwtwjxsyswqixpjxucmycdgfkyvked` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ubhaisvnehhlcrbrwzbzbnudbtvpyojqjknx` FOREIGN KEY (`purchasableId`) REFERENCES `elements` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_lineitemstatuses`
--

DROP TABLE IF EXISTS `commerce_lineitemstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_lineitemstatuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `isArchived` tinyint(1) NOT NULL DEFAULT 0,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderadjustments`
--

DROP TABLE IF EXISTS `commerce_orderadjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderadjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `lineItemId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(14,4) NOT NULL,
  `included` tinyint(1) DEFAULT NULL,
  `isEstimated` tinyint(1) NOT NULL DEFAULT 0,
  `sourceSnapshot` longtext DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_exfcycwcwfwjgalobqsmgfduffzbmdnisgpg` (`orderId`),
  CONSTRAINT `fk_nrpcitncgzyzfjnhyocpscehreqlcikldnlm` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderhistories`
--

DROP TABLE IF EXISTS `commerce_orderhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderhistories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `prevStatusId` int(11) DEFAULT NULL,
  `newStatusId` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_negacdtlmazaoxfcxpylixmdtyqsmzeajoif` (`orderId`),
  KEY `idx_epxhqmbpflaahtdmqlvciodiieopthrqmczs` (`prevStatusId`),
  KEY `idx_grvkdxgvmpvuijgsspnbqnyvjolzwfkxbqrv` (`newStatusId`),
  KEY `idx_afgfyvjwvvbcusdnvrmswzoedcuqaszbrhhr` (`customerId`),
  CONSTRAINT `fk_eyaahyrbgcfouhocksvxxqtxmlmuzxrsqigy` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hxauwkzemapkcutrxtbtmthxetjsqfczruim` FOREIGN KEY (`newStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_trejzqkdbbvqipqlznnurfrzfjwirjmvpmld` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zjutdawusksiqyxnvwohzumxyrjaoytchers` FOREIGN KEY (`prevStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_ordernotices`
--

DROP TABLE IF EXISTS `commerce_ordernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_ordernotices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lxgygzhmkhziloycjzwqslzdmdtkcnzucmjg` (`orderId`),
  CONSTRAINT `fk_zdjvatbkerfcfnwytukaylpgdlxwflnxadsp` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orders`
--

DROP TABLE IF EXISTS `commerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orders` (
  `id` int(11) NOT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  `estimatedBillingAddressId` int(11) DEFAULT NULL,
  `estimatedShippingAddressId` int(11) DEFAULT NULL,
  `gatewayId` int(11) DEFAULT NULL,
  `paymentSourceId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `orderStatusId` int(11) DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `couponCode` varchar(255) DEFAULT NULL,
  `itemTotal` decimal(14,4) DEFAULT 0.0000,
  `itemSubtotal` decimal(14,4) DEFAULT 0.0000,
  `total` decimal(14,4) DEFAULT 0.0000,
  `totalPrice` decimal(14,4) DEFAULT 0.0000,
  `totalPaid` decimal(14,4) DEFAULT 0.0000,
  `totalDiscount` decimal(14,4) DEFAULT 0.0000,
  `totalTax` decimal(14,4) DEFAULT 0.0000,
  `totalTaxIncluded` decimal(14,4) DEFAULT 0.0000,
  `totalShippingCost` decimal(14,4) DEFAULT 0.0000,
  `paidStatus` enum('paid','partial','unpaid','overPaid') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isCompleted` tinyint(1) DEFAULT NULL,
  `dateOrdered` datetime DEFAULT NULL,
  `datePaid` datetime DEFAULT NULL,
  `dateAuthorized` datetime DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `paymentCurrency` varchar(255) DEFAULT NULL,
  `lastIp` varchar(255) DEFAULT NULL,
  `orderLanguage` varchar(12) NOT NULL,
  `origin` enum('web','cp','remote') NOT NULL DEFAULT 'web',
  `message` text DEFAULT NULL,
  `registerUserOnOrderComplete` tinyint(1) DEFAULT NULL,
  `recalculationMode` enum('all','none','adjustmentsOnly') NOT NULL DEFAULT 'all',
  `returnUrl` text DEFAULT NULL,
  `cancelUrl` text DEFAULT NULL,
  `shippingMethodHandle` varchar(255) DEFAULT NULL,
  `shippingMethodName` varchar(255) DEFAULT NULL,
  `orderSiteId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tgibgljlmxrhvoaficzlgorsypxmszgmgkjw` (`number`),
  KEY `idx_bywclmmsoupvliftnzffyjmdnjzacctggiyk` (`reference`),
  KEY `idx_wcgnypqclbrptxwoqfheidwosgxphbgvqkak` (`billingAddressId`),
  KEY `idx_fxlmjmygchsvfaiijopfxqehlscjwulehvwk` (`shippingAddressId`),
  KEY `idx_jfahvxhuedrjabtpamhaxuhwxulozxfcaqjl` (`gatewayId`),
  KEY `idx_bguoznrpiluinmzjfmfetgjfrunuctzmwqhf` (`customerId`),
  KEY `idx_kmjohdajkgnzfxldicmwupesczxeidtnzpab` (`orderStatusId`),
  KEY `idx_xsadhvahaprorxmklyrifmwrthrjqdqglofm` (`email`),
  KEY `fk_migzzglecnfagduebajbqujohmoxaefrkmnc` (`paymentSourceId`),
  KEY `fk_rlqreexbannpqwmjkdhbrojvjbwivxoscpky` (`estimatedShippingAddressId`),
  KEY `fk_nckstyibfuespnutogdlltnxlnpmsmgezdcd` (`estimatedBillingAddressId`),
  CONSTRAINT `fk_bciyywqjyopodmftaovygmzqqjyqhxvvdfqr` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_cvurovygckihdepsfrtwsxasueeqnzcubcbq` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_migzzglecnfagduebajbqujohmoxaefrkmnc` FOREIGN KEY (`paymentSourceId`) REFERENCES `commerce_paymentsources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nckstyibfuespnutogdlltnxlnpmsmgezdcd` FOREIGN KEY (`estimatedBillingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qrufceftnksxpyapgsmmzxpveckrujkrydqr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rlqreexbannpqwmjkdhbrojvjbwivxoscpky` FOREIGN KEY (`estimatedShippingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wdayuhdmhjcyaavnwdrujdjcehuqbitofknp` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_xrebcokqrtbmlfwyvgrjmfsdavnhbzotgrts` FOREIGN KEY (`billingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zplgopoabwuejyohzwsnwxbjgqbahqvyryjh` FOREIGN KEY (`shippingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderstatus_emails`
--

DROP TABLE IF EXISTS `commerce_orderstatus_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderstatus_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderStatusId` int(11) NOT NULL,
  `emailId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ouavoehbcfuyprvsjbybtocaacgcwflyimwr` (`orderStatusId`),
  KEY `idx_dniplvyegdzrnheicbcteruvnfvzflnayuae` (`emailId`),
  CONSTRAINT `fk_prvspcszdfacbbgpymatbwbsodmjsrbaiuqb` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_rtxknyxpruchwswdatuaaspwmvwyrocfgbiq` FOREIGN KEY (`emailId`) REFERENCES `commerce_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderstatuses`
--

DROP TABLE IF EXISTS `commerce_orderstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderstatuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_paymentcurrencies`
--

DROP TABLE IF EXISTS `commerce_paymentcurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_paymentcurrencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(3) NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  `rate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iycbbiikeidadvggpwsgscwpmcvllbikehqo` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_paymentsources`
--

DROP TABLE IF EXISTS `commerce_paymentsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_paymentsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `gatewayId` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_yuvbdmjzyhzodwmvrgntaxttysjrekfpfbks` (`gatewayId`),
  KEY `fk_quemnxyaoizznbwdsfsswwbpfdeqodlnjqyh` (`userId`),
  CONSTRAINT `fk_quemnxyaoizznbwdsfsswwbpfdeqodlnjqyh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yuvbdmjzyhzodwmvrgntaxttysjrekfpfbks` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_pdfs`
--

DROP TABLE IF EXISTS `commerce_pdfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_pdfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `templatePath` varchar(255) NOT NULL,
  `fileNameFormat` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xucgpioodbfszqrkoyammsalqzbnughzzebe` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_plans`
--

DROP TABLE IF EXISTS `commerce_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gatewayId` int(11) DEFAULT NULL,
  `planInformationId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text DEFAULT NULL,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sohvofcwzhradywgzfpumrrzfclobgrequeg` (`handle`),
  KEY `idx_rwzdtfghzkyobkxsybmktwfuxgojrdqdxtpn` (`gatewayId`),
  KEY `idx_puydjxnouoyngqwatnnqwisqyqhvhtttdwbd` (`reference`),
  KEY `fk_wrxhkztiygxqcwxxxgqadynjlzcgdvvfgkyv` (`planInformationId`),
  CONSTRAINT `fk_wrxhkztiygxqcwxxxgqadynjlzcgdvvfgkyv` FOREIGN KEY (`planInformationId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xumnmeizigtoigviuljhggbblvpdodzlnvpg` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_products`
--

DROP TABLE IF EXISTS `commerce_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_products` (
  `id` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `taxCategoryId` int(11) NOT NULL,
  `shippingCategoryId` int(11) NOT NULL,
  `defaultVariantId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `promotable` tinyint(1) DEFAULT NULL,
  `availableForPurchase` tinyint(1) DEFAULT NULL,
  `freeShipping` tinyint(1) DEFAULT NULL,
  `defaultSku` varchar(255) DEFAULT NULL,
  `defaultPrice` decimal(14,4) DEFAULT NULL,
  `defaultHeight` decimal(14,4) DEFAULT NULL,
  `defaultLength` decimal(14,4) DEFAULT NULL,
  `defaultWidth` decimal(14,4) DEFAULT NULL,
  `defaultWeight` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dzebvxmlewtluqhggcygnhhueszzrlkqmnlh` (`typeId`),
  KEY `idx_mwetldyijywxrznedfjweyqoylnlugqdpdcr` (`postDate`),
  KEY `idx_lkvzmyuutlyejajrwthgpjvmumoxxppeykni` (`expiryDate`),
  KEY `idx_nyyunnvmxzkzlzjwcuzwocfmjizpombhddwn` (`taxCategoryId`),
  KEY `idx_qanrtefhuxzgnhiflfaekmdygxpcthfhvkib` (`shippingCategoryId`),
  CONSTRAINT `fk_dnvjcgjigpehmtomirdnskrkrnnmoqrhgorw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ehaeihtpasjycuxglrnshbgelmoagpzapysx` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`),
  CONSTRAINT `fk_kpvnskvobkglkxflqeljqcxpxzsmzooyrtnp` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`),
  CONSTRAINT `fk_zpmipzahyvjdyxtvlffxkfygydkncpbwwmti` FOREIGN KEY (`typeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes`
--

DROP TABLE IF EXISTS `commerce_producttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `variantFieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasDimensions` tinyint(1) DEFAULT NULL,
  `hasVariants` tinyint(1) DEFAULT NULL,
  `hasVariantTitleField` tinyint(1) DEFAULT NULL,
  `titleFormat` varchar(255) NOT NULL,
  `hasProductTitleField` tinyint(1) DEFAULT NULL,
  `productTitleFormat` varchar(255) DEFAULT NULL,
  `skuFormat` varchar(255) DEFAULT NULL,
  `descriptionFormat` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pgwsdoicruyhmdihgoqplqicrmirzxhvinel` (`handle`),
  KEY `idx_ussglflermteqwfuybpunavaasbcjriiecli` (`fieldLayoutId`),
  KEY `idx_zfsxxhamagqzpynfnwpjpoopirosytuadvig` (`variantFieldLayoutId`),
  CONSTRAINT `fk_agaezzsrlqfipiuiieiruyepbgjqlfugvubf` FOREIGN KEY (`variantFieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ayypenjwwuhiifxssuesmrqdicnfmcxfdxoz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_shippingcategories`
--

DROP TABLE IF EXISTS `commerce_producttypes_shippingcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_shippingcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productTypeId` int(11) NOT NULL,
  `shippingCategoryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rvgnsjnarelwpgcqtkuxezhwofyiilwzpqto` (`productTypeId`,`shippingCategoryId`),
  KEY `idx_croziuxmjfcqgqaxrwgrperrvwohhtdtzutj` (`shippingCategoryId`),
  CONSTRAINT `fk_kkbojrforvutiohmsczjkotgvvaxizghwcir` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vzfhqvvgzyjksrjfktpglghbhwjxeqylyvzu` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_sites`
--

DROP TABLE IF EXISTS `commerce_producttypes_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productTypeId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `hasUrls` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mhwxjiweffkbdjgcdrcabapodpubrbijsnxv` (`productTypeId`,`siteId`),
  KEY `idx_vawwqotslgefyjiysyahecexljkazvwilpcr` (`siteId`),
  CONSTRAINT `fk_egpuldzxbttbtpzmrjoltibxnniugfscvadr` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xbqvyozicemnahmaefjahhotpltuaiwmajhd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_taxcategories`
--

DROP TABLE IF EXISTS `commerce_producttypes_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_taxcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productTypeId` int(11) NOT NULL,
  `taxCategoryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mbyrexqhukvaonitwuclearqguolfktwgjlk` (`productTypeId`,`taxCategoryId`),
  KEY `idx_hfoyzwsecfaaotrmerufazexznqdxtanbvsb` (`taxCategoryId`),
  CONSTRAINT `fk_bbjaryoaaxqxxwjdiwkizelrpwenekcrhkeg` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kimgbtgqufwgjhbspcgahptaholnmxpqwrbm` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_purchasables`
--

DROP TABLE IF EXISTS `commerce_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_purchasables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `price` decimal(14,4) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vasrfrjdbtnpydbjiqfvrznptwzzopuogqkk` (`sku`),
  CONSTRAINT `fk_ekopttzkyxnkddymkucluvwctswivddlwglw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_categories`
--

DROP TABLE IF EXISTS `commerce_sale_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_palxxpjsrovmsltsluhlqkzcyvxjypncbzkj` (`saleId`,`categoryId`),
  KEY `idx_licmxwxjznyowrjmbyavumgssxonidiuuiuu` (`categoryId`),
  CONSTRAINT `fk_bjlodcudpnsgjkqmxsjropsdwtexgpwdwvrh` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_niwsjfsbywnkqhuaxjdhfonzsivglksybmdu` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_purchasables`
--

DROP TABLE IF EXISTS `commerce_sale_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_purchasables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleId` int(11) NOT NULL,
  `purchasableId` int(11) NOT NULL,
  `purchasableType` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lqtywzfpdurajzbbymvruznsqgyeuljinxuk` (`saleId`,`purchasableId`),
  KEY `idx_sgqwslleklvgmhhchwmmpqimefqiwdxdaajn` (`purchasableId`),
  CONSTRAINT `fk_pnjmzhpwnfhrgqqcfhbajpynvcjxslxtakzq` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yecwxwrpenbyrcvvsnfnlmnzurhrrnrwwmaw` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_usergroups`
--

DROP TABLE IF EXISTS `commerce_sale_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleId` int(11) NOT NULL,
  `userGroupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_empemzxajzeibzssgsctppnctzellcirkxvk` (`saleId`,`userGroupId`),
  KEY `idx_jpemagwqhvmghrkzsmdowrwnserpysijqakz` (`userGroupId`),
  CONSTRAINT `fk_bvdfozhtpcgpxenjzdsbpobavqqzpnnghasg` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hzkkilvxolwhsoodwfcveggvkpkhpfjglpko` FOREIGN KEY (`userGroupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sales`
--

DROP TABLE IF EXISTS `commerce_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `apply` enum('toPercent','toFlat','byPercent','byFlat') NOT NULL,
  `applyAmount` decimal(14,4) NOT NULL,
  `allGroups` tinyint(1) DEFAULT NULL,
  `allPurchasables` tinyint(1) DEFAULT NULL,
  `allCategories` tinyint(1) DEFAULT NULL,
  `categoryRelationshipType` enum('element','sourceElement','targetElement') NOT NULL DEFAULT 'element',
  `enabled` tinyint(1) DEFAULT NULL,
  `ignorePrevious` tinyint(1) DEFAULT NULL,
  `stopProcessing` tinyint(1) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingcategories`
--

DROP TABLE IF EXISTS `commerce_shippingcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gesrqlkrvnxqgtohrxnurluumitfwnxhzwzl` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingmethods`
--

DROP TABLE IF EXISTS `commerce_shippingmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `isLite` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dhstddkzghtkhrsjhvzfcytfhfymkhlothzp` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingrule_categories`
--

DROP TABLE IF EXISTS `commerce_shippingrule_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingrule_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingRuleId` int(11) DEFAULT NULL,
  `shippingCategoryId` int(11) DEFAULT NULL,
  `condition` enum('allow','disallow','require') NOT NULL,
  `perItemRate` decimal(14,4) DEFAULT NULL,
  `weightRate` decimal(14,4) DEFAULT NULL,
  `percentageRate` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kjyykjsqcdkbioddrdbtxsdzdciuzkhnpptc` (`shippingRuleId`),
  KEY `idx_ifqvbotaaixszemecwetaguprlzhnciiswry` (`shippingCategoryId`),
  CONSTRAINT `fk_aigdrfqfiuthrdovynphemwvqloulmjvbiei` FOREIGN KEY (`shippingRuleId`) REFERENCES `commerce_shippingrules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_djahfxolzhdrxnhbtijgbbichsbntjktgigc` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingrules`
--

DROP TABLE IF EXISTS `commerce_shippingrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingZoneId` int(11) DEFAULT NULL,
  `methodId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) DEFAULT NULL,
  `orderConditionFormula` text DEFAULT NULL,
  `minQty` int(11) NOT NULL DEFAULT 0,
  `maxQty` int(11) NOT NULL DEFAULT 0,
  `minTotal` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `maxTotal` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `minMaxTotalType` enum('salePrice','salePriceWithDiscounts') NOT NULL DEFAULT 'salePrice',
  `minWeight` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `maxWeight` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `baseRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `perItemRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `weightRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `percentageRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `minRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `maxRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `isLite` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eouwlxguczmlhxmvhrnctanwbfxzgqcncpob` (`name`),
  KEY `idx_rxhzyunqmzvwjknowzthkqzfgeiwdqkaqncu` (`methodId`),
  KEY `idx_ryxeifoeydopzcseecumdiemcnxjkuiqjdev` (`shippingZoneId`),
  CONSTRAINT `fk_axunlotnepkykfqzciljjbfzslklfwnxcnai` FOREIGN KEY (`methodId`) REFERENCES `commerce_shippingmethods` (`id`),
  CONSTRAINT `fk_ogwvkxstxsjwpphovfzktmaxtlhycamvvgym` FOREIGN KEY (`shippingZoneId`) REFERENCES `commerce_shippingzones` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingzone_countries`
--

DROP TABLE IF EXISTS `commerce_shippingzone_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingzone_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingZoneId` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hvnbayjyjydaifrgaakbgovfbffgczlvaxbb` (`shippingZoneId`,`countryId`),
  KEY `idx_cexelxlfqlmhpmaftbzdrhzobvtjvlzufupa` (`shippingZoneId`),
  KEY `idx_cbwctrshscinrgsgxcjwacxhnisqjngewogm` (`countryId`),
  CONSTRAINT `fk_uwpcmzzskiatrlazldtcnevcaygdcuujgski` FOREIGN KEY (`shippingZoneId`) REFERENCES `commerce_shippingzones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zpvfupwhcnkzokpqmcougrnxdijjhrdtmskt` FOREIGN KEY (`countryId`) REFERENCES `commerce_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingzone_states`
--

DROP TABLE IF EXISTS `commerce_shippingzone_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingzone_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingZoneId` int(11) NOT NULL,
  `stateId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unowtstczacqiuoonjddyezmelrbhleowqdh` (`shippingZoneId`,`stateId`),
  KEY `idx_adcwejlkrudytucldemwrxketjalzfyrnqie` (`shippingZoneId`),
  KEY `idx_nadzaddiscrdnlqhwyfgzhtjasrjazzngvuw` (`stateId`),
  CONSTRAINT `fk_eezfxocrnxfxiqytnxtrdhkybqfkkwoslvpu` FOREIGN KEY (`shippingZoneId`) REFERENCES `commerce_shippingzones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gcjgzhmtmkrwpnrpwgsnzenzsynpqrvujmzy` FOREIGN KEY (`stateId`) REFERENCES `commerce_states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingzones`
--

DROP TABLE IF EXISTS `commerce_shippingzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingzones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isCountryBased` tinyint(1) DEFAULT NULL,
  `zipCodeConditionFormula` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gusfedhwvstmivpggaoqgxkxddkyaglaogqw` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_states`
--

DROP TABLE IF EXISTS `commerce_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tdqondsrurdjgtvvtazghtnsxsnidkkwsrbj` (`countryId`,`name`),
  UNIQUE KEY `idx_jrvkmulgmukvcxdrkuaxvuybvuowmjkoruxb` (`countryId`,`abbreviation`),
  KEY `idx_tlispubdyyykntrvuardxceygjqlsgrqwwdk` (`countryId`),
  CONSTRAINT `fk_qyfvpsxiqwssytqzquncdilfzcorysupqmkr` FOREIGN KEY (`countryId`) REFERENCES `commerce_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_subscriptions`
--

DROP TABLE IF EXISTS `commerce_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `planId` int(11) DEFAULT NULL,
  `gatewayId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text DEFAULT NULL,
  `trialDays` int(11) NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT 1,
  `isSuspended` tinyint(1) NOT NULL DEFAULT 0,
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qzvrxspysdvgljrrzqthyoafolsjdrmmeema` (`reference`),
  KEY `idx_njntwckjcknbeunbpbtaonkjtrfupiyzlgmy` (`userId`),
  KEY `idx_qhfdfxowmbcnqkvicgychppuholrnjqydsie` (`planId`),
  KEY `idx_fzljrbnqwuyndfudnkpfjbxabxbhiknpdbjf` (`gatewayId`),
  KEY `idx_atkadvtmsqjnalqriwoyycuxqtycdxpshgtk` (`nextPaymentDate`),
  KEY `idx_benjnnlsbydzjsobddhyvnmrdazncikfyqwi` (`dateCreated`),
  KEY `idx_qtjhjdshteierhrfwjcogtdyvjwviipxwsbe` (`dateExpired`),
  KEY `fk_qnzfkaauepbyvnghxffdyeuetneswlinizmp` (`orderId`),
  CONSTRAINT `fk_duhkvdlomkfgaumnmoenekrxlswkyexwbwjd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hunoghvbnwfyuobodupnxvcwbaeqwjhffjpe` FOREIGN KEY (`planId`) REFERENCES `commerce_plans` (`id`),
  CONSTRAINT `fk_qnzfkaauepbyvnghxffdyeuetneswlinizmp` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sfrhcidxnpraxcubhxdgxlxrwfnwjbthsefu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_ugekrbhnaypcufwkxnjwwwxclookxwdoltrv` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxcategories`
--

DROP TABLE IF EXISTS `commerce_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_suuiviqjpebkomvqxsxpvyvhapdksxqhxmtz` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxrates`
--

DROP TABLE IF EXISTS `commerce_taxrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxZoneId` int(11) DEFAULT NULL,
  `isEverywhere` tinyint(1) DEFAULT NULL,
  `taxCategoryId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `rate` decimal(14,10) NOT NULL,
  `include` tinyint(1) DEFAULT NULL,
  `isVat` tinyint(1) DEFAULT NULL,
  `removeIncluded` tinyint(1) DEFAULT NULL,
  `removeVatIncluded` tinyint(1) DEFAULT NULL,
  `taxable` enum('price','shipping','price_shipping','order_total_shipping','order_total_price') NOT NULL,
  `isLite` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jljibfdceacnttliaajqunjwzaqroloekrze` (`taxZoneId`),
  KEY `idx_awkeldlnxykxzicinmkdzwfwyyoohjqpwaao` (`taxCategoryId`),
  CONSTRAINT `fk_gsqflgppmigwuhasaeomulhhcnafuokursjw` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_rgsucybndjwskrigjvqdiiijfzohnfnamrwx` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxzone_countries`
--

DROP TABLE IF EXISTS `commerce_taxzone_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxzone_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxZoneId` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vbbpwcjustqwefeawrnacdnaoikpfpokmzjb` (`taxZoneId`,`countryId`),
  KEY `idx_axxemofgwupzpgbdgemhhvwfxawpsxjzdazb` (`taxZoneId`),
  KEY `idx_higgaxnctmqmtsrwovuiksxvfrmgwhgcadxu` (`countryId`),
  CONSTRAINT `fk_rwpjjsqngcrdqnjwpqpbjujthbziptgwtimp` FOREIGN KEY (`countryId`) REFERENCES `commerce_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zokhodgzxojtmfuincirxhvsadwflojwurov` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxzone_states`
--

DROP TABLE IF EXISTS `commerce_taxzone_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxzone_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxZoneId` int(11) NOT NULL,
  `stateId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ozchvwksvlqonyjhfwlwqcntqdvqtuepamjm` (`taxZoneId`,`stateId`),
  KEY `idx_jmncjtavzwrmpfutkwhlffyxuxrxhdgwsooo` (`taxZoneId`),
  KEY `idx_yhujwsykjjypfvmwttmsbcruzvaivwkbgzkx` (`stateId`),
  CONSTRAINT `fk_tebbnpkypmokkjpsyvfcklvgnajhbjzwxcse` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zcahfeosljgrremwrklwtmouosbefynocrvv` FOREIGN KEY (`stateId`) REFERENCES `commerce_states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxzones`
--

DROP TABLE IF EXISTS `commerce_taxzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxzones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isCountryBased` tinyint(1) DEFAULT NULL,
  `zipCodeConditionFormula` text DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ghocnwhocdphpmczbiwuijabceuoofcvobsy` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_transactions`
--

DROP TABLE IF EXISTS `commerce_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `gatewayId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `type` enum('authorize','capture','purchase','refund') NOT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `paymentAmount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `paymentCurrency` varchar(255) DEFAULT NULL,
  `paymentRate` decimal(14,4) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ithvhvehzxmjyrgmmbrmyebeykwatlwpfciw` (`parentId`),
  KEY `idx_epdlzzecwcpitixuyguvodqbzfbmrgoksswh` (`gatewayId`),
  KEY `idx_ndmecjapjzwupkiqweehuoxycbbsdlzkfnxq` (`orderId`),
  KEY `idx_znmgcltetjjvzlqccevkohyzrybnbplnlojh` (`userId`),
  CONSTRAINT `fk_behfsqxiloazrrwhcezymqmormbwwxnrjvjb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_cjvniaajekexpmfenyyuugptmwevprzlqtbw` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_egluewfrtbmfpaxrdprxibfojtprshlmucre` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_uhikwwudyhfechjzchipukoafacpwdgootly` FOREIGN KEY (`parentId`) REFERENCES `commerce_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_variants`
--

DROP TABLE IF EXISTS `commerce_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_variants` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `price` decimal(14,4) NOT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `width` decimal(14,4) DEFAULT NULL,
  `height` decimal(14,4) DEFAULT NULL,
  `length` decimal(14,4) DEFAULT NULL,
  `weight` decimal(14,4) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `hasUnlimitedStock` tinyint(1) DEFAULT NULL,
  `minQty` int(11) DEFAULT NULL,
  `maxQty` int(11) DEFAULT NULL,
  `deletedWithProduct` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pcjinikuncceplrlcibwyvumirhwqaarhpmt` (`sku`),
  KEY `idx_redzlpxeuqskmbyhmzhfvqozabkrbxlnirnf` (`productId`),
  CONSTRAINT `fk_jeaythlgnaimwzkiezhvihplynklgjzaczmw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wxfnxyxqqlafucnrchypyvotboiiwwxkkfnr` FOREIGN KEY (`productId`) REFERENCES `commerce_products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cycnjfehcrpmxtskknfjpfeswciglkjhzouo` (`elementId`,`siteId`),
  KEY `idx_ifdmsihmfuzprotdltvuqwvgqxgeplehvptv` (`siteId`),
  KEY `idx_vwhjmtabvwtqchsmxgycfwicgjjmxbqfzgsx` (`title`),
  CONSTRAINT `fk_mucaiolljpubccyjwmcyzzskfelzuubbzbdn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yvrpqnkuuwihjyuypxvtejowzxophpnjyquf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_zjbzpghqbneffcuvxbyyxlbumihulxrkbukh` (`userId`),
  CONSTRAINT `fk_zjbzpghqbneffcuvxbyyxlbumihulxrkbukh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qatcqhvpqtkupsygyebbwrsmbauyupmqlxop` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_ajltwfvjbumytufwzzhfabjpevxkstwrsplt` (`creatorId`,`provisional`),
  KEY `idx_wjjxhgvzbhaxmhjqaobtekjbrdjeiydwjhpv` (`saved`),
  KEY `fk_qemrspxwhmggfnweurwncqhemrpgrmhwmifv` (`sourceId`),
  CONSTRAINT `fk_dwjtemmymbzarrthfaqbarubsikariqvergz` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qemrspxwhmggfnweurwncqhemrpgrmhwmifv` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tjoplsoytqjsgyyeizsipmvdpwmuvuvinkno` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_joiaeqxyapnypxkkmhjgumstmcfcjrdgzfmn` (`dateDeleted`),
  KEY `idx_odsxhflpedgkqgdupbuiagtxzuhiygcziihv` (`fieldLayoutId`),
  KEY `idx_hmzaodgdjwvjehevxecvwgfwftqebrdtvqno` (`type`),
  KEY `idx_fkaemksvhsbiwyzwmbfnunvbemxatchkojqt` (`enabled`),
  KEY `idx_zldxxikrcyjlwdwewrsqqzaannpgttbbrhby` (`archived`,`dateCreated`),
  KEY `idx_wcdafrhshssnzuokmewzsenkfpnfgtjcuoqs` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_qpuzgrwhpzdzivibncppqyayxvnysosrxkje` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_huzzrkjijqwxbeeswjtqidvqnoxgrbjrvfme` (`canonicalId`),
  KEY `fk_kkhbzuemrujxoymamylionbnlnbcdndbmojh` (`draftId`),
  KEY `fk_ooaoknkdpljpjlkffcozjbqnsdhmgdqephtl` (`revisionId`),
  CONSTRAINT `fk_huzzrkjijqwxbeeswjtqidvqnoxgrbjrvfme` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kkhbzuemrujxoymamylionbnlnbcdndbmojh` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ooaoknkdpljpjlkffcozjbqnsdhmgdqephtl` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uaodaiqszgmiumecrbpkwdyjrtlahqgwwamo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kvjkgbxubsvopbmydiebzkmkjifbnftoyzjm` (`elementId`,`siteId`),
  KEY `idx_dzwtnfvhuacqgzuikpucdclztxlwqkkpwhag` (`siteId`),
  KEY `idx_ckgqifqaqrmdijtasoyvoqavrtbmhcgcgask` (`slug`,`siteId`),
  KEY `idx_aqrmalvukjtkauzgkhscslghlrruvhafkhuc` (`enabled`),
  KEY `idx_shcbyltchwdcslxeqbuneosnngylyyelzjuz` (`uri`,`siteId`),
  CONSTRAINT `fk_pljdwnpchdfnlzzniwnwpoagcspmuvhqdter` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uimdqmrjtzazfufvyolalqqjwjbazhnopvar` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lnfrymyhpclxgobnwhetqwtscfqbjebgflfq` (`postDate`),
  KEY `idx_eqvzrkelingtmaeydzuyshrvvggeabwldrrz` (`expiryDate`),
  KEY `idx_gzlliencpdiimvafuiuijjukempzpvzwfqqa` (`authorId`),
  KEY `idx_zeoqvarbixowwczanfxsikkflpxcasrzsyum` (`sectionId`),
  KEY `idx_nsynejytnwwwkvhsnbeqkperulhjqwsnsmgp` (`typeId`),
  KEY `fk_phzyivteewsnohqzvxsxcpphnsabcbciwmiy` (`parentId`),
  CONSTRAINT `fk_phzyivteewsnohqzvxsxcpphnsabcbciwmiy` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sdtdtflwdvwfymjilnozumlsmadllfoxxndg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_toppxgptbjvyvczghtjausvgjmekwhjgxyqe` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wpkoaztxifsjcniveolwqkfhkifwyjkufcef` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrswqiucgmvlvrnwykcxhpzrucwdwicakwpu` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_twobgwseeqmwqkbaxlgcjnljjkxmmdkvicxu` (`name`,`sectionId`),
  KEY `idx_uxfbnfdcidwxzsfvwsnxavpetknmrzjvpkbo` (`handle`,`sectionId`),
  KEY `idx_cxsnddhfocjftugmqokjasithonuvknvqwzm` (`sectionId`),
  KEY `idx_inctsefcdmtwsxbpxsulywvnfhryboufxdxv` (`fieldLayoutId`),
  KEY `idx_wdljfmofskjgzrrsewsjihhuavckgpvubird` (`dateDeleted`),
  CONSTRAINT `fk_ajupppmhyqmwlfncprfzprwbyhpnitwtaymd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yygybyfyhsxuttxuasilsbvzkqmccuhjsbxb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tczditvtxaprngprytfehfhqwlskmfizojyz` (`name`),
  KEY `idx_jticianawdguqbvamyfixraginwmywvqjcol` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lvzracqhfibuoqtlwfxesscaowfpmobbhxzu` (`layoutId`,`fieldId`),
  KEY `idx_txqxbudnfthpflpnmxtejmklmensnaaoskmv` (`sortOrder`),
  KEY `idx_vtmvmtnjydlrgsorgiwgkkqjfvcydmunjaov` (`tabId`),
  KEY `idx_mcxbfwxpuncgzmwxbtrsdjqpulneqyuhwpwp` (`fieldId`),
  CONSTRAINT `fk_csiaqmcnoyacibetaczmwnwrqxrcchdhplws` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nblhfndmoofoaqkoojekmcpkwmyunxdxbgra` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xagamufivliaozmttqcusgswjketolhugvum` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hoxvvjjkbvbfsalqsqvdfbkwmybqunengmoh` (`dateDeleted`),
  KEY `idx_xlxtblqhohwietbxlcvchdqfcbpaekxeaxgd` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uhxrspwvypkkoieitgyqygchvsqrtxzzwhyb` (`sortOrder`),
  KEY `idx_zuiuwjwqavitbnfqafjmekbsmlrewbjjlmjk` (`layoutId`),
  CONSTRAINT `fk_zxobcbihxekjkqyxuirrjokzpeyletztmkgz` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_khpbtfwwphicgnmkvftdxifgyeuqkbgultqu` (`handle`,`context`),
  KEY `idx_hrmxkwypsyfzcigwvjjojpqbjyjqkbnnunuj` (`groupId`),
  KEY `idx_bqboorsqsvrqawjfwrdfwgzohcgormiipnuc` (`context`),
  CONSTRAINT `fk_mguprerhnqkmcairsnntpxwiwaodwyrlicew` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_buhramevbjfbxesldvzjvhlgrkpkgtrrhass` (`name`),
  KEY `idx_eynhhrjluklmbnyykjqcsaxntkmnjpvnuttz` (`handle`),
  KEY `idx_yvsdvbqcygbcawdekeyxbbfcfaiznlfxrdxb` (`fieldLayoutId`),
  KEY `idx_tftvzxronvbxdojbbmnaparjirznrisjbkrj` (`sortOrder`),
  CONSTRAINT `fk_rwgxspwvjorrzmksmuajbnbyuzlunjfxdlqn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xjbykjprtaphkdreksdsmbfnbubavqtmiscr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ujkqrcahfgpujdrprevriosuhoxjnckwqlwy` (`accessToken`),
  UNIQUE KEY `idx_udzzvtavtjsydjsqexeqpagyyzkbghamojnq` (`name`),
  KEY `fk_wxmoqvkqeevvyumyxzbhqujgffeoolcsgyot` (`schemaId`),
  CONSTRAINT `fk_wxmoqvkqeevvyumyxzbhqujgffeoolcsgyot` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_inhlunrouarsgjjsblwbrxcjgthrdjfolaun` (`ownerId`),
  KEY `idx_zrgdafnymnenjfniivcygfpcbmavhujamrtf` (`fieldId`),
  KEY `idx_quvqjqygnawwicvdmdreetyxlsvqeldastwa` (`typeId`),
  KEY `idx_oflxwinzjbmjdkfanlfzitsqvqgmkgrcrbje` (`sortOrder`),
  CONSTRAINT `fk_bmdcvkusfvcjhlqogyvwpebyvgwvdyviouzx` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fgqzopvpvhuxltdfhqrphwtfpafquxernlhv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ovswbllqgmswhltequbhiaeilvnfxoioqwis` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qhcdlazngacqrapwpoybfvmntddtsdyjpoad` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_axrmgsxzhrxtwvudyhomhszqitcngjkmxsfe` (`name`,`fieldId`),
  KEY `idx_nromvbxcbwptegtqznthsraviofsakdtezqf` (`handle`,`fieldId`),
  KEY `idx_bbtzmpojzswinzapeofsvidijmqeyztfgpzk` (`fieldId`),
  KEY `idx_jkcwxdbdeymzjrjdvrljidusfrwrdzxtgmrj` (`fieldLayoutId`),
  CONSTRAINT `fk_bgerxzzxwzruzjnjfahlxkfhmrpctezwcnuc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gjcexvwoxwgcnravpbkiphfvvekietcmsrdd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hbklysfseklfgftgzgdryjpepmlqxmxvtcmn` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_elashazjmmibmcusbspxxwwbyavrcrpivbmc` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pfujjiqxqckuwovaigsqtwbzrkcxlvgoxqxv` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_wdpoykbhgfrrextykqpdkxmrcpoynafsfaru` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iwwngqfyehpprakxtihvrjtwhsnlawjcmzku` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_srlzigjotnymavknylnqlygasxealoqotgnk` (`sourceId`),
  KEY `idx_tfnksaerltsrjjnlkeurfvnhzdaidgxaftak` (`targetId`),
  KEY `idx_asngyujfrhcbqosjmelslcjbcmgfnfdwssll` (`sourceSiteId`),
  CONSTRAINT `fk_lzeterdkhlegpxucfonwpkdmjieveldxrnst` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vtbzxpuujcytjnbawlvskpomroqdkdekvakz` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wxqaafgowuufnoujixbpcprabkzmcjdswvdg` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rkdfebjoshnqmlbdcylsuiajuypidzexqxuw` (`sourceId`,`num`),
  KEY `fk_dddsbgmuqxtsmjhjirifiyflsyhbbuyugrnf` (`creatorId`),
  CONSTRAINT `fk_dddsbgmuqxtsmjhjirifiyflsyhbbuyugrnf` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tvqceprkzvhyiodlobddvudfuyzuhbtegzsi` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_lvvmzxghemnpdhylqqoudhqspwlokmohweiv` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mdtsigqjbjwbjavlnxrchkqdsgxtnaounfsd` (`handle`),
  KEY `idx_zfgruymkdgpuzfzpipnzylpulvgeskprfdgp` (`name`),
  KEY `idx_wsyooesvmoqtrwauutsdroscboojvscnkgvr` (`structureId`),
  KEY `idx_alyibtaxlggtgnajjoqvkpyetbfizwytbqko` (`dateDeleted`),
  CONSTRAINT `fk_tgngzewsvtmhsntdmypzrcwsiaunrqkjrryz` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_smeavjxdflwuszeqeawicyvixqfvxhqufhss` (`sectionId`,`siteId`),
  KEY `idx_njatjmevvwfvmzxsogxfiljqszdywnnbfaak` (`siteId`),
  CONSTRAINT `fk_wmcoawxdadailyrsljedffgmnddcinumvirh` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkakdueegqqkrcphoslirizgyelffitvzezq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uvzcqcpvfhioqptipvpqbruqvjjuqqrzdzmg` (`uid`),
  KEY `idx_oiebojvphzpjpdytcdygiqirgsczkccidhgg` (`token`),
  KEY `idx_jpugpkkjgvztqbmoshzjdpgbkkkhxphuifav` (`dateUpdated`),
  KEY `idx_itryiaealfwssigtctwsdvbfndtmrnzunqbq` (`userId`),
  CONSTRAINT `fk_kvqnakogcvuehecpvvjrddtclmbkerlyaetf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nzrptbhdfzrsdzhywcolkbcrwsmwbcweearj` (`userId`,`message`),
  CONSTRAINT `fk_kkhaelmtckhtodigbnyngdaaegdwgbwpozwc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_khaxiapvkuojlripfcxiqziycnfkwrpytgzy` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lnwgnypppqlleizazwjwoctmcbkraxdocsyi` (`dateDeleted`),
  KEY `idx_fjfgmqrbflfzeojbnbutfivajjqrgffqworu` (`handle`),
  KEY `idx_myuhiqloipcvnivngtswhmffnmtzqtoreaol` (`sortOrder`),
  KEY `fk_axkbxeyvfwvrxmyjoiuxptmpyuajfwbnwqhf` (`groupId`),
  CONSTRAINT `fk_axkbxeyvfwvrxmyjoiuxptmpyuajfwbnwqhf` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hxbzslzwxjhhyhbtsfajmvkhlsybsayvzhzf` (`structureId`,`elementId`),
  KEY `idx_ldieqzjajsqplruxshjvprokvgsfkvisooqh` (`root`),
  KEY `idx_gnwnovjnxxbdlvnctxtckltfsgzlpzujcljv` (`lft`),
  KEY `idx_pgcqhkkiiewrpshspgfudyxyugnzwemmkvxp` (`rgt`),
  KEY `idx_qsgufopemzogwlvsstspiahweinkdbhpnets` (`level`),
  KEY `idx_umkiqtymdnpwhdenxyvgmdlyuydzetkwjcgf` (`elementId`),
  CONSTRAINT `fk_qdbrwvivsufalzimoryamtddsjlocflotmmd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dcsuqyrotuipkddctylqooppsnbegrpahttr` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mmawonycjmxzexrrmnyarjnqbgutcigqxfwa` (`key`,`language`),
  KEY `idx_ratmkualcufigfkbjvxwkpkqujgwnadkyvuz` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mgrauydbzifprifcwqbefcfbwtalbobvgycw` (`name`),
  KEY `idx_smdxvcslnxmxjgazylmmyoleritviizpklmh` (`handle`),
  KEY `idx_gzfonuwjvyghlushzgbituqmgksunmedaepo` (`dateDeleted`),
  KEY `fk_pxvcoemvqhitzaqbozoajqopggpeiigvxvxj` (`fieldLayoutId`),
  CONSTRAINT `fk_pxvcoemvqhitzaqbozoajqopggpeiigvxvxj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ikllwlywwsicplwwuawvjvearydslxoteclw` (`groupId`),
  CONSTRAINT `fk_iiiaybjdjaufoiovubmsmscdbgbgfvielusg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_neewbpgunamvjrexqeqzqbngfaenbwrdgaqh` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pdvubwwzdxmsdjcwzohuvzajdscovfshckma` (`cacheId`),
  KEY `idx_jslsqyvklpvufivzclooodrsidhjwriacuqa` (`elementId`),
  CONSTRAINT `fk_rqrqkrqjswqpprypkpyfoqbgfrjqlmnydalx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ubnjlevszytqxijymccpzwyitlkmugmdxbvn` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lrfvgaupejuguwfvuqhggmiuntlssmesuvxm` (`cacheId`),
  KEY `idx_jrvefcgywbmquojokafoclemzfbhqonpbkpl` (`type`),
  CONSTRAINT `fk_vghrjwqnlsrllbazlclhawzwhovifetutjea` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_klahyzpugvqifvefvhqxjiqrdypifsrgoaoo` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_szfnptnwwtnaevnzvwmtzfxlzzitighyeahv` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_hsygxtjqiuwioekdecuupxoehwpqcfztukie` (`siteId`),
  CONSTRAINT `fk_pzlxiggtriajinbzhxaxjuxbxoxjypxinbwj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lmdvkaqhsnmmoyjnpamsprygrkwqhjqinexx` (`token`),
  KEY `idx_hbjvqlmbuasbrixetvofdlmwmsymnwwayswg` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_daxbmxrxtnsiywcfgpsmaieqfsrqiuiysdlp` (`handle`),
  KEY `idx_kxlakhiqmezsfvqiwxekkmvmtqkrnybtzrqy` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_apleqriysvvhblkrxnhvyvmyxgomzzbpsier` (`groupId`,`userId`),
  KEY `idx_dvggbzkmjmsunlnhmmkefqgujudqtbwexfnc` (`userId`),
  CONSTRAINT `fk_apurughnludsgvtjgqukpelamkfosjowunfo` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ymldjssavdnckbkczllvfjycaqiixcazwlmp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sojrfkkoydrfunthyklholtkvvvrcphjcizn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_exfxifrgdyvwlzmehjbhfoxklxueqdjsuvuc` (`permissionId`,`groupId`),
  KEY `idx_oevaaontpnecymxizkotfcblhzidmvokkryq` (`groupId`),
  CONSTRAINT `fk_ihxjdqiiisijpumnlhhhntrmnbrvystptzae` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xqqqegafdliipvildqmzfhwnzaneoalinqxc` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_glsxelxkijeqyalklgsijozuezyzauaagtkh` (`permissionId`,`userId`),
  KEY `idx_tnnfmkocrqhaiyhifpjwvqaalcotqljfvoez` (`userId`),
  CONSTRAINT `fk_frueplnfgvaeqzapdmukryrxzlnitsyaxgkg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpzgdulvfmnkplqqzjvfjifjfpmwhuimcbhv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_bwqbbfopvtvwwqgysmqtfbeawrwxedkjpfkz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jgoolcvalckwyqrxoccarvfeeztpbvqlcrgl` (`uid`),
  KEY `idx_uvfxmtggtptnpejiqdajfgvpdmwnghwahxuy` (`verificationCode`),
  KEY `idx_hpfnekeezkntwshodirxslgzqpsxltbpuigy` (`email`),
  KEY `idx_ubqdignapqfqzuhavockwgxngrwsgccmscyw` (`username`),
  KEY `fk_nrsjsbiizmnhyoroihnipgfqlpndzatzlcxa` (`photoId`),
  CONSTRAINT `fk_nrsjsbiizmnhyoroihnipgfqlpndzatzlcxa` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xqginnnnvopmreyhtdlldwvojzxtytjxbtrb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vshyzqyyuqtpekgrzqhqdegfpnhfcmlhrtyc` (`name`,`parentId`,`volumeId`),
  KEY `idx_scwhlbykceqrgfuabjqpfsykjbqdyzfynnoa` (`parentId`),
  KEY `idx_xgplvzvcbcigwmzrpsgmgjrrgtqblczokuqq` (`volumeId`),
  CONSTRAINT `fk_pciuknhxqtywfljubynuzipiqaryqsjgmaad` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfsygtmuejiqrsnfjokiehwhtxlxuobtaokc` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_htvsrsntjkgabbwleybvufaxbpxqynfybxij` (`name`),
  KEY `idx_uffmqwtgblirbjlqziuajaivvqzufwwfkleq` (`handle`),
  KEY `idx_ugglgcjtiwobvrhzkkvggltkncjnfbdcavne` (`fieldLayoutId`),
  KEY `idx_wdyrojdocbtjlxwscdoivjpemnretboensrj` (`dateDeleted`),
  CONSTRAINT `fk_hholnkildatpbizcrgggokvqnrephnsjxlca` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jqfopaxdanianzgqkfpxaasavuyloggfkndg` (`userId`),
  CONSTRAINT `fk_hexfsxuffgziaigejwgkfvwzfbnfyoqdqioa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-10 23:40:44
-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB-1:10.4.28+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_addresses`
--

LOCK TABLES `commerce_addresses` WRITE;
/*!40000 ALTER TABLE `commerce_addresses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_addresses` VALUES (1,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2023-08-08 23:50:20','2023-08-08 23:59:01','d01ad843-126c-4f63-a802-f1beba7731e4');
/*!40000 ALTER TABLE `commerce_addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_countries`
--

LOCK TABLES `commerce_countries` WRITE;
/*!40000 ALTER TABLE `commerce_countries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_countries` VALUES (1,'Afghanistan','AF',NULL,1,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','cb228ec5-4cf7-47d0-bed6-698abdb8c1b1'),(2,'Aland Islands','AX',NULL,2,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','78eb0890-57f2-4680-bdb6-6e2ed6c052f2'),(3,'Albania','AL',NULL,3,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','76491cbe-2520-4a55-ac0e-99f73cedcf53'),(4,'Algeria','DZ',NULL,4,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6c571d67-fbf6-430e-b43a-90d232fc640c'),(5,'American Samoa','AS',NULL,5,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a42e1272-5e56-4777-bde4-c6c927e33fd7'),(6,'Andorra','AD',NULL,6,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','35483f51-d3bd-4cc5-b9f4-28856f4ca2d1'),(7,'Angola','AO',NULL,7,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4cb6c273-5711-45d6-8359-737e4b31e40d'),(8,'Anguilla','AI',NULL,8,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a289f2e2-e23e-4c3e-b1c0-9c4dfbab958a'),(9,'Antarctica','AQ',NULL,9,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ab56dfb6-89de-4887-91bf-e78560d4294d'),(10,'Antigua and Barbuda','AG',NULL,10,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e301462f-2ace-41bf-bcf3-a9c625e2d3bd'),(11,'Argentina','AR',NULL,11,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','fb6d0511-0654-4d31-ad9f-019f792889f8'),(12,'Armenia','AM',NULL,12,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c388cd48-47f0-46d2-a103-47318590e7e8'),(13,'Aruba','AW',NULL,13,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6a588a9b-9864-40b1-8f58-20a092fb5aef'),(14,'Australia','AU',NULL,14,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','640ce6c7-88ba-4580-89e5-583854fc2970'),(15,'Austria','AT',NULL,15,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','65f8f430-ae44-4d51-a801-66639a960250'),(16,'Azerbaijan','AZ',NULL,16,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','66303ef9-86de-4f3f-8473-c26c9ac0e966'),(17,'Bahamas','BS',NULL,17,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','51392fd3-94d5-413c-b6e3-1359bec8abd4'),(18,'Bahrain','BH',NULL,18,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','955d2e48-1e5e-4e64-8fee-4d85ad5c47bb'),(19,'Bangladesh','BD',NULL,19,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','96af544d-46e1-4be6-817a-3428bf3767ab'),(20,'Barbados','BB',NULL,20,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5e82ec3e-e34d-43e3-a8fc-281df2b9d3a0'),(21,'Belarus','BY',NULL,21,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','377646f9-489e-4adc-85cf-fc151b4645d0'),(22,'Belgium','BE',NULL,22,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a9957150-3e46-4117-bd80-faa6be0d720d'),(23,'Belize','BZ',NULL,23,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','01ad39e2-e997-47a8-8099-36139ed331eb'),(24,'Benin','BJ',NULL,24,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','73345db9-3be1-47a8-8020-fd20f5be52e5'),(25,'Bermuda','BM',NULL,25,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','633c3f85-086d-4e04-b19d-186b858c328a'),(26,'Bhutan','BT',NULL,26,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ac8d5683-76e7-496f-aa02-1e3251c7da87'),(27,'Bolivia','BO',NULL,27,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','567a2670-7fd1-4777-a78d-c80eab62f839'),(28,'Bonaire, Sint Eustatius and Saba','BQ',NULL,28,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2ee4af47-2f30-4091-a6ca-623169feca11'),(29,'Bosnia and Herzegovina','BA',NULL,29,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4591794a-3b5f-4626-b97f-42da0f3952f4'),(30,'Botswana','BW',NULL,30,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4d3a1f1c-d4b3-4674-b093-7ae30b40ea3a'),(31,'Bouvet Island','BV',NULL,31,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d4361512-077b-46f1-89b7-f07ad089e28e'),(32,'Brazil','BR',NULL,32,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','9dbc80c9-c950-45e9-90a2-337b9f96aec7'),(33,'British Indian Ocean Territory','IO',NULL,33,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','81b3602e-a6bd-43ab-8cac-cd33af399783'),(34,'Brunei Darussalam','BN',NULL,34,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','18b74f4c-f5c3-42cb-8d75-aa8a8cc88721'),(35,'Bulgaria','BG',NULL,35,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','8d147c37-44a1-4dfd-85f4-ea897042be1e'),(36,'Burkina Faso','BF',NULL,36,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7a107ebc-0e2d-4218-83ff-38d336e73d31'),(37,'Burma (Myanmar)','MM',NULL,37,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','576ff918-c8a4-45bb-b73f-8dcab5811cdd'),(38,'Burundi','BI',NULL,38,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','41c94402-7c8a-496a-81b3-dcbf194956c3'),(39,'Cambodia','KH',NULL,39,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','340476b5-67a6-4d4f-bbe7-7f65ff7afc4b'),(40,'Cameroon','CM',NULL,40,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e0121ffa-19e6-4697-a9b7-be27f56858ed'),(41,'Canada','CA',NULL,41,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','af250bec-f9b1-4505-a2b4-0b1be4842ae6'),(42,'Cape Verde','CV',NULL,42,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f97a7692-f37a-438f-84f5-b6e6f906fce6'),(43,'Cayman Islands','KY',NULL,43,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','0ac6d2ac-6d14-4528-9ef2-a10d8441938f'),(44,'Central African Republic','CF',NULL,44,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','02968041-b06c-4ec1-a02a-20f8f63bc289'),(45,'Chad','TD',NULL,45,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f54f2de6-b206-4c1d-86bb-ff7601c57303'),(46,'Chile','CL',NULL,46,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a4730e00-fa0f-46e8-9351-f94d2730150c'),(47,'China','CN',NULL,47,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','11df2212-a8c9-40b5-95b7-f9e8520bba31'),(48,'Christmas Island','CX',NULL,48,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c79d65d2-5c2b-4d6d-a7ac-8f154664cd07'),(49,'Cocos (Keeling) Islands','CC',NULL,49,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','51b9d5d7-2ed6-4c3c-a535-17c9b2f7afea'),(50,'Colombia','CO',NULL,50,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f76ca11a-5732-43f1-be6a-469ae0e4ca8d'),(51,'Comoros','KM',NULL,51,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','9babd2fb-548b-4956-9873-32f26424eb35'),(52,'Congo','CG',NULL,52,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','75f3fbc9-d5ec-4633-8173-c993043ab645'),(53,'Cook Islands','CK',NULL,53,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a5f35eba-4b2d-4cd4-92f2-0dd8036b873a'),(54,'Costa Rica','CR',NULL,54,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','94b4becb-c004-447c-a342-cb4df5e564ac'),(55,'Croatia (Hrvatska)','HR',NULL,55,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d13644f4-5a32-4df5-b921-36877a9cbbaf'),(56,'Cuba','CU',NULL,56,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3544c9e9-3ee2-4b02-945f-3194f206d271'),(57,'Curacao','CW',NULL,57,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','257f0a3f-e150-4e7c-a7ea-d732e8cc8153'),(58,'Cyprus','CY',NULL,58,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5356b7d1-5152-4d72-9dc7-9720b1f252fe'),(59,'Czech Republic','CZ',NULL,59,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','33114607-491c-410f-a3ac-f2da4f56b311'),(60,'Democratic Republic of Congo','CD',NULL,60,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','050ede73-2d55-46ea-929a-2a8c01dab506'),(61,'Denmark','DK',NULL,61,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','13787909-068d-4f1a-a2ac-eb6ddc60d5d3'),(62,'Djibouti','DJ',NULL,62,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f6001204-c916-4106-ae1f-b5c987227745'),(63,'Dominica','DM',NULL,63,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','bdc41e12-1a17-4573-a1fa-82d16a95751e'),(64,'Dominican Republic','DO',NULL,64,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','1a6619ee-dc2e-43c0-88a4-559b1e6ced1b'),(65,'Ecuador','EC',NULL,65,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ac0efa47-f34f-40ea-85b5-6c1e60229f91'),(66,'Egypt','EG',NULL,66,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','44a12d69-8263-4cc9-8b59-fbbbe805e32c'),(67,'El Salvador','SV',NULL,67,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6a74dd1e-30ec-4126-8eef-ed7027ca8252'),(68,'Equatorial Guinea','GQ',NULL,68,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e13d7faa-99fa-4081-871e-84050726fcc7'),(69,'Eritrea','ER',NULL,69,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a67ff05c-be75-46ef-87a0-91bf590af050'),(70,'Estonia','EE',NULL,70,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4a4ef579-7583-4ff9-8461-29bb8795ac10'),(71,'Ethiopia','ET',NULL,71,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e235717d-bbc1-4be0-98ab-646862651e25'),(72,'Falkland Islands (Malvinas)','FK',NULL,72,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','bd04993e-601d-4ae2-9972-45931505b140'),(73,'Faroe Islands','FO',NULL,73,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','cbc64874-70ee-4ef1-9073-fd5613825351'),(74,'Fiji','FJ',NULL,74,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e1b48787-136a-4e70-8dfd-85cd99d8226f'),(75,'Finland','FI',NULL,75,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a1b68edb-bc8d-4c0d-8cce-cbb36c493509'),(76,'France','FR',NULL,76,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','fa3e2c9b-8f4c-4260-a3eb-7dfc00db72c6'),(77,'French Guiana','GF',NULL,77,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','09faf96d-1e16-4d43-b295-6acdc70a454d'),(78,'French Polynesia','PF',NULL,78,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5eb9d470-84a2-49eb-ac0c-0fd25500788a'),(79,'French Southern Territories','TF',NULL,79,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','49f5426a-2a2d-425f-b0d2-d411f54e407a'),(80,'Gabon','GA',NULL,80,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c769f326-476d-4fe5-8279-d45b6f6c1695'),(81,'Gambia','GM',NULL,81,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d6ad721e-f7b4-4ff8-bffa-bbe79688670e'),(82,'Georgia','GE',NULL,82,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','198b3dc0-a5c5-4b80-bf71-47bc68aa0577'),(83,'Germany','DE',NULL,83,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','12c9d9d6-c77d-407a-8ed4-ac4b12049d39'),(84,'Ghana','GH',NULL,84,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3663656f-aff0-47e9-b900-321f43901f33'),(85,'Gibraltar','GI',NULL,85,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c49e0d19-8807-450f-a500-e4ef77584b0d'),(86,'Greece','GR',NULL,86,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f977cf7c-1d7b-49eb-b8d4-c6de2604f58a'),(87,'Greenland','GL',NULL,87,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','84fdc8e4-0cfb-404a-b34c-789ac1a4c7f5'),(88,'Grenada','GD',NULL,88,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6559b23f-fe66-4e48-a64b-11502abc493a'),(89,'Guadeloupe','GP',NULL,89,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ec6bc204-47ae-4825-a7c9-5ebf287df170'),(90,'Guam','GU',NULL,90,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d297cdc0-519f-4b52-b984-1af743012de2'),(91,'Guatemala','GT',NULL,91,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','430e79bd-323e-4174-a4b0-4b660b503a2b'),(92,'Guernsey','GG',NULL,92,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','927bb34d-7f33-4088-81a0-919e88bba73e'),(93,'Guinea','GN',NULL,93,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','b2a1d549-3e84-4a38-8837-d511c8f76ed6'),(94,'Guinea-Bissau','GW',NULL,94,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','96a8e4af-14cd-4ab8-b94e-10b95a66f708'),(95,'Guyana','GY',NULL,95,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7976b6a1-49c2-4237-9b6a-5dd93699889d'),(96,'Haiti','HT',NULL,96,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c592277f-58ac-4d5d-887e-bab69be86c18'),(97,'Heard and McDonald Islands','HM',NULL,97,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d5eac8e9-e23c-4a52-8351-e6708a8cab93'),(98,'Honduras','HN',NULL,98,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','486bd742-c0ed-45fa-bb31-43e625aa9130'),(99,'Hong Kong','HK',NULL,99,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','686d162f-57e3-4033-af84-8b75765ad882'),(100,'Hungary','HU',NULL,100,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','bd4e09fd-06d7-4815-a915-fb51c91570ea'),(101,'Iceland','IS',NULL,101,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ce5bff99-3ab7-4236-891c-7ae031789228'),(102,'India','IN',NULL,102,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','84c05120-6ea6-4d99-874b-0aab4adc0604'),(103,'Indonesia','ID',NULL,103,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','0bc4dc84-8d6d-471b-a72a-ff59adc39dd7'),(104,'Iran','IR',NULL,104,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ba99c39f-4c73-4084-ad2d-9fa9c350a4bf'),(105,'Iraq','IQ',NULL,105,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2939c561-b9e4-4f2c-a061-518ecf52f982'),(106,'Ireland','IE',NULL,106,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','89c16e1d-7270-4c03-9cb0-2bdaf75b0529'),(107,'Isle Of Man','IM',NULL,107,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2fca72e9-ddfa-4c72-8494-a3f8f0095049'),(108,'Israel','IL',NULL,108,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','50e3791b-498d-4a07-b2e5-a42dc46a3b6e'),(109,'Italy','IT',NULL,109,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e96a858c-6c56-4cd6-b9e2-e3f42230e068'),(110,'Ivory Coast','CI',NULL,110,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7240478e-28f6-4995-97f0-ffff98a039a6'),(111,'Jamaica','JM',NULL,111,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2153cc2e-9331-49e8-bf16-eae43764804a'),(112,'Japan','JP',NULL,112,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','0eeaf5a0-6b27-42fb-bf53-12dd34f1159e'),(113,'Jersey','JE',NULL,113,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','59aa9880-c242-4fff-b8c6-1ee4be816078'),(114,'Jordan','JO',NULL,114,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e049ff3a-83d8-4c7c-af96-5864002a8421'),(115,'Kazakhstan','KZ',NULL,115,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f49eff27-6643-4d64-b33e-900745313112'),(116,'Kenya','KE',NULL,116,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','136e36e5-094a-4a5c-bde7-bf3fa69b715b'),(117,'Kiribati','KI',NULL,117,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c78cad90-f9e2-43a0-90e0-8960212b03af'),(118,'Korea (North)','KP',NULL,118,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','12c3e1a2-5f5c-4f77-a4c7-a7e1d646724a'),(119,'Korea (South)','KR',NULL,119,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','406afb87-1d3a-4300-94af-c18c704ebe76'),(120,'Kuwait','KW',NULL,120,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','9d674e97-ba38-4d82-bff8-a930cc4f3c90'),(121,'Kyrgyzstan','KG',NULL,121,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3b0cd8a0-a054-4e86-ae62-64011461560f'),(122,'Laos','LA',NULL,122,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','28d122fd-f5d4-4a8b-801b-54df342580da'),(123,'Latvia','LV',NULL,123,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','58c8f909-4eb1-48e0-b1c3-340e55bcdf9c'),(124,'Lebanon','LB',NULL,124,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','532cac2f-31e1-4a6f-aad7-0a2d5eb0c4a0'),(125,'Lesotho','LS',NULL,125,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ac59eed4-15db-4548-96c8-725b2612317f'),(126,'Liberia','LR',NULL,126,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e687911c-7ddd-4255-b645-5146f5dd230d'),(127,'Libya','LY',NULL,127,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5c65740c-d29d-4e92-9b95-627468be20d5'),(128,'Liechtenstein','LI',NULL,128,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4dc3ea12-b311-4ca2-aced-3ee516bdae81'),(129,'Lithuania','LT',NULL,129,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c2843a53-0f7a-4e10-bb35-417e2dbd4367'),(130,'Luxembourg','LU',NULL,130,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','37256b99-774a-4b12-8185-4d200bf594a6'),(131,'Macau','MO',NULL,131,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6b3a3645-d159-4ddd-a1e0-842a524c96b1'),(132,'Macedonia','MK',NULL,132,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','978a90dc-aa5c-4d88-9b64-6f0dac0d626a'),(133,'Madagascar','MG',NULL,133,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d5717626-7ffa-42ab-8a79-6307e184455f'),(134,'Malawi','MW',NULL,134,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','bffabd7d-445d-416c-9131-c8c17f3471ba'),(135,'Malaysia','MY',NULL,135,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','22c01eb6-6966-4d4a-8691-a2d7bed1b9a7'),(136,'Maldives','MV',NULL,136,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','0ebc5ff0-f261-4bbe-89c2-d44154292b6f'),(137,'Mali','ML',NULL,137,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ae05557e-e1a5-4542-8d5f-2758b65c5f4f'),(138,'Malta','MT',NULL,138,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7a858b08-05db-476f-bcb4-e1dc005d436f'),(139,'Marshall Islands','MH',NULL,139,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ab2b480b-4720-4866-a52d-098bc74c7c70'),(140,'Martinique','MQ',NULL,140,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a9469557-6b73-4423-a8cb-c16467e4592d'),(141,'Mauritania','MR',NULL,141,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','766420ca-5850-44b1-abd5-85857a47dddc'),(142,'Mauritius','MU',NULL,142,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d363d0e0-7ea5-4987-8a6f-9652cdb0c47d'),(143,'Mayotte','YT',NULL,143,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','46387a3c-1154-406a-a90c-a00679cbdfcd'),(144,'Mexico','MX',NULL,144,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2bc4d08d-a143-4c3a-96fa-8c2348beda41'),(145,'Micronesia','FM',NULL,145,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','472f3d48-cc68-4eb5-bb61-e149f06e4796'),(146,'Moldova','MD',NULL,146,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3648f858-7fbe-4207-9674-f38a1432f116'),(147,'Monaco','MC',NULL,147,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c6ee846f-ba87-4a43-8ce1-a7911840c721'),(148,'Mongolia','MN',NULL,148,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7270021d-e01d-4c6f-ae3a-ab2e64acedd1'),(149,'Montenegro','ME',NULL,149,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7e6ce79f-2dbf-4c9a-a191-cb0883db82d1'),(150,'Montserrat','MS',NULL,150,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4d7e6909-4058-418e-b59d-f6a7ced70533'),(151,'Morocco','MA',NULL,151,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','39625644-4830-404a-9e4c-905a86052950'),(152,'Mozambique','MZ',NULL,152,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','1e31b5ed-50e6-4355-badb-4741527cda07'),(153,'Namibia','NA',NULL,153,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7cdd398f-b9fb-449e-88c4-c5fd54e99a3e'),(154,'Nauru','NR',NULL,154,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','bc8f171a-21f9-45ca-b7f8-4e9e9e53aedd'),(155,'Nepal','NP',NULL,155,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','27b63715-3388-46b1-8dce-1a57b6074ecf'),(156,'Netherlands','NL',NULL,156,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','64d05dc8-914e-4bdd-a43c-73ba529ecb46'),(157,'New Caledonia','NC',NULL,157,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','cb289f58-a2df-4a75-b703-f3726669d1c9'),(158,'New Zealand','NZ',NULL,158,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','67f115fd-b98d-4d24-acb2-88d5e9cab5de'),(159,'Nicaragua','NI',NULL,159,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','889bd3a9-ca36-4b5f-8785-aa9009bb92ef'),(160,'Niger','NE',NULL,160,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','010f8b90-485c-42dc-93da-9cb585e47699'),(161,'Nigeria','NG',NULL,161,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','280c63b1-af40-491f-8856-9c828367a194'),(162,'Niue','NU',NULL,162,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2db46dad-d0bf-4275-a654-60e09f3be8bb'),(163,'Norfolk Island','NF',NULL,163,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3bc343db-2ec9-4963-8a0f-75c2c0763488'),(164,'Northern Mariana Islands','MP',NULL,164,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','56a9b086-48f4-41b8-ad9c-1fe82b7bdd07'),(165,'Norway','NO',NULL,165,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c75d57c2-8e99-48cb-8c77-8443c82e52e4'),(166,'Oman','OM',NULL,166,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','8365c5fa-e7f0-412a-be76-c64df666645b'),(167,'Pakistan','PK',NULL,167,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4028ec4f-a15b-413d-a4ca-f400dc4fde92'),(168,'Palau','PW',NULL,168,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','42210573-9196-46fb-b86d-930067b20b72'),(169,'Palestinian Territory, Occupied','PS',NULL,169,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','8ef9bba1-5fc7-4c3c-98e7-5046ca0c1464'),(170,'Panama','PA',NULL,170,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e6857eb7-6596-4bc8-90dd-ba2ee465bb49'),(171,'Papua New Guinea','PG',NULL,171,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3911e2b8-eb3c-46ee-ac10-46a21de12ab6'),(172,'Paraguay','PY',NULL,172,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','cb1d554f-2df2-4112-a195-1d5ed93477d0'),(173,'Peru','PE',NULL,173,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','59b29ccc-c47d-41f6-a498-d8f4a232857b'),(174,'Philippines','PH',NULL,174,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','79e00fba-b81e-4977-8cd1-1b4b1c70f19d'),(175,'Pitcairn','PN',NULL,175,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','73295f78-9f6f-4597-a228-5433c6ec9fce'),(176,'Poland','PL',NULL,176,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','48ef96d0-9601-4956-a86e-3a6e7e61b59a'),(177,'Portugal','PT',NULL,177,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f11f3251-9caa-42df-9846-93ad6f5d8fd0'),(178,'Puerto Rico','PR',NULL,178,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','26729541-590c-4925-9d3b-18e9efafa3aa'),(179,'Qatar','QA',NULL,179,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','aff28e55-5d3c-4e28-9dc0-3ab624bf9ee6'),(180,'Republic of Serbia','RS',NULL,180,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4922f549-e07f-4274-a8dd-08484ebc8809'),(181,'Reunion','RE',NULL,181,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','373447b0-57d8-42f4-8c98-b25d095bcd72'),(182,'Romania','RO',NULL,182,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4102f97f-3509-44ae-aff3-36b55b6343c7'),(183,'Russia','RU',NULL,183,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','954cb126-4db3-4154-83c1-bd66e2ed9469'),(184,'Rwanda','RW',NULL,184,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6f10412b-c843-453d-9859-b009058b15c5'),(185,'S. Georgia and S. Sandwich Isls.','GS',NULL,185,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','497d00f3-bef5-4941-9363-5ac93df1528b'),(186,'Saint Barthelemy','BL',NULL,186,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d06dbcd3-f7c4-40e9-a3a4-909ce9e7b9e0'),(187,'Saint Kitts and Nevis','KN',NULL,187,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e2fa0956-9b66-49ee-b9f8-42b031f5f84d'),(188,'Saint Lucia','LC',NULL,188,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5d889f6f-e599-42a6-b74a-4a09f5ca4c9f'),(189,'Saint Martin (French part)','MF',NULL,189,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4ba213a8-8a62-410e-9168-6321c18410f3'),(190,'Saint Vincent and the Grenadines','VC',NULL,190,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a703fbfe-c162-4224-a351-5ddde92e2444'),(191,'Samoa','WS',NULL,191,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','65536e03-0dcb-4a98-908d-bdcccfdec811'),(192,'San Marino','SM',NULL,192,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2c790975-7822-4735-aeec-4aad8597522d'),(193,'Sao Tome and Principe','ST',NULL,193,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','08aab7e1-5022-4686-8183-e3084bcfe230'),(194,'Saudi Arabia','SA',NULL,194,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','fcc86264-1939-4cd6-9e27-faf671517000'),(195,'Senegal','SN',NULL,195,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','89b4b546-7ea1-434a-9e8a-75365774fb1c'),(196,'Seychelles','SC',NULL,196,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c4937d76-79eb-4006-9c53-5c31f595b017'),(197,'Sierra Leone','SL',NULL,197,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','87d0d0d9-5593-487c-830e-27f31b07af71'),(198,'Singapore','SG',NULL,198,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','1a86db36-4914-4d8c-84ef-0b9ca48ac906'),(199,'Sint Maarten (Dutch part)','SX',NULL,199,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','24eacbc5-f396-4d05-aad7-342716e8bc53'),(200,'Slovak Republic','SK',NULL,200,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5bb14685-b34e-4b9a-a367-72312cdf74f0'),(201,'Slovenia','SI',NULL,201,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','33568843-20d8-4cce-8da4-8c34de6dc64a'),(202,'Solomon Islands','SB',NULL,202,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3768a81d-27a0-49cd-b009-5ec0f10c0116'),(203,'Somalia','SO',NULL,203,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','fb052a71-2150-4f0e-a828-22a7b1dfc343'),(204,'South Africa','ZA',NULL,204,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2ace6f8a-5bd3-45d8-a045-a5878f4e7efa'),(205,'South Sudan','SS',NULL,205,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','79996f9f-daf1-4dde-9cc5-534a07b8f7d8'),(206,'Spain','ES',NULL,206,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','b776ee43-9309-4d08-8111-58297d191c27'),(207,'Sri Lanka','LK',NULL,207,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','07f41171-b5b2-4f7e-bb28-66db3f08145c'),(208,'St. Helena','SH',NULL,208,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','07b648e2-3aeb-4ce0-813f-b50709713245'),(209,'St. Pierre and Miquelon','PM',NULL,209,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','83f629fb-10a8-4eab-8515-568acbd76444'),(210,'Sudan','SD',NULL,210,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5b897539-c42c-4fcd-8f2e-481badd139a6'),(211,'Suriname','SR',NULL,211,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','8af286f4-560a-4623-8ae3-e6d93de7c7b1'),(212,'Svalbard and Jan Mayen Islands','SJ',NULL,212,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','11a08280-c3a2-4c34-8fd4-78c6966163e1'),(213,'Swaziland','SZ',NULL,213,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2b6451da-2b75-400e-a614-78a12c2425aa'),(214,'Sweden','SE',NULL,214,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a350e55c-5c70-4e17-9e0b-d85939b30010'),(215,'Switzerland','CH',NULL,215,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','148e7900-ed9d-4da6-83ae-2e131c280c71'),(216,'Syria','SY',NULL,216,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a8376c0a-0c65-4470-aaed-a135ad4f4bb3'),(217,'Taiwan','TW',NULL,217,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','b2b95c20-69ba-4024-974d-fe2d0782c0b5'),(218,'Tajikistan','TJ',NULL,218,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','dc42ec3a-8421-4d2d-b4c4-0995f332ed14'),(219,'Tanzania','TZ',NULL,219,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','02eb58ff-bc35-4a87-95ad-786e92abfba6'),(220,'Thailand','TH',NULL,220,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','39a68a83-7e5c-4b46-83d8-d9adf207945d'),(221,'Timor-Leste','TL',NULL,221,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','1b9e53bb-f080-4c95-bd5a-f981a1128073'),(222,'Togo','TG',NULL,222,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','64936533-e750-4da1-8401-dfb77abe619f'),(223,'Tokelau','TK',NULL,223,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a871a999-a434-4451-a24f-1a53ab38116b'),(224,'Tonga','TO',NULL,224,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','dab72971-cb0a-4546-a10f-3a270168141b'),(225,'Trinidad and Tobago','TT',NULL,225,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','78668bbe-0245-4cd7-9189-38e3a3bed793'),(226,'Tunisia','TN',NULL,226,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6907c985-8c25-49a0-8ff8-39f981887767'),(227,'Turkey','TR',NULL,227,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5bdfa036-d0f0-4e36-ba3c-e6d74ba4d886'),(228,'Turkmenistan','TM',NULL,228,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','88e118d2-a2ad-439e-86f0-6ad6fcc6fed2'),(229,'Turks and Caicos Islands','TC',NULL,229,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','93f356d8-f227-45b2-9cbc-9757c3cc83a1'),(230,'Tuvalu','TV',NULL,230,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','cd011f94-3bdf-4219-b7c8-9f206fbc142a'),(231,'Uganda','UG',NULL,231,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','fb639f4d-c826-43fb-b477-3cab33a13785'),(232,'Ukraine','UA',NULL,232,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4df81d73-f3c7-4766-8f1f-07591406f100'),(233,'United Arab Emirates','AE',NULL,233,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','1d85c0a5-c492-4107-b471-abfe59ccaac6'),(234,'United Kingdom','GB',NULL,234,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','9b21d324-f444-412f-90a1-9ea54ca87861'),(235,'United States Minor Outlying Islands','UM',NULL,235,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','58aab8a5-37dc-4bc7-95a5-5cd261fdf390'),(236,'United States','US',NULL,236,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','13820ef8-2a7c-49e5-b3a9-357a4ef4192e'),(237,'Uruguay','UY',NULL,237,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2459bd40-2603-4fc0-9056-8700760885b9'),(238,'Uzbekistan','UZ',NULL,238,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','df4d37bc-8c63-4dfa-a98c-d2c8443ac94e'),(239,'Vanuatu','VU',NULL,239,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','248431b2-374c-4ea2-a2af-0c1caedcebb1'),(240,'Vatican City State (Holy See)','VA',NULL,240,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','9301cbb0-ad72-4add-8934-f62300fc090e'),(241,'Venezuela','VE',NULL,241,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','116b67f3-559a-4af5-8031-61eaad1e9550'),(242,'Viet Nam','VN',NULL,242,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6affa1dc-9ce2-4aed-8ea4-a0fb7a38ed37'),(243,'Virgin Islands (British)','VG',NULL,243,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c93e7d64-1b04-4ce3-8b5f-a4161b4abe74'),(244,'Virgin Islands (U.S.)','VI',NULL,244,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ac41a9d2-3bb4-43fc-876b-bce4299ab594'),(245,'Wallis and Futuna Islands','WF',NULL,245,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c215294f-ffb4-48a5-8f5b-35f101a4b858'),(246,'Western Sahara','EH',NULL,246,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a958a044-12da-4361-8555-a4e1b57a4b80'),(247,'Yemen','YE',NULL,247,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','67284512-55bc-462a-9793-ce5b34481d0c'),(248,'Zambia','ZM',NULL,248,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','47b2f537-baea-4163-9a61-0e4b0f259cd5'),(249,'Zimbabwe','ZW',NULL,249,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','459469dc-a1cd-4e65-bb11-4597972d137c');
/*!40000 ALTER TABLE `commerce_countries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customer_discountuses`
--

LOCK TABLES `commerce_customer_discountuses` WRITE;
/*!40000 ALTER TABLE `commerce_customer_discountuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_customer_discountuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customers`
--

LOCK TABLES `commerce_customers` WRITE;
/*!40000 ALTER TABLE `commerce_customers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_customers` VALUES (1,1,NULL,NULL,'2023-08-08 23:48:17','2023-08-08 23:48:17','fd6d821d-c5e4-48cc-b23d-899dfa84cf54'),(15,NULL,NULL,NULL,'2023-08-09 16:39:57','2023-08-09 16:39:57','be297ead-327d-47e7-949d-9a52ba4b7033');
/*!40000 ALTER TABLE `commerce_customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customers_addresses`
--

LOCK TABLES `commerce_customers_addresses` WRITE;
/*!40000 ALTER TABLE `commerce_customers_addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_customers_addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_categories`
--

LOCK TABLES `commerce_discount_categories` WRITE;
/*!40000 ALTER TABLE `commerce_discount_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_purchasables`
--

LOCK TABLES `commerce_discount_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_discount_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_usergroups`
--

LOCK TABLES `commerce_discount_usergroups` WRITE;
/*!40000 ALTER TABLE `commerce_discount_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discounts`
--

LOCK TABLES `commerce_discounts` WRITE;
/*!40000 ALTER TABLE `commerce_discounts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discounts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_donations`
--

LOCK TABLES `commerce_donations` WRITE;
/*!40000 ALTER TABLE `commerce_donations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_donations` VALUES (2,'DONATION-CC3',0,'2023-08-08 23:47:46','2023-08-08 23:47:46','01b8340a-637f-4a73-add8-3b03062df426');
/*!40000 ALTER TABLE `commerce_donations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_email_discountuses`
--

LOCK TABLES `commerce_email_discountuses` WRITE;
/*!40000 ALTER TABLE `commerce_email_discountuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_email_discountuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_emails`
--

LOCK TABLES `commerce_emails` WRITE;
/*!40000 ALTER TABLE `commerce_emails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_emails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_gateways`
--

LOCK TABLES `commerce_gateways` WRITE;
/*!40000 ALTER TABLE `commerce_gateways` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_gateways` VALUES (1,'craft\\commerce\\gateways\\Dummy','Dummy','dummy',NULL,'purchase',1,0,NULL,99,'2023-08-08 23:47:46','2023-08-08 23:47:46','383b942f-b795-4168-92c3-e6231731049c');
/*!40000 ALTER TABLE `commerce_gateways` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_lineitems`
--

LOCK TABLES `commerce_lineitems` WRITE;
/*!40000 ALTER TABLE `commerce_lineitems` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_lineitems` VALUES (2,15,14,1,1,'Full-Size Dry Boxer','[]','d751713988987e9331980363e24189ce',70.0000,0.0000,70.0000,'FDB-001',0.0000,0.0000,0.0000,0.0000,70.0000,70.0000,1,'','','{\"productId\":\"13\",\"isDefault\":\"1\",\"price\":70,\"sortOrder\":\"1\",\"width\":null,\"height\":null,\"length\":null,\"weight\":null,\"stock\":\"0\",\"hasUnlimitedStock\":\"1\",\"minQty\":null,\"maxQty\":null,\"deletedWithProduct\":false,\"id\":14,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"isProvisionalDraft\":false,\"uid\":\"6cfaee97-5cfd-44b9-bf04-fa26d82b87ef\",\"siteSettingsId\":14,\"fieldLayoutId\":null,\"contentId\":13,\"enabled\":true,\"archived\":false,\"siteId\":1,\"title\":\"Full-Size Dry Boxer\",\"slug\":\"fdb-001\",\"uri\":null,\"dateCreated\":\"2023-08-08T16:47:46-07:00\",\"dateUpdated\":\"2023-08-08T16:48:19-07:00\",\"dateLastMerged\":null,\"dateDeleted\":null,\"trashed\":false,\"isNewForSite\":false,\"canonicalId\":14,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":\"https:\\/\\/pest-craft-3.ddev.site\\/shop\\/products\\/fdb-001?variant=14\",\"isAvailable\":true,\"isPromotable\":true,\"shippingCategoryId\":1,\"sku\":\"FDB-001\",\"taxCategoryId\":1,\"product\":{\"postDate\":\"2023-08-08T16:47:46-07:00\",\"expiryDate\":null,\"typeId\":\"1\",\"taxCategoryId\":\"1\",\"shippingCategoryId\":\"1\",\"promotable\":\"1\",\"freeShipping\":\"0\",\"availableForPurchase\":\"1\",\"defaultVariantId\":\"14\",\"defaultSku\":\"FDB-001\",\"defaultPrice\":\"70.0000\",\"defaultHeight\":\"0.0000\",\"defaultLength\":\"0.0000\",\"defaultWidth\":\"0.0000\",\"defaultWeight\":\"0.0000\",\"taxCategory\":null,\"name\":null,\"id\":13,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"isProvisionalDraft\":false,\"uid\":\"476a6d15-af22-40b1-b1ce-ab3eef79170f\",\"siteSettingsId\":13,\"fieldLayoutId\":null,\"contentId\":12,\"enabled\":true,\"archived\":false,\"siteId\":1,\"title\":\"Full-Size Dry Boxer\",\"slug\":\"fdb-001\",\"uri\":\"shop\\/products\\/fdb-001\",\"dateCreated\":\"2023-08-08T16:47:46-07:00\",\"dateUpdated\":\"2023-08-08T16:47:46-07:00\",\"dateLastMerged\":null,\"dateDeleted\":null,\"trashed\":false,\"isNewForSite\":false,\"canonicalId\":13,\"ref\":null,\"status\":\"live\",\"structureId\":null,\"url\":\"https:\\/\\/pest-craft-3.ddev.site\\/shop\\/products\\/fdb-001\"},\"onSale\":false,\"cpEditUrl\":\"#\",\"description\":\"Full-Size Dry Boxer\",\"purchasableId\":14,\"options\":[],\"sales\":[]}',NULL,'2023-08-08 23:59:44','2023-08-08 23:59:44','f98c5607-2305-41aa-bfb1-95593d372996');
/*!40000 ALTER TABLE `commerce_lineitems` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_lineitemstatuses`
--

LOCK TABLES `commerce_lineitemstatuses` WRITE;
/*!40000 ALTER TABLE `commerce_lineitemstatuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_lineitemstatuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderadjustments`
--

LOCK TABLES `commerce_orderadjustments` WRITE;
/*!40000 ALTER TABLE `commerce_orderadjustments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderadjustments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderhistories`
--

LOCK TABLES `commerce_orderhistories` WRITE;
/*!40000 ALTER TABLE `commerce_orderhistories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderhistories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_ordernotices`
--

LOCK TABLES `commerce_ordernotices` WRITE;
/*!40000 ALTER TABLE `commerce_ordernotices` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_ordernotices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orders`
--

LOCK TABLES `commerce_orders` WRITE;
/*!40000 ALTER TABLE `commerce_orders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_orders` VALUES (15,NULL,NULL,1,1,1,NULL,1,NULL,'089cd65314535a37fcdbd0277b2f2a2d',NULL,NULL,70.0000,70.0000,70.0000,70.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'unpaid','joshua.pease@viget.com',0,NULL,NULL,NULL,'USD','USD','172.24.0.1','en-US','web',NULL,NULL,'all',NULL,NULL,NULL,NULL,1,'2023-08-08 23:50:01','2023-08-08 23:59:44','8e971737-dcda-4520-aa5e-ac5a8e71ce3e');
/*!40000 ALTER TABLE `commerce_orders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderstatus_emails`
--

LOCK TABLES `commerce_orderstatus_emails` WRITE;
/*!40000 ALTER TABLE `commerce_orderstatus_emails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderstatus_emails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderstatuses`
--

LOCK TABLES `commerce_orderstatuses` WRITE;
/*!40000 ALTER TABLE `commerce_orderstatuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_orderstatuses` VALUES (1,'New','new','green',NULL,NULL,99,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2f40b566-21b8-41ba-9ab2-b8156f452f7b');
/*!40000 ALTER TABLE `commerce_orderstatuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_paymentcurrencies`
--

LOCK TABLES `commerce_paymentcurrencies` WRITE;
/*!40000 ALTER TABLE `commerce_paymentcurrencies` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_paymentcurrencies` VALUES (1,'USD',1,1.0000,'2023-08-08 23:47:46','2023-08-08 23:47:46','78fedb94-c285-49f6-943b-77f94427bcaa');
/*!40000 ALTER TABLE `commerce_paymentcurrencies` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_paymentsources`
--

LOCK TABLES `commerce_paymentsources` WRITE;
/*!40000 ALTER TABLE `commerce_paymentsources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_paymentsources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_pdfs`
--

LOCK TABLES `commerce_pdfs` WRITE;
/*!40000 ALTER TABLE `commerce_pdfs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_pdfs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_plans`
--

LOCK TABLES `commerce_plans` WRITE;
/*!40000 ALTER TABLE `commerce_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_products`
--

LOCK TABLES `commerce_products` WRITE;
/*!40000 ALTER TABLE `commerce_products` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_products` VALUES (3,1,1,1,4,'2023-08-08 23:47:46',NULL,1,1,0,'ANT-001',20.0000,0.0000,0.0000,0.0000,0.0000,'2023-08-08 23:47:46','2023-08-08 23:48:19','e955e0a6-413a-4910-a4c2-acb941f22ed4'),(5,1,1,1,6,'2023-08-08 23:47:46',NULL,1,1,0,'PSB-001',30.0000,0.0000,0.0000,0.0000,0.0000,'2023-08-08 23:47:46','2023-08-08 23:48:19','b56ce0e2-f3b1-40a3-a330-0fa5dcca6c43'),(7,1,1,1,8,'2023-08-08 23:47:46',NULL,1,1,0,'RRE-001',40.0000,0.0000,0.0000,0.0000,0.0000,'2023-08-08 23:47:46','2023-08-08 23:48:19','68af69f8-9742-4ece-aa71-cd6cfaf36d1a'),(9,1,1,1,10,'2023-08-08 23:47:46',NULL,1,1,0,'TFA-001',50.0000,0.0000,0.0000,0.0000,0.0000,'2023-08-08 23:47:46','2023-08-08 23:48:19','97cb6e9b-7767-4c54-a190-ccb6fa7eb50f'),(11,1,1,1,12,'2023-08-08 23:47:46',NULL,1,1,0,'LKH-001',60.0000,0.0000,0.0000,0.0000,0.0000,'2023-08-08 23:47:46','2023-08-08 23:48:19','3f0a8ff1-8423-49b9-81ec-125a51f3c67e'),(13,1,1,1,14,'2023-08-08 23:47:46',NULL,1,1,0,'FDB-001',70.0000,0.0000,0.0000,0.0000,0.0000,'2023-08-08 23:47:46','2023-08-08 23:48:19','e490303e-7a91-4a54-91a9-39022908048d');
/*!40000 ALTER TABLE `commerce_products` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes`
--

LOCK TABLES `commerce_producttypes` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_producttypes` VALUES (1,NULL,NULL,'Clothing','clothing',1,0,1,'{product.title}',1,'','','','2023-08-08 23:47:46','2023-08-08 23:47:46','5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd');
/*!40000 ALTER TABLE `commerce_producttypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_shippingcategories`
--

LOCK TABLES `commerce_producttypes_shippingcategories` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_shippingcategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_shippingcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_sites`
--

LOCK TABLES `commerce_producttypes_sites` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_producttypes_sites` VALUES (1,1,1,'shop/products/{slug}','shop/products/_product',1,'2023-08-08 23:47:46','2023-08-08 23:47:46','bc494e53-0acb-417d-a75c-942834dce227');
/*!40000 ALTER TABLE `commerce_producttypes_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_taxcategories`
--

LOCK TABLES `commerce_producttypes_taxcategories` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_taxcategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_taxcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_purchasables`
--

LOCK TABLES `commerce_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_purchasables` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_purchasables` VALUES (2,'DONATION-CC3',0.0000,'Donation','2023-08-08 23:47:46','2023-08-08 23:47:46','71de940e-9216-4de9-9d6e-807db8f1f32a'),(4,'ANT-001',20.0000,'A New Toga','2023-08-08 23:47:46','2023-08-08 23:48:19','47662650-27e0-40a0-a2c9-a8d8eba5f549'),(6,'PSB-001',30.0000,'Parka With Stripes On Back','2023-08-08 23:47:46','2023-08-08 23:48:19','933ab3c8-3f95-4857-b61a-f5ae5845e87f'),(8,'RRE-001',40.0000,'Romper For A Red Eye','2023-08-08 23:47:46','2023-08-08 23:48:19','44667fd8-26f4-4c6a-bb3c-31e029d06beb'),(10,'TFA-001',50.0000,'The Fleece Awakens','2023-08-08 23:47:46','2023-08-08 23:48:19','b1893bf7-ea35-4571-bc26-0ede2c9742da'),(12,'LKH-001',60.0000,'The Last Knee-High','2023-08-08 23:47:46','2023-08-08 23:48:19','8dc7b44f-468f-4f9e-b4c0-5a6e36c2e808'),(14,'FDB-001',70.0000,'Full-Size Dry Boxer','2023-08-08 23:47:46','2023-08-08 23:48:19','b7bcf789-49e2-435b-8113-d11653fcf0ef');
/*!40000 ALTER TABLE `commerce_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_categories`
--

LOCK TABLES `commerce_sale_categories` WRITE;
/*!40000 ALTER TABLE `commerce_sale_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_purchasables`
--

LOCK TABLES `commerce_sale_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_sale_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_usergroups`
--

LOCK TABLES `commerce_sale_usergroups` WRITE;
/*!40000 ALTER TABLE `commerce_sale_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sales`
--

LOCK TABLES `commerce_sales` WRITE;
/*!40000 ALTER TABLE `commerce_sales` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sales` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingcategories`
--

LOCK TABLES `commerce_shippingcategories` WRITE;
/*!40000 ALTER TABLE `commerce_shippingcategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingcategories` VALUES (1,'General','general',NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d699c322-b5c0-4de0-beea-be71c0c7bef6');
/*!40000 ALTER TABLE `commerce_shippingcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingmethods`
--

LOCK TABLES `commerce_shippingmethods` WRITE;
/*!40000 ALTER TABLE `commerce_shippingmethods` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingmethods` VALUES (1,'Free Shipping','freeShipping',1,NULL,'2023-08-08 23:47:46','2023-08-08 23:47:46','4c8e0654-64a6-4a17-90ce-69b1e09b7635');
/*!40000 ALTER TABLE `commerce_shippingmethods` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingrule_categories`
--

LOCK TABLES `commerce_shippingrule_categories` WRITE;
/*!40000 ALTER TABLE `commerce_shippingrule_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingrule_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingrules`
--

LOCK TABLES `commerce_shippingrules` WRITE;
/*!40000 ALTER TABLE `commerce_shippingrules` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingrules` VALUES (1,NULL,1,'Free Everywhere','All countries, free shipping',0,1,NULL,0,0,0.0000,0.0000,'salePrice',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,'2023-08-08 23:47:46','2023-08-08 23:47:46','b1da259b-e286-427d-a3a4-b57bcd3c6fb8');
/*!40000 ALTER TABLE `commerce_shippingrules` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingzone_countries`
--

LOCK TABLES `commerce_shippingzone_countries` WRITE;
/*!40000 ALTER TABLE `commerce_shippingzone_countries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingzone_countries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingzone_states`
--

LOCK TABLES `commerce_shippingzone_states` WRITE;
/*!40000 ALTER TABLE `commerce_shippingzone_states` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingzone_states` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingzones`
--

LOCK TABLES `commerce_shippingzones` WRITE;
/*!40000 ALTER TABLE `commerce_shippingzones` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingzones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_states`
--

LOCK TABLES `commerce_states` WRITE;
/*!40000 ALTER TABLE `commerce_states` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_states` VALUES (1,14,'Australian Capital Territory','ACT',1,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','01adcdb4-e3f1-4ff8-aba0-4b17e9fa1430'),(2,14,'New South Wales','NSW',2,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','827a254e-8e5b-463a-b15c-cd5b68c413aa'),(3,14,'Northern Territory','NT',3,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','10b77db9-e594-4bf3-9764-4862f5918712'),(4,14,'Queensland','QLD',4,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','61e282e1-16d4-4e3a-9677-ad44e554cc42'),(5,14,'South Australia','SA',5,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','88509048-64d6-43a5-8e43-777019c4b7f9'),(6,14,'Tasmania','TAS',6,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','56fc3355-7125-4aeb-af38-e56789773b80'),(7,14,'Victoria','VIC',7,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','527dda90-30e0-4889-8457-4c007a44ab35'),(8,14,'Western Australia','WA',8,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c832b0b8-510b-43b2-85e5-2829a3f67576'),(9,41,'Alberta','AB',1,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','172bdc68-096d-46d6-aea7-efc9df1d38f4'),(10,41,'British Columbia','BC',2,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5ed4c5bb-5d57-4b9b-996d-0faddd53ee53'),(11,41,'Manitoba','MB',3,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','9b91b5dc-b248-4e7a-8e60-71f2ef50816a'),(12,41,'New Brunswick','NB',4,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','19a3ac50-db22-489d-92b6-116ea6fbfded'),(13,41,'Newfoundland and Labrador','NL',5,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e293344b-dcec-4ebe-9726-c9f4c6e5c427'),(14,41,'Northwest Territories','NT',6,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','abc572a0-6de7-4e57-a3e5-6c6480a8b0f7'),(15,41,'Nova Scotia','NS',7,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','430df3d8-aef7-41ac-a2f1-8002c61c0060'),(16,41,'Nunavut','NU',8,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','af54b56a-ff3e-4cb7-9cd6-754f82bdf628'),(17,41,'Ontario','ON',9,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7d00afa0-cd0c-4e4c-88f9-e9e8e76b72ad'),(18,41,'Prince Edward Island','PE',10,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f7567cbf-a6e8-4e0b-837d-a50c0b442737'),(19,41,'Quebec','QC',11,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4b862fc1-a753-4840-8032-d061bd8336cc'),(20,41,'Saskatchewan','SK',12,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4a82e8e1-841d-4f8a-bdcd-60d4d4ca7434'),(21,41,'Yukon','YT',13,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','196bee27-8e71-474a-b8ee-b674ee9761e9'),(22,236,'Alabama','AL',1,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3b9b15d2-3112-44fa-83f8-0aee8efb0b1f'),(23,236,'Alaska','AK',2,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','0754a803-57d3-4553-9fa2-2c833eb559bc'),(24,236,'Arizona','AZ',3,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','598af4e1-d261-4a71-9f1c-c28c41381de5'),(25,236,'Arkansas','AR',4,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','4d55f783-7ce6-4dfd-9913-b4fa243edcbe'),(26,236,'California','CA',5,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3a19a5c9-e057-4ca2-afca-ebd834a59b25'),(27,236,'Colorado','CO',6,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','823e477d-6b72-4dd1-8609-dc66b7bb11b3'),(28,236,'Connecticut','CT',7,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','29688eec-c79c-4886-a058-c74c058724bb'),(29,236,'Delaware','DE',8,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','70b88241-dcf5-49b8-8eee-5c69cc0bb42f'),(30,236,'District of Columbia','DC',9,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','1a3c3142-b8a8-40d3-878f-bfcf3fd13182'),(31,236,'Florida','FL',10,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','8aca7ba4-fb38-4566-bbe7-efa5c03c8189'),(32,236,'Georgia','GA',11,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','77b1c24a-840e-4f69-9e63-aeba05603a96'),(33,236,'Hawaii','HI',12,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','7b6d1d1e-d5a8-4297-9984-23d4cb708a01'),(34,236,'Idaho','ID',13,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a0f01b62-eec9-4140-a418-02dce48a97ac'),(35,236,'Illinois','IL',14,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','b22a0295-812f-4278-8b9f-d329634351d0'),(36,236,'Indiana','IN',15,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3bfc3c75-76e8-4fa7-a29d-a0535ec0f7df'),(37,236,'Iowa','IA',16,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f080534f-41b4-49f9-9112-bef52fb05d84'),(38,236,'Kansas','KS',17,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c020c14a-3c72-4fe6-9af2-e642d8d7c572'),(39,236,'Kentucky','KY',18,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3b32e6ee-3572-4c24-809f-bb189cfde514'),(40,236,'Louisiana','LA',19,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','abbdfc62-7765-432b-a2a5-271cbb16ab96'),(41,236,'Maine','ME',20,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2ad11a20-523d-47eb-867e-27d7fbce80c4'),(42,236,'Maryland','MD',21,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','41aaa105-d353-49f0-94d6-51978f0e2e78'),(43,236,'Massachusetts','MA',22,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c7285d48-13b9-4d57-9158-90b0bb723f9d'),(44,236,'Michigan','MI',23,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','2e455e59-249a-469a-ad3a-1da372aad989'),(45,236,'Minnesota','MN',24,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','5e970670-abb1-4178-b1ac-6c3b75c6bc9c'),(46,236,'Mississippi','MS',25,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','f142c07e-97ae-451f-aec5-b5c266ead9f8'),(47,236,'Missouri','MO',26,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','25b1644a-5eee-4af3-9505-873d42fcff52'),(48,236,'Montana','MT',27,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','36818350-bd63-4182-a0df-441031408ff7'),(49,236,'Nebraska','NE',28,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ed4d29af-b6c8-4bcd-b9fd-61f67780a4a1'),(50,236,'Nevada','NV',29,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','8459b06e-d08b-4e5b-934f-872b2c29a8dd'),(51,236,'New Hampshire','NH',30,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','948092d5-c69a-4548-aa30-871ab032814a'),(52,236,'New Jersey','NJ',31,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','6cefa478-3b71-4b90-ac65-785aa3e8bcdf'),(53,236,'New Mexico','NM',32,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','409f0c12-a025-4be2-8d5c-90ed0774bfe1'),(54,236,'New York','NY',33,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c101625a-d338-4351-afe7-2df136923475'),(55,236,'North Carolina','NC',34,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3ca11f73-d1bb-47e7-9af6-64bb175ec95a'),(56,236,'North Dakota','ND',35,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','1cfd3d53-2dbc-4c85-9372-3285e0e9d4d2'),(57,236,'Ohio','OH',36,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','28fe4977-1a6f-455e-9b87-a587706a908d'),(58,236,'Oklahoma','OK',37,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','8f9abd04-ab23-425c-a7ef-b8ac37b080b3'),(59,236,'Oregon','OR',38,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','aea2cb1d-7ded-40a3-a5e0-bcbe0bdd4a89'),(60,236,'Pennsylvania','PA',39,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','66e3ead5-d5da-4d90-aab9-608e2c6dd9cd'),(61,236,'Rhode Island','RI',40,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','caf18bdf-3307-4f76-b170-4fc588cc1b19'),(62,236,'South Carolina','SC',41,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','64755d61-1f5a-4ece-825e-59e2dedcfb74'),(63,236,'South Dakota','SD',42,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ccc2561e-b75d-45a8-8e72-98e7d689ca3d'),(64,236,'Tennessee','TN',43,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c8e69572-6b66-4eac-ac11-06bab168f400'),(65,236,'Texas','TX',44,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','057088b2-8fb2-4be1-9165-33e117486fb7'),(66,236,'Utah','UT',45,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','52577b02-5efe-434f-9993-a4a9fb976e35'),(67,236,'Vermont','VT',46,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d502b8f8-57af-4986-92fc-d7cf2f1d92ce'),(68,236,'Virginia','VA',47,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','ad209d89-6753-4092-89f3-e7e91d9f61f2'),(69,236,'Washington','WA',48,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a7ad2f94-b424-46bd-b717-57acfae222e1'),(70,236,'West Virginia','WV',49,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','729a13f3-f33a-4c23-a712-2647f956335f'),(71,236,'Wisconsin','WI',50,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','dcd02ca7-ed2d-42c7-aac4-761f5c550126'),(72,236,'Wyoming','WY',51,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','796c8d6e-c2da-4731-aa32-482e5872fd36');
/*!40000 ALTER TABLE `commerce_states` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_subscriptions`
--

LOCK TABLES `commerce_subscriptions` WRITE;
/*!40000 ALTER TABLE `commerce_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxcategories`
--

LOCK TABLES `commerce_taxcategories` WRITE;
/*!40000 ALTER TABLE `commerce_taxcategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_taxcategories` VALUES (1,'General','general',NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e8e32d4f-ac2d-4307-bcd2-484c74551944');
/*!40000 ALTER TABLE `commerce_taxcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxrates`
--

LOCK TABLES `commerce_taxrates` WRITE;
/*!40000 ALTER TABLE `commerce_taxrates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxrates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxzone_countries`
--

LOCK TABLES `commerce_taxzone_countries` WRITE;
/*!40000 ALTER TABLE `commerce_taxzone_countries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxzone_countries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxzone_states`
--

LOCK TABLES `commerce_taxzone_states` WRITE;
/*!40000 ALTER TABLE `commerce_taxzone_states` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxzone_states` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxzones`
--

LOCK TABLES `commerce_taxzones` WRITE;
/*!40000 ALTER TABLE `commerce_taxzones` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxzones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_transactions`
--

LOCK TABLES `commerce_transactions` WRITE;
/*!40000 ALTER TABLE `commerce_transactions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_variants`
--

LOCK TABLES `commerce_variants` WRITE;
/*!40000 ALTER TABLE `commerce_variants` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_variants` VALUES (4,3,'ANT-001',1,20.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2023-08-08 23:47:46','2023-08-08 23:48:19','75af194d-b8e4-4a54-b9d5-2a40073ce5b1'),(6,5,'PSB-001',1,30.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2023-08-08 23:47:46','2023-08-08 23:48:19','51f03021-1ad2-42e8-a155-e5362aa81c07'),(8,7,'RRE-001',1,40.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2023-08-08 23:47:46','2023-08-08 23:48:19','b4a70051-d700-45f0-8098-8c0766ae17bf'),(10,9,'TFA-001',1,50.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2023-08-08 23:47:46','2023-08-08 23:48:19','1fef7378-0655-4af0-865d-c763affe05d4'),(12,11,'LKH-001',1,60.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2023-08-08 23:47:46','2023-08-08 23:48:19','bcd4249f-bb59-4ced-bfa6-fb91fcd05e1d'),(14,13,'FDB-001',1,70.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2023-08-08 23:47:46','2023-08-08 23:48:19','7d49e251-525c-46a4-9817-66e553d2926c');
/*!40000 ALTER TABLE `commerce_variants` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-08-08 23:45:44','2023-08-08 23:45:44','95e8cb05-0518-4db9-9a5f-c90cab3f1338'),(2,3,1,'A New Toga','2023-08-08 23:47:46','2023-08-08 23:48:19','07fde75c-5b81-48ef-90dc-988933c63981'),(3,4,1,'A New Toga','2023-08-08 23:47:46','2023-08-08 23:48:19','d81e7bb6-6234-40ba-b5ac-618607bc9fc5'),(4,5,1,'Parka With Stripes On Back','2023-08-08 23:47:46','2023-08-08 23:48:19','ff204325-5f4e-4021-a574-6ef1ab9422aa'),(5,6,1,'Parka With Stripes On Back','2023-08-08 23:47:46','2023-08-08 23:48:19','4d88e4d0-f851-4e80-b53e-0bbc4511d307'),(6,7,1,'Romper For A Red Eye','2023-08-08 23:47:46','2023-08-08 23:48:19','73e2b621-d169-4d9a-96dc-de280139e46e'),(7,8,1,'Romper For A Red Eye','2023-08-08 23:47:46','2023-08-08 23:48:19','3a0f70f3-16e5-413c-affe-dae0cf3db653'),(8,9,1,'The Fleece Awakens','2023-08-08 23:47:46','2023-08-08 23:48:19','68307487-0b1b-46e9-bb5d-40a40533eabc'),(9,10,1,'The Fleece Awakens','2023-08-08 23:47:46','2023-08-08 23:48:19','70f9f038-3d91-41ee-9e83-3f4823510838'),(10,11,1,'The Last Knee-High','2023-08-08 23:47:46','2023-08-08 23:48:19','2c5c725b-383f-4db6-8d0c-249f0a0443e1'),(11,12,1,'The Last Knee-High','2023-08-08 23:47:46','2023-08-08 23:48:19','075d2380-7a6e-41f5-9cb2-84d77c65a871'),(12,13,1,'Full-Size Dry Boxer','2023-08-08 23:47:46','2023-08-08 23:48:19','8592d801-f1ef-4236-b597-02d4c0a986c6'),(13,14,1,'Full-Size Dry Boxer','2023-08-08 23:47:46','2023-08-08 23:48:19','50552725-0d16-43ec-acaf-12de332c6561'),(14,15,1,NULL,'2023-08-08 23:50:01','2023-08-08 23:59:44','bb51b764-b8d3-4f7c-a432-d414739c6b83');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-08-08 23:45:44','2023-08-08 23:45:44',NULL,NULL,'9e2901f7-0039-44ce-845e-94e8939d5e70'),(2,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Donation',1,0,'2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,NULL,'19889cf9-9762-4d6b-b4b0-082bdac3160d'),(3,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Product',1,0,'2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,NULL,'a701b921-c22b-4c4a-8357-ccefa5592ca4'),(4,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2023-08-08 23:47:46','2023-08-08 23:48:19',NULL,NULL,'83f5e4f6-4398-4602-8a15-c918a9b28cc8'),(5,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Product',1,0,'2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,NULL,'9b51bd22-1fd8-4e0e-bb10-fe5c5a23449e'),(6,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2023-08-08 23:47:46','2023-08-08 23:48:19',NULL,NULL,'892033f6-6fac-4036-b95e-c6aca892464d'),(7,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Product',1,0,'2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,NULL,'1930a43b-1ebb-4c79-8dda-931bd3186db8'),(8,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2023-08-08 23:47:46','2023-08-08 23:48:19',NULL,NULL,'fbec093b-199a-43fb-a4ca-d8a335a0d5fb'),(9,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Product',1,0,'2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,NULL,'899e41a1-1389-49b2-b11e-6f5ae9793c69'),(10,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2023-08-08 23:47:46','2023-08-08 23:48:19',NULL,NULL,'4044c7ba-d98e-4c1e-9db1-4998a6ad2dd0'),(11,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Product',1,0,'2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,NULL,'1cd36a7d-427b-4dc4-8b11-5f7dc608d4c3'),(12,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2023-08-08 23:47:46','2023-08-08 23:48:19',NULL,NULL,'2c3534f1-bc8b-4f7e-8f0e-197b09a77f63'),(13,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Product',1,0,'2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,NULL,'476a6d15-af22-40b1-b1ce-ab3eef79170f'),(14,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2023-08-08 23:47:46','2023-08-08 23:48:19',NULL,NULL,'6cfaee97-5cfd-44b9-bf04-fa26d82b87ef'),(15,NULL,NULL,NULL,1,'craft\\commerce\\elements\\Order',1,0,'2023-08-08 23:50:01','2023-08-08 23:59:44',NULL,'2023-08-09 00:06:17','7e0aff0e-655b-4a88-8f63-5b41050deab5');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-08-08 23:45:44','2023-08-08 23:45:44','fc52e67f-4b53-4c03-982d-7d9971ce0d5e'),(2,2,1,NULL,NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','d4d4c826-ffb1-4a27-94e6-4b59be6d9a83'),(3,3,1,'ant-001','shop/products/ant-001',1,'2023-08-08 23:47:46','2023-08-08 23:48:18','24a677f1-8b4c-4246-a67a-630fe465513f'),(4,4,1,'ant-001',NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','c76ef8c9-742a-4eab-af20-84cbf212b132'),(5,5,1,'psb-001','shop/products/psb-001',1,'2023-08-08 23:47:46','2023-08-08 23:48:18','8579c418-153a-47cc-8679-0165ece7dd85'),(6,6,1,'psb-001',NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','3a8f86a9-6428-43fd-8287-06dd73bbe713'),(7,7,1,'rre-001','shop/products/rre-001',1,'2023-08-08 23:47:46','2023-08-08 23:48:18','ae6bef04-0552-4640-8999-19f0ae52f4c9'),(8,8,1,'rre-001',NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','0d601067-3b64-4bf8-898a-4313186a1c41'),(9,9,1,'tfa-001','shop/products/tfa-001',1,'2023-08-08 23:47:46','2023-08-08 23:48:18','7033045b-1f39-446b-baca-09ddfd20967d'),(10,10,1,'tfa-001',NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','a7f1a583-7cc9-4def-82bf-ee451be7c86e'),(11,11,1,'lkh-001','shop/products/lkh-001',1,'2023-08-08 23:47:46','2023-08-08 23:48:18','a13241e6-c496-4940-a88a-d340d44b28ae'),(12,12,1,'lkh-001',NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','253ed8b0-5048-4e24-8c01-3308e7273489'),(13,13,1,'fdb-001','shop/products/fdb-001',1,'2023-08-08 23:47:46','2023-08-08 23:48:18','ea917a85-08ff-4f0c-82da-4c70a6656bf6'),(14,14,1,'fdb-001',NULL,1,'2023-08-08 23:47:46','2023-08-08 23:47:46','e74f9335-1f3e-4271-9d9b-a6a6d59a13e8'),(15,15,1,NULL,NULL,1,'2023-08-08 23:50:01','2023-08-08 23:50:01','8c3d9787-8218-4030-9490-ab93276c7910');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-08-08 23:45:44','2023-08-08 23:45:44',NULL,'ed24198a-0505-4d80-b3cb-38f6d3cdc071');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\commerce\\elements\\Order','2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,'5eac4469-2a42-429b-9348-5b3d6735e7b2'),(2,'craft\\commerce\\elements\\Product','2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,'3d7c2412-7b23-4ba3-8b30-8a26ca86c4ea'),(3,'craft\\commerce\\elements\\Variant','2023-08-08 23:47:46','2023-08-08 23:47:46',NULL,'d401bbec-4854-4b1c-81f6-d27df159df93');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'3.8.17','3.8.0.1',0,'qsgerowcgznr','3@udcrkycazg','2023-08-08 23:45:43','2023-08-08 23:52:12','b306c0e1-28b7-490e-8931-910a2fc5497a');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','15820581-9477-448f-a120-d436f2c63724'),(2,'craft','m150403_183908_migrations_table_changes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','d43d062a-035b-4cbf-b3e4-22f8084d9ee9'),(3,'craft','m150403_184247_plugins_table_changes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','81edd7eb-f26e-4961-9a74-d84b74e9c08b'),(4,'craft','m150403_184533_field_version','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5c8ddeb6-657f-423d-a516-1a4a0a1bf578'),(5,'craft','m150403_184729_type_columns','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','325de4a4-9c56-40da-bf63-774b1e1d88e1'),(6,'craft','m150403_185142_volumes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','ffd52b21-7393-4f60-8eb4-3df33dbf3b42'),(7,'craft','m150428_231346_userpreferences','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','9e9d44b9-0bc7-4f78-9161-2182faedb20c'),(8,'craft','m150519_150900_fieldversion_conversion','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','4a9098e2-65c1-457e-a2f1-30388459f388'),(9,'craft','m150617_213829_update_email_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','8083004a-99f0-456c-9c18-76520db02a1a'),(10,'craft','m150721_124739_templatecachequeries','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c3e5e013-43ed-4c5f-939c-96b09ce009af'),(11,'craft','m150724_140822_adjust_quality_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','94b0affe-ec10-46d7-964c-96bbca738792'),(12,'craft','m150815_133521_last_login_attempt_ip','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','1c04e116-154b-44b7-ac67-4d6414145488'),(13,'craft','m151002_095935_volume_cache_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','44fba209-b02d-4b3f-91a6-83df50ba9dd0'),(14,'craft','m151005_142750_volume_s3_storage_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c0525084-f703-4a8d-a672-af884f64c44b'),(15,'craft','m151016_133600_delete_asset_thumbnails','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','927a7eb1-75f3-4a07-a8f0-88aee37e1151'),(16,'craft','m151209_000000_move_logo','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','3f2ebf28-0f26-4199-88b1-749be57d6d38'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','577561ac-6200-4ab4-98be-59ea1deab7e6'),(18,'craft','m151215_000000_rename_asset_permissions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','d0b1bced-b191-4c10-9fb7-ca0d2df126d6'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','d2e2d0c8-a3ad-41fb-835d-06bbb09168a2'),(20,'craft','m160708_185142_volume_hasUrls_setting','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7c30d7e4-22c0-4181-81b7-dd3815ef2063'),(21,'craft','m160714_000000_increase_max_asset_filesize','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','112d2fb1-65d8-4834-a0f5-0e6ddc4fde89'),(22,'craft','m160727_194637_column_cleanup','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','2e66aaa2-73c7-4021-a23a-9ed45efc2b1a'),(23,'craft','m160804_110002_userphotos_to_assets','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','1ecab95b-8e5d-438c-93c7-6faee9b0650c'),(24,'craft','m160807_144858_sites','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','45d0dd9b-cbc3-4b74-8aa5-44063af2d485'),(25,'craft','m160829_000000_pending_user_content_cleanup','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','bd6b588f-840c-4c6d-8439-af18e47fde76'),(26,'craft','m160830_000000_asset_index_uri_increase','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f7077ac3-6f5f-4838-825f-bb90b023e37c'),(27,'craft','m160912_230520_require_entry_type_id','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','8df410d8-820f-4c3b-b107-d39379c5e167'),(28,'craft','m160913_134730_require_matrix_block_type_id','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','84e48c2a-58d7-4642-858c-e59da5d57db0'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','0d630c9b-10af-45b8-a4d4-abd7fa1cf5b0'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','84dffe57-4ec4-4144-8cb9-0a9df937e181'),(31,'craft','m160925_113941_route_uri_parts','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','16ae9bf0-86dc-47f2-a16f-7e661653d86a'),(32,'craft','m161006_205918_schemaVersion_not_null','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','40ea3e72-9785-4373-8274-bbf67304cdd2'),(33,'craft','m161007_130653_update_email_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','45f32db3-9a10-4f62-b65b-5b0c5a88e19a'),(34,'craft','m161013_175052_newParentId','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','52191581-064f-4c3d-8bab-c45ce4e1cd63'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','362a19e7-15ab-48d3-9fdf-69d2500e06c5'),(36,'craft','m161021_182140_rename_get_help_widget','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','12fc3e96-7241-4ea3-8751-bb585a1890db'),(37,'craft','m161025_000000_fix_char_columns','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c1642394-0608-4491-bd6d-94570a0ca6ad'),(38,'craft','m161029_124145_email_message_languages','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','8ffd6957-8e73-403a-8e2f-41126824121e'),(39,'craft','m161108_000000_new_version_format','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','07e89e8c-90e5-4db3-aa08-eb4be8e4d298'),(40,'craft','m161109_000000_index_shuffle','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','45081449-f917-4341-9ff3-ec09e102db1f'),(41,'craft','m161122_185500_no_craft_app','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7736e919-de41-47ca-ab3c-815cb691777c'),(42,'craft','m161125_150752_clear_urlmanager_cache','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','190f9511-c2d3-4201-ba5e-dd51eb4552e3'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f045b4d4-de52-4049-88fe-db8bda7ee3eb'),(44,'craft','m170114_161144_udates_permission','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','b2491dc5-bfed-4bc8-a7a9-01d064f32ee1'),(45,'craft','m170120_000000_schema_cleanup','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c9f49c1e-856e-47c5-8cef-23d2334ed2c7'),(46,'craft','m170126_000000_assets_focal_point','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','596a8dcf-3071-46c8-bf05-d90f49c3b9e8'),(47,'craft','m170206_142126_system_name','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','e294c585-4454-495f-b2b5-d5957b7a69a6'),(48,'craft','m170217_044740_category_branch_limits','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','e811e57c-c66c-4911-8a5e-d960f476b36a'),(49,'craft','m170217_120224_asset_indexing_columns','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','11ec3530-a223-48ec-8f9f-6c3d080a14a2'),(50,'craft','m170223_224012_plain_text_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','dc757ebf-4ef6-4ea2-aea6-ba4ccff56414'),(51,'craft','m170227_120814_focal_point_percentage','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','195f707e-8b31-4a44-bb27-288f129e8adb'),(52,'craft','m170228_171113_system_messages','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c81ee9e7-3b49-4579-a227-5b4bd85ebe0a'),(53,'craft','m170303_140500_asset_field_source_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','9b557ddc-86b2-4ef6-bfa8-9a7982048af0'),(54,'craft','m170306_150500_asset_temporary_uploads','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','97176fea-dfa8-4187-a2ac-43481eb2706f'),(55,'craft','m170523_190652_element_field_layout_ids','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','81038e95-055d-4261-b3a6-95dcc5e4d391'),(56,'craft','m170621_195237_format_plugin_handles','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','390ffd69-d175-424f-84d1-f71b9b7680a6'),(57,'craft','m170630_161027_deprecation_line_nullable','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','86dfef8c-49b9-4df0-8ade-a111b51c35f1'),(58,'craft','m170630_161028_deprecation_changes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f014078b-193f-4d54-9504-fbb891783bd1'),(59,'craft','m170703_181539_plugins_table_tweaks','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','cce185e7-d790-4493-92f2-999815a86de4'),(60,'craft','m170704_134916_sites_tables','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5058f716-2962-4b3c-b453-22a16a27d7a9'),(61,'craft','m170706_183216_rename_sequences','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','3c5a6950-d74a-4a85-8efd-dab303ee116c'),(62,'craft','m170707_094758_delete_compiled_traits','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','ef648ec2-3d94-4d69-8213-6689426a6fc2'),(63,'craft','m170731_190138_drop_asset_packagist','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','4738f1f4-3c74-4c08-bb46-920f88bf4a4a'),(64,'craft','m170810_201318_create_queue_table','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','fef10eae-69aa-49bd-8c97-4b6574bf183d'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','b68c2f61-dc6a-4083-9f5c-c6bad58812fb'),(66,'craft','m170914_204621_asset_cache_shuffle','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','acee8ce3-8790-46b7-bbf8-1b629bbeb89b'),(67,'craft','m171011_214115_site_groups','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','8745e52c-3894-4a9d-aa3c-935197f72b32'),(68,'craft','m171012_151440_primary_site','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','15352b0f-7ca2-44c5-b441-78f5b5542bf6'),(69,'craft','m171013_142500_transform_interlace','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','288e4096-3874-48b8-9087-8a7ba30c0bd2'),(70,'craft','m171016_092553_drop_position_select','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','e088b25c-adfb-43a9-9e19-928bf70354f7'),(71,'craft','m171016_221244_less_strict_translation_method','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','a747f02f-c729-4843-97fd-f190975fc33c'),(72,'craft','m171107_000000_assign_group_permissions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','41b02e18-9f40-47d7-9b9e-503476eb49bc'),(73,'craft','m171117_000001_templatecache_index_tune','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','edd1d6f4-debc-427c-9987-4890cc438b16'),(74,'craft','m171126_105927_disabled_plugins','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5254d7ec-9a82-4f49-8b7d-2c9be1c8b333'),(75,'craft','m171130_214407_craftidtokens_table','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f987d120-6514-43a8-bba1-1aa4e040eb3f'),(76,'craft','m171202_004225_update_email_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','78debef2-3b96-4c81-b7f5-fa8b30502f02'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','0c19c722-1f3e-4d03-9fd0-559ce9c7951c'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','418b5be6-59ec-4d49-a5f6-0f3da10c972d'),(79,'craft','m171218_143135_longtext_query_column','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','dd1f9d5d-3cce-4b05-944e-8325fd1bdd86'),(80,'craft','m171231_055546_environment_variables_to_aliases','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','95153f6b-0e4b-4395-89dd-ab18523cebb8'),(81,'craft','m180113_153740_drop_users_archived_column','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','9c8dde35-8be6-47ca-aad6-551c3cfcc6e0'),(82,'craft','m180122_213433_propagate_entries_setting','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7297c644-1826-47d9-b67f-71f54efe637a'),(83,'craft','m180124_230459_fix_propagate_entries_values','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5b284cea-f9a2-4979-b95e-dd2cf4b39269'),(84,'craft','m180128_235202_set_tag_slugs','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','d3880cae-55fe-4101-a0d3-6e07cc5c3702'),(85,'craft','m180202_185551_fix_focal_points','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','0f9c1997-c5ea-49c8-90ae-695a2b278e7a'),(86,'craft','m180217_172123_tiny_ints','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','ac0f3507-c6dc-4ad4-9e0a-264a76575c62'),(87,'craft','m180321_233505_small_ints','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','013040bd-980e-4966-9cdb-77050eaf44ea'),(88,'craft','m180404_182320_edition_changes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','06a17396-1f09-4030-9b68-ab5099022a8a'),(89,'craft','m180411_102218_fix_db_routes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','022c3e62-b877-4ca0-9e06-18f7cc3772c7'),(90,'craft','m180416_205628_resourcepaths_table','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','8e821f7e-68e7-411e-be46-5a19bed9effe'),(91,'craft','m180418_205713_widget_cleanup','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','078e81c5-c4cb-47f3-95b4-b21e18e4e69e'),(92,'craft','m180425_203349_searchable_fields','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','3515dd6a-80c7-42d1-8e86-ee2c4eb7e877'),(93,'craft','m180516_153000_uids_in_field_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7a2ac598-740e-42da-b6ec-fb4701f81912'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','9dee02ec-288b-4c36-b426-6c971dce918d'),(95,'craft','m180518_173000_permissions_to_uid','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','6cdcb34a-3d98-4f67-88dd-ee2e46acfb34'),(96,'craft','m180520_173000_matrix_context_to_uids','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','d20de6ab-726a-424b-8cf5-cae8af72fff4'),(97,'craft','m180521_172900_project_config_table','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','9285ef9c-f83b-457c-b369-0c823ffada91'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','aa515d10-7b36-4b22-b25a-d55038b40c2d'),(99,'craft','m180731_162030_soft_delete_sites','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','464b259f-1b76-4693-85ee-b43b413c2e66'),(100,'craft','m180810_214427_soft_delete_field_layouts','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','215bc025-3d96-4def-a679-2fe9c4cc9d36'),(101,'craft','m180810_214439_soft_delete_elements','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','600d4ee7-18d6-49bd-bcf3-2f22ce958a6e'),(102,'craft','m180824_193422_case_sensitivity_fixes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','941a2be0-a0a8-4f2c-acdc-71ee58c47e5e'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','bd0a900b-5d9f-4eab-b09e-b9ff19a84c95'),(104,'craft','m180904_112109_permission_changes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','b035b0f1-37f4-47ad-b8e6-bc7a3bf12e00'),(105,'craft','m180910_142030_soft_delete_sitegroups','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','600c404d-6cf3-4f40-b4cb-565a40309834'),(106,'craft','m181011_160000_soft_delete_asset_support','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','03b07b16-18b0-4f5a-9930-7e024260e685'),(107,'craft','m181016_183648_set_default_user_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','36a24df3-a395-40f4-82a8-219866f59a55'),(108,'craft','m181017_225222_system_config_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','60aba2b2-7e61-46da-af78-32e17c48f06c'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','a7a85836-1d18-4c48-ba51-5f07c60fa574'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','930c8e65-93f7-4313-b207-fa7a2c53b72c'),(111,'craft','m181112_203955_sequences_table','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','0847a81a-e305-40ee-b310-92472bcf7d61'),(112,'craft','m181121_001712_cleanup_field_configs','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','2e951743-f704-4365-998b-6be6f21499ef'),(113,'craft','m181128_193942_fix_project_config','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','74b7c741-54a8-4ea1-b220-79988f7f7259'),(114,'craft','m181130_143040_fix_schema_version','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','69d31144-5e88-48a3-8e80-19bdd6057308'),(115,'craft','m181211_143040_fix_entry_type_uids','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','a1b44333-37f6-48c2-b54b-3652d900d475'),(116,'craft','m181217_153000_fix_structure_uids','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','098e2e3c-ea6e-4e93-8f70-fb01aef63199'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','e51b5476-f5fb-4876-bba2-ce06c0b61b87'),(118,'craft','m190108_110000_cleanup_project_config','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','0d61a646-503c-45dc-802b-20331c0835c1'),(119,'craft','m190108_113000_asset_field_setting_change','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5458a402-829b-4196-ae23-dcd0c92d88ff'),(120,'craft','m190109_172845_fix_colspan','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','57097663-d8d1-496e-a393-4547970cc739'),(121,'craft','m190110_150000_prune_nonexisting_sites','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f7d4d277-a5ea-4629-90b7-6fc85e184172'),(122,'craft','m190110_214819_soft_delete_volumes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','031ecffc-0d58-4941-90e0-876c446dd1c6'),(123,'craft','m190112_124737_fix_user_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','df6127b7-54f7-4f7f-96cd-3c825acbc364'),(124,'craft','m190112_131225_fix_field_layouts','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','bfd9772a-9f93-4682-8954-bcbe2d9ffd8e'),(125,'craft','m190112_201010_more_soft_deletes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','ed30b1bc-d5b8-4f14-9ab4-b0847c1c88c3'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','b89250b6-6892-4515-bab9-0c6132f76d6c'),(127,'craft','m190121_120000_rich_text_config_setting','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7de9aa5d-c1b1-4811-84bf-87173f62fa1b'),(128,'craft','m190125_191628_fix_email_transport_password','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','03296f07-8eca-4e4d-a9bf-7cda13e334fc'),(129,'craft','m190128_181422_cleanup_volume_folders','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','0871b435-5eb7-4e50-8cf1-ad72f70dacd1'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5eeaf0e7-c9f3-4458-9749-2e63f13d9581'),(131,'craft','m190218_143000_element_index_settings_uid','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','2f5d0f51-70e1-45a9-9d98-9a28eeb971e7'),(132,'craft','m190312_152740_element_revisions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f27a353b-0955-413e-996c-f998e13491ad'),(133,'craft','m190327_235137_propagation_method','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','683465fc-db39-420f-9b9c-fe714ea33e38'),(134,'craft','m190401_223843_drop_old_indexes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','3deb3274-fd4e-444a-bdff-c67ad7d5a3a1'),(135,'craft','m190416_014525_drop_unique_global_indexes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','79d18c78-a22d-481b-a49e-17e2b05e44c4'),(136,'craft','m190417_085010_add_image_editor_permissions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','b1c1f9eb-5a93-4d4a-990d-66bf10fd5149'),(137,'craft','m190502_122019_store_default_user_group_uid','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7032ea33-f5eb-4444-b67e-50551abb849f'),(138,'craft','m190504_150349_preview_targets','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','abec97c2-9405-480d-887a-cab274252801'),(139,'craft','m190516_184711_job_progress_label','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','a2549379-9209-449c-8805-67148e8f57a1'),(140,'craft','m190523_190303_optional_revision_creators','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7f3ceff2-2306-4750-9c95-1804b3d2ca56'),(141,'craft','m190529_204501_fix_duplicate_uids','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c282df98-442a-4f24-b412-9c1358632347'),(142,'craft','m190605_223807_unsaved_drafts','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','8c04bbca-4586-4707-8fc6-f7cfd8c52dde'),(143,'craft','m190607_230042_entry_revision_error_tables','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5124e6a2-4789-4c9b-8e7d-02e7413ee888'),(144,'craft','m190608_033429_drop_elements_uid_idx','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','109fd88e-89dc-4c44-a33d-7712f5f9f93a'),(145,'craft','m190617_164400_add_gqlschemas_table','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','ab5379a3-5cc5-40a6-a776-b0810e81f896'),(146,'craft','m190624_234204_matrix_propagation_method','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','544b01b2-b102-4aba-8a92-1f5cb6abfa0d'),(147,'craft','m190711_153020_drop_snapshots','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','73bb8f03-0704-4183-9078-e9869b2c2c3b'),(148,'craft','m190712_195914_no_draft_revisions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f0bd4f17-93fa-4a1c-a166-15aa461e4956'),(149,'craft','m190723_140314_fix_preview_targets_column','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','064916e0-c642-497c-bf64-eb1267c585b7'),(150,'craft','m190820_003519_flush_compiled_templates','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','0efaa8ae-4ea0-4a5e-b5dc-b9b99c84dfe6'),(151,'craft','m190823_020339_optional_draft_creators','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','bd42081e-2741-428c-9c65-e87f7614ad66'),(152,'craft','m190913_152146_update_preview_targets','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5282dabd-567a-49bf-a116-cedef87a7c6a'),(153,'craft','m191107_122000_add_gql_project_config_support','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','4e96715c-dec7-40ef-8c48-89506e52570f'),(154,'craft','m191204_085100_pack_savable_component_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f72dbd99-927b-4412-b2be-a1b2d2954197'),(155,'craft','m191206_001148_change_tracking','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','88212a7d-4a77-417a-a9c6-2389d7cb34bb'),(156,'craft','m191216_191635_asset_upload_tracking','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','ed0bc73a-7d35-4bcb-9ed6-558272b64864'),(157,'craft','m191222_002848_peer_asset_permissions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','39ebb6b7-299d-422a-a821-05572f98318b'),(158,'craft','m200127_172522_queue_channels','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','f66de508-7e78-448e-9008-67acf8337d4a'),(159,'craft','m200211_175048_truncate_element_query_cache','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','8d7f773f-f504-4785-9e60-870f7a9d5e6e'),(160,'craft','m200213_172522_new_elements_index','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','4594356f-777e-49bd-9fe2-902bb6e2d656'),(161,'craft','m200228_195211_long_deprecation_messages','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','b8bf70b2-3dfc-41a3-8aba-ab20e99600eb'),(162,'craft','m200306_054652_disabled_sites','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','431f6558-fc03-4e52-a14b-aa5d8e517c72'),(163,'craft','m200522_191453_clear_template_caches','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','93471e3b-1642-4a8b-966b-9cd16c9598a4'),(164,'craft','m200606_231117_migration_tracks','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','fccf8a98-48a3-4920-843a-b2a5b073c463'),(165,'craft','m200619_215137_title_translation_method','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','e5e02abe-2753-4467-bf9a-68e0f0ed9b21'),(166,'craft','m200620_005028_user_group_descriptions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','6aedf8ff-9c94-40d8-9067-eed4d6643edc'),(167,'craft','m200620_230205_field_layout_changes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','6605d35a-9165-430a-a48d-f7ea29c70e05'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c50205e4-7498-45b1-a24e-ccc53400a8c0'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7d4e00e2-4de9-4008-87b7-861d58f50668'),(170,'craft','m200630_183000_drop_configmap','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c84b1112-9b1e-4f31-8b60-3a174f2807c6'),(171,'craft','m200715_113400_transform_index_error_flag','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','81fef65c-6d49-440c-8a0e-32551b566981'),(172,'craft','m200716_110900_replace_file_asset_permissions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','93efd3b1-abb9-46f6-9821-b8776fc7a421'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5c4cfb2e-f43f-4621-9380-2d221e061f32'),(174,'craft','m200720_175543_drop_unique_constraints','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','6be26c4f-5b75-4aa3-bd05-7846f608be20'),(175,'craft','m200825_051217_project_config_version','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','1ffc1e6a-e72d-4b40-8a24-51bda9dd7ac2'),(176,'craft','m201116_190500_asset_title_translation_method','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','3a5fd278-fbea-4887-8057-532475d49562'),(177,'craft','m201124_003555_plugin_trials','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','84a20eaa-8f65-4ff1-8464-f9b556093048'),(178,'craft','m210209_135503_soft_delete_field_groups','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','c70bd24b-0b6b-40f9-8bb9-7a94291e71d7'),(179,'craft','m210212_223539_delete_invalid_drafts','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','b04fc5df-19c3-43c1-a531-e4ddd0747a2a'),(180,'craft','m210214_202731_track_saved_drafts','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','737b2f2a-5b12-475e-9290-bbebae055525'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','80e587bc-ca46-4089-ab37-0c55636eafa4'),(182,'craft','m210302_212318_canonical_elements','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','580eb180-0918-4da3-85ca-444a51d24786'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','75cc9d9d-8dd0-42ef-8738-cbd7e74af06d'),(184,'craft','m210329_214847_field_column_suffixes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5f4318b3-e267-4ded-8463-83dacbf5da43'),(185,'craft','m210331_220322_null_author','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','7b5529e8-b2e4-4129-b35f-1fb6758afe26'),(186,'craft','m210405_231315_provisional_drafts','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','96eb3baa-7bb3-4d86-a87c-c4cbf6fe6540'),(187,'craft','m210602_111300_project_config_names_in_config','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','1eb4b068-3ed8-4522-950f-26be718bc733'),(188,'craft','m210611_233510_default_placement_settings','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','536388b1-29d3-49d1-8e0b-09dbeb43100e'),(189,'craft','m210613_145522_sortable_global_sets','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','bff8ed50-9790-4c67-bf0c-e2baf3b9a5cc'),(190,'craft','m210613_184103_announcements','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','a48150f3-e200-4c79-a6d0-806b59011fe7'),(191,'craft','m210829_000000_element_index_tweak','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','4e4fe451-4adb-4619-a8fd-f0b647279ef2'),(192,'craft','m220209_095604_add_indexes','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','fc491fba-f474-4a8e-aef1-3e8e7cf705c2'),(193,'craft','m220214_000000_truncate_sessions','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','5ed1f288-ce1e-4a7f-86e2-d52fb064285e'),(194,'craft','m230221_185926_drop_element_fks','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','88bfc919-4b11-4ba7-a485-f089008a25e7'),(195,'craft','m230226_013114_drop_plugin_license_columns','2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:45:44','118a88c8-a160-4f37-89b3-26633c040671'),(196,'plugin:commerce','Install','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','42cfc39b-ab89-43ac-b923-3163bb0c72b0'),(197,'plugin:commerce','m160531_154500_craft3_upgrade','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a05cb871-1fbc-4c1e-9a59-b2ec27639260'),(198,'plugin:commerce','m170616_154500_productTypeSites_upgrade','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','4e9a576b-4528-4c44-a471-8b4e0ca8105e'),(199,'plugin:commerce','m170705_154500_i18n_to_sites','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','42abd0ac-dba8-4182-bf4c-3ef47879446c'),(200,'plugin:commerce','m170705_155000_order_shippingmethod_to_shippingmethodhandle','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','153befc4-e9a3-430b-8d9c-cac4067287be'),(201,'plugin:commerce','m170718_150000_paymentmethod_class_to_type','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','dd5e0f31-59a5-4e11-a98a-62e602a337d3'),(202,'plugin:commerce','m170725_130000_paymentmethods_are_now_gateways','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','16104217-2415-42dc-8d38-d5c6bd6616df'),(203,'plugin:commerce','m170810_130000_sendCartInfo_per_gateway','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','f6ba39bb-aab5-46f4-8be4-405f6f8a10e7'),(204,'plugin:commerce','m170828_130000_transaction_gatewayProcessing_flag','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','738c8cf4-6334-4fd4-b571-7cfce3bdd21b'),(205,'plugin:commerce','m170830_130000_order_refactor','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','4a3ff880-d23e-421e-9891-247036334217'),(206,'plugin:commerce','m170831_130000_paymentCurreny_primary_not_null','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','449e7225-2e39-47ff-9a37-57444124ef93'),(207,'plugin:commerce','m170904_130000_processing_transactions','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a2982fdc-cd25-4b3e-9902-c062af0f753d'),(208,'plugin:commerce','m171010_170000_stock_location','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','267ad3ab-607b-4047-a483-e2f861d8fccd'),(209,'plugin:commerce','m171202_180000_promotions_for_all_purchasables','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','0b0dad6f-392e-45a6-bb5f-bf50a6c24fb8'),(210,'plugin:commerce','m171204_213000_payment_sources','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','14fcda12-0d3a-4bd0-aa3c-d13d5681c4e6'),(211,'plugin:commerce','m171207_160000_order_can_store_payment_sources','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d337e247-2a6d-409f-8853-914ac871a469'),(212,'plugin:commerce','m171221_120000_subscriptions','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','ae7271d4-080f-4707-b012-7d63b54cb3aa'),(213,'plugin:commerce','m171221_120500_missing_indexes','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','9ce9abcf-845f-4f91-bad8-e983b9117b26'),(214,'plugin:commerce','m180205_150646_create_state_abbreviation_index','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','6fc1a89e-38a4-4d32-8034-90da1767f6aa'),(215,'plugin:commerce','m180209_115000_plan_description','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d7c3dcba-9125-44ac-8287-376b5f8569ba'),(216,'plugin:commerce','m180216_130000_rename_store_location','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','0402fc0d-42c4-4fa6-80fa-4517f7ae77f0'),(217,'plugin:commerce','m180217_130000_sale_migration','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','31fb124a-825c-4f5f-9d36-dd85f57c256b'),(218,'plugin:commerce','m180218_130000_sale_order','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','57e5de25-b389-4534-82e3-6eb8b0a63be5'),(219,'plugin:commerce','m180219_130000_sale_can_stop_processing','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','c027a0e9-da34-4aea-b890-48cdd29b0cb6'),(220,'plugin:commerce','m180220_130000_sale_can_ignore_previous','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','b8abbcc7-c366-41df-8eb9-ec61dee83e53'),(221,'plugin:commerce','m180221_130000_sale_fixSort','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','cf8e5faa-d875-4515-9405-5e1a37707857'),(222,'plugin:commerce','m180222_130000_lineitemsubtotal','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','4690161e-0d3f-4428-b83d-cb6639491b0b'),(223,'plugin:commerce','m180306_130000_renamed','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','aeef4adc-30bc-4d63-a8e9-caa872a9798d'),(224,'plugin:commerce','m180307_130000_order_paid_status','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','f50173de-1968-4365-9a55-bc1ddbb2431b'),(225,'plugin:commerce','m180308_130000_update_order_paid_status','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','6844e487-ac89-447e-89aa-12d74ca14d12'),(226,'plugin:commerce','m180308_130001_has_and_is','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','51f6921c-3d8b-435b-9e55-97c43318aee4'),(227,'plugin:commerce','m180312_130001_countryBased','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','3467905f-6ad2-49c8-8ef6-56f60046f00e'),(228,'plugin:commerce','m180319_130001_fieldSettings','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d3bd887e-7daa-4c32-a8c2-350162c6d429'),(229,'plugin:commerce','m180326_130001_cascadeDeleteVariants','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','7465545e-906c-4fdf-8093-69d01338c7fc'),(230,'plugin:commerce','m180329_161901_gateway_send_cart_info','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','9b383b70-1ecd-496b-9934-18f757d83ba7'),(231,'plugin:commerce','m180401_150701_primary_addresses','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','af8cfe9d-f1ee-4009-99cb-9951911d5dee'),(232,'plugin:commerce','m180401_161901_first_last_name_optional','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','18187e81-c619-4d62-a161-ee7ee8f29b64'),(233,'plugin:commerce','m180402_161901_increase_size_of_snapshot','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','bf53c5e8-8738-4d83-82bb-78f1ca94855c'),(234,'plugin:commerce','m180402_161902_email_discount_usage','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','32c5207a-d6a2-4486-8919-92195dba8d0d'),(235,'plugin:commerce','m180402_161903_primary_customer_addresses_relations','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','157e886d-05b2-45f5-b080-82d78cf1c415'),(236,'plugin:commerce','m180402_161904_order_addresses_relations','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','bec129b9-1945-4730-b995-c6e551fddd3d'),(237,'plugin:commerce','m180417_161904_fix_purchasables','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','eee58e29-d8df-4fae-8891-7973075ad349'),(238,'plugin:commerce','m180421_161904_transaction_note','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','f85c6d51-9d92-4372-a08b-df2046960581'),(239,'plugin:commerce','m180525_161904_available_for_purchase','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','764d01cb-6e94-4700-9d6e-bfc73879ed02'),(240,'plugin:commerce','m180601_161904_fix_orderLanguage','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','26d310d8-9393-48ed-a514-e5f3443c0e7a'),(241,'plugin:commerce','m180620_161904_fix_primaryAddressCascade','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','44f13ef8-3b43-4843-a8af-17c4a79dc425'),(242,'plugin:commerce','m180718_161906_add_orderPdfAttachment','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','79ba4b1d-d938-4be7-a509-4d4e8a962c0c'),(243,'plugin:commerce','m180818_161906_fix_discountPurchasableType','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a3f4093d-6542-4a06-99cb-e7d2f58927fc'),(244,'plugin:commerce','m180818_161907_fix_orderPaidWithAddresses','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','58344b9c-f145-472b-a4b7-8f19f606b7fd'),(245,'plugin:commerce','m180918_161907_fix_uniqueEmailDiscountsUses','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','ec7bcee7-a3f5-4305-b2f6-5ccff1cedd5a'),(246,'plugin:commerce','m180918_161908_fix_messageLengthOnOrder','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','c1021166-e5ee-4802-8359-59c4dd4cb859'),(247,'plugin:commerce','m181024_100600_gateway_project_config_support','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','e10df765-b6eb-4c6c-919a-496a9b66c9c7'),(248,'plugin:commerce','m181113_161908_addReferenceToOrder','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','73318e8c-360b-4b8b-8203-5ba95a4e4c6b'),(249,'plugin:commerce','m181119_100600_lite_shipping_and_tax','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d0485664-ceef-44c1-a832-bff2671f688e'),(250,'plugin:commerce','m181203_130000_order_status_archivable','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','10a301a7-4e72-46cf-8b2d-bd046b28b157'),(251,'plugin:commerce','m181203_162000_gateway_unique_index_drop','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','14ec97c1-89a0-4331-bb72-636efaa875f2'),(252,'plugin:commerce','m181206_120000_remaining_project_config_support','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','5c62bea6-d8e7-405c-837c-4fc6b3c43ba1'),(253,'plugin:commerce','m181221_120000_sort_order_for_plans','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d4dc9fb9-54ad-4af7-b114-d697f88a2c15'),(254,'plugin:commerce','m190109_223402_set_edition','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','ab62cc11-2b17-4d02-b7b4-2dfe936149db'),(255,'plugin:commerce','m190111_161909_lineItemTotalCanBeNegative','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','0efa7991-9c3d-4a4e-9e1e-4cb582164e94'),(256,'plugin:commerce','m190117_161909_replace_product_ref_tags','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','e21175b4-9a7b-44dd-a6d6-fe3d9859c078'),(257,'plugin:commerce','m190126_000856_restore_variants_with_products','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','1e96b742-57ed-4e76-bcb3-6b6d5e066050'),(258,'plugin:commerce','m190129_000857_insert_cached_data','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','529596c6-fe44-44a0-a631-bbdd737cf187'),(259,'plugin:commerce','m190131_000858_add_donation_purchasable','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','0c88c53e-6ac7-49f6-804f-753b30c2de6f'),(260,'plugin:commerce','m190213_000858_discount_free_shipping_changes','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','ac3a62c6-0f9c-4109-ac1e-e58be6a360c8'),(261,'plugin:commerce','m190222_161405_permissions_to_uid','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a6b76445-31cf-43de-9372-df4f77faad7f'),(262,'plugin:commerce','m190301_161406_unique_sku_constraint_in_app','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','77e002fd-2b9e-41c1-bc64-adb7a2800923'),(263,'plugin:commerce','m190311_161910_order_total','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','01f4adbb-1fc9-49bb-adb7-85aa687dcb9e'),(264,'plugin:commerce','m190322_161911_register_on_checkout','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','6da0b637-6228-41b9-b0ae-4843948da795'),(265,'plugin:commerce','m190523_150000_fix_lineItems_dateCreated','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','7dc43492-199a-4823-9bb5-e2b014a79e2e'),(266,'plugin:commerce','m190523_161912_line_item_statuses','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','8ecdc633-3fb7-4774-8246-7f232242abb0'),(267,'plugin:commerce','m190527_161913_order_recalc_mode','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','4968cb17-8b55-4816-be73-4511b6bd2403'),(268,'plugin:commerce','m190527_161914_admin_note_on_lineitem','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','c2adebb7-0f7f-409c-aef4-c96bf19c0151'),(269,'plugin:commerce','m190528_161915_description_on_purchasable','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a0afe478-2990-4ecd-9892-11be9657a870'),(270,'plugin:commerce','m190622_161916_origin_on_order','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d9f64b04-88d2-4054-8662-a078a537a29d'),(271,'plugin:commerce','m190725_141100_subscription_suspension_fields','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','050d9fcc-61c6-4035-b5e3-7021e1869f8b'),(272,'plugin:commerce','m190821_150226_discount_purchaseTotal_update','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','97957486-fedb-4fe4-b56a-848b50242f22'),(273,'plugin:commerce','m190823_071838_taxCategoryId_allow_null','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','96a2279e-fd6f-403f-88c1-47604e7e6ea9'),(274,'plugin:commerce','m190923_131716_update_overpaid_status','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','031f3af0-4b5e-4f69-ad51-72a8c14c7ccc'),(275,'plugin:commerce','m190923_132226_update_paidStatuses','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','6f38992a-8982-4f48-84ed-4c4ffadec46f'),(276,'plugin:commerce','m190924_184909_taxCategory_allow_null_postgres','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','e8051401-282c-4d2a-8668-62ebdd947166'),(277,'plugin:commerce','m191004_184910_orderPaidDate','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','b2c1b310-6a47-4c5c-a38f-2b24010ca445'),(278,'plugin:commerce','m191007_184911_orderStatus_from_archived_to_deleted','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','0b4b277b-2133-40f1-93d4-3fac299b7128'),(279,'plugin:commerce','m191008_153947_add_relationship_type_to_discounts','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','9dd0b24e-6a2d-4631-9a56-10df4b6557fc'),(280,'plugin:commerce','m191008_155732_add_relationship_type_to_sales','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','b1456484-6495-43da-826c-2e29b31502de'),(281,'plugin:commerce','m191009_002748_add_ignoreSales_to_discounts','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','4bd2ee2f-71d2-4955-9c29-d189896834e6'),(282,'plugin:commerce','m191009_184912_zipCode_match_added_to_shipping_and_tax_address_zones','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d6d64ed5-3ce8-42c5-a573-9dfa181c5a2c'),(283,'plugin:commerce','m191015_194704_add_description_to_orderStatus','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','ded3b71c-9311-479f-bfd3-86a4bb1965d1'),(284,'plugin:commerce','m191015_201444_add_code_to_taxRates','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','ac87ef38-6b55-4d82-aa63-506a991217dc'),(285,'plugin:commerce','m191016_231143_add_sortOrder_to_countries','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a716c241-1e40-4849-b947-422fa1a22374'),(286,'plugin:commerce','m191017_183550_add_extra_address_fields','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a5a4aff4-a75f-481a-bef3-0d23670ea04a'),(287,'plugin:commerce','m191018_183551_cc_replyTo_emails','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','045df9aa-ed44-4ee3-8985-84cffbbf90aa'),(288,'plugin:commerce','m191021_184436_add_estimated_fields_to_order','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','b46db388-b008-4b5c-952a-9cf8474a8ec3'),(289,'plugin:commerce','m191021_190018_add_estimated_flag_to_addresses','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','5cbaaa92-b5e1-4260-bda1-abb52de64c05'),(290,'plugin:commerce','m191022_162628_add_estimated_toadjustments','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a67a6b18-e8dd-4f0e-a189-bf44eb3f491e'),(291,'plugin:commerce','m191113_111954_add_plain_text_template_path','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','7f8acdeb-3524-4c08-b088-ab98fc867762'),(292,'plugin:commerce','m191114_115600_remove_customer_info_field','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a03b0b63-1ad3-4b8a-b356-a417d5b2daed'),(293,'plugin:commerce','m191114_133817_add_base_discount_type_attribute','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','56fb50ad-1b49-4b50-a13d-1f0034ca91eb'),(294,'plugin:commerce','m191115_103105_add_totalDiscountUses_column','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','efd481e4-dcfc-4500-9832-01d1114f7181'),(295,'plugin:commerce','m191115_103501_update_totalDiscountUses_with_current_uses','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','f61ce8bb-cde0-4deb-98b4-999acd02d15f'),(296,'plugin:commerce','m191115_105329_add_totalDiscountUseLimit','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','804a9bd9-3409-4716-bdec-635bf51b9d85'),(297,'plugin:commerce','m191125_150308_add_enabled_countries','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','caed22bf-c5cd-4b20-975c-2634c4053163'),(298,'plugin:commerce','m191125_150315_add_enabled_states','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','e2f4bbad-1ecb-496b-9fb6-d35d225a51d9'),(299,'plugin:commerce','m191202_220748_updated_zipCodeConditional_column_type','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','feb9ed65-7b64-48f5-ba2b-e06d1f865d77'),(300,'plugin:commerce','m191203_163242_add_titleLabel_to_product_type','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d70fd052-762a-4160-86e2-d4b9b756d60d'),(301,'plugin:commerce','m200101_114320_remove_orphan_customers','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','29f3f05b-5200-4b39-a99b-cea3f263a869'),(302,'plugin:commerce','m200102_141910_add_variantTitleLabel_attribute','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a7fb607f-d24a-4f88-bf60-885f2bec3727'),(303,'plugin:commerce','m200102_185704_update_totalDiscountUseLimit_with_current_totalUseLimit','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','aef95347-7d98-43dc-9ff6-7b28e1552a58'),(304,'plugin:commerce','m200102_185839_remove_totalUses_and_totalUseLimit','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','1e855911-afda-4d71-b615-bf913aae1778'),(305,'plugin:commerce','m200108_114623_consolidate_customer_records','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','421a7f2f-2bf9-4b3a-83af-c94bd658260e'),(306,'plugin:commerce','m200112_220749_cache_totalDiscount_totalTax_totalShipping','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','e5b2663c-8cb4-4266-a8dc-cdf187c06112'),(307,'plugin:commerce','m200127_235254_replace_old_revenue_widget','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','7b96b353-c2d7-4683-a0b6-35c7dff4602d'),(308,'plugin:commerce','m200129_161705_create_missing_customer_records_for_users','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','b8d56485-99ca-412f-b2d4-44f0ea6732c8'),(309,'plugin:commerce','m200206_161706_date_authorized','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','2a44c5fc-8bf8-4509-9a1b-e234bbf0119d'),(310,'plugin:commerce','m200207_161707_sku_description_on_lineitem','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d4b0f473-dc06-4ce3-9e6c-d0880f1ca081'),(311,'plugin:commerce','m200218_231144_add_sortOrder_to_states','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','0633e35c-4304-4226-b903-c08aa6405293'),(312,'plugin:commerce','m200218_231199_add_appliesTo_to_discounts','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','31358c55-089c-4263-8934-2f24d2a66619'),(313,'plugin:commerce','m200320_161708_add_index_order_email','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','fcd09bca-fbdc-41a9-9a3d-78e62acd17ab'),(314,'plugin:commerce','m200402_172412_add_order_condition_formula','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','db9f11f1-3f5d-4392-9eec-63e98c60cfff'),(315,'plugin:commerce','m200602_172413_fix_orders_without_customerId','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','9c5f5b13-fe3d-4eb8-9152-485a3a29a699'),(316,'plugin:commerce','m200617_172414_fix_country_state_sort_orders','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','6fd841db-1c19-49d0-813a-b6ed2130043b'),(317,'plugin:commerce','m200722_172699_product_title_format','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d228dbe3-a058-4d2d-823b-36d99a75411b'),(318,'plugin:commerce','m200723_072632_add_shippingMethodName_to_order','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','eae71a92-3418-49df-b92a-aed8e5898d47'),(319,'plugin:commerce','m200730_233644_field_layout_changes','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','64e1a11a-7069-4778-a55f-50cee4c12602'),(320,'plugin:commerce','m200801_233755_pdfs','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','130b6553-6e47-4532-bd98-eaa78bbb4ca6'),(321,'plugin:commerce','m200804_185727_fix_productTitleFormat','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','965b5e05-a362-423f-8417-f5c15092d181'),(322,'plugin:commerce','m200901_094328_add_lineItem_description_column_type','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','606b6a98-85ce-4181-967e-866f67968b07'),(323,'plugin:commerce','m200902_071515_add_itemSubtotal_order_column','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','8ef29118-cd09-4dc3-b5f9-ee2bd28d5477'),(324,'plugin:commerce','m200907_132553_fix_donation_siteIds','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','f17af443-547c-4fe6-bf8f-522f74ce4242'),(325,'plugin:commerce','m200910_134928_fix_productType_title_format_columns','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','ad686aba-baac-4534-852a-945474423214'),(326,'plugin:commerce','m201005_169999_add_orderSiteId','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','e9d54e1b-524b-45d1-b4c7-4a61ad3ea28b'),(327,'plugin:commerce','m201013_064230_add_subscription_id_fk','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','b263b3b8-d913-4594-a7bf-f81ac60d7589'),(328,'plugin:commerce','m201102_064231_fix_deletedWithProduct_bool','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','210f8383-c39c-4fb0-99bf-de8e2107987d'),(329,'plugin:commerce','m201111_064232_order_notices','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','39eadafd-1963-44aa-8c84-3a50247031be'),(330,'plugin:commerce','m201120_093135_add_locale_setting_to_email_and_pdf','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','46adb43d-b7a8-4ec4-9f51-8cc334c0b8fc'),(331,'plugin:commerce','m201218_103541_add_user_condition_column_in_promotions','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','6a5d0f75-56cb-437b-bafc-79ad461b2dca'),(332,'plugin:commerce','m210113_093199_add_minMaxTotalType_to_shipping_rules','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','aa13652f-e825-42f3-a632-5c27d75ed704'),(333,'plugin:commerce','m210114_093299_add_orderConditionFormula_to_shipping_rules','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','47c95b55-489c-4b9c-a774-035c7c88c523'),(334,'plugin:commerce','m210302_050822_change_adjust_type_to_lowercase','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','8014bd40-fc0c-47ed-bcab-be4e8f7a074f'),(335,'plugin:commerce','m210317_050824_taxIncluded_update','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','7cba9195-3b1e-4b73-b160-66b8a8af1d0b'),(336,'plugin:commerce','m210317_093136_includedTax_fix','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','a36f2ffa-7de8-40c9-8008-c4d07fd16a13'),(337,'plugin:commerce','m210317_093137_add_type_to_notices','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','1e149e6f-b596-40c7-bc08-f05f90243042'),(338,'plugin:commerce','m210321_222635_ordrHistory_customerId_nullable','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','d5276363-b46a-4977-ab19-b376a655227a'),(339,'plugin:commerce','m210608_093199_add_remove_included_to_taxrates','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','73f52ab2-308f-4a39-8d81-97b0c548389a'),(340,'plugin:commerce','m210611_093299_add_remove_vat_included_to_taxrates','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','ea3d8aff-c610-45ca-8ea6-c164343b1936'),(341,'plugin:commerce','m210616_152013_change_return_cancel_url_column_type','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','6f60729e-1634-4d3c-b80e-a772ae627a08'),(342,'plugin:commerce','m210703_060852_store_location_index','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','fd812d36-fff3-4000-9682-e7356643bfb8'),(343,'plugin:commerce','m210901_222634_drop_column','2023-08-08 23:47:46','2023-08-08 23:47:46','2023-08-08 23:47:46','6ca16e1a-be7f-4df5-b7cb-78956a156814');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'commerce','3.4.22.1','3.4.13','2023-08-08 23:47:42','2023-08-08 23:47:42','2023-08-08 23:47:42','cea38102-48bd-4b74-888a-f57726b77b73'),(2,'pest','1.0.0-alpha12','1.0.0','2023-08-08 23:52:12','2023-08-08 23:52:12','2023-08-08 23:52:12','32f187ad-5133-4651-b748-5308ec7a0cd7');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('commerce.gateways.383b942f-b795-4168-92c3-e6231731049c.handle','\"dummy\"'),('commerce.gateways.383b942f-b795-4168-92c3-e6231731049c.isFrontendEnabled','true'),('commerce.gateways.383b942f-b795-4168-92c3-e6231731049c.name','\"Dummy\"'),('commerce.gateways.383b942f-b795-4168-92c3-e6231731049c.paymentType','\"purchase\"'),('commerce.gateways.383b942f-b795-4168-92c3-e6231731049c.sortOrder','99'),('commerce.gateways.383b942f-b795-4168-92c3-e6231731049c.type','\"craft\\\\commerce\\\\gateways\\\\Dummy\"'),('commerce.orderStatuses.2f40b566-21b8-41ba-9ab2-b8156f452f7b.color','\"green\"'),('commerce.orderStatuses.2f40b566-21b8-41ba-9ab2-b8156f452f7b.default','true'),('commerce.orderStatuses.2f40b566-21b8-41ba-9ab2-b8156f452f7b.description','null'),('commerce.orderStatuses.2f40b566-21b8-41ba-9ab2-b8156f452f7b.handle','\"new\"'),('commerce.orderStatuses.2f40b566-21b8-41ba-9ab2-b8156f452f7b.name','\"New\"'),('commerce.orderStatuses.2f40b566-21b8-41ba-9ab2-b8156f452f7b.sortOrder','99'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.descriptionFormat','\"\"'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.handle','\"clothing\"'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.hasDimensions','true'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.hasProductTitleField','true'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.hasVariants','false'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.hasVariantTitleField','true'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.name','\"Clothing\"'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.productTitleFormat','\"\"'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.siteSettings.40bd14f2-81cb-46a6-b064-5a0545119073.hasUrls','true'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.siteSettings.40bd14f2-81cb-46a6-b064-5a0545119073.template','\"shop/products/_product\"'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.siteSettings.40bd14f2-81cb-46a6-b064-5a0545119073.uriFormat','\"shop/products/{slug}\"'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.skuFormat','\"\"'),('commerce.productTypes.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd.titleFormat','\"{product.title}\"'),('dateModified','1691538732'),('email.fromEmail','\"joshua.pease@viget.com\"'),('email.fromName','\"Craft 3 with Pest\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.ed24198a-0505-4d80-b3cb-38f6d3cdc071.name','\"Common\"'),('meta.__names__.09c1ceab-683b-4ec2-b64a-f23488f4f1ba','\"Craft 3 with Pest\"'),('meta.__names__.2f40b566-21b8-41ba-9ab2-b8156f452f7b','\"New\"'),('meta.__names__.383b942f-b795-4168-92c3-e6231731049c','\"Dummy\"'),('meta.__names__.40bd14f2-81cb-46a6-b064-5a0545119073','\"Craft 3 with Pest\"'),('meta.__names__.5d382ee6-772b-4eb6-b3d3-0b2dcd9118fd','\"Clothing\"'),('meta.__names__.ed24198a-0505-4d80-b3cb-38f6d3cdc071','\"Common\"'),('plugins.commerce.edition','\"lite\"'),('plugins.commerce.enabled','true'),('plugins.commerce.licenseKey','\"NX5GD8371DNBH7X0QMNW4F9W\"'),('plugins.commerce.schemaVersion','\"3.4.13\"'),('plugins.pest.edition','\"standard\"'),('plugins.pest.enabled','true'),('plugins.pest.schemaVersion','\"1.0.0\"'),('siteGroups.09c1ceab-683b-4ec2-b64a-f23488f4f1ba.name','\"Craft 3 with Pest\"'),('sites.40bd14f2-81cb-46a6-b064-5a0545119073.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.40bd14f2-81cb-46a6-b064-5a0545119073.handle','\"default\"'),('sites.40bd14f2-81cb-46a6-b064-5a0545119073.hasUrls','true'),('sites.40bd14f2-81cb-46a6-b064-5a0545119073.language','\"en-US\"'),('sites.40bd14f2-81cb-46a6-b064-5a0545119073.name','\"Craft 3 with Pest\"'),('sites.40bd14f2-81cb-46a6-b064-5a0545119073.primary','true'),('sites.40bd14f2-81cb-46a6-b064-5a0545119073.siteGroup','\"09c1ceab-683b-4ec2-b64a-f23488f4f1ba\"'),('sites.40bd14f2-81cb-46a6-b064-5a0545119073.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft 3 with Pest\"'),('system.schemaVersion','\"3.8.0.1\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' joshua pease viget com '),(1,'slug',0,1,''),(2,'slug',0,1,''),(15,'slug',0,1,''),(15,'lineitemdescriptions',0,1,' full size dry boxer '),(15,'skus',0,1,' fdb 001 '),(15,'reference',0,1,''),(15,'username',0,1,' admin '),(15,'transactionreference',0,1,''),(15,'shortnumber',0,1,' 089cd65 '),(15,'shippingaddresslines',0,1,''),(15,'shippingphone',0,1,''),(15,'shippingfullname',0,1,''),(15,'shippinglastname',0,1,''),(15,'shippingfirstname',0,1,''),(15,'number',0,1,' 089cd65314535a37fcdbd0277b2f2a2d '),(15,'email',0,1,' joshua pease viget com '),(15,'billingaddresslines',0,1,''),(15,'billingphone',0,1,''),(15,'billingfullname',0,1,''),(15,'billinglastname',0,1,''),(15,'billingfirstname',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Craft 3 with Pest','2023-08-08 23:45:44','2023-08-08 23:45:44',NULL,'09c1ceab-683b-4ec2-b64a-f23488f4f1ba');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,1,'Craft 3 with Pest','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-08-08 23:45:44','2023-08-08 23:45:44',NULL,'40bd14f2-81cb-46a6-b064-5a0545119073');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,NULL,'joshua.pease@viget.com','$2y$13$hDvneX8uuM3MFcWf9AR5dOvNfUW6cyXW/PEissg9vKie34TcqrHQ.',1,0,0,0,'2023-08-08 23:48:17',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-08-08 23:45:44','2023-08-08 23:45:44','2023-08-08 23:48:17','3336c48c-867b-433d-a38d-81a60607b9ee');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-08-08 23:48:17','2023-08-08 23:48:17','f60aae7a-6748-4211-9ca8-39075546e825'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-08-08 23:48:17','2023-08-08 23:48:17','cac8f077-0fdb-4c94-ad37-7a34e9bed35a'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-08-08 23:48:17','2023-08-08 23:48:17','bcf5fbc4-ac61-49b1-9506-c916ee0a09fe'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-08-08 23:48:17','2023-08-08 23:48:17','2bc2a486-73e2-4eb2-80ec-bc3d128843cc');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-10 23:40:44
