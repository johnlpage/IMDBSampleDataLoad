#!/bin/sh

mkdir inputfiles
cd inputfiles
echo "Downloading files"
curl -OL https://datasets.imdbws.com/name.basics.tsv.gz
curl -OL https://datasets.imdbws.com/title.akas.tsv.gz
curl -OL https://datasets.imdbws.com/title.basics.tsv.gz
curl -OL https://datasets.imdbws.com/title.crew.tsv.gz
curl -OL https://datasets.imdbws.com/title.episode.tsv.gz
curl -OL https://datasets.imdbws.com/title.principals.tsv.gz
curl -OL https://datasets.imdbws.com/title.ratings.tsv.gz
echo "Unzipping files"
gunzip -f *.gz 
cd ..
