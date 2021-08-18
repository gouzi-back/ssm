/*
 Navicat Premium Data Transfer

 Source Server         : hyy
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : ssm_crud

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 18/08/2021 23:10:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept`  (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp`  (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `d_id` int NOT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1019 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
