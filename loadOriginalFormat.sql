
create database if not exists movies;
use movies;
drop table if exists names;

create table names ( nameId varchar(10), fullName varchar(255), yearBorn int, yearDied int,
primary key(nameId));

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/inputfiles/name.basics.tsv' 
INTO TABLE names 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nameId,fullName,yearBorn,yearDied,@dummy,@dummy)
;



drop table if exists title;

create table title ( titleId char(10), titleType varchar(16), 
 primaryTitle varchar(512),
 originalTitle varchar(512),
 isAdult int,
  startYear int,
   endYear int, 
   runtimeMins int, 
   genres varchar(255),
primary key(titleId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/inputfiles/title.basics.tsv' 
INTO TABLE title 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

drop table if exists altTitle;

create table altTitle ( titleId char(10), ordering int, altTitle varchar(1024),
 region varchar(10),titleLanguage varchar(10),titleType varchar(32) ,titleAttribs varchar(255), isOriginalTitle char,
primary key(titleId,ordering) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/inputfiles/title.akas.tsv' 
INTO TABLE altTitle 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;


drop table if exists ratings;
create table ratings ( titleId char(10), averageRating float, numVotes int,
primary key(titleId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/inputfiles/title.ratings.tsv' 
INTO TABLE ratings 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

drop table if exists roles;

create table roles ( titleId char(10), ordering int, nameId varchar(10),category varchar(2048), job varchar(2048),
characters text,
primary key(titleId,ordering) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/inputfiles/title.principals.tsv' 
INTO TABLE roles 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

drop table if exists episodes;

create table episodes ( titleId char(10), parentId char(10), seasonNumber int, episodeNumber int,
primary key(titleId));

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/inputfiles/title.episode.tsv' 
INTO TABLE episodes 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

drop table if exists crew;


create table crew ( titleId char(10), directors text ,writers text,
primary key(titleId));


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/inputfiles/title.crew.tsv' 
INTO TABLE crew 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- Normalise the data that is denormalised;
