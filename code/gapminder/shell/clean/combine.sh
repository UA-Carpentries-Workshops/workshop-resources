#!/bin/bash

#########################################################################
# This file creates a combined tsv file from the individual country files
#########################################################################

OUTPUT_FILE="output/combined_gapMinder.tsv"

echo Building combined country data file
cat data/clean/country.cc.txt > $OUTPUT_FILE

mv -v data/clean/country.cc.txt data/clean/country.cc.processed
sleep 2

cat data/clean/*.cc.txt 
sleep 2
cat data/clean/*.cc.txt >> $OUTPUT_FILE

mv -v data/clean/country.cc.processed data/clean/country.cc.txt

