#!/bin/bash

# For each file in csv create a sql script that creates a load infile script:
# copy the create table sql script
# include the infile load data conf from the csvData

echo "DB initialization started."
echo "################################################"
csvDir=/etc/mysql/tmp/csvData
sqlDir=/etc/mysql/tmp/sqlScripts
infileLoadDir=/etc/mysql/tmp/infileLoadScripts

for csvFile in "$csvDir"/*;
  do
    csvFileNameWithExtension=$(basename -- "$csvFile")
    fileName="${csvFileNameWithExtension%.*}"
    csvDirName=$(dirname "$csvFile")
    echo "File $csvFileNameWithExtension found in $csvDirName folder"
    sqlFile="$sqlDir/$fileName.sql"

    if [ -f "$sqlFile" ]; then
      echo "Corresponding sql script $sqlFile exists"

      infileLoad="$infileLoadDir/$fileName.sql"

      if [ -s "$infileLoad" ]; then
        echo "Infile load data sql script already exists"
      else
        echo "Creating infile load data sql script"
        cat "$sqlFile" > "$infileLoad"
        {
          printf "\nLOAD DATA INFILE '%s'" "$csvFile"
          printf "\nINTO TABLE %s" "$fileName"
          printf "\nFIELDS TERMINATED BY ','"
          printf "\nENCLOSED BY '\"'"
          printf "\nLINES TERMINATED BY '\\\n'"
          printf "\nIGNORE 1 LINES"
          printf "\n(%s);" "$(head -1 "$csvFile" | tr -d '"')"
        } >> "$infileLoad"
      fi

    else
      echo "No sql script $sqlFile for $csvFile found in $sqlDir folder"
    fi
    echo "************************************************************"

done
