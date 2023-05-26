# IMDBSampleDataLoad
IMDB Sample Data Loader

This set of scripts loads the IMDB non commercial datasets from here [ https://developer.imdb.com/non-commercial-datasets/ ]
into MySQL.

download.sh - Download the source files in Tab seperated format 

loadOriginalFormat.sh - Creare tables in MySQL and load the data as Supplied

normalize.py - Python script to convert the data into something a lto more like 3rd normal form - it contains comma seperated lists, no domain tabels and embedded JSON in its original form so this is a nicer starting point

loadNormalisedData.sh - Load the data once converted and set up indexes, constraints etc.

