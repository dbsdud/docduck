# docduck
use docduck;
select * from doc_user;
select NOTICE_NO = 2, NOTICE_TITLE = 'test' from doc_notice;
select * from doc_notice;
select * from doc_review;
select * from doc_hosp;
select * from doc_hosp_2;
select * from doc_notice;
select * from sido;
select * from gugun;
select * from dong;

	SELECT
		ID AS id
	FROM
		DOC_USER
	WHERE
		REGNO=1;

select distinct sidoCd, sidoCdNm, sgguCd, sgguCdNm, emdongNm from dong;
	
drop table doc_user;

select * from doc_hosp where yadmNm='미즈메디병원';

select 
	HOSP_NO,
    yadmNm,
    telno
from
	doc_hosp
where
	sidoCd=110000 and sgguCd=110023 and emdongNm='능동';

insert into doc_review(
`HOSP_NO`,
`ID`,
`REVIEW_TREAT`,
`REVIEW_SERVICE`,
`REVIEW_FACIL`,
`REVIEW_CONTENT`,
`REGDATE`,
`REGNO`
) VALUES (
947,
'admin',
5,
5,
5,
'test2',
NOW(),
1
);

select * from doc_review where hosp_no=947;

SELECT
	USER_NO AS userNo,
	ID AS id,
	PASSWORD AS password,
	USER_NAME AS userName,
	USER_TEL AS userTel,
	REGDATE AS regDate
FROM
	DOC_USER
WHERE
	USER_NO=1;

