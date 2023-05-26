create database if not exists movies;
use movies;





DROP TABLE  IF EXISTS NameBasicsPrimaryprofession;


CREATE TABLE NameBasicsPrimaryprofession (
 nconst char(10),
 primaryProfessionNo int,
 primaryProfession int,
 PRIMARY KEY (nconst,primaryProfessionNo) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/name.basics.primaryProfession.tsv'
INTO TABLE NameBasicsPrimaryprofession
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


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


DROP TABLE  IF EXISTS TitleAkasType;


CREATE TABLE TitleAkasType (
 typesId char(10),
 types varchar(512),
 PRIMARY KEY (typesId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.type.tsv'
INTO TABLE TitleAkasType
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS NameBasicsPrimaryprofessionPrimaryprofession;


CREATE TABLE NameBasicsPrimaryprofessionPrimaryprofession (
 primaryProfessionId char(10),
 primaryProfession varchar(512),
 PRIMARY KEY (primaryProfessionId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/name.basics.primaryProfession.primaryProfession.tsv'
INTO TABLE NameBasicsPrimaryprofessionPrimaryprofession
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS NameBasicsKnownfortitles;


CREATE TABLE NameBasicsKnownfortitles (
 nconst char(10),
 knownForTitleNo int,
 knownForTitle varchar(512),
 PRIMARY KEY (nconst,knownForTitleNo) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/name.basics.knownForTitles.tsv'
INTO TABLE NameBasicsKnownfortitles
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleCrewDirectors;


CREATE TABLE TitleCrewDirectors (
 tconst char(10),
 directorNo int,
 director varchar(512),
 PRIMARY KEY (tconst,directorNo) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.crew.directors.tsv'
INTO TABLE TitleCrewDirectors
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitlePrincipals;


CREATE TABLE TitlePrincipals (
 tconst char(10),
 ordering int,
 nconst char(10),
 category int,
 job int,
 characters varchar(512),
 PRIMARY KEY (tconst,ordering,nconst) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.principals.tsv'
INTO TABLE TitlePrincipals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


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


DROP TABLE  IF EXISTS TitlePrincipalsCategory;


CREATE TABLE TitlePrincipalsCategory (
 categoryId char(10),
 category varchar(512),
 PRIMARY KEY (categoryId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.principals.category.tsv'
INTO TABLE TitlePrincipalsCategory
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleAkas;


CREATE TABLE TitleAkas (
 titleId char(10),
 ordering int,
 title varchar(512),
 region int,
 language int,
 types int,
 attributes int,
 isOriginalTitle int,
 PRIMARY KEY (titleId,ordering) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.tsv'
INTO TABLE TitleAkas
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleAkasAttribute;


CREATE TABLE TitleAkasAttribute (
 attributesId char(10),
 attributes varchar(512),
 PRIMARY KEY (attributesId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.attribute.tsv'
INTO TABLE TitleAkasAttribute
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleBasicsGenres;


CREATE TABLE TitleBasicsGenres (
 tconst char(10),
 genreNo int,
 genre int,
 PRIMARY KEY (tconst,genreNo) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.basics.genres.tsv'
INTO TABLE TitleBasicsGenres
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS NameBasics;


CREATE TABLE NameBasics (
 nconst char(10),
 primaryName varchar(512),
 birthYear int,
 deathYear int,
 primaryProfession varchar(512),
 knownForTitles varchar(512),
 PRIMARY KEY (nconst) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/name.basics.tsv'
INTO TABLE NameBasics
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitlePrincipalsJob;


CREATE TABLE TitlePrincipalsJob (
 jobId char(10),
 job varchar(512),
 PRIMARY KEY (jobId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.principals.job.tsv'
INTO TABLE TitlePrincipalsJob
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleCrewWriters;


CREATE TABLE TitleCrewWriters (
 tconst char(10),
 writerNo int,
 writer varchar(512),
 PRIMARY KEY (tconst,writerNo) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.crew.writers.tsv'
INTO TABLE TitleCrewWriters
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleBasicsGenresGenre;


CREATE TABLE TitleBasicsGenresGenre (
 genreId char(10),
 genre varchar(512),
 PRIMARY KEY (genreId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.basics.genres.genre.tsv'
INTO TABLE TitleBasicsGenresGenre
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleAkasRegion;


CREATE TABLE TitleAkasRegion (
 regionId char(10),
 region varchar(512),
 PRIMARY KEY (regionId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.region.tsv'
INTO TABLE TitleAkasRegion
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleBasics;


CREATE TABLE TitleBasics (
 tconst char(10),
 titleType int,
 primaryTitle varchar(512),
 originalTitle varchar(512),
 isAdult int,
 startYear int,
 endYear varchar(512),
 runtimeMinutes int,
 genres varchar(512),
 PRIMARY KEY (tconst) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.basics.tsv'
INTO TABLE TitleBasics
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


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


DROP TABLE  IF EXISTS TitleCrew;


CREATE TABLE TitleCrew (
 tconst char(10),
 directors varchar(512),
 writers varchar(512),
 PRIMARY KEY (tconst) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.crew.tsv'
INTO TABLE TitleCrew
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleAkasLanguage;


CREATE TABLE TitleAkasLanguage (
 languageId char(10),
 language varchar(512),
 PRIMARY KEY (languageId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.akas.language.tsv'
INTO TABLE TitleAkasLanguage
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


DROP TABLE  IF EXISTS TitleBasicsTitletype;


CREATE TABLE TitleBasicsTitletype (
 titleTypeId char(10),
 titleType varchar(512),
 PRIMARY KEY (titleTypeId) );


LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/title.basics.titleType.tsv'
INTO TABLE TitleBasicsTitletype
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
