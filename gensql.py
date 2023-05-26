#Read directory of files in TSV and make a rough guess a thte SQL to create the table and load the data
#There are a few edge case workarounds in here for example endyear is mostly NULLs so figuring out it shoudl be an integer
#is explicit - also character is a reserved works so we change to ascharacter explicitly

import os
import csv

print("""create database if not exists movies;
use movies;


"""
)

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
for datafile in datafiles:
     if datafile.endswith('.tsv'):
      
        with open(F"outputfiles/{datafile}") as infile:
            reader = csv.DictReader(infile, delimiter='\t',quotechar='\a')
          
            row = next(reader)
            
            fname=datafile[:-4]
            tableparts = fname.split('.')
            tablename = ""
            for part in tableparts:
                tablename = tablename + part.capitalize()

            print(F"\n\nDROP TABLE  IF EXISTS {tablename};\n\n")
            createstatement = F"CREATE TABLE {tablename} (\n "
            for col in reader.fieldnames:
                example = row[col]
                if col == "character":
                    col = "ascharacter"
                ecount = 0
                while example == '\\N' and ecount < 100:
                    row = next(reader)
                    example = row[col]
                    ecount += 1
                if col.endswith('const') or col.endswith('Id'):
                      createstatement = createstatement + F"{col} char(10),\n "
                elif represents_int(example) or col.endswith('year'):
                    createstatement = createstatement + F"{col} int,\n "
                elif represents_double(example):
                    createstatement = createstatement + F"{col} double,\n "
                elif col == "ascharacter":
                     createstatement = createstatement + F"{col} varchar(4096),\n "
                else:
                    createstatement = createstatement + F"{col} varchar(512),\n "

            createstatement = createstatement + "PRIMARY KEY ("
            for col in reader.fieldnames:
                if col.endswith('const') or col.endswith('Id') or col.endswith('No')  or col == "ordering":
                    createstatement = createstatement + F"{col},"
            
            createstatement = createstatement[:-1]
            createstatement = createstatement + ") );\n\n"
               

            print(createstatement)

            print(F"LOAD DATA LOCAL  INFILE '/users/jlp/Documents/Source/IMDBSampleDataLoad/outputfiles/{datafile}'") 
            print(F"INTO TABLE {tablename}")
            print("""FIELDS TERMINATED BY '\\t'
LINES TERMINATED BY '\\n'
IGNORE 1 LINES;""")