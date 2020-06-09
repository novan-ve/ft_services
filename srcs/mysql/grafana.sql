-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: May 02, 2020 at 01:35 PM
-- Server version: 10.4.12-MariaDB
-- PHP Version: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grafana`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `panel_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` bigint(20) NOT NULL,
  `handler` bigint(20) NOT NULL,
  `severity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `silenced` tinyint(1) NOT NULL,
  `execution_error` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eval_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eval_date` datetime DEFAULT NULL,
  `new_state_date` datetime NOT NULL,
  `state_changes` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `for` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alert_notification`
--

CREATE TABLE `alert_notification` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `frequency` bigint(20) DEFAULT NULL,
  `send_reminder` tinyint(1) DEFAULT 0,
  `disable_resolve_message` tinyint(1) NOT NULL DEFAULT 0,
  `uid` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alert_notification_state`
--

CREATE TABLE `alert_notification_state` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) NOT NULL,
  `notifier_id` bigint(20) NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `alert_rule_state_updated_version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alert_rule_tag`
--

CREATE TABLE `alert_rule_tag` (
  `alert_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `annotation`
--

CREATE TABLE `annotation` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `dashboard_id` bigint(20) DEFAULT NULL,
  `panel_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metric` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_state` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_state` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `region_id` bigint(20) DEFAULT 0,
  `tags` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` bigint(20) DEFAULT 0,
  `updated` bigint(20) DEFAULT 0,
  `epoch_end` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `annotation_tag`
--

CREATE TABLE `annotation_tag` (
  `annotation_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE `api_key` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expires` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_data`
--

