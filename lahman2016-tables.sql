-- CREATE DATABASE  IF NOT EXISTS `baseball2016` /*!40100 DEFAULT CHARACTER SET utf8 */;
-- USE `baseball2016`;

/*

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : localhost
 Source Database       : lahman2016

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : utf-8

 Date: 02/25/2017 08:32:12 AM
*/

SET NAMES utf8mb4;


SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `AllstarFull`
-- ----------------------------
DROP TABLE IF EXISTS `AllstarFull`;
CREATE TABLE `AllstarFull` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `gameNum` int(11) DEFAULT NOT NULL,
  `gameID` varchar(255) DEFAULT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `GP` int(11) DEFAULT NULL,
  `startingPos` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`, `gameNum`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)


) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Appearances`
-- ----------------------------
DROP TABLE IF EXISTS `Appearances`;
CREATE TABLE `Appearances` (
  `yearID` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `playerID` varchar(255) DEFAULT NOT NULL,
  `G_all` int(11) DEFAULT NULL,
  `GS` varchar(255) DEFAULT NULL,
  `G_batting` int(11) DEFAULT NULL,
  `G_defense` int(11) DEFAULT NULL,
  `G_p` int(11) DEFAULT NULL,
  `G_c` int(11) DEFAULT NULL,
  `G_1b` int(11) DEFAULT NULL,
  `G_2b` int(11) DEFAULT NULL,
  `G_3b` int(11) DEFAULT NULL,
  `G_ss` int(11) DEFAULT NULL,
  `G_lf` int(11) DEFAULT NULL,
  `G_cf` int(11) DEFAULT NULL,
  `G_rf` int(11) DEFAULT NULL,
  `G_of` int(11) DEFAULT NULL,
  `G_dh` varchar(255) DEFAULT NULL,
  `G_ph` varchar(255) DEFAULT NULL,
  `G_pr` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`,`teamID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `AwardsManagers`
-- ----------------------------
DROP TABLE IF EXISTS `AwardsManagers`;
CREATE TABLE `AwardsManagers` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `awardID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `tie` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `awardID`, `yearID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `AwardsPlayers`
-- ----------------------------
DROP TABLE IF EXISTS `AwardsPlayers`;
CREATE TABLE `AwardsPlayers` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `awardID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NOT NULL,
  `tie` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `awardID`, `yearID`, `lgID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`)


) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `AwardsShareManagers`
-- ----------------------------
DROP TABLE IF EXISTS `AwardsShareManagers`;
CREATE TABLE `AwardsShareManagers` (
  `awardID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `playerID` varchar(255) DEFAULT NOT NULL,
  `pointsWon` int(11) DEFAULT NULL,
  `pointsMax` int(11) DEFAULT NULL,
  `votesFirst` int(11) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `awardID`, `yearID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `AwardsSharePlayers`
-- ----------------------------
DROP TABLE IF EXISTS `AwardsSharePlayers`;
CREATE TABLE `AwardsSharePlayers` (
  `awardID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `playerID` varchar(255) DEFAULT NOT NULL,
  `pointsWon` int(11) DEFAULT NULL,
  `pointsMax` int(11) DEFAULT NULL,
  `votesFirst` int(11) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `awardID`, `yearID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Batting`
-- ----------------------------
DROP TABLE IF EXISTS `Batting`;
CREATE TABLE `Batting` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `stint` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `AB` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `2B` int(11) DEFAULT NULL,
  `3B` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `RBI` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `IBB` varchar(255) DEFAULT NULL,
  `HBP` varchar(255) DEFAULT NULL,
  `SH` varchar(255) DEFAULT NULL,
  `SF` varchar(255) DEFAULT NULL,
  `GIDP` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`, `stint`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `BattingPost`
-- ----------------------------
DROP TABLE IF EXISTS `BattingPost`;
CREATE TABLE `BattingPost` (
  `yearID` int(11) DEFAULT NOT NULL,
  `round` varchar(255) DEFAULT NOT NULL,
  `playerID` varchar(255) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `AB` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `2B` int(11) DEFAULT NULL,
  `3B` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `RBI` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` varchar(255) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `IBB` int(11) DEFAULT NULL,
  `HBP` varchar(255) DEFAULT NULL,
  `SH` varchar(255) DEFAULT NULL,
  `SF` varchar(255) DEFAULT NULL,
  `GIDP` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`yearID`, `round`, `playerID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CollegePlaying`
-- ----------------------------
DROP TABLE IF EXISTS `CollegePlaying`;
CREATE TABLE `CollegePlaying` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `schoolID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,

  PRIMARY KEY (`playerID`, `schoolID`, `yearID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`schoolID`) references Schools (`schoolID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Fielding`
-- ----------------------------
DROP TABLE IF EXISTS `Fielding`;
CREATE TABLE `Fielding` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `stint` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `POS` varchar(255) DEFAULT NOT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` varchar(255) DEFAULT NULL,
  `InnOuts` varchar(255) DEFAULT NULL,
  `PO` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `PB` varchar(255) DEFAULT NULL,
  `WP` varchar(255) DEFAULT NULL,
  `SB` varchar(255) DEFAULT NULL,
  `CS` varchar(255) DEFAULT NULL,
  `ZR` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`, `stint`,`POS`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `FieldingOF`
-- ----------------------------
DROP TABLE IF EXISTS `FieldingOF`;
CREATE TABLE `FieldingOF` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `stint` int(11) DEFAULT NOT NULL,
  `Glf` int(11) DEFAULT NULL,
  `Gcf` int(11) DEFAULT NULL,
  `Grf` int(11) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`, `stint`),
  FOREIGN KEY (`playerID`) references Master (`playerID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `FieldingOFsplit`
-- ----------------------------
DROP TABLE IF EXISTS `FieldingOFsplit`;
CREATE TABLE `FieldingOFsplit` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `stint` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `POS` varchar(255) DEFAULT NOT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `InnOuts` int(11) DEFAULT NULL,
  `PO` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `PB` varchar(255) DEFAULT NULL,
  `WP` varchar(255) DEFAULT NULL,
  `SB` varchar(255) DEFAULT NULL,
  `CS` varchar(255) DEFAULT NULL,
  `ZR` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`, `stint`,`POS`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)


) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `FieldingPost`
-- ----------------------------
DROP TABLE IF EXISTS `FieldingPost`;
CREATE TABLE `FieldingPost` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `round` varchar(255) DEFAULT NOT NULL,
  `POS` varchar(255) DEFAULT NOT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `InnOuts` int(11) DEFAULT NULL,
  `PO` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `TP` int(11) DEFAULT NULL,
  `PB` varchar(255) DEFAULT NULL,
  `SB` varchar(255) DEFAULT NULL,
  `CS` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`, `round`,`POS`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `HallOfFame`
-- ----------------------------
DROP TABLE IF EXISTS `HallOfFame`;
CREATE TABLE `HallOfFame` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearid` int(11) DEFAULT NOT NULL,
  `votedBy` varchar(255) DEFAULT NOT NULL,
  `ballots` int(11) DEFAULT NULL,
  `needed` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `inducted` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `needed_note` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearid`, `votedBy`),
  FOREIGN KEY (`playerID`) references Master (`playerID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `HomeGames`
-- ----------------------------
DROP TABLE IF EXISTS `HomeGames`;
CREATE TABLE `HomeGames` (
  `year.key` int(11) DEFAULT NOT NULL,
  `league.key` varchar(255) DEFAULT NULL,
  `team.key` varchar(255) DEFAULT NOT NULL,
  `park.key` varchar(255) DEFAULT NOT NULL,
  `span.first` varchar(255) DEFAULT NULL,
  `span.last` varchar(255) DEFAULT NULL,
  `games` int(11) DEFAULT NULL,
  `openings` int(11) DEFAULT NULL,
  `attendance` int(11) DEFAULT NULL,

  PRIMARY KEY (`year.key`,`team.key`,`park.key`),
  FOREIGN KEY (`park.key`) references Parks (`park.key`),
  FOREIGN KEY (`team.key`,`year.key`) references Teams (`teamID`,`yearID`)



) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Managers`
-- ----------------------------
DROP TABLE IF EXISTS `Managers`;
CREATE TABLE `Managers` (
  `playerID` varchar(255) DEFAULT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `inseason` int(11) DEFAULT NOT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `plyrMgr` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`teamID`,`yearID`,`inseason`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `ManagersHalf`
-- ----------------------------
DROP TABLE IF EXISTS `ManagersHalf`;
CREATE TABLE `ManagersHalf` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `inseason` int(11) DEFAULT NULL,
  `half` int(11) DEFAULT NOT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,

  PRIMARY KEY (`playerID`,`yearID`,`half`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Master`
-- ----------------------------
DROP TABLE IF EXISTS `Master`;
CREATE TABLE `Master` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `birthMonth` int(11) DEFAULT NULL,
  `birthDay` int(11) DEFAULT NULL,
  `birthCountry` varchar(255) DEFAULT NULL,
  `birthState` varchar(255) DEFAULT NULL,
  `birthCity` varchar(255) DEFAULT NULL,
  `deathYear` varchar(255) DEFAULT NULL,
  `deathMonth` varchar(255) DEFAULT NULL,
  `deathDay` varchar(255) DEFAULT NULL,
  `deathCountry` varchar(255) DEFAULT NULL,
  `deathState` varchar(255) DEFAULT NULL,
  `deathCity` varchar(255) DEFAULT NULL,
  `nameFirst` varchar(255) DEFAULT NULL,
  `nameLast` varchar(255) DEFAULT NULL,
  `nameGiven` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `bats` varchar(255) DEFAULT NULL,
  `throws` varchar(255) DEFAULT NULL,
  `debut` varchar(255) DEFAULT NULL,
  `finalGame` varchar(255) DEFAULT NULL,
  `retroID` varchar(255) DEFAULT NULL,
  `bbrefID` varchar(255) DEFAULT NULL,

    PRIMARY KEY (`playerID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Parks`
-- ----------------------------
DROP TABLE IF EXISTS `Parks`;
CREATE TABLE `Parks` (
  `park.key` varchar(255) DEFAULT NOT NULL,
  `park.name` varchar(255) DEFAULT NULL,
  `park.alias` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`park.key`)


) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Pitching`
-- ----------------------------
DROP TABLE IF EXISTS `Pitching`;
CREATE TABLE `Pitching` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `stint` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `CG` int(11) DEFAULT NULL,
  `SHO` int(11) DEFAULT NULL,
  `SV` int(11) DEFAULT NULL,
  `IPouts` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `ER` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `BAOpp` varchar(255) DEFAULT NULL,
  `ERA` float DEFAULT NULL,
  `IBB` varchar(255) DEFAULT NULL,
  `WP` varchar(255) DEFAULT NULL,
  `HBP` varchar(255) DEFAULT NULL,
  `BK` int(11) DEFAULT NULL,
  `BFP` varchar(255) DEFAULT NULL,
  `GF` varchar(255) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `SH` varchar(255) DEFAULT NULL,
  `SF` varchar(255) DEFAULT NULL,
  `GIDP` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`, `stint`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PitchingPost`
-- ----------------------------
DROP TABLE IF EXISTS `PitchingPost`;
CREATE TABLE `PitchingPost` (
  `playerID` varchar(255) DEFAULT NOT NULL,
  `yearID` int(11) DEFAULT NOT NULL,
  `round` varchar(255) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `CG` int(11) DEFAULT NULL,
  `SHO` int(11) DEFAULT NULL,
  `SV` int(11) DEFAULT NULL,
  `IPouts` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `ER` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `BAOpp` float DEFAULT NULL,
  `ERA` varchar(255) DEFAULT NULL,
  `IBB` int(11) DEFAULT NULL,
  `WP` int(11) DEFAULT NULL,
  `HBP` int(11) DEFAULT NULL,
  `BK` int(11) DEFAULT NULL,
  `BFP` int(11) DEFAULT NULL,
  `GF` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `SH` int(11) DEFAULT NULL,
  `SF` int(11) DEFAULT NULL,
  `GIDP` int(11) DEFAULT NULL,

  PRIMARY KEY (`yearID`, `round`, `playerID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Salaries`
-- ----------------------------
DROP TABLE IF EXISTS `Salaries`;
CREATE TABLE `Salaries` (
  `yearID` int(11) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `playerID` varchar(255) DEFAULT NOT NULL,
  `salary` int(11) DEFAULT NULL,

  PRIMARY KEY (`playerID`, `yearID`, `teamID`),
  FOREIGN KEY (`playerID`) references Master (`playerID`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `Schools`
-- ----------------------------
DROP TABLE IF EXISTS `Schools`;
CREATE TABLE `Schools` (
  `schoolID` varchar(255) DEFAULT NOT NULL,
  `name_full` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`schoolID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SeriesPost`
-- ----------------------------
DROP TABLE IF EXISTS `SeriesPost`;
CREATE TABLE `SeriesPost` (
  `yearID` int(11) DEFAULT NOT NULL,
  `round` varchar(255) DEFAULT NOT NULL,
  `teamIDwinner` varchar(255) DEFAULT NULL,
  `lgIDwinner` varchar(255) DEFAULT NULL,
  `teamIDloser` varchar(255) DEFAULT NULL,
  `lgIDloser` varchar(255) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `ties` int(11) DEFAULT NULL,

  PRIMARY KEY (`yearID`,`round`),
  FOREIGN KEY (`teamIDwinner`,`yearID`) references Teams (`teamID`,`yearID`),
  FOREIGN KEY (`teamIDloser`,`yearID`) references Teams (`teamID`,`yearID`),
  -- this is Libang Liang works, 2020 Jan 17

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Teams`
-- ----------------------------
DROP TABLE IF EXISTS `Teams`;
CREATE TABLE `Teams` (
  `yearID` int(11) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NOT NULL,
  `teamID` varchar(255) DEFAULT NOT NULL,
  `franchID` varchar(255) DEFAULT NULL,
  `divID` varchar(255) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `Ghome` varchar(255) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `DivWin` varchar(255) DEFAULT NULL,
  `WCWin` varchar(255) DEFAULT NULL,
  `LgWin` varchar(255) DEFAULT NULL,
  `WSWin` varchar(255) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `AB` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `2B` int(11) DEFAULT NULL,
  `3B` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` varchar(255) DEFAULT NULL,
  `HBP` varchar(255) DEFAULT NULL,
  `SF` varchar(255) DEFAULT NULL,
  `RA` int(11) DEFAULT NULL,
  `ER` int(11) DEFAULT NULL,
  `ERA` float DEFAULT NULL,
  `CG` int(11) DEFAULT NULL,
  `SHO` int(11) DEFAULT NULL,
  `SV` int(11) DEFAULT NULL,
  `IPouts` int(11) DEFAULT NULL,
  `HA` int(11) DEFAULT NULL,
  `HRA` int(11) DEFAULT NULL,
  `BBA` int(11) DEFAULT NULL,
  `SOA` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` varchar(255) DEFAULT NULL,
  `FP` float DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `park` varchar(255) DEFAULT NULL,
  `attendance` varchar(255) DEFAULT NULL,
  `BPF` int(11) DEFAULT NULL,
  `PPF` int(11) DEFAULT NULL,
  `teamIDBR` varchar(255) DEFAULT NULL,
  `teamIDlahman45` varchar(255) DEFAULT NULL,
  `teamIDretro` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`teamID`,`yearID`,`lgID`),
  FOREIGN KEY (`franchID`) references TeamsFranchises (`franchID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `TeamsFranchises`
-- ----------------------------
DROP TABLE IF EXISTS `TeamsFranchises`;
CREATE TABLE `TeamsFranchises` (
  `franchID` varchar(255) DEFAULT NOT NULL,
  `franchName` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `NAassoc` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`franchID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `TeamsHalf`
-- ----------------------------
DROP TABLE IF EXISTS `TeamsHalf`;
CREATE TABLE `TeamsHalf` (
  `yearID` int(11) DEFAULT NOT NULL,
  `lgID` varchar(255) DEFAULT NULL,
  `teamID` varchar(255) DEFAULT NOT NULL,
  `Half` int(11) DEFAULT NOT NULL,
  `divID` varchar(255) DEFAULT NULL,
  `DivWin` varchar(255) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` decimal(11) DEFAULT NULL,

  PRIMARY KEY (`teamID`,`yearID`,`Half`),
  FOREIGN KEY (`teamID`,`yearID`) references Teams (`teamID`,`yearID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;
