#!/bin/bash

# Demo bash shell script to illustrate scripts and loops
# Naupaka Zimmerman October 3, 2015 naupaka@gmail.com

# Afternoon challenge:
# Write a bash script to fix the three incorrect files 
#      in the clean directory
#
# It can be as sophisticated or simple as you like, as long
#    as it results in a directory of tab-delimited text files
#    that are all 12 lines in length (except country.txt) and 
#    the file name matches the country name in the first column
#
# Tip: you may want to make a backup copy of the directory before
#    you change any files

# For those of you brave souls pursuing a general solution, you may 
# want to look up help for sed, awk, and grep

# But you don't need to pursue a general solution if you don't want to

# Another helpful thing: $1 is the first command line argument, $2 is the second, etc

cd ../clean

for filename in *da.cc.txt
do
  echo Moving $filename to new filename: 2015-$filename
  echo mv -v $filename 2015-$filename
done