CREATE TABLE `cache_data` (
  `cache_key` varchar(168) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `expires` int(255) NOT NULL,
  `created_at` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard`
--

CREATE TABLE `dashboard` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `slug` varchar(189) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(189) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `gnet_id` bigint(20) DEFAULT NULL,
  `plugin_id` varchar(189) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint(20) NOT NULL DEFAULT 0,
  `is_folder` tinyint(1) NOT NULL DEFAULT 0,
  `has_acl` tinyint(1) NOT NULL DEFAULT 0,
  `uid` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard`
--

INSERT INTO `dashboard` (`id`, `version`, `slug`, `title`, `data`, `org_id`, `created`, `updated`, `updated_by`, `created_by`, `gnet_id`, `plugin_id`, `folder_id`, `is_folder`, `has_acl`, `uid`) VALUES
(1, 1, 'ftps', 'ftps', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:58\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"cacheTimeout\":null,\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"links\":[],\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[{\"$$hashKey\":\"object:308\",\"id\":0,\"op\":\"=\",\"text\":\"N/A\",\"type\":1,\"value\":\"null\"}],\"nullValueMode\":\"connected\",\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]},\"unit\":\"none\"},\"overrides\":[],\"values\":false},\"orientation\":\"horizontal\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"ftps\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"ftps\",\"uid\":\"In9Utp6Zz\",\"variables\":{\"list\":[]},\"version\":1}', 1, '2020-05-02 12:24:26', '2020-05-02 12:24:26', 1, 1, 0, '', 0, 0, 0, 'In9Utp6Zz'),
(2, 1, 'grafana', 'grafana', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:453\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"grafana\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"grafana\",\"uid\":\"qtKXpteWk\",\"variables\":{\"list\":[]},\"version\":1}', 1, '2020-05-02 12:25:47', '2020-05-02 12:25:47', 1, 1, 0, '', 0, 0, 0, 'qtKXpteWk'),
(3, 1, 'influxDB', 'influxDB', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:775\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"influxDB\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"influxDB\",\"uid\":\"ArOjtteZz\",\"variables\":{\"list\":[]},\"version\":1}', 1, '2020-05-02 12:26:52', '2020-05-02 12:26:52', 1, 1, 0, '', 0, 0, 0, 'ArOjtteZz'),
(4, 1, 'mysql', 'mysql', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1054\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"mysql\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"mysql\",\"uid\":\"oOuqppeWk\",\"variables\":{\"list\":[]},\"version\":1}', 1, '2020-05-02 12:27:41', '2020-05-02 12:27:41', 1, 1, 0, '', 0, 0, 0, 'oOuqppeWk'),
(5, 1, 'nginx', 'nginx', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1260\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"dataLinks\":[]},\"percentage\":false,\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"nginx\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Memory usage percentage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"nginx\",\"uid\":\"m8iRhp6Wk\",\"variables\":{\"list\":[]},\"version\":1}', 1, '2020-05-02 12:28:22', '2020-05-02 12:28:22', 1, 1, 0, '', 0, 0, 0, 'm8iRhp6Wk'),
(6, 1, 'phpmyadmin', 'phpmyadmin', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1401\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"phpmyadmin\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"phpmyadmin\",\"uid\":\"tYik2t6Wk\",\"variables\":{\"list\":[]},\"version\":1}', 1, '2020-05-02 12:28:54', '2020-05-02 12:28:54', 1, 1, 0, '', 0, 0, 0, 'tYik2t6Wk'),
(7, 1, 'telegraf', 'telegraf', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1613\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"telegraf\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"telegraf\",\"uid\":\"rY5mht6Wk\",\"variables\":{\"list\":[]},\"version\":1}', 1, '2020-05-02 12:29:37', '2020-05-02 12:29:37', 1, 1, 0, '', 0, 0, 0, 'rY5mht6Wk'),
(8, 1, 'wordpress', 'wordpress', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1825\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"wordpress\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"wordpress\",\"uid\":\"rgwZ2peWk\",\"variables\":{\"list\":[]},\"version\":1}', 1, '2020-05-02 12:30:23', '2020-05-02 12:30:23', 1, 1, 0, '', 0, 0, 0, 'rgwZ2peWk');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_acl`
--

CREATE TABLE `dashboard_acl` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `permission` smallint(6) NOT NULL DEFAULT 4,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_acl`
--

INSERT INTO `dashboard_acl` (`id`, `org_id`, `dashboard_id`, `user_id`, `team_id`, `permission`, `role`, `created`, `updated`) VALUES
(1, -1, -1, NULL, NULL, 1, 'Viewer', '2017-06-20 00:00:00', '2017-06-20 00:00:00'),
(2, -1, -1, NULL, NULL, 2, 'Editor', '2017-06-20 00:00:00', '2017-06-20 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_provisioning`
--

CREATE TABLE `dashboard_provisioning` (
  `id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` int(11) NOT NULL DEFAULT 0,
  `check_sum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_snapshot`
--

CREATE TABLE `dashboard_snapshot` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_key` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `external` tinyint(1) NOT NULL,
  `external_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external_delete_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_tag`
--

CREATE TABLE `dashboard_tag` (
  `id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `term` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_version`
--

CREATE TABLE `dashboard_version` (
  `id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `parent_version` int(11) NOT NULL,
  `restored_from` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_version`
--

INSERT INTO `dashboard_version` (`id`, `dashboard_id`, `parent_version`, `restored_from`, `version`, `created`, `created_by`, `message`, `data`) VALUES
(1, 1, 0, 0, 1, '2020-05-02 12:24:26', 1, '', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:58\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"cacheTimeout\":null,\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"links\":[],\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[{\"$$hashKey\":\"object:308\",\"id\":0,\"op\":\"=\",\"text\":\"N/A\",\"type\":1,\"value\":\"null\"}],\"nullValueMode\":\"connected\",\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]},\"unit\":\"none\"},\"overrides\":[],\"values\":false},\"orientation\":\"horizontal\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"ftps\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"ftps\",\"uid\":\"In9Utp6Zz\",\"variables\":{\"list\":[]},\"version\":1}'),
(2, 2, 0, 0, 1, '2020-05-02 12:25:47', 1, '', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:453\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"grafana\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"grafana\",\"uid\":\"qtKXpteWk\",\"variables\":{\"list\":[]},\"version\":1}'),
(3, 3, 0, 0, 1, '2020-05-02 12:26:52', 1, '', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:775\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"influxDB\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"influxDB\",\"uid\":\"ArOjtteZz\",\"variables\":{\"list\":[]},\"version\":1}'),
(4, 4, 0, 0, 1, '2020-05-02 12:27:41', 1, '', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1054\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"mysql\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"mysql\",\"uid\":\"oOuqppeWk\",\"variables\":{\"list\":[]},\"version\":1}'),
(5, 5, 0, 0, 1, '2020-05-02 12:28:22', 1, '', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1260\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"dataLinks\":[]},\"percentage\":false,\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"nginx\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Memory usage percentage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"nginx\",\"uid\":\"m8iRhp6Wk\",\"variables\":{\"list\":[]},\"version\":1}'),
(6, 6, 0, 0, 1, '2020-05-02 12:28:54', 1, '', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1401\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"phpmyadmin\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"phpmyadmin\",\"uid\":\"tYik2t6Wk\",\"variables\":{\"list\":[]},\"version\":1}'),
(7, 7, 0, 0, 1, '2020-05-02 12:29:37', 1, '', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1613\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"telegraf\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"telegraf\",\"uid\":\"rY5mht6Wk\",\"variables\":{\"list\":[]},\"version\":1}'),
(8, 8, 0, 0, 1, '2020-05-02 12:30:23', 1, '', '{\"annotations\":{\"list\":[{\"$$hashKey\":\"object:1825\",\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"hideControls\":false,\"id\":null,\"links\":[],\"panels\":[{\"datasource\":null,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"fieldOptions\":{\"calcs\":[\"mean\"],\"defaults\":{\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[],\"values\":false},\"orientation\":\"auto\",\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"6.7.3\",\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"io.kubernetes.container.name\",\"operator\":\"=\",\"value\":\"wordpress\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"Memory usage percentage\",\"type\":\"gauge\"}],\"schemaVersion\":22,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"wordpress\",\"uid\":\"rgwZ2peWk\",\"variables\":{\"list\":[]},\"version\":1}');

-- --------------------------------------------------------

--
-- Table structure for table `data_source`
--

CREATE TABLE `data_source` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_auth` tinyint(1) NOT NULL,
  `basic_auth_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_auth_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `with_credentials` tinyint(1) NOT NULL DEFAULT 0,
  `secure_json_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_only` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_source`
--

INSERT INTO `data_source` (`id`, `org_id`, `version`, `type`, `name`, `access`, `url`, `password`, `user`, `database`, `basic_auth`, `basic_auth_user`, `basic_auth_password`, `is_default`, `json_data`, `created`, `updated`, `with_credentials`, `secure_json_data`, `read_only`) VALUES
(1, 1, 5, 'influxdb', 'InfluxDB', 'proxy', 'http://192.168.99.156:8086', '', 'telegraf-admin', 'telegraf', 0, '', '', 1, '{\"timeInterval\":\"10s\"}', '2020-05-02 12:17:15', '2020-05-02 12:18:24', 0, '{\"password\":\"VXN2NWFOWnifqIsNf/k5qxbGscS5qa2OK2Fl0T5O/GHtKnbWh3fMmS/7\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempt`
--

CREATE TABLE `login_attempt` (
  `id` bigint(20) NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration_log`
--

CREATE TABLE `migration_log` (
  `id` bigint(20) NOT NULL,
  `migration_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  `error` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_log`
--

INSERT INTO `migration_log` (`id`, `migration_id`, `sql`, `success`, `error`, `timestamp`) VALUES
(1, 'create migration_log table', 'CREATE TABLE IF NOT EXISTS `migration_log` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `migration_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `sql` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `success` TINYINT(1) NOT NULL\n, `error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `timestamp` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:15'),
(2, 'create user table', 'CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `account_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:15'),
(3, 'add unique index user.login', 'CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);', 1, '', '2020-05-02 12:16:15'),
(4, 'add unique index user.email', 'CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);', 1, '', '2020-05-02 12:16:16'),
(5, 'drop index UQE_user_login - v1', 'DROP INDEX `UQE_user_login` ON `user`', 1, '', '2020-05-02 12:16:16'),
(6, 'drop index UQE_user_email - v1', 'DROP INDEX `UQE_user_email` ON `user`', 1, '', '2020-05-02 12:16:16'),
(7, 'Rename table user to user_v1 - v1', 'ALTER TABLE `user` RENAME TO `user_v1`', 1, '', '2020-05-02 12:16:16'),
(8, 'create user table v2', 'CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `org_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `email_verified` TINYINT(1) NULL\n, `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:16'),
(9, 'create index UQE_user_login - v2', 'CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);', 1, '', '2020-05-02 12:16:17'),
(10, 'create index UQE_user_email - v2', 'CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);', 1, '', '2020-05-02 12:16:17'),
(11, 'copy data_source v1 to v2', 'INSERT INTO `user` (`version`\n, `company`\n, `created`\n, `salt`\n, `rands`\n, `org_id`\n, `id`\n, `login`\n, `email`\n, `name`\n, `password`\n, `is_admin`\n, `updated`) SELECT `version`\n, `company`\n, `created`\n, `salt`\n, `rands`\n, `account_id`\n, `id`\n, `login`\n, `email`\n, `name`\n, `password`\n, `is_admin`\n, `updated` FROM `user_v1`', 1, '', '2020-05-02 12:16:17'),
(12, 'Drop old table user_v1', 'DROP TABLE IF EXISTS `user_v1`', 1, '', '2020-05-02 12:16:17'),
(13, 'Add column help_flags1 to user table', 'alter table `user` ADD COLUMN `help_flags1` BIGINT(20) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:17'),
(14, 'Update user table charset', 'ALTER TABLE `user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2020-05-02 12:16:18'),
(15, 'Add last_seen_at column to user', 'alter table `user` ADD COLUMN `last_seen_at` DATETIME NULL ', 1, '', '2020-05-02 12:16:18'),
(16, 'Add missing user data', 'code migration', 1, '', '2020-05-02 12:16:18'),
(17, 'Add is_disabled column to user', 'alter table `user` ADD COLUMN `is_disabled` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:18'),
(18, 'create temp user table v1-7', 'CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `invited_by_user_id` BIGINT(20) NULL\n, `email_sent` TINYINT(1) NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:18'),
(19, 'create index IDX_temp_user_email - v1-7', 'CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);', 1, '', '2020-05-02 12:16:18'),
(20, 'create index IDX_temp_user_org_id - v1-7', 'CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);', 1, '', '2020-05-02 12:16:19'),
(21, 'create index IDX_temp_user_code - v1-7', 'CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);', 1, '', '2020-05-02 12:16:19'),
(22, 'create index IDX_temp_user_status - v1-7', 'CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);', 1, '', '2020-05-02 12:16:19'),
(23, 'Update temp_user table charset', 'ALTER TABLE `temp_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2020-05-02 12:16:19'),
(24, 'create star table', 'CREATE TABLE IF NOT EXISTS `star` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:19'),
(25, 'add unique index star.user_id_dashboard_id', 'CREATE UNIQUE INDEX `UQE_star_user_id_dashboard_id` ON `star` (`user_id`,`dashboard_id`);', 1, '', '2020-05-02 12:16:19'),
(26, 'create org table v1', 'CREATE TABLE IF NOT EXISTS `org` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:20'),
(27, 'create index UQE_org_name - v1', 'CREATE UNIQUE INDEX `UQE_org_name` ON `org` (`name`);', 1, '', '2020-05-02 12:16:20'),
(28, 'create org_user table v1', 'CREATE TABLE IF NOT EXISTS `org_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:20'),
(29, 'create index IDX_org_user_org_id - v1', 'CREATE INDEX `IDX_org_user_org_id` ON `org_user` (`org_id`);', 1, '', '2020-05-02 12:16:20'),
(30, 'create index UQE_org_user_org_id_user_id - v1', 'CREATE UNIQUE INDEX `UQE_org_user_org_id_user_id` ON `org_user` (`org_id`,`user_id`);', 1, '', '2020-05-02 12:16:20'),
(31, 'Update org table charset', 'ALTER TABLE `org` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2020-05-02 12:16:21'),
(32, 'Update org_user table charset', 'ALTER TABLE `org_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:21'),
(33, 'Migrate all Read Only Viewers to Viewers', 'UPDATE org_user SET role = \'Viewer\' WHERE role = \'Read Only Editor\'', 1, '', '2020-05-02 12:16:21'),
(34, 'create dashboard table', 'CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:21'),
(35, 'add index dashboard.account_id', 'CREATE INDEX `IDX_dashboard_account_id` ON `dashboard` (`account_id`);', 1, '', '2020-05-02 12:16:21'),
(36, 'add unique index dashboard_account_id_slug', 'CREATE UNIQUE INDEX `UQE_dashboard_account_id_slug` ON `dashboard` (`account_id`,`slug`);', 1, '', '2020-05-02 12:16:21'),
(37, 'create dashboard_tag table', 'CREATE TABLE IF NOT EXISTS `dashboard_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:21'),
(38, 'add unique index dashboard_tag.dasboard_id_term', 'CREATE UNIQUE INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag` (`dashboard_id`,`term`);', 1, '', '2020-05-02 12:16:21'),
(39, 'drop index UQE_dashboard_tag_dashboard_id_term - v1', 'DROP INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag`', 1, '', '2020-05-02 12:16:21'),
(40, 'Rename table dashboard to dashboard_v1 - v1', 'ALTER TABLE `dashboard` RENAME TO `dashboard_v1`', 1, '', '2020-05-02 12:16:21'),
(41, 'create dashboard v2', 'CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:22'),
(42, 'create index IDX_dashboard_org_id - v2', 'CREATE INDEX `IDX_dashboard_org_id` ON `dashboard` (`org_id`);', 1, '', '2020-05-02 12:16:22'),
(43, 'create index UQE_dashboard_org_id_slug - v2', 'CREATE UNIQUE INDEX `UQE_dashboard_org_id_slug` ON `dashboard` (`org_id`,`slug`);', 1, '', '2020-05-02 12:16:22'),
(44, 'copy dashboard v1 to v2', 'INSERT INTO `dashboard` (`updated`\n, `id`\n, `version`\n, `slug`\n, `title`\n, `data`\n, `org_id`\n, `created`) SELECT `updated`\n, `id`\n, `version`\n, `slug`\n, `title`\n, `data`\n, `account_id`\n, `created` FROM `dashboard_v1`', 1, '', '2020-05-02 12:16:22'),
(45, 'drop table dashboard_v1', 'DROP TABLE IF EXISTS `dashboard_v1`', 1, '', '2020-05-02 12:16:22'),
(46, 'alter dashboard.data to mediumtext v1', 'ALTER TABLE dashboard MODIFY data MEDIUMTEXT;', 1, '', '2020-05-02 12:16:22'),
(47, 'Add column updated_by in dashboard - v2', 'alter table `dashboard` ADD COLUMN `updated_by` INT NULL ', 1, '', '2020-05-02 12:16:23'),
(48, 'Add column created_by in dashboard - v2', 'alter table `dashboard` ADD COLUMN `created_by` INT NULL ', 1, '', '2020-05-02 12:16:23'),
(49, 'Add column gnetId in dashboard', 'alter table `dashboard` ADD COLUMN `gnet_id` BIGINT(20) NULL ', 1, '', '2020-05-02 12:16:23'),
(50, 'Add index for gnetId in dashboard', 'CREATE INDEX `IDX_dashboard_gnet_id` ON `dashboard` (`gnet_id`);', 1, '', '2020-05-02 12:16:23'),
(51, 'Add column plugin_id in dashboard', 'alter table `dashboard` ADD COLUMN `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:23'),
(52, 'Add index for plugin_id in dashboard', 'CREATE INDEX `IDX_dashboard_org_id_plugin_id` ON `dashboard` (`org_id`,`plugin_id`);', 1, '', '2020-05-02 12:16:23'),
(53, 'Add index for dashboard_id in dashboard_tag', 'CREATE INDEX `IDX_dashboard_tag_dashboard_id` ON `dashboard_tag` (`dashboard_id`);', 1, '', '2020-05-02 12:16:23'),
(54, 'Update dashboard table charset', 'ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `data` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:23'),
(55, 'Update dashboard_tag table charset', 'ALTER TABLE `dashboard_tag` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:24'),
(56, 'Add column folder_id in dashboard', 'alter table `dashboard` ADD COLUMN `folder_id` BIGINT(20) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:24'),
(57, 'Add column isFolder in dashboard', 'alter table `dashboard` ADD COLUMN `is_folder` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:24'),
(58, 'Add column has_acl in dashboard', 'alter table `dashboard` ADD COLUMN `has_acl` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:24'),
(59, 'Add column uid in dashboard', 'alter table `dashboard` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:24'),
(60, 'Update uid column values in dashboard', 'UPDATE dashboard SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;', 1, '', '2020-05-02 12:16:24'),
(61, 'Add unique index dashboard_org_id_uid', 'CREATE UNIQUE INDEX `UQE_dashboard_org_id_uid` ON `dashboard` (`org_id`,`uid`);', 1, '', '2020-05-02 12:16:24'),
(62, 'Remove unique index org_id_slug', 'DROP INDEX `UQE_dashboard_org_id_slug` ON `dashboard`', 1, '', '2020-05-02 12:16:24'),
(63, 'Update dashboard title length', 'ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `title` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:24'),
(64, 'Add unique index for dashboard_org_id_title_folder_id', 'CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`);', 1, '', '2020-05-02 12:16:25'),
(65, 'create dashboard_provisioning', 'CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:25'),
(66, 'Rename table dashboard_provisioning to dashboard_provisioning_tmp_qwerty - v1', 'ALTER TABLE `dashboard_provisioning` RENAME TO `dashboard_provisioning_tmp_qwerty`', 1, '', '2020-05-02 12:16:25'),
(67, 'create dashboard_provisioning v2', 'CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:25'),
(68, 'create index IDX_dashboard_provisioning_dashboard_id - v2', 'CREATE INDEX `IDX_dashboard_provisioning_dashboard_id` ON `dashboard_provisioning` (`dashboard_id`);', 1, '', '2020-05-02 12:16:26'),
(69, 'create index IDX_dashboard_provisioning_dashboard_id_name - v2', 'CREATE INDEX `IDX_dashboard_provisioning_dashboard_id_name` ON `dashboard_provisioning` (`dashboard_id`,`name`);', 1, '', '2020-05-02 12:16:26'),
(70, 'copy dashboard_provisioning v1 to v2', 'INSERT INTO `dashboard_provisioning` (`external_id`\n, `id`\n, `dashboard_id`\n, `name`) SELECT `external_id`\n, `id`\n, `dashboard_id`\n, `name` FROM `dashboard_provisioning_tmp_qwerty`', 1, '', '2020-05-02 12:16:26'),
(71, 'drop dashboard_provisioning_tmp_qwerty', 'DROP TABLE IF EXISTS `dashboard_provisioning_tmp_qwerty`', 1, '', '2020-05-02 12:16:26'),
(72, 'Add check_sum column', 'alter table `dashboard_provisioning` ADD COLUMN `check_sum` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:26'),
(73, 'create data_source table', 'CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:26'),
(74, 'add index data_source.account_id', 'CREATE INDEX `IDX_data_source_account_id` ON `data_source` (`account_id`);', 1, '', '2020-05-02 12:16:26'),
(75, 'add unique index data_source.account_id_name', 'CREATE UNIQUE INDEX `UQE_data_source_account_id_name` ON `data_source` (`account_id`,`name`);', 1, '', '2020-05-02 12:16:26'),
(76, 'drop index IDX_data_source_account_id - v1', 'DROP INDEX `IDX_data_source_account_id` ON `data_source`', 1, '', '2020-05-02 12:16:26'),
(77, 'drop index UQE_data_source_account_id_name - v1', 'DROP INDEX `UQE_data_source_account_id_name` ON `data_source`', 1, '', '2020-05-02 12:16:26'),
(78, 'Rename table data_source to data_source_v1 - v1', 'ALTER TABLE `data_source` RENAME TO `data_source_v1`', 1, '', '2020-05-02 12:16:27'),
(79, 'create data_source table v2', 'CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:27'),
(80, 'create index IDX_data_source_org_id - v2', 'CREATE INDEX `IDX_data_source_org_id` ON `data_source` (`org_id`);', 1, '', '2020-05-02 12:16:27'),
(81, 'create index UQE_data_source_org_id_name - v2', 'CREATE UNIQUE INDEX `UQE_data_source_org_id_name` ON `data_source` (`org_id`,`name`);', 1, '', '2020-05-02 12:16:27'),
(82, 'copy data_source v1 to v2', 'INSERT INTO `data_source` (`password`\n, `basic_auth_password`\n, `is_default`\n, `created`\n, `version`\n, `name`\n, `access`\n, `user`\n, `type`\n, `database`\n, `basic_auth_user`\n, `updated`\n, `id`\n, `org_id`\n, `url`\n, `basic_auth`) SELECT `password`\n, `basic_auth_password`\n, `is_default`\n, `created`\n, `version`\n, `name`\n, `access`\n, `user`\n, `type`\n, `database`\n, `basic_auth_user`\n, `updated`\n, `id`\n, `account_id`\n, `url`\n, `basic_auth` FROM `data_source_v1`', 1, '', '2020-05-02 12:16:27'),
(83, 'Drop old table data_source_v1 #2', 'DROP TABLE IF EXISTS `data_source_v1`', 1, '', '2020-05-02 12:16:27'),
(84, 'Add column with_credentials', 'alter table `data_source` ADD COLUMN `with_credentials` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:27'),
(85, 'Add secure json data column', 'alter table `data_source` ADD COLUMN `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:27'),
(86, 'Update data_source table charset', 'ALTER TABLE `data_source` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2020-05-02 12:16:27'),
(87, 'Update initial version to 1', 'UPDATE data_source SET version = 1 WHERE version = 0', 1, '', '2020-05-02 12:16:28'),
(88, 'Add read_only data column', 'alter table `data_source` ADD COLUMN `read_only` TINYINT(1) NULL ', 1, '', '2020-05-02 12:16:28'),
(89, 'Migrate logging ds to loki ds', 'UPDATE data_source SET type = \'loki\' WHERE type = \'logging\'', 1, '', '2020-05-02 12:16:28'),
(90, 'Update json_data with nulls', 'UPDATE data_source SET json_data = \'{}\' WHERE json_data is null', 1, '', '2020-05-02 12:16:28'),
(91, 'create api_key table', 'CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:28'),
(92, 'add index api_key.account_id', 'CREATE INDEX `IDX_api_key_account_id` ON `api_key` (`account_id`);', 1, '', '2020-05-02 12:16:28'),
(93, 'add index api_key.key', 'CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);', 1, '', '2020-05-02 12:16:28'),
(94, 'add index api_key.account_id_name', 'CREATE UNIQUE INDEX `UQE_api_key_account_id_name` ON `api_key` (`account_id`,`name`);', 1, '', '2020-05-02 12:16:28'),
(95, 'drop index IDX_api_key_account_id - v1', 'DROP INDEX `IDX_api_key_account_id` ON `api_key`', 1, '', '2020-05-02 12:16:28'),
(96, 'drop index UQE_api_key_key - v1', 'DROP INDEX `UQE_api_key_key` ON `api_key`', 1, '', '2020-05-02 12:16:29'),
(97, 'drop index UQE_api_key_account_id_name - v1', 'DROP INDEX `UQE_api_key_account_id_name` ON `api_key`', 1, '', '2020-05-02 12:16:29'),
(98, 'Rename table api_key to api_key_v1 - v1', 'ALTER TABLE `api_key` RENAME TO `api_key_v1`', 1, '', '2020-05-02 12:16:29'),
(99, 'create api_key table v2', 'CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:29'),
(100, 'create index IDX_api_key_org_id - v2', 'CREATE INDEX `IDX_api_key_org_id` ON `api_key` (`org_id`);', 1, '', '2020-05-02 12:16:30'),
(101, 'create index UQE_api_key_key - v2', 'CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);', 1, '', '2020-05-02 12:16:30'),
(102, 'create index UQE_api_key_org_id_name - v2', 'CREATE UNIQUE INDEX `UQE_api_key_org_id_name` ON `api_key` (`org_id`,`name`);', 1, '', '2020-05-02 12:16:30'),
(103, 'copy api_key v1 to v2', 'INSERT INTO `api_key` (`role`\n, `created`\n, `updated`\n, `id`\n, `org_id`\n, `name`\n, `key`) SELECT `role`\n, `created`\n, `updated`\n, `id`\n, `account_id`\n, `name`\n, `key` FROM `api_key_v1`', 1, '', '2020-05-02 12:16:30'),
(104, 'Drop old table api_key_v1', 'DROP TABLE IF EXISTS `api_key_v1`', 1, '', '2020-05-02 12:16:30'),
(105, 'Update api_key table charset', 'ALTER TABLE `api_key` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:31'),
(106, 'Add expires to api_key table', 'alter table `api_key` ADD COLUMN `expires` BIGINT(20) NULL ', 1, '', '2020-05-02 12:16:31'),
(107, 'create dashboard_snapshot table v4', 'CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:31'),
(108, 'drop table dashboard_snapshot_v4 #1', 'DROP TABLE IF EXISTS `dashboard_snapshot`', 1, '', '2020-05-02 12:16:31'),
(109, 'create dashboard_snapshot table v5 #2', 'CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `external` TINYINT(1) NOT NULL\n, `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:31'),
(110, 'create index UQE_dashboard_snapshot_key - v5', 'CREATE UNIQUE INDEX `UQE_dashboard_snapshot_key` ON `dashboard_snapshot` (`key`);', 1, '', '2020-05-02 12:16:31'),
(111, 'create index UQE_dashboard_snapshot_delete_key - v5', 'CREATE UNIQUE INDEX `UQE_dashboard_snapshot_delete_key` ON `dashboard_snapshot` (`delete_key`);', 1, '', '2020-05-02 12:16:31'),
(112, 'create index IDX_dashboard_snapshot_user_id - v5', 'CREATE INDEX `IDX_dashboard_snapshot_user_id` ON `dashboard_snapshot` (`user_id`);', 1, '', '2020-05-02 12:16:31'),
(113, 'alter dashboard_snapshot to mediumtext v2', 'ALTER TABLE dashboard_snapshot MODIFY dashboard MEDIUMTEXT;', 1, '', '2020-05-02 12:16:32'),
(114, 'Update dashboard_snapshot table charset', 'ALTER TABLE `dashboard_snapshot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `dashboard` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:33'),
(115, 'Add column external_delete_url to dashboard_snapshots table', 'alter table `dashboard_snapshot` ADD COLUMN `external_delete_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:33'),
(116, 'create quota table v1', 'CREATE TABLE IF NOT EXISTS `quota` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `limit` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:33'),
(117, 'create index UQE_quota_org_id_user_id_target - v1', 'CREATE UNIQUE INDEX `UQE_quota_org_id_user_id_target` ON `quota` (`org_id`,`user_id`,`target`);', 1, '', '2020-05-02 12:16:33'),
(118, 'Update quota table charset', 'ALTER TABLE `quota` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:33'),
(119, 'create plugin_setting table', 'CREATE TABLE IF NOT EXISTS `plugin_setting` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `enabled` TINYINT(1) NOT NULL\n, `pinned` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:34'),
(120, 'create index UQE_plugin_setting_org_id_plugin_id - v1', 'CREATE UNIQUE INDEX `UQE_plugin_setting_org_id_plugin_id` ON `plugin_setting` (`org_id`,`plugin_id`);', 1, '', '2020-05-02 12:16:34'),
(121, 'Add column plugin_version to plugin_settings', 'alter table `plugin_setting` ADD COLUMN `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:34'),
(122, 'Update plugin_setting table charset', 'ALTER TABLE `plugin_setting` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2020-05-02 12:16:34'),
(123, 'create session table', 'CREATE TABLE IF NOT EXISTS `session` (\n`key` CHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expiry` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:34'),
(124, 'Drop old table playlist table', 'DROP TABLE IF EXISTS `playlist`', 1, '', '2020-05-02 12:16:34'),
(125, 'Drop old table playlist_item table', 'DROP TABLE IF EXISTS `playlist_item`', 1, '', '2020-05-02 12:16:34'),
(126, 'create playlist table v2', 'CREATE TABLE IF NOT EXISTS `playlist` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:34'),
(127, 'create playlist item table v2', 'CREATE TABLE IF NOT EXISTS `playlist_item` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `playlist_id` BIGINT(20) NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `order` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:34'),
(128, 'Update playlist table charset', 'ALTER TABLE `playlist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:34'),
(129, 'Update playlist_item table charset', 'ALTER TABLE `playlist_item` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:35'),
(130, 'drop preferences table v2', 'DROP TABLE IF EXISTS `preferences`', 1, '', '2020-05-02 12:16:35'),
(131, 'drop preferences table v3', 'DROP TABLE IF EXISTS `preferences`', 1, '', '2020-05-02 12:16:35'),
(132, 'create preferences table v3', 'CREATE TABLE IF NOT EXISTS `preferences` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `home_dashboard_id` BIGINT(20) NOT NULL\n, `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:35'),
(133, 'Update preferences table charset', 'ALTER TABLE `preferences` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:35'),
(134, 'Add column team_id in preferences', 'alter table `preferences` ADD COLUMN `team_id` BIGINT(20) NULL ', 1, '', '2020-05-02 12:16:35'),
(135, 'Update team_id column values in preferences', 'UPDATE preferences SET team_id=0 WHERE team_id IS NULL;', 1, '', '2020-05-02 12:16:35'),
(136, 'create alert table v1', 'CREATE TABLE IF NOT EXISTS `alert` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `panel_id` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `frequency` BIGINT(20) NOT NULL\n, `handler` BIGINT(20) NOT NULL\n, `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `silenced` TINYINT(1) NOT NULL\n, `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `eval_date` DATETIME NULL\n, `new_state_date` DATETIME NOT NULL\n, `state_changes` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:35'),
(137, 'add index alert org_id & id ', 'CREATE INDEX `IDX_alert_org_id_id` ON `alert` (`org_id`,`id`);', 1, '', '2020-05-02 12:16:35'),
(138, 'add index alert state', 'CREATE INDEX `IDX_alert_state` ON `alert` (`state`);', 1, '', '2020-05-02 12:16:35'),
(139, 'add index alert dashboard_id', 'CREATE INDEX `IDX_alert_dashboard_id` ON `alert` (`dashboard_id`);', 1, '', '2020-05-02 12:16:36'),
(140, 'Create alert_rule_tag table v1', 'CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`alert_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:36'),
(141, 'Add unique index alert_rule_tag.alert_id_tag_id', 'CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);', 1, '', '2020-05-02 12:16:36'),
(142, 'create alert_notification table v1', 'CREATE TABLE IF NOT EXISTS `alert_notification` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:36'),
(143, 'Add column is_default', 'alter table `alert_notification` ADD COLUMN `is_default` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:37'),
(144, 'Add column frequency', 'alter table `alert_notification` ADD COLUMN `frequency` BIGINT(20) NULL ', 1, '', '2020-05-02 12:16:37'),
(145, 'Add column send_reminder', 'alter table `alert_notification` ADD COLUMN `send_reminder` TINYINT(1) NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:37'),
(146, 'Add column disable_resolve_message', 'alter table `alert_notification` ADD COLUMN `disable_resolve_message` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:37'),
(147, 'add index alert_notification org_id & name', 'CREATE UNIQUE INDEX `UQE_alert_notification_org_id_name` ON `alert_notification` (`org_id`,`name`);', 1, '', '2020-05-02 12:16:37'),
(148, 'Update alert table charset', 'ALTER TABLE `alert` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2020-05-02 12:16:37'),
(149, 'Update alert_notification table charset', 'ALTER TABLE `alert_notification` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:37'),
(150, 'create notification_journal table v1', 'CREATE TABLE IF NOT EXISTS `alert_notification_journal` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `sent_at` BIGINT(20) NOT NULL\n, `success` TINYINT(1) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:37'),
(151, 'add index notification_journal org_id & alert_id & notifier_id', 'CREATE INDEX `IDX_alert_notification_journal_org_id_alert_id_notifier_id` ON `alert_notification_journal` (`org_id`,`alert_id`,`notifier_id`);', 1, '', '2020-05-02 12:16:37'),
(152, 'drop alert_notification_journal', 'DROP TABLE IF EXISTS `alert_notification_journal`', 1, '', '2020-05-02 12:16:37'),
(153, 'create alert_notification_state table v1', 'CREATE TABLE IF NOT EXISTS `alert_notification_state` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `state` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `updated_at` BIGINT(20) NOT NULL\n, `alert_rule_state_updated_version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:38'),
(154, 'add index alert_notification_state org_id & alert_id & notifier_id', 'CREATE UNIQUE INDEX `UQE_alert_notification_state_org_id_alert_id_notifier_id` ON `alert_notification_state` (`org_id`,`alert_id`,`notifier_id`);', 1, '', '2020-05-02 12:16:38'),
(155, 'Add for to alert table', 'alter table `alert` ADD COLUMN `for` BIGINT(20) NULL ', 1, '', '2020-05-02 12:16:38'),
(156, 'Add column uid in alert_notification', 'alter table `alert_notification` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:38'),
(157, 'Update uid column values in alert_notification', 'UPDATE alert_notification SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;', 1, '', '2020-05-02 12:16:38'),
(158, 'Add unique index alert_notification_org_id_uid', 'CREATE UNIQUE INDEX `UQE_alert_notification_org_id_uid` ON `alert_notification` (`org_id`,`uid`);', 1, '', '2020-05-02 12:16:38'),
(159, 'Remove unique index org_id_name', 'DROP INDEX `UQE_alert_notification_org_id_name` ON `alert_notification`', 1, '', '2020-05-02 12:16:38'),
(160, 'Drop old annotation table v4', 'DROP TABLE IF EXISTS `annotation`', 1, '', '2020-05-02 12:16:38'),
(161, 'create annotation table v5', 'CREATE TABLE IF NOT EXISTS `annotation` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `dashboard_id` BIGINT(20) NULL\n, `panel_id` BIGINT(20) NULL\n, `category_id` BIGINT(20) NULL\n, `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `epoch` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:38'),
(162, 'add index annotation 0 v3', 'CREATE INDEX `IDX_annotation_org_id_alert_id` ON `annotation` (`org_id`,`alert_id`);', 1, '', '2020-05-02 12:16:38'),
(163, 'add index annotation 1 v3', 'CREATE INDEX `IDX_annotation_org_id_type` ON `annotation` (`org_id`,`type`);', 1, '', '2020-05-02 12:16:39'),
(164, 'add index annotation 2 v3', 'CREATE INDEX `IDX_annotation_org_id_category_id` ON `annotation` (`org_id`,`category_id`);', 1, '', '2020-05-02 12:16:39'),
(165, 'add index annotation 3 v3', 'CREATE INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation` (`org_id`,`dashboard_id`,`panel_id`,`epoch`);', 1, '', '2020-05-02 12:16:39'),
(166, 'add index annotation 4 v3', 'CREATE INDEX `IDX_annotation_org_id_epoch` ON `annotation` (`org_id`,`epoch`);', 1, '', '2020-05-02 12:16:39'),
(167, 'Update annotation table charset', 'ALTER TABLE `annotation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2020-05-02 12:16:39'),
(168, 'Add column region_id to annotation table', 'alter table `annotation` ADD COLUMN `region_id` BIGINT(20) NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:39'),
(169, 'Drop category_id index', 'DROP INDEX `IDX_annotation_org_id_category_id` ON `annotation`', 1, '', '2020-05-02 12:16:39'),
(170, 'Add column tags to annotation table', 'alter table `annotation` ADD COLUMN `tags` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:40'),
(171, 'Create annotation_tag table v2', 'CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`annotation_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:40'),
(172, 'Add unique index annotation_tag.annotation_id_tag_id', 'CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);', 1, '', '2020-05-02 12:16:42'),
(173, 'Update alert annotations and set TEXT to empty', 'UPDATE annotation SET TEXT = \'\' WHERE alert_id > 0', 1, '', '2020-05-02 12:16:42'),
(174, 'Add created time to annotation table', 'alter table `annotation` ADD COLUMN `created` BIGINT(20) NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:42'),
(175, 'Add updated time to annotation table', 'alter table `annotation` ADD COLUMN `updated` BIGINT(20) NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:43'),
(176, 'Add index for created in annotation table', 'CREATE INDEX `IDX_annotation_org_id_created` ON `annotation` (`org_id`,`created`);', 1, '', '2020-05-02 12:16:43'),
(177, 'Add index for updated in annotation table', 'CREATE INDEX `IDX_annotation_org_id_updated` ON `annotation` (`org_id`,`updated`);', 1, '', '2020-05-02 12:16:43'),
(178, 'Convert existing annotations from seconds to milliseconds', 'UPDATE annotation SET epoch = (epoch*1000) where epoch < 9999999999', 1, '', '2020-05-02 12:16:43'),
(179, 'Add epoch_end column', 'alter table `annotation` ADD COLUMN `epoch_end` BIGINT(20) NOT NULL DEFAULT 0 ', 1, '', '2020-05-02 12:16:43');
INSERT INTO `migration_log` (`id`, `migration_id`, `sql`, `success`, `error`, `timestamp`) VALUES
(180, 'Add index for epoch_end', 'CREATE INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation` (`org_id`,`epoch`,`epoch_end`);', 1, '', '2020-05-02 12:16:43'),
(181, 'Make epoch_end the same as epoch', 'UPDATE annotation SET epoch_end = epoch', 1, '', '2020-05-02 12:16:43'),
(182, 'Move region to single row', 'code migration', 1, '', '2020-05-02 12:16:43'),
(183, 'Remove index org_id_epoch from annotation table', 'DROP INDEX `IDX_annotation_org_id_epoch` ON `annotation`', 1, '', '2020-05-02 12:16:43'),
(184, 'Remove index org_id_dashboard_id_panel_id_epoch from annotation table', 'DROP INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation`', 1, '', '2020-05-02 12:16:43'),
(185, 'Add index for org_id_dashboard_id_epoch_end_epoch on annotation table', 'CREATE INDEX `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` ON `annotation` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`);', 1, '', '2020-05-02 12:16:43'),
(186, 'Add index for org_id_epoch_end_epoch on annotation table', 'CREATE INDEX `IDX_annotation_org_id_epoch_end_epoch` ON `annotation` (`org_id`,`epoch_end`,`epoch`);', 1, '', '2020-05-02 12:16:44'),
(187, 'Remove index org_id_epoch_epoch_end from annotation table', 'DROP INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation`', 1, '', '2020-05-02 12:16:44'),
(188, 'Add index for alert_id on annotation table', 'CREATE INDEX `IDX_annotation_alert_id` ON `annotation` (`alert_id`);', 1, '', '2020-05-02 12:16:44'),
(189, 'create test_data table', 'CREATE TABLE IF NOT EXISTS `test_data` (\n`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `metric1` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `metric2` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `value_big_int` BIGINT(20) NULL\n, `value_double` DOUBLE NULL\n, `value_float` FLOAT NULL\n, `value_int` INT NULL\n, `time_epoch` BIGINT(20) NOT NULL\n, `time_date_time` DATETIME NOT NULL\n, `time_time_stamp` TIMESTAMP NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:44'),
(190, 'create dashboard_version table v1', 'CREATE TABLE IF NOT EXISTS `dashboard_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:44'),
(191, 'add index dashboard_version.dashboard_id', 'CREATE INDEX `IDX_dashboard_version_dashboard_id` ON `dashboard_version` (`dashboard_id`);', 1, '', '2020-05-02 12:16:44'),
(192, 'add unique index dashboard_version.dashboard_id and dashboard_version.version', 'CREATE UNIQUE INDEX `UQE_dashboard_version_dashboard_id_version` ON `dashboard_version` (`dashboard_id`,`version`);', 1, '', '2020-05-02 12:16:44'),
(193, 'Set dashboard version to 1 where 0', 'UPDATE dashboard SET version = 1 WHERE version = 0', 1, '', '2020-05-02 12:16:45'),
(194, 'save existing dashboard data in dashboard_version table v1', 'INSERT INTO dashboard_version\n(\n	dashboard_id,\n	version,\n	parent_version,\n	restored_from,\n	created,\n	created_by,\n	message,\n	data\n)\nSELECT\n	dashboard.id,\n	dashboard.version,\n	dashboard.version,\n	dashboard.version,\n	dashboard.updated,\n	COALESCE(dashboard.updated_by, -1),\n	\'\',\n	dashboard.data\nFROM dashboard;', 1, '', '2020-05-02 12:16:45'),
(195, 'alter dashboard_version.data to mediumtext v1', 'ALTER TABLE dashboard_version MODIFY data MEDIUMTEXT;', 1, '', '2020-05-02 12:16:45'),
(196, 'create team table', 'CREATE TABLE IF NOT EXISTS `team` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:45'),
(197, 'add index team.org_id', 'CREATE INDEX `IDX_team_org_id` ON `team` (`org_id`);', 1, '', '2020-05-02 12:16:46'),
(198, 'add unique index team_org_id_name', 'CREATE UNIQUE INDEX `UQE_team_org_id_name` ON `team` (`org_id`,`name`);', 1, '', '2020-05-02 12:16:46'),
(199, 'create team member table', 'CREATE TABLE IF NOT EXISTS `team_member` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:46'),
(200, 'add index team_member.org_id', 'CREATE INDEX `IDX_team_member_org_id` ON `team_member` (`org_id`);', 1, '', '2020-05-02 12:16:46'),
(201, 'add unique index team_member_org_id_team_id_user_id', 'CREATE UNIQUE INDEX `UQE_team_member_org_id_team_id_user_id` ON `team_member` (`org_id`,`team_id`,`user_id`);', 1, '', '2020-05-02 12:16:47'),
(202, 'Add column email to team table', 'alter table `team` ADD COLUMN `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:47'),
(203, 'Add column external to team_member table', 'alter table `team_member` ADD COLUMN `external` TINYINT(1) NULL ', 1, '', '2020-05-02 12:16:47'),
(204, 'Add column permission to team_member table', 'alter table `team_member` ADD COLUMN `permission` SMALLINT NULL ', 1, '', '2020-05-02 12:16:47'),
(205, 'create dashboard acl table', 'CREATE TABLE IF NOT EXISTS `dashboard_acl` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NULL\n, `team_id` BIGINT(20) NULL\n, `permission` SMALLINT NOT NULL DEFAULT 4\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:47'),
(206, 'add index dashboard_acl_dashboard_id', 'CREATE INDEX `IDX_dashboard_acl_dashboard_id` ON `dashboard_acl` (`dashboard_id`);', 1, '', '2020-05-02 12:16:47'),
(207, 'add unique index dashboard_acl_dashboard_id_user_id', 'CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_user_id` ON `dashboard_acl` (`dashboard_id`,`user_id`);', 1, '', '2020-05-02 12:16:47'),
(208, 'add unique index dashboard_acl_dashboard_id_team_id', 'CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_team_id` ON `dashboard_acl` (`dashboard_id`,`team_id`);', 1, '', '2020-05-02 12:16:47'),
(209, 'save default acl rules in dashboard_acl table', '\nINSERT INTO dashboard_acl\n	(\n		org_id,\n		dashboard_id,\n		permission,\n		role,\n		created,\n		updated\n	)\n	VALUES\n		(-1,-1, 1,\'Viewer\',\'2017-06-20\',\'2017-06-20\'),\n		(-1,-1, 2,\'Editor\',\'2017-06-20\',\'2017-06-20\')\n	', 1, '', '2020-05-02 12:16:47'),
(210, 'create tag table', 'CREATE TABLE IF NOT EXISTS `tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `key` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:48'),
(211, 'add index tag.key_value', 'CREATE UNIQUE INDEX `UQE_tag_key_value` ON `tag` (`key`,`value`);', 1, '', '2020-05-02 12:16:48'),
(212, 'create login attempt table', 'CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:48'),
(213, 'add index login_attempt.username', 'CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);', 1, '', '2020-05-02 12:16:48'),
(214, 'drop index IDX_login_attempt_username - v1', 'DROP INDEX `IDX_login_attempt_username` ON `login_attempt`', 1, '', '2020-05-02 12:16:48'),
(215, 'Rename table login_attempt to login_attempt_tmp_qwerty - v1', 'ALTER TABLE `login_attempt` RENAME TO `login_attempt_tmp_qwerty`', 1, '', '2020-05-02 12:16:48'),
(216, 'create login_attempt v2', 'CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:48'),
(217, 'create index IDX_login_attempt_username - v2', 'CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);', 1, '', '2020-05-02 12:16:49'),
(218, 'copy login_attempt v1 to v2', 'INSERT INTO `login_attempt` (`id`\n, `username`\n, `ip_address`) SELECT `id`\n, `username`\n, `ip_address` FROM `login_attempt_tmp_qwerty`', 1, '', '2020-05-02 12:16:49'),
(219, 'drop login_attempt_tmp_qwerty', 'DROP TABLE IF EXISTS `login_attempt_tmp_qwerty`', 1, '', '2020-05-02 12:16:49'),
(220, 'create user auth table', 'CREATE TABLE IF NOT EXISTS `user_auth` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_module` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:49'),
(221, 'create index IDX_user_auth_auth_module_auth_id - v1', 'CREATE INDEX `IDX_user_auth_auth_module_auth_id` ON `user_auth` (`auth_module`,`auth_id`);', 1, '', '2020-05-02 12:16:49'),
(222, 'alter user_auth.auth_id to length 190', 'ALTER TABLE user_auth MODIFY auth_id VARCHAR(190);', 1, '', '2020-05-02 12:16:49'),
(223, 'Add OAuth access token to user_auth', 'alter table `user_auth` ADD COLUMN `o_auth_access_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:49'),
(224, 'Add OAuth refresh token to user_auth', 'alter table `user_auth` ADD COLUMN `o_auth_refresh_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:49'),
(225, 'Add OAuth token type to user_auth', 'alter table `user_auth` ADD COLUMN `o_auth_token_type` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2020-05-02 12:16:49'),
(226, 'Add OAuth expiry to user_auth', 'alter table `user_auth` ADD COLUMN `o_auth_expiry` DATETIME NULL ', 1, '', '2020-05-02 12:16:50'),
(227, 'Add index to user_id column in user_auth', 'CREATE INDEX `IDX_user_auth_user_id` ON `user_auth` (`user_id`);', 1, '', '2020-05-02 12:16:50'),
(228, 'create server_lock table', 'CREATE TABLE IF NOT EXISTS `server_lock` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `operation_uid` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `last_execution` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:50'),
(229, 'add index server_lock.operation_uid', 'CREATE UNIQUE INDEX `UQE_server_lock_operation_uid` ON `server_lock` (`operation_uid`);', 1, '', '2020-05-02 12:16:50'),
(230, 'create user auth token table', 'CREATE TABLE IF NOT EXISTS `user_auth_token` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `prev_auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `user_agent` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `client_ip` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_token_seen` TINYINT(1) NOT NULL\n, `seen_at` INT NULL\n, `rotated_at` INT NOT NULL\n, `created_at` INT NOT NULL\n, `updated_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:50'),
(231, 'add unique index user_auth_token.auth_token', 'CREATE UNIQUE INDEX `UQE_user_auth_token_auth_token` ON `user_auth_token` (`auth_token`);', 1, '', '2020-05-02 12:16:50'),
(232, 'add unique index user_auth_token.prev_auth_token', 'CREATE UNIQUE INDEX `UQE_user_auth_token_prev_auth_token` ON `user_auth_token` (`prev_auth_token`);', 1, '', '2020-05-02 12:16:50'),
(233, 'create cache_data table', 'CREATE TABLE IF NOT EXISTS `cache_data` (\n`cache_key` VARCHAR(168) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expires` INTEGER(255) NOT NULL\n, `created_at` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2020-05-02 12:16:51'),
(234, 'add unique index cache_data.cache_key', 'CREATE UNIQUE INDEX `UQE_cache_data_cache_key` ON `cache_data` (`cache_key`);', 1, '', '2020-05-02 12:16:51');

-- --------------------------------------------------------

--
-- Table structure for table `org`
--

CREATE TABLE `org` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `org`
--

INSERT INTO `org` (`id`, `version`, `name`, `address1`, `address2`, `city`, `state`, `zip_code`, `country`, `billing_email`, `created`, `updated`) VALUES
(1, 0, 'Main Org.', '', '', '', '', '', '', NULL, '2020-05-02 12:16:51', '2020-05-02 12:16:51');

-- --------------------------------------------------------

--
-- Table structure for table `org_user`
--

CREATE TABLE `org_user` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `org_user`
--

INSERT INTO `org_user` (`id`, `org_id`, `user_id`, `role`, `created`, `updated`) VALUES
(1, 1, 1, 'Admin', '2020-05-02 12:16:51', '2020-05-02 12:16:51');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playlist_item`
--

CREATE TABLE `playlist_item` (
  `id` bigint(20) NOT NULL,
  `playlist_id` bigint(20) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_setting`
--

CREATE TABLE `plugin_setting` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `plugin_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `pinned` tinyint(1) NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secure_json_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `plugin_version` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `home_dashboard_id` bigint(20) NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `team_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quota`
--

CREATE TABLE `quota` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `target` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `server_lock`
--

CREATE TABLE `server_lock` (
  `id` bigint(20) NOT NULL,
  `operation_uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` bigint(20) NOT NULL,
  `last_execution` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `server_lock`
--

INSERT INTO `server_lock` (`id`, `operation_uid`, `version`, `last_execution`) VALUES
(1, 'cleanup expired auth tokens', 1, 1588421811),
(2, 'delete old login attempts', 7, 1588426011);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `key` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `expiry` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `star`
--

CREATE TABLE `star` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external` tinyint(1) DEFAULT NULL,
  `permission` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_user`
--

CREATE TABLE `temp_user` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invited_by_user_id` bigint(20) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL,
  `email_sent_on` datetime DEFAULT NULL,
  `remote_addr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_data`
--

CREATE TABLE `test_data` (
  `id` int(11) NOT NULL,
  `metric1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metric2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_big_int` bigint(20) DEFAULT NULL,
  `value_double` double DEFAULT NULL,
  `value_float` float DEFAULT NULL,
  `value_int` int(11) DEFAULT NULL,
  `time_epoch` bigint(20) NOT NULL,
  `time_date_time` datetime NOT NULL,
  `time_time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `login` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rands` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `help_flags1` bigint(20) NOT NULL DEFAULT 0,
  `last_seen_at` datetime DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `version`, `login`, `email`, `name`, `password`, `salt`, `rands`, `company`, `org_id`, `is_admin`, `email_verified`, `theme`, `created`, `updated`, `help_flags1`, `last_seen_at`, `is_disabled`) VALUES
(1, 0, 'grafana-admin', 'grafana-admin@localhost', '', '42af2d0ba873b1e0d00511ff8b66ace133f4ac2e3c62d420dfff495234491689b8141342054f9adb70e49b3e6fa0c23319de', 'iIKtucl6HY', 'mPF6s4zvnQ', '', 1, 1, 0, '', '2020-05-02 12:16:51', '2020-05-02 12:16:51', 0, '2020-05-02 12:33:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

CREATE TABLE `user_auth` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_module` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `o_auth_access_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `o_auth_refresh_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `o_auth_token_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `o_auth_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_token`
--

CREATE TABLE `user_auth_token` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prev_auth_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token_seen` tinyint(1) NOT NULL,
  `seen_at` int(11) DEFAULT NULL,
  `rotated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_auth_token`
--

INSERT INTO `user_auth_token` (`id`, `user_id`, `auth_token`, `prev_auth_token`, `user_agent`, `client_ip`, `auth_token_seen`, `seen_at`, `rotated_at`, `created_at`, `updated_at`) VALUES
(1, 1, '6a638b27234f6950aade2e6c952c506cc778a940bae7e5d6bb4881e1f8057a1a', '31c188e762e938a6f001a69c45aa5be4e60a6ba101399c789b64f2a28b2fe70b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0', '172.18.0.1', 1, 1588422433, 1588422431, 1588421829, 1588421829);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_alert_org_id_id` (`org_id`,`id`),
  ADD KEY `IDX_alert_state` (`state`),
  ADD KEY `IDX_alert_dashboard_id` (`dashboard_id`);

--
-- Indexes for table `alert_notification`
--
ALTER TABLE `alert_notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_alert_notification_org_id_uid` (`org_id`,`uid`);

--
-- Indexes for table `alert_notification_state`
--
ALTER TABLE `alert_notification_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_alert_notification_state_org_id_alert_id_notifier_id` (`org_id`,`alert_id`,`notifier_id`);

--
-- Indexes for table `alert_rule_tag`
--
ALTER TABLE `alert_rule_tag`
  ADD UNIQUE KEY `UQE_alert_rule_tag_alert_id_tag_id` (`alert_id`,`tag_id`);

--
-- Indexes for table `annotation`
--
ALTER TABLE `annotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_annotation_org_id_alert_id` (`org_id`,`alert_id`),
  ADD KEY `IDX_annotation_org_id_type` (`org_id`,`type`),
  ADD KEY `IDX_annotation_org_id_created` (`org_id`,`created`),
  ADD KEY `IDX_annotation_org_id_updated` (`org_id`,`updated`),
  ADD KEY `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`),
  ADD KEY `IDX_annotation_org_id_epoch_end_epoch` (`org_id`,`epoch_end`,`epoch`),
  ADD KEY `IDX_annotation_alert_id` (`alert_id`);

--
-- Indexes for table `annotation_tag`
--
ALTER TABLE `annotation_tag`
  ADD UNIQUE KEY `UQE_annotation_tag_annotation_id_tag_id` (`annotation_id`,`tag_id`);

--
-- Indexes for table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_api_key_key` (`key`),
  ADD UNIQUE KEY `UQE_api_key_org_id_name` (`org_id`,`name`),
  ADD KEY `IDX_api_key_org_id` (`org_id`);

--
-- Indexes for table `cache_data`
--
ALTER TABLE `cache_data`
  ADD PRIMARY KEY (`cache_key`),
  ADD UNIQUE KEY `UQE_cache_data_cache_key` (`cache_key`);

--
-- Indexes for table `dashboard`
--
ALTER TABLE `dashboard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_dashboard_org_id_folder_id_title` (`org_id`,`folder_id`,`title`),
  ADD UNIQUE KEY `UQE_dashboard_org_id_uid` (`org_id`,`uid`),
  ADD KEY `IDX_dashboard_org_id` (`org_id`),
  ADD KEY `IDX_dashboard_gnet_id` (`gnet_id`),
  ADD KEY `IDX_dashboard_org_id_plugin_id` (`org_id`,`plugin_id`);

--
-- Indexes for table `dashboard_acl`
--
ALTER TABLE `dashboard_acl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_dashboard_acl_dashboard_id_user_id` (`dashboard_id`,`user_id`),
  ADD UNIQUE KEY `UQE_dashboard_acl_dashboard_id_team_id` (`dashboard_id`,`team_id`),
  ADD KEY `IDX_dashboard_acl_dashboard_id` (`dashboard_id`);

--
-- Indexes for table `dashboard_provisioning`
--
ALTER TABLE `dashboard_provisioning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_dashboard_provisioning_dashboard_id` (`dashboard_id`),
  ADD KEY `IDX_dashboard_provisioning_dashboard_id_name` (`dashboard_id`,`name`);

--
-- Indexes for table `dashboard_snapshot`
--
ALTER TABLE `dashboard_snapshot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_dashboard_snapshot_key` (`key`),
  ADD UNIQUE KEY `UQE_dashboard_snapshot_delete_key` (`delete_key`),
  ADD KEY `IDX_dashboard_snapshot_user_id` (`user_id`);

--
-- Indexes for table `dashboard_tag`
--
ALTER TABLE `dashboard_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_dashboard_tag_dashboard_id` (`dashboard_id`);

--
-- Indexes for table `dashboard_version`
--
ALTER TABLE `dashboard_version`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_dashboard_version_dashboard_id_version` (`dashboard_id`,`version`),
  ADD KEY `IDX_dashboard_version_dashboard_id` (`dashboard_id`);

--
-- Indexes for table `data_source`
--
ALTER TABLE `data_source`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_data_source_org_id_name` (`org_id`,`name`),
  ADD KEY `IDX_data_source_org_id` (`org_id`);

--
-- Indexes for table `login_attempt`
--
ALTER TABLE `login_attempt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_login_attempt_username` (`username`);

--
-- Indexes for table `migration_log`
--
ALTER TABLE `migration_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `org`
--
ALTER TABLE `org`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_org_name` (`name`);

--
-- Indexes for table `org_user`
--
ALTER TABLE `org_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_org_user_org_id_user_id` (`org_id`,`user_id`),
  ADD KEY `IDX_org_user_org_id` (`org_id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlist_item`
--
ALTER TABLE `playlist_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugin_setting`
--
ALTER TABLE `plugin_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_plugin_setting_org_id_plugin_id` (`org_id`,`plugin_id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quota`
--
ALTER TABLE `quota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_quota_org_id_user_id_target` (`org_id`,`user_id`,`target`);

--
-- Indexes for table `server_lock`
--
ALTER TABLE `server_lock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_server_lock_operation_uid` (`operation_uid`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `star`
--
ALTER TABLE `star`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_star_user_id_dashboard_id` (`user_id`,`dashboard_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_tag_key_value` (`key`,`value`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_team_org_id_name` (`org_id`,`name`),
  ADD KEY `IDX_team_org_id` (`org_id`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_team_member_org_id_team_id_user_id` (`org_id`,`team_id`,`user_id`),
  ADD KEY `IDX_team_member_org_id` (`org_id`);

--
-- Indexes for table `temp_user`
--
ALTER TABLE `temp_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_temp_user_email` (`email`),
  ADD KEY `IDX_temp_user_org_id` (`org_id`),
  ADD KEY `IDX_temp_user_code` (`code`),
  ADD KEY `IDX_temp_user_status` (`status`);

--
-- Indexes for table `test_data`
--
ALTER TABLE `test_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_user_login` (`login`),
  ADD UNIQUE KEY `UQE_user_email` (`email`);

--
-- Indexes for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_user_auth_auth_module_auth_id` (`auth_module`,`auth_id`),
  ADD KEY `IDX_user_auth_user_id` (`user_id`);

--
-- Indexes for table `user_auth_token`
--
ALTER TABLE `user_auth_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_user_auth_token_auth_token` (`auth_token`),
  ADD UNIQUE KEY `UQE_user_auth_token_prev_auth_token` (`prev_auth_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alert_notification`
--
ALTER TABLE `alert_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alert_notification_state`
--
ALTER TABLE `alert_notification_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `annotation`
--
ALTER TABLE `annotation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_key`
--
ALTER TABLE `api_key`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dashboard_acl`
--
ALTER TABLE `dashboard_acl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dashboard_provisioning`
--
ALTER TABLE `dashboard_provisioning`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_snapshot`
--
ALTER TABLE `dashboard_snapshot`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_tag`
--
ALTER TABLE `dashboard_tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_version`
--
ALTER TABLE `dashboard_version`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `data_source`
--
ALTER TABLE `data_source`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempt`
--
ALTER TABLE `login_attempt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migration_log`
--
ALTER TABLE `migration_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `org`
--
ALTER TABLE `org`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `org_user`
--
ALTER TABLE `org_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlist_item`
--
ALTER TABLE `playlist_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugin_setting`
--
ALTER TABLE `plugin_setting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quota`
--
ALTER TABLE `quota`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_lock`
--
ALTER TABLE `server_lock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `star`
--
ALTER TABLE `star`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_member`
--
ALTER TABLE `team_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_user`
--
ALTER TABLE `temp_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_data`
--
ALTER TABLE `test_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_auth_token`
--
ALTER TABLE `user_auth_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
