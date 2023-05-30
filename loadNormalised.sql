drop database movies;
    create database if not exists movies;
    use movies;


    SELECT 'TitleRatings' AS LOADING;


DROP TABLE  IF EXISTS TitleRatings;

CREATE TABLE TitleRatings (
 tconst char(10),
 averageRating double,
 numVotes int,
 PRIMARY KEY (tconst) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.ratings.tsv' 
INTO TABLE TitleRatings 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitlePrincipals' AS LOADING;


DROP TABLE  IF EXISTS TitlePrincipals;

CREATE TABLE TitlePrincipals (
 tconst char(10),
 ordering int,
 nconst char(10),
 categoryId int,
 jobId int,
 PRIMARY KEY (tconst,ordering,nconst) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.principals.tsv' 
INTO TABLE TitlePrincipals 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitlePrincipalsJob' AS LOADING;


DROP TABLE  IF EXISTS TitlePrincipalsJob;

CREATE TABLE TitlePrincipalsJob (
 jobId int,
 job varchar(1024),
 PRIMARY KEY (jobId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.principals.job.tsv' 
INTO TABLE TitlePrincipalsJob 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitlePrincipalsCharacters' AS LOADING;


DROP TABLE  IF EXISTS TitlePrincipalsCharacters;

CREATE TABLE TitlePrincipalsCharacters (
 tconst char(10),
 ordering int,
 characterNo int,
 ascharacter varchar(4096),
 PRIMARY KEY (tconst,ordering,characterNo) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.principals.characters.tsv' 
INTO TABLE TitlePrincipalsCharacters 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitlePrincipalsCategory' AS LOADING;


DROP TABLE  IF EXISTS TitlePrincipalsCategory;

CREATE TABLE TitlePrincipalsCategory (
 categoryId int,
 category varchar(1024),
 PRIMARY KEY (categoryId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.principals.category.tsv' 
INTO TABLE TitlePrincipalsCategory 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleEpisode' AS LOADING;


DROP TABLE  IF EXISTS TitleEpisode;

CREATE TABLE TitleEpisode (
 tconst char(10),
 parentTconst char(10),
 seasonNumber int,
 episodeNumber int,
 PRIMARY KEY (tconst,parentTconst) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.episode.tsv' 
INTO TABLE TitleEpisode 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleCrewWriters' AS LOADING;


DROP TABLE  IF EXISTS TitleCrewWriters;

CREATE TABLE TitleCrewWriters (
 tconst char(10),
 writerNo int,
 writer varchar(1024),
 PRIMARY KEY (tconst,writerNo) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.crew.writers.tsv' 
INTO TABLE TitleCrewWriters 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleCrew' AS LOADING;


DROP TABLE  IF EXISTS TitleCrew;

CREATE TABLE TitleCrew (
 tconst char(10),
 PRIMARY KEY (tconst) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.crew.tsv' 
INTO TABLE TitleCrew 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleCrewDirectors' AS LOADING;


DROP TABLE  IF EXISTS TitleCrewDirectors;

CREATE TABLE TitleCrewDirectors (
 tconst char(10),
 directorNo int,
 director varchar(1024),
 PRIMARY KEY (tconst,directorNo) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.crew.directors.tsv' 
INTO TABLE TitleCrewDirectors 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'Title' AS LOADING;


DROP TABLE  IF EXISTS Title;

CREATE TABLE Title (
 tconst char(10),
 titleTypeId int,
 primaryTitle varchar(1024),
 originalTitle varchar(1024),
 isAdult int,
 startYear int,
 endYear varchar(1024),
 runtimeMinutes int,
 PRIMARY KEY (tconst) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.basics.tsv' 
INTO TABLE Title 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleTitletype' AS LOADING;


DROP TABLE  IF EXISTS TitleTitletype;

CREATE TABLE TitleTitletype (
 titleTypeId int,
 titleType varchar(1024),
 PRIMARY KEY (titleTypeId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.basics.titleType.tsv' 
INTO TABLE TitleTitletype 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleGenres' AS LOADING;


DROP TABLE  IF EXISTS TitleGenres;

CREATE TABLE TitleGenres (
 tconst char(10),
 genreNo int,
 genreId int,
 PRIMARY KEY (tconst,genreNo) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.basics.genres.tsv' 
INTO TABLE TitleGenres 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'Genre' AS LOADING;


DROP TABLE  IF EXISTS Genre;

CREATE TABLE Genre (
 genreId int,
 genre varchar(1024),
 PRIMARY KEY (genreId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.basics.genres.genre.tsv' 
INTO TABLE Genre 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleAkasType' AS LOADING;


DROP TABLE  IF EXISTS TitleAkasType;

CREATE TABLE TitleAkasType (
 typesId int,
 types varchar(1024),
 PRIMARY KEY (typesId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.type.tsv' 
INTO TABLE TitleAkasType 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleAkas' AS LOADING;


DROP TABLE  IF EXISTS TitleAkas;

CREATE TABLE TitleAkas (
 titleId char(10),
 ordering int,
 title varchar(1024),
 regionId int,
 languageId int,
 typesId int,
 attributesId int,
 isOriginalTitle int,
 PRIMARY KEY (titleId,ordering) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.tsv' 
INTO TABLE TitleAkas 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleAkasRegion' AS LOADING;


DROP TABLE  IF EXISTS TitleAkasRegion;

CREATE TABLE TitleAkasRegion (
 regionId int,
 region varchar(1024),
 PRIMARY KEY (regionId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.region.tsv' 
INTO TABLE TitleAkasRegion 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleAkasLanguage' AS LOADING;


DROP TABLE  IF EXISTS TitleAkasLanguage;

CREATE TABLE TitleAkasLanguage (
 languageId int,
 language varchar(1024),
 PRIMARY KEY (languageId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.language.tsv' 
INTO TABLE TitleAkasLanguage 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'TitleAkasAttribute' AS LOADING;


DROP TABLE  IF EXISTS TitleAkasAttribute;

CREATE TABLE TitleAkasAttribute (
 attributesId int,
 attributes varchar(1024),
 PRIMARY KEY (attributesId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.attribute.tsv' 
INTO TABLE TitleAkasAttribute 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'Name' AS LOADING;


DROP TABLE  IF EXISTS Name;

CREATE TABLE Name (
 nconst char(10),
 primaryName varchar(1024),
 birthYear int,
 deathYear int,
 PRIMARY KEY (nconst) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/name.basics.tsv' 
INTO TABLE Name 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'NameProfession' AS LOADING;


DROP TABLE  IF EXISTS NameProfession;

CREATE TABLE NameProfession (
 nconst char(10),
 primaryProfessionNo int,
 primaryProfessionId int,
 PRIMARY KEY (nconst,primaryProfessionNo) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/name.basics.primaryProfession.tsv' 
INTO TABLE NameProfession 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'Profession' AS LOADING;


DROP TABLE  IF EXISTS Profession;

CREATE TABLE Profession (
 primaryProfessionId int,
 primaryProfession varchar(1024),
 PRIMARY KEY (primaryProfessionId) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/name.basics.primaryProfession.primaryProfession.tsv' 
INTO TABLE Profession 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    SELECT 'NameKnownfortitles' AS LOADING;


DROP TABLE  IF EXISTS NameKnownfortitles;

CREATE TABLE NameKnownfortitles (
 nconst char(10),
 knownForTitleNo int,
 knownForTitle varchar(1024),
 PRIMARY KEY (nconst,knownForTitleNo) );

LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/name.basics.knownForTitles.tsv' 
INTO TABLE NameKnownfortitles 
FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    