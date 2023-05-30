#Read directory of files in TSV and make a rough guess a thte SQL to create the table and load the data
#There are a few edge case workarounds in here for example endyear is mostly NULLs so figuring out it shoudl be an integer
#is explicit - also character is a reserved works so we change to ascharacter explicitly




import os
import csv

allfields = {}

with open(F"loadNormalised.sql","w") as sqlfile:
    sqlfile.write("""drop database movies;
    create database if not exists movies;
    use movies;


    """
    )

    constraints = ""

    def represents_int(s):
        try: 
            int(s)
        except ValueError:
            return False
        else:
            return True

    def represents_double(s):
        try: 
            float(s)
        except ValueError:
            return False
        else:
            return True

    datafiles = os.listdir('outputfiles')
    datafiles.sort(reverse=True)
    for datafile in datafiles:
        if datafile.endswith('.tsv'):
        
            with open(F"outputfiles/{datafile}") as infile:
                reader = csv.DictReader(infile, delimiter='\t',quotechar='\a')
            
                row = next(reader)
                
                fname=datafile[:-4]
                tableparts = fname.split('.')
                tablename = ""
                fulltablename = ""
                opart = ""
                for part in tableparts:
                    part = part.replace('primary','')
                    #If we get a repeat - then take the last part so NameProfessionProfession becomes Professsion
                    #As it's a domain table
                    if part == opart or part == opart[:-1] :
                        tablename = ""
                    opart = part
                    fulltablename =fulltablename + part.capitalize()
                    tablename = tablename + part.capitalize()
                tablename = tablename.replace('Basics','');
                fulltablename = fulltablename.replace('Basics','');
                sqlfile.write(F"SELECT '{tablename}' AS LOADING;\n")
                sqlfile.write(F"\n\nDROP TABLE  IF EXISTS {tablename};\n\n")
                createstatement = F"CREATE TABLE {tablename} (\n "
                for col in reader.fieldnames:
                    example = row[col]
                    if col == "character":
                        col = "ascharacter"
                    allfields[fulltablename+"_"+col] = True
                    #print(fulltablename+"_"+col)
                    ecount = 0
                    while example == '\\N' and ecount < 100:
                        row = next(reader)
                        example = row[col]
                        ecount += 1
                    if col.endswith('const') or col == "titleId":
                        createstatement = createstatement + F"{col} char(10),\n "
                    elif represents_int(example) or col.endswith('year') or col.endswith('Id'):
                        createstatement = createstatement + F"{col} int,\n "
                    elif represents_double(example):
                        createstatement = createstatement + F"{col} double,\n "
                    elif col == "ascharacter":
                        createstatement = createstatement + F"{col} varchar(4096),\n "
                    else:
                        createstatement = createstatement + F"{col} varchar(1024),\n "

                createstatement = createstatement + "PRIMARY KEY ("
                pkfields = []
                for col in reader.fieldnames:
                    if col.endswith('const') or col==('titleId') or col.endswith('No')  or col == "ordering":
                        pkfields.append(col)
                
                if len(pkfields) == 0:
                    for col in reader.fieldnames:
                        if col.endswith('Id') :
                            pkfields.append(col)

                createstatement = createstatement + ",".join(pkfields)
                
                #createstatement = createstatement[:-1]
                createstatement = createstatement + ") );\n\n"
                

                sqlfile.write(createstatement)

                sqlfile.write(F"LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/{datafile}' \n") 
                sqlfile.write(F"INTO TABLE {tablename} \n")
                sqlfile.write("""FIELDS TERMINATED BY '\\t'
    LINES TERMINATED BY '\\n'
    IGNORE 1 LINES;
    
    """)
                parentTable = fulltablename[:-len(opart)]
                parentHasOrdering = allfields.get(parentTable+"_ordering",False)
                if "tconst" in reader.fieldnames and not parentHasOrdering and tablename != "Title":
                    constraints += F"ALTER TABLE {tablename} DROP CONSTRAINT {tablename}_Title_fk;\n"
                    constraints += F"ALTER TABLE {tablename} ADD CONSTRAINT {tablename}_Title_fk FOREIGN KEY(`tconst`) REFERENCES Title(`tconst`);\n\n"

                if "titleId" in reader.fieldnames:
                    constraints += F"ALTER TABLE {tablename} DROP CONSTRAINT {tablename}_Title_fk;\n"
                    constraints += F"ALTER TABLE {tablename} ADD CONSTRAINT {tablename}_Title_fk FOREIGN KEY(`titleId`) REFERENCES Title(`tconst`);\n\n"

                if "nconst" in reader.fieldnames and tablename != "Name":
                    constraints += F"ALTER TABLE {tablename} DROP CONSTRAINT {tablename}_Name_fk;\n"
                    constraints += F"ALTER TABLE {tablename} ADD CONSTRAINT {tablename}_Name_fk FOREIGN KEY(`nconst`) REFERENCES Name (`nconst`);\n\n"

                if "tconst" in reader.fieldnames and "ordering" in reader.fieldnames and parentHasOrdering and tablename != "Title":
                    constraints += F"ALTER TABLE {tablename} DROP CONSTRAINT {tablename}_{parentTable}_fk;\n"
                    constraints += F"ALTER TABLE {tablename} ADD CONSTRAINT {tablename}_{parentTable}_fk FOREIGN KEY(`tconst`,`ordering`) REFERENCES {parentTable}(`tconst`,`ordering`);\n\n"
                
                for f in reader.fieldnames:
                    if  f.endswith('Id') and f != 'titleId':
                
                       
                        if allfields.get(parentTable+"_"+f,False):
                            constraints += F"ALTER TABLE {parentTable} DROP CONSTRAINT {parentTable}_{tablename}_fk;\n"
                            constraints += F"ALTER TABLE {parentTable} ADD CONSTRAINT {parentTable}_{tablename}_fk FOREIGN KEY(`{f}`) REFERENCES {tablename} (`{f}`);\n\n"
                        else:
                            print(F"{f} not in {parentTable}")

with open(F"constraints.sql","w") as consfile:
    consfile.write(F"""
-- Unfortunately the data seems seem to have a few issues and so we turn this off on load

SET FOREIGN_KEY_CHECKS=0;

{constraints}

SET FOREIGN_KEY_CHECKS=1;
""")