CREATE TABLE IF NOT EXISTS `docduck`.`doc_hosp` (
  `HOSP_NO` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `yadmNm` VARCHAR(150) NULL DEFAULT NULL,
  `clCd` INT(2) NULL DEFAULT NULL,
  `clCdNm` VARCHAR(150) NULL DEFAULT NULL,
  `sidoCd` INT(6) NULL DEFAULT NULL,
  `sidoCdNm` VARCHAR(150) NULL DEFAULT NULL,
  `sgguCd` INT(6) NULL DEFAULT NULL,
  `sgguCdNm` VARCHAR(150) NULL DEFAULT NULL,
  `emdongNm` VARCHAR(150) NULL DEFAULT NULL,
  `postNo` INT(6) NULL DEFAULT NULL,
  `addr` VARCHAR(500) NULL DEFAULT NULL,
  `telno` VARCHAR(30) NULL DEFAULT NULL,
  `hospUrl` VARCHAR(500) NULL DEFAULT NULL,
  `estbDd` INT(8) NULL DEFAULT NULL,
  `drTotCnt` INT(14) NULL DEFAULT NULL,
  `gdrCnt` INT(14) NULL DEFAULT NULL,
  `intnCnt` INT(14) NULL DEFAULT NULL,
  `resdntCnt` INT(14) NULL DEFAULT NULL,
  `sdrCnt` INT(14) NULL DEFAULT NULL,
  `XPos` VARCHAR(45) NULL DEFAULT NULL,
  `YPos` VARCHAR(45) NULL DEFAULT NULL,
  `REGDATE` DATE NULL DEFAULT NULL,
  `REGNO` INT(11) NULL DEFAULT NULL,
  `UPDDATE` DATE NULL DEFAULT NULL,
  `UPDNO` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`HOSP_NO`));
  
  CREATE TABLE IF NOT EXISTS `docduck`.`doc_notice` (
  `NOTICE_NO` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NOTICE_TITLE` VARCHAR(100),
  `NOTICE_CONTENT` VARCHAR(4000),
  `NOTICE_WRITER` VARCHAR(45),
  `NOTICE_COUNT` INT(11) UNSIGNED,
  `REGDATE` DATE,
  `REGNO` INT(11) UNSIGNED,
  `UPDDATE` DATE,
  `UPDNO` INT(11) UNSIGNED,
  PRIMARY KEY (`NOTICE_NO`));
  
  CREATE TABLE IF NOT EXISTS `docduck`.`doc_review` (
  `REVIEW_NO` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `HOSP_NO` INT(11),
  `ID` VARCHAR(45),
  `REVIEW_TREAT` VARCHAR(45),
  `REVIEW_SERVICE` VARCHAR(45),
  `REVIEW_FACIL` VARCHAR(45),
  `REVIEW_CONTENT` VARCHAR(4000),
  `REGDATE` DATE,
  `REGNO` INT(11) UNSIGNED,
  `UPDDATE` DATE,
  `UPDNO` INT(11) UNSIGNED,
  PRIMARY KEY (`REVIEW_NO`));
  
  CREATE TABLE IF NOT EXISTS `docduck`.`doc_user` (
  `USER_NO` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID` VARCHAR(45),
  `PASSWORD` VARCHAR(256),
  `USER_NAME` VARCHAR(45),
  `USER_TEL` VARCHAR(45),
  `REGDATE` DATE,
  `REGNO` INT(11) UNSIGNED,
  `UPDATE` DATE,
  `UPDNO` INT(11) UNSIGNED,
  PRIMARY KEY (`USER_NO`));
  
  CREATE TABLE IF NOT EXISTS `docduck`.`sido` (
  `sidoCd` INT(6) DEFAULT NULL,
  `sidoCdNm` VARCHAR(150) DEFAULT NULL
  );
  
  CREATE TABLE IF NOT EXISTS `docduck`.`gugun2` (
  `sidoCd` INT(6) DEFAULT NULL,
  `sidoCdNm` VARCHAR(150) DEFAULT NULL, 
  `sgguCd` INT(45) DEFAULT NULL,
  `sgguCdNm` VARCHAR(150) DEFAULT NULL
  );
  
  CREATE TABLE IF NOT EXISTS `docduck`.`dong` (
  `sidoCd` INT(6) DEFAULT NULL,
  `sidoCdNm` VARCHAR(150) DEFAULT NULL, 
  `sgguCd` INT(6) DEFAULT NULL,
  `sgguCdNm` VARCHAR(150) DEFAULT NULL,
  `emdongNm` VARCHAR(150) DEFAULT NULL
  );
  
    CREATE TABLE IF NOT exists `docduck`.`doc_hosp_2`(
   `ITEM_NO` INT(11) UNSIGNED NOT NULL auto_increment,
    `dutyAddr` VARCHAR(200) NULL DEFAULT NULL,
    `dutyDiv` VARCHAR(10) NULL DEFAULT NULL,
    `dutyDivNam` VARCHAR(50) NULL DEFAULT NULL,
    `dutyEmcls` VARCHAR(10) NULL DEFAULT NULL,
    `dutyEmclsName` VARCHAR(50) NULL DEFAULT NULL,
    `dutyEryn` VARCHAR(10) NULL DEFAULT NULL,
    `dutyEtc` VARCHAR(200) NULL DEFAULT NULL,
    `dutyMapimg` VARCHAR(100) NULL DEFAULT NULL,
    `dutyName` VARCHAR(100) NULL DEFAULT NULL,
    `dutyTel1` VARCHAR(20) NULL DEFAULT NULL,
    `dutyTel3` VARCHAR(20) NULL DEFAULT NULL,
    `dutyTime1c` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime2c` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime3c` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime4c` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime5c` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime6c` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime7c` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime8c` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime1s` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime2s` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime3s` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime4s` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime5s` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime6s` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime7s` VARCHAR(10) NULL DEFAULT NULL,
    `dutyTime8s` VARCHAR(10) NULL DEFAULT NULL,
    `hpid` VARCHAR(50) NULL DEFAULT NULL,
    `postCdn1` VARCHAR(10) NULL DEFAULT NULL,
    `postCdn2` VARCHAR(10) NULL DEFAULT NULL,
    `wgs84Lon` VARCHAR(30) NULL DEFAULT NULL,
    `wgs84Lat` VARCHAR(30) NULL DEFAULT NULL,
    `dutyInf` VARCHAR(300) NULL DEFAULT NULL,
  primary key(`ITEM_NO`));
