#### These are the critical steps for building the PAPRICA database.  This is not necessary
#### to use PAPRICA, but will provide you with some added flexibility and the ability
#### to work directly with the PGDBs.  Be sure to check the beginning of each Python script
#### for user setable variables.  Depending on your system this script will take a substantial
#### amount of time to run and the PGDBs will take a substantial amount of space.  On my system
#### (24 cores) it takes roughly 8 hours to get all the genomes downloaded and the database
#### built.  The PGDBs take up about 100 Gb of space.

#!/bin/bash

## 1. download genomes, combine elements, extract 16S

python paprica_make_ref.py -download T -domain bacteria &&

## 2. make a reference package from 16S

python paprica_place_it.py -ref combined_16S.bacteria.tax -domain bacteria &&

## 3. run test.bacteria.fasta 

python paprica_place_it.py -query test.bacteria -ref combined_16S.bacteria.tax -splits 1 &&

## 4. build the reference database.  the rm step isn't strictly necessary but cleans up the workspace
## substantially.  the logs are only helpful if pathway-tools isn't firing for some reason.

python paprica_build_core_genomes.py test.combined_16S.tax.clean.align.phyloxml &&

rm pathos*log