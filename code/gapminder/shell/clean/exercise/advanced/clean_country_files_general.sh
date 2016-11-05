#!/bin/bash

cd ../clean

for filename in *.txt
do
    # Store the country name from each file into a varible called NAME
    # Removing any underscores and replacing them with spaces
    NAME=$(echo $filename | sed 's/\(.*\)\.cc\.txt/\1/g' | sed 's/_/ /g')

    #DEBUG TEST # awk 'BEGIN{FS="\t"} {print $1}' Congo_Dem_Rep.cc.txt | sed 's/,/ /g' | sed 's/\./ /g' | sed 's/  / /g'

    # In the first column of the file, remove any commas or periods, which will break the string matching comparison
    # between the column and the filename. Store the fixed file to filename.tmp
    awk 'BEGIN {OFS=FS="\t"} {gsub(/,/,"",$1);gsub(/\./,"",$1)}1' "$filename" > "$filename.tmp"

    # If the extracted name of the country matches the cleaned value in the first column, print the whole row to filename.cleaned 
    awk -v countryname="$NAME" -v filename="$filename.tmp" 'BEGIN{FS="\t"} $1 == countryname {print $0}' "$filename.tmp" > "$filename.cleaned"

    # Rename the cleaned file to the original filename
    mv -v "$filename.cleaned" "$filename"

    # Clean up the temporary file
    rm "$filename.tmp"
done

