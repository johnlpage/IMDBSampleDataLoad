
-- Unfortunately the data seems seem to have a few issues and so we turn this off on load

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE NameProfession DROP CONSTRAINT NameProfession_name_fk;
ALTER TABLE NameProfession ADD CONSTRAINT NameProfession_name_fk FOREIGN KEY(`nconst`) REFERENCES Name (`nconst`);

ALTER TABLE TitleRatings DROP CONSTRAINT TitleRatings_title_fk;
ALTER TABLE TitleRatings ADD CONSTRAINT TitleRatings_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE NameKnownfortitles DROP CONSTRAINT NameKnownfortitles_name_fk;
ALTER TABLE NameKnownfortitles ADD CONSTRAINT NameKnownfortitles_name_fk FOREIGN KEY(`nconst`) REFERENCES Name (`nconst`);

ALTER TABLE TitleCrewDirectors DROP CONSTRAINT TitleCrewDirectors_title_fk;
ALTER TABLE TitleCrewDirectors ADD CONSTRAINT TitleCrewDirectors_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitlePrincipals DROP CONSTRAINT TitlePrincipals_title_fk;
ALTER TABLE TitlePrincipals ADD CONSTRAINT TitlePrincipals_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitlePrincipals DROP CONSTRAINT TitlePrincipals_name_fk;
ALTER TABLE TitlePrincipals ADD CONSTRAINT TitlePrincipals_name_fk FOREIGN KEY(`nconst`) REFERENCES Name (`nconst`);

ALTER TABLE TitlePrincipalsCharacters DROP CONSTRAINT TitlePrincipalsCharacters_title_fk;
ALTER TABLE TitlePrincipalsCharacters ADD CONSTRAINT TitlePrincipalsCharacters_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitleGenres DROP CONSTRAINT TitleGenres_title_fk;
ALTER TABLE TitleGenres ADD CONSTRAINT TitleGenres_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE Name DROP CONSTRAINT Name_name_fk;
ALTER TABLE Name ADD CONSTRAINT Name_name_fk FOREIGN KEY(`nconst`) REFERENCES Name (`nconst`);

ALTER TABLE TitleCrewWriters DROP CONSTRAINT TitleCrewWriters_title_fk;
ALTER TABLE TitleCrewWriters ADD CONSTRAINT TitleCrewWriters_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE Title DROP CONSTRAINT Title_title_fk;
ALTER TABLE Title ADD CONSTRAINT Title_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitleEpisode DROP CONSTRAINT TitleEpisode_title_fk;
ALTER TABLE TitleEpisode ADD CONSTRAINT TitleEpisode_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);

ALTER TABLE TitleCrew DROP CONSTRAINT TitleCrew_title_fk;
ALTER TABLE TitleCrew ADD CONSTRAINT TitleCrew_title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);



SET FOREIGN_KEY_CHECKS=1;
