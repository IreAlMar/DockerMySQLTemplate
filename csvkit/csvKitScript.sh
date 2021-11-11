#!/bin/bash

echo "Starting conversion from CSV to SQL with CSVKit."
echo "################################################"

for file in csvData/*;
  do
    echo "Processing file: $file"
    encoding=$(file -bi $file)
    echo "File encoding: $encoding"
    fileNameWithExtension=$(basename -- "$file")
    fileName="${fileNameWithExtension%.*}"
    echo "File name $fileName"
    eval csvsql -i mysql $file -v > sqlScripts/$fileName.sql
    cho "Processing $file completed"

done


