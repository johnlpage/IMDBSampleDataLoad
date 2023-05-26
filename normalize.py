import csv
import os
import re
import json

from pprint import pprint


title = { "title.basics" : { "_keyFields": ["tconst"] ,
                              "titleType" : "normalise",
                              "genres" : "unwindAndNormalise" }}

name = {          "name.basics" : { "_keyFields": ["nconst" ],
                             "primaryProfession" : "unwindAndNormalise",
                             "knownForTitles": "unwind"} }

                         

crew = ( {          "title.crew" : { "_keyFields": ["tconst" ],
                             "writers" : "unwind",
                             "directors": "unwind"} })

ratings = ({ "title.ratings" : {  "_keyFields": ["tconst" ] }})

episodes = ({ "title.episode" : {  "_keyFields": ["tconst" ] }})

                          

aka = ({ "title.akas" : {  "_keyFields": ["tconst" ],
                           "region":"normalise",
                            "language" : "normalise",
                             "types" : "normalise" ,
                             "attributes":"normalise"}})

principals = ({ "title.principals" : {  "_keyFields": ["tconst","ordering"],
                           "category":"normalise",
                            "job" : "normalise",
                             "characters" : "unwindJson" } })

inputs = {**title,**name,**crew,**ratings,**episodes,**aka,**principals}

caches = {}
writers = {}



     
# Convert field to a lookup
def normalise(row,field,table):
    fieldValue = row[field]
    if fieldValue == "\\N":
        return fieldValue
    #Do we have a cache?
    if caches.get(table,None) == None:
         caches[table] = {"_id" : 0 , "_field" : field}
    cache = caches[table]
    key = cache.get(fieldValue,-1)
    if key == -1:
         key = cache['_id'] + 1
         cache['_id'] = key
         cache[fieldValue] = key
    return key



#Deal with arrays in the input data

def unwind(row,idFields,field,table,normaliseField=False,parseJson=False):
    writer = writers.get(table,None);
    if field.endswith('s'):
        singularField = field[:-1]
    else:
         singularField = field     
    if writer is None:
        outfile =  open(F"outputfiles/{table}.tsv","w")
        writer = csv.DictWriter(outfile, idFields + [F"{singularField}No",singularField] ,delimiter='\t',quotechar='\a',lineterminator='\n')
        writers[table] = writer
        writer.writeheader()

    fieldValue = row[field]
    if fieldValue == "\\N":
        return 
    
    if parseJson == True:
        fieldValues = json.loads(fieldValue)
    else:
        fieldValues = fieldValue.split(',')

    index = 1
    for fieldValue in fieldValues:
        newRow = {}
        for idField in idFields:
              newRow[idField] = row[idField]
        newRow[singularField] = fieldValue
        newRow[F"{singularField}No"] = index
        
        if normaliseField == True:
             newRow[singularField] = normalise( newRow, singularField ,F"{table}.{singularField}")
       
        index = index + 1
        writer.writerow(newRow)
        
try:
    os.mkdir('outputfiles')
except:
     pass

#Some of the supplied data has arrays and we want it as tables 
for name in inputs.keys():
    print(F"Processing {name}")
    with open(F"inputfiles/{name}.tsv") as infile:
        with open(F"outputfiles/{name}.tsv","w") as outfile:
                reader = csv.DictReader(infile, delimiter='\t',quotechar='\a')
                writer = csv.DictWriter(outfile, reader.fieldnames ,delimiter='\t',quotechar='\a',lineterminator='\n')
                writer.writeheader()
                for row in reader:
                    newrow = {}
                    for field in row:
                        #Repeating value should be in own table
                        if inputs[name].get(field,"") == "normalise":
                             newrow[field] = normalise(row,field,F"{name}.{field}")
                        #A comma seperated field needs ot become another table
                        elif inputs[name].get(field,"") == "unwind":
                             newrow[field] = '\\N'
                             unwind(row,inputs[name]['_keyFields'],field,F"{name}.{field}")
                        elif inputs[name].get(field,"") == "unwindAndNormalise":
                             newrow[field] = '\\N'
                             unwind(row,inputs[name]['_keyFields'],field,F"{name}.{field}",normaliseField=True)
                        elif inputs[name].get(field,"") == "unwindJson":
                             newrow[field] = '\\N'
                             unwind(row,inputs[name]['_keyFields'],field,F"{name}.{field}",normaliseField=False,parseJson=True)
                        else:
                            newrow[field] = row[field]
                    writer.writerow(newrow)
    #Write out all our normalised tables
    for domainTable in caches.keys():
        cache = caches[domainTable]
        if domainTable.endswith('s'):
             domainTable = domainTable[:-1]
        
        with open(F"outputfiles/{domainTable}.tsv","w") as outfile:
            cachedField = cache['_field']
            fieldList = [F"{cachedField}Id",F"{cachedField}"] 
            writer = csv.DictWriter(outfile,fieldList  ,delimiter='\t',quotechar='\a',lineterminator='\n')
            writer.writeheader()
            for cacheEntry in cache:
                 if cacheEntry != "" and cacheEntry[0] != '_':
                    newRow = {}
                    newRow[fieldList[1]] = cacheEntry
                    newRow[fieldList[0]] = cache[cacheEntry]
                    writer.writerow(newRow)
              
    
                