DROP DATABASE IF EXISTS `blog`;

CREATE DATABASE IF NOT EXISTS `blog`;

USE `blog`;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(15)	PRIMARY KEY,
	`me_ms_name`	varchar(8)	NOT NULL,
	`me_pw`	varchar(12)	NOT NULL,
	`me_email`	varchar(20)	NOT NULL,
	`me_name`	varchar(15)	NOT NULL,
	`me_phone`	varchar(13)	NOT NULL,
	`me_acess`	varchar(5)	NOT NULL DEFAULT 'USER',
	`me_fail_count`	int	NOT NULL default 0,
	`me_stop`	datetime	NULL
);

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
	`bl_num`	int	PRIMARY KEY AUTO_INCREMENT,
	`bl_name`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`bo_num`	int	PRIMARY KEY AUTO_INCREMENT,
	`bo_bl_num`	int	NOT NULL,
	`bo_me_id`	varchar(15)	NOT NULL,
	`bo_name`	varchar(8)	NOT NULL,
	`bo_title`	varchar(50)	NOT NULL,
	`bo_content`	text	NOT NULL,
	`bo_view`	int	NOT NULL DEFAULT 0,
	`bo_date`	datetime	NULL,
	`bo_report_count`	int	NOT NULL DEFAULT 0,
	`bo_bogi`	int	NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `inputFile`;

CREATE TABLE `inputFile` (
	`if_num`	int	PRIMARY KEY AUTO_INCREMENT,
	`if_bo_num`	int	NOT NULL,
	`if_name`	varchar(50)	NOT NULL,
	`if_or_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
	`re_num`	int	PRIMARY KEY AUTO_INCREMENT,
	`re_me_id`	varchar(15)	NOT NULL,
	`re_rt_name`	varchar(15)	NOT NULL,
	`re_table`	varchar(10)	NOT NULL,
	`re_content`	text	NOT NULL,
	`re_state`	varchar(8)	NOT NULL DEFAULT '신고접수',
	`re_target`	int	NOT NULL
);

DROP TABLE IF EXISTS `member_state`;

CREATE TABLE `member_state` (
	`ms_name`	varchar(8)	PRIMARY KEY
);

DROP TABLE IF EXISTS `recommend`;

CREATE TABLE `recommend` (
	`rc_num`	int	PRIMARY KEY AUTO_INCREMENT,
	`rc_bo_num`	int	NOT NULL,
	`rc_me_id`	varchar(15)	NOT NULL,
	`rc_state`	varchar(5)	NOT NULL
);

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`co_num`	int	PRIMARY KEY AUTO_INCREMENT,
	`co_bo_num`	int	NOT NULL,
	`co_me_id`	varchar(15)	NOT NULL,
	`co_content`	text	NOT NULL
);

DROP TABLE IF EXISTS `report_type`;

CREATE TABLE `report_type` (
	`rt_name`	varchar(15)	PRIMARY KEY
);

ALTER TABLE `member` ADD CONSTRAINT `FK_member_state_TO_member_1` FOREIGN KEY (
	`me_ms_name`
)
REFERENCES `member_state` (
	`ms_name`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_blog_TO_board_1` FOREIGN KEY (
	`bo_bl_num`
)
REFERENCES `blog` (
	`bl_num`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (
	`bo_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `inputFile` ADD CONSTRAINT `FK_board_TO_inputFile_1` FOREIGN KEY (
	`if_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_member_TO_report_1` FOREIGN KEY (
	`re_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_report_type_TO_report_1` FOREIGN KEY (
	`re_rt_name`
)
REFERENCES `report_type` (
	`rt_name`
);

ALTER TABLE `recommend` ADD CONSTRAINT `FK_board_TO_recommend_1` FOREIGN KEY (
	`rc_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `recommend` ADD CONSTRAINT `FK_member_TO_recommend_1` FOREIGN KEY (
	`rc_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_board_TO_comment_1` FOREIGN KEY (
	`co_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (
	`co_me_id`
)
REFERENCES `member` (
	`me_id`
);