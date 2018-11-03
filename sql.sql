-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Nov 03, 2018 at 06:17 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `bnt`
--

-- --------------------------------------------------------

--
-- Table structure for table `bnt_adodb_logsql`
--

CREATE TABLE `bnt_adodb_logsql` (
  `created` datetime NOT NULL,
  `sql0` varchar(250) NOT NULL,
  `sql1` text NOT NULL,
  `params` text NOT NULL,
  `tracer` text NOT NULL,
  `timer` decimal(16,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_bounty`
--

CREATE TABLE `bnt_bounty` (
  `bounty_id` int(10) unsigned NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bounty_on` int(10) unsigned NOT NULL DEFAULT '0',
  `placed_by` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_ibank_accounts`
--

CREATE TABLE `bnt_ibank_accounts` (
  `ship_id` int(11) NOT NULL DEFAULT '0',
  `balance` bigint(20) DEFAULT '0',
  `loan` bigint(20) DEFAULT '0',
  `loantime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_IGB_transfers`
--

CREATE TABLE `bnt_IGB_transfers` (
  `transfer_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL DEFAULT '0',
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `amount` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_ip_bans`
--

CREATE TABLE `bnt_ip_bans` (
  `ban_id` int(10) unsigned NOT NULL,
  `ban_mask` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_languages`
--

CREATE TABLE `bnt_languages` (
  `lang_id` smallint(5) NOT NULL,
  `language` varchar(30) NOT NULL DEFAULT 'english',
  `name` varchar(75) NOT NULL,
  `value` varchar(2000) NOT NULL,
  `category` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_links`
--

CREATE TABLE `bnt_links` (
  `link_id` int(10) unsigned NOT NULL,
  `link_start` int(10) unsigned NOT NULL DEFAULT '0',
  `link_dest` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_logs`
--

CREATE TABLE `bnt_logs` (
  `log_id` int(10) unsigned NOT NULL,
  `ship_id` int(11) NOT NULL DEFAULT '0',
  `type` mediumint(5) NOT NULL DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_messages`
--

CREATE TABLE `bnt_messages` (
  `ID` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL DEFAULT '0',
  `recp_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `sent` varchar(19) DEFAULT NULL,
  `message` longtext NOT NULL,
  `notified` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_movement_log`
--

CREATE TABLE `bnt_movement_log` (
  `event_id` int(10) unsigned NOT NULL,
  `ship_id` int(11) NOT NULL DEFAULT '0',
  `sector_id` int(11) DEFAULT '0',
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_news`
--

CREATE TABLE `bnt_news` (
  `news_id` int(11) NOT NULL,
  `headline` varchar(100) NOT NULL,
  `newstext` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `news_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_planets`
--

CREATE TABLE `bnt_planets` (
  `planet_id` int(10) unsigned NOT NULL,
  `sector_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` tinytext,
  `organics` bigint(20) NOT NULL DEFAULT '0',
  `ore` bigint(20) NOT NULL DEFAULT '0',
  `goods` bigint(20) NOT NULL DEFAULT '0',
  `energy` bigint(20) NOT NULL DEFAULT '0',
  `colonists` bigint(20) NOT NULL DEFAULT '0',
  `credits` bigint(20) NOT NULL DEFAULT '0',
  `fighters` bigint(20) NOT NULL DEFAULT '0',
  `torps` bigint(20) NOT NULL DEFAULT '0',
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `corp` int(10) unsigned NOT NULL DEFAULT '0',
  `base` enum('Y','N') NOT NULL DEFAULT 'N',
  `sells` enum('Y','N') NOT NULL DEFAULT 'N',
  `prod_organics` int(11) NOT NULL DEFAULT '20',
  `prod_ore` int(11) NOT NULL DEFAULT '0',
  `prod_goods` int(11) NOT NULL DEFAULT '0',
  `prod_energy` int(11) NOT NULL DEFAULT '0',
  `prod_fighters` int(11) NOT NULL DEFAULT '0',
  `prod_torp` int(11) NOT NULL DEFAULT '0',
  `defeated` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_scheduler`
--

CREATE TABLE `bnt_scheduler` (
  `sched_id` int(10) unsigned NOT NULL,
  `repeate` enum('Y','N') NOT NULL DEFAULT 'N',
  `ticks_left` int(10) unsigned NOT NULL DEFAULT '0',
  `ticks_full` int(10) unsigned NOT NULL DEFAULT '0',
  `spawn` int(10) unsigned NOT NULL DEFAULT '0',
  `sched_file` varchar(30) NOT NULL,
  `extra_info` varchar(50) DEFAULT NULL,
  `last_run` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_sector_defence`
--

CREATE TABLE `bnt_sector_defence` (
  `defence_id` int(10) unsigned NOT NULL,
  `ship_id` int(11) NOT NULL DEFAULT '0',
  `sector_id` int(10) unsigned NOT NULL DEFAULT '0',
  `defence_type` enum('M','F') NOT NULL DEFAULT 'M',
  `quantity` bigint(20) NOT NULL DEFAULT '0',
  `fm_setting` enum('attack','toll') NOT NULL DEFAULT 'toll'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_sessions`
--

CREATE TABLE `bnt_sessions` (
  `SESSKEY` varchar(32) NOT NULL DEFAULT '',
  `EXPIRY` int(11) NOT NULL DEFAULT '0',
  `EXPIREREF` varchar(64) DEFAULT NULL,
  `SESSDATA` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_ships`
--

CREATE TABLE `bnt_ships` (
  `ship_id` int(10) unsigned NOT NULL,
  `ship_name` char(20) DEFAULT NULL,
  `ship_destroyed` enum('Y','N') NOT NULL DEFAULT 'N',
  `character_name` char(20) NOT NULL,
  `password` char(60) NOT NULL,
  `email` char(60) NOT NULL,
  `hull` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `engines` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `power` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `computer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sensors` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `beams` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `torp_launchers` tinyint(3) NOT NULL DEFAULT '0',
  `torps` bigint(20) NOT NULL DEFAULT '0',
  `shields` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `armor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `armor_pts` bigint(20) NOT NULL DEFAULT '0',
  `cloak` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `credits` bigint(20) NOT NULL DEFAULT '0',
  `sector` int(10) unsigned NOT NULL DEFAULT '0',
  `ship_ore` bigint(20) NOT NULL DEFAULT '0',
  `ship_organics` bigint(20) NOT NULL DEFAULT '0',
  `ship_goods` bigint(20) NOT NULL DEFAULT '0',
  `ship_energy` bigint(20) NOT NULL DEFAULT '0',
  `ship_colonists` bigint(20) NOT NULL DEFAULT '0',
  `ship_fighters` bigint(20) NOT NULL DEFAULT '0',
  `ship_damage` smallint(5) NOT NULL DEFAULT '0',
  `turns` smallint(4) NOT NULL DEFAULT '0',
  `on_planet` enum('Y','N') NOT NULL DEFAULT 'N',
  `dev_warpedit` smallint(5) NOT NULL DEFAULT '0',
  `dev_genesis` smallint(5) NOT NULL DEFAULT '0',
  `dev_beacon` smallint(5) NOT NULL DEFAULT '0',
  `dev_emerwarp` smallint(5) NOT NULL DEFAULT '0',
  `dev_escapepod` enum('Y','N') NOT NULL DEFAULT 'N',
  `dev_fuelscoop` enum('Y','N') NOT NULL DEFAULT 'N',
  `dev_minedeflector` bigint(20) NOT NULL DEFAULT '0',
  `turns_used` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL DEFAULT '0',
  `team` int(11) NOT NULL DEFAULT '0',
  `team_invite` int(11) NOT NULL DEFAULT '0',
  `ip_address` tinytext NOT NULL,
  `planet_id` int(10) unsigned NOT NULL DEFAULT '0',
  `preset1` int(11) NOT NULL DEFAULT '0',
  `preset2` int(11) NOT NULL DEFAULT '0',
  `preset3` int(11) NOT NULL DEFAULT '0',
  `trade_colonists` enum('Y','N') NOT NULL DEFAULT 'Y',
  `trade_fighters` enum('Y','N') NOT NULL DEFAULT 'N',
  `trade_torps` enum('Y','N') NOT NULL DEFAULT 'N',
  `trade_energy` enum('Y','N') NOT NULL DEFAULT 'Y',
  `cleared_defences` tinytext,
  `lang` varchar(30) NOT NULL DEFAULT 'english.inc',
  `dev_lssd` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_teams`
--

CREATE TABLE `bnt_teams` (
  `id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) DEFAULT '0',
  `team_name` tinytext,
  `description` tinytext,
  `number_of_members` tinyint(3) NOT NULL DEFAULT '0',
  `admin` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_traderoutes`
--

CREATE TABLE `bnt_traderoutes` (
  `traderoute_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dest_id` int(10) unsigned NOT NULL DEFAULT '0',
  `source_type` enum('P','L','C','D') NOT NULL DEFAULT 'P',
  `dest_type` enum('P','L','C','D') NOT NULL DEFAULT 'P',
  `move_type` enum('R','W') NOT NULL DEFAULT 'W',
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `circuit` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_universe`
--

CREATE TABLE `bnt_universe` (
  `sector_id` int(10) unsigned NOT NULL,
  `sector_name` tinytext,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `port_type` enum('ore','organics','goods','energy','special','none') NOT NULL DEFAULT 'none',
  `port_organics` bigint(20) NOT NULL DEFAULT '0',
  `port_ore` bigint(20) NOT NULL DEFAULT '0',
  `port_goods` bigint(20) NOT NULL DEFAULT '0',
  `port_energy` bigint(20) NOT NULL DEFAULT '0',
  `beacon` tinytext,
  `angle1` float(10,2) NOT NULL DEFAULT '0.00',
  `angle2` float(10,2) NOT NULL DEFAULT '0.00',
  `distance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fighters` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_xenobe`
--

CREATE TABLE `bnt_xenobe` (
  `xenobe_id` char(40) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `aggression` smallint(5) NOT NULL DEFAULT '0',
  `orders` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bnt_zones`
--

CREATE TABLE `bnt_zones` (
  `zone_id` int(10) unsigned NOT NULL,
  `zone_name` tinytext,
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `corp_zone` enum('Y','N') NOT NULL DEFAULT 'N',
  `allow_beacon` enum('Y','N','L') NOT NULL DEFAULT 'Y',
  `allow_attack` enum('Y','N') NOT NULL DEFAULT 'Y',
  `allow_planetattack` enum('Y','N') NOT NULL DEFAULT 'Y',
  `allow_warpedit` enum('Y','N','L') NOT NULL DEFAULT 'Y',
  `allow_planet` enum('Y','L','N') NOT NULL DEFAULT 'Y',
  `allow_trade` enum('Y','L','N') NOT NULL DEFAULT 'Y',
  `allow_defenses` enum('Y','L','N') NOT NULL DEFAULT 'Y',
  `max_hull` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bnt_bounty`
--
ALTER TABLE `bnt_bounty`
  ADD PRIMARY KEY (`bounty_id`),
  ADD KEY `bounty_on` (`bounty_on`),
  ADD KEY `placed_by` (`placed_by`);

--
-- Indexes for table `bnt_ibank_accounts`
--
ALTER TABLE `bnt_ibank_accounts`
  ADD PRIMARY KEY (`ship_id`);

--
-- Indexes for table `bnt_IGB_transfers`
--
ALTER TABLE `bnt_IGB_transfers`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `amount` (`amount`);

--
-- Indexes for table `bnt_ip_bans`
--
ALTER TABLE `bnt_ip_bans`
  ADD PRIMARY KEY (`ban_id`);

--
-- Indexes for table `bnt_languages`
--
ALTER TABLE `bnt_languages`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `bnt_links`
--
ALTER TABLE `bnt_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_start` (`link_start`),
  ADD KEY `link_dest` (`link_dest`);

--
-- Indexes for table `bnt_logs`
--
ALTER TABLE `bnt_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idate` (`ship_id`,`time`);

--
-- Indexes for table `bnt_messages`
--
ALTER TABLE `bnt_messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bnt_movement_log`
--
ALTER TABLE `bnt_movement_log`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `ship_id` (`ship_id`),
  ADD KEY `sector_id` (`sector_id`);

--
-- Indexes for table `bnt_news`
--
ALTER TABLE `bnt_news`
  ADD PRIMARY KEY (`news_id`),
  ADD UNIQUE KEY `news_id_2` (`news_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `bnt_planets`
--
ALTER TABLE `bnt_planets`
  ADD PRIMARY KEY (`planet_id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `corp` (`corp`);

--
-- Indexes for table `bnt_scheduler`
--
ALTER TABLE `bnt_scheduler`
  ADD PRIMARY KEY (`sched_id`);

--
-- Indexes for table `bnt_sector_defence`
--
ALTER TABLE `bnt_sector_defence`
  ADD PRIMARY KEY (`defence_id`),
  ADD KEY `sector_id` (`sector_id`),
  ADD KEY `ship_id` (`ship_id`);

--
-- Indexes for table `bnt_sessions`
--
ALTER TABLE `bnt_sessions`
  ADD PRIMARY KEY (`EXPIRY`),
  ADD KEY `SESSKEY` (`SESSKEY`);

--
-- Indexes for table `bnt_ships`
--
ALTER TABLE `bnt_ships`
  ADD PRIMARY KEY (`email`),
  ADD KEY `email` (`email`),
  ADD KEY `sector` (`sector`),
  ADD KEY `ship_destroyed` (`ship_destroyed`),
  ADD KEY `on_planet` (`on_planet`),
  ADD KEY `team` (`team`),
  ADD KEY `ship_id` (`ship_id`);

--
-- Indexes for table `bnt_teams`
--
ALTER TABLE `bnt_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin` (`admin`);

--
-- Indexes for table `bnt_traderoutes`
--
ALTER TABLE `bnt_traderoutes`
  ADD PRIMARY KEY (`traderoute_id`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `bnt_universe`
--
ALTER TABLE `bnt_universe`
  ADD PRIMARY KEY (`sector_id`),
  ADD KEY `zone_id` (`zone_id`),
  ADD KEY `port_type` (`port_type`);

--
-- Indexes for table `bnt_xenobe`
--
ALTER TABLE `bnt_xenobe`
  ADD PRIMARY KEY (`xenobe_id`),
  ADD KEY `xenobe_id` (`xenobe_id`);

--
-- Indexes for table `bnt_zones`
--
ALTER TABLE `bnt_zones`
  ADD PRIMARY KEY (`zone_id`),
  ADD KEY `zone_id` (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bnt_bounty`
--
ALTER TABLE `bnt_bounty`
  MODIFY `bounty_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_IGB_transfers`
--
ALTER TABLE `bnt_IGB_transfers`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_ip_bans`
--
ALTER TABLE `bnt_ip_bans`
  MODIFY `ban_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_languages`
--
ALTER TABLE `bnt_languages`
  MODIFY `lang_id` smallint(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_links`
--
ALTER TABLE `bnt_links`
  MODIFY `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_logs`
--
ALTER TABLE `bnt_logs`
  MODIFY `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_messages`
--
ALTER TABLE `bnt_messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_movement_log`
--
ALTER TABLE `bnt_movement_log`
  MODIFY `event_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_news`
--
ALTER TABLE `bnt_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_planets`
--
ALTER TABLE `bnt_planets`
  MODIFY `planet_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_scheduler`
--
ALTER TABLE `bnt_scheduler`
  MODIFY `sched_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_sector_defence`
--
ALTER TABLE `bnt_sector_defence`
  MODIFY `defence_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_ships`
--
ALTER TABLE `bnt_ships`
  MODIFY `ship_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_traderoutes`
--
ALTER TABLE `bnt_traderoutes`
  MODIFY `traderoute_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_universe`
--
ALTER TABLE `bnt_universe`
  MODIFY `sector_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bnt_zones`
--
ALTER TABLE `bnt_zones`
  MODIFY `zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT;