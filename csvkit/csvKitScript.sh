#!/bin/bash

echo "DB initialization script generation started."
echo "################################################"

csvDir=csvData
infileLoadDir=infileLoadScripts

for csvFile in "$csvDir"/*; do
  csvFileNameWithExtension=$(basename -- "$csvFile")
  fileName="${csvFileNameWithExtension%.*}"
  encoding=$(file -bi "$csvFile")
  infileLoad="$infileLoadDir/$fileName.sql"

  echo "Processing file: $csvFileNameWithExtension"
  echo "File encoding: $encoding"
  eval csvsql -i mysql "$csvFile" -v > "$infileLoad"
  echo "Create table sql sentence written to $infileLoad"
  echo "Adding load data sql sentence"
  {
    printf "\nLOAD DATA INFILE '/etc/mysql/tmp/csvData/%s'" "$csvFileNameWithExtension"
    printf "\nINTO TABLE %s" "$fileName"
    printf "\nFIELDS TERMINATED BY ','"
    printf "\nENCLOSED BY '\"'"
    printf "\nLINES TERMINATED BY '\\\n'"
    printf "\nIGNORE 1 LINES"
    printf "\n(%s);" "$(head -1 "$csvFile" | tr -d '"')"
  } >>"$infileLoad"

  echo "Init script for $infileLoad completed"
  echo "************************************************************"

done
