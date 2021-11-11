#!/bin/bash

echo "Starting conversion from CSV to SQL with CSVKit."
echo "################################################"

for file in csvData/*;
  do
    fileNameWithExtension=$(basename -- "$file")
    fileName="${fileNameWithExtension%.*}"
    encoding=$(file -bi $file)

    echo "Processing file: $fileNameWithExtension"
    echo "File encoding: $encoding"
    eval csvsql -i mysql "$file" -v > sqlScripts/"$fileName".sql
    echo "Create table script for $fileName.sql created"
    echo "************************************************************"

done


