
-- Unfortunately the data seems seem to have a few issues and so we turn this off on load

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE TitleRatings DROP CONSTRAINT TitleRatings_Title_fk;
ALTER TABLE TitleRatings ADD CONSTRAINT TitleRatings_Title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitlePrincipals DROP CONSTRAINT TitlePrincipals_Title_fk;
ALTER TABLE TitlePrincipals ADD CONSTRAINT TitlePrincipals_Title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitlePrincipals DROP CONSTRAINT TitlePrincipals_Name_fk;
ALTER TABLE TitlePrincipals ADD CONSTRAINT TitlePrincipals_Name_fk FOREIGN KEY(`nconst`) REFERENCES Name (`nconst`);

ALTER TABLE TitlePrincipals DROP CONSTRAINT TitlePrincipals_TitlePrincipalsJob_fk;
ALTER TABLE TitlePrincipals ADD CONSTRAINT TitlePrincipals_TitlePrincipalsJob_fk FOREIGN KEY(`jobId`) REFERENCES TitlePrincipalsJob (`jobId`);

ALTER TABLE TitlePrincipalsCharacters DROP CONSTRAINT TitlePrincipalsCharacters_TitlePrincipals_fk;
ALTER TABLE TitlePrincipalsCharacters ADD CONSTRAINT TitlePrincipalsCharacters_TitlePrincipals_fk FOREIGN KEY(`tconst`,`ordering`) REFERENCES TitlePrincipals(`tconst`,`ordering`);

ALTER TABLE TitlePrincipals DROP CONSTRAINT TitlePrincipals_TitlePrincipalsCategory_fk;
ALTER TABLE TitlePrincipals ADD CONSTRAINT TitlePrincipals_TitlePrincipalsCategory_fk FOREIGN KEY(`categoryId`) REFERENCES TitlePrincipalsCategory (`categoryId`);

ALTER TABLE TitleEpisode DROP CONSTRAINT TitleEpisode_Title_fk;
ALTER TABLE TitleEpisode ADD CONSTRAINT TitleEpisode_Title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitleCrewWriters DROP CONSTRAINT TitleCrewWriters_Title_fk;
ALTER TABLE TitleCrewWriters ADD CONSTRAINT TitleCrewWriters_Title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitleCrew DROP CONSTRAINT TitleCrew_Title_fk;
ALTER TABLE TitleCrew ADD CONSTRAINT TitleCrew_Title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitleCrewDirectors DROP CONSTRAINT TitleCrewDirectors_Title_fk;
ALTER TABLE TitleCrewDirectors ADD CONSTRAINT TitleCrewDirectors_Title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE Title DROP CONSTRAINT Title_TitleTitletype_fk;
ALTER TABLE Title ADD CONSTRAINT Title_TitleTitletype_fk FOREIGN KEY(`titleTypeId`) REFERENCES TitleTitletype (`titleTypeId`);

ALTER TABLE TitleGenres DROP CONSTRAINT TitleGenres_Title_fk;
ALTER TABLE TitleGenres ADD CONSTRAINT TitleGenres_Title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitleGenres DROP CONSTRAINT TitleGenres_Genre_fk;
ALTER TABLE TitleGenres ADD CONSTRAINT TitleGenres_Genre_fk FOREIGN KEY(`genreId`) REFERENCES Genre (`genreId`);

ALTER TABLE TitleAkas DROP CONSTRAINT TitleAkas_Title_fk;
ALTER TABLE TitleAkas ADD CONSTRAINT TitleAkas_Title_fk FOREIGN KEY(`titleId`) REFERENCES Title(`tconst`);

ALTER TABLE TitleAkas DROP CONSTRAINT TitleAkas_TitleAkasRegion_fk;
ALTER TABLE TitleAkas ADD CONSTRAINT TitleAkas_TitleAkasRegion_fk FOREIGN KEY(`regionId`) REFERENCES TitleAkasRegion (`regionId`);

ALTER TABLE TitleAkas DROP CONSTRAINT TitleAkas_TitleAkasLanguage_fk;
ALTER TABLE TitleAkas ADD CONSTRAINT TitleAkas_TitleAkasLanguage_fk FOREIGN KEY(`languageId`) REFERENCES TitleAkasLanguage (`languageId`);

ALTER TABLE TitleAkas DROP CONSTRAINT TitleAkas_TitleAkasAttribute_fk;
ALTER TABLE TitleAkas ADD CONSTRAINT TitleAkas_TitleAkasAttribute_fk FOREIGN KEY(`attributesId`) REFERENCES TitleAkasAttribute (`attributesId`);

ALTER TABLE NameProfession DROP CONSTRAINT NameProfession_Name_fk;
ALTER TABLE NameProfession ADD CONSTRAINT NameProfession_Name_fk FOREIGN KEY(`nconst`) REFERENCES Name (`nconst`);

ALTER TABLE NameProfession DROP CONSTRAINT NameProfession_Profession_fk;
ALTER TABLE NameProfession ADD CONSTRAINT NameProfession_Profession_fk FOREIGN KEY(`primaryProfessionId`) REFERENCES Profession (`primaryProfessionId`);

ALTER TABLE NameKnownfortitles DROP CONSTRAINT NameKnownfortitles_Name_fk;
ALTER TABLE NameKnownfortitles ADD CONSTRAINT NameKnownfortitles_Name_fk FOREIGN KEY(`nconst`) REFERENCES Name (`nconst`);



SET FOREIGN_KEY_CHECKS=1;
