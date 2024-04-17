#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check for argument
if [[ "$#" -eq 0 ]]
then
  echo "Please provide an element as an argument." 
else
  # check if argument is a number
  if [[ "$1" =~ ^[0-9]+$ ]]
  then
    if [[ -z $($PSQL "select * from elements where atomic_number = $1") ]]
    then
      echo "I could not find that element in the database."
      exit
    else
      ATON="$1"
    fi
  # check if argument is 1-2 chars long
  elif [[ "$1" =~ ^[a-zA-Z]{1,2}$ ]]
  then
    if [[ -z $($PSQL "select * from elements where symbol = '$1'") ]]
    then
      echo "I could not find that element in the database."
      exit
    else
      ATON=$($PSQL "select atomic_number from elements where symbol = '$1'")
    fi
  # else check for full name
  else
    if [[ -z $($PSQL "select * from elements where name = '$1'") ]]
    then
      echo "I could not find that element in the database."
      exit
    else
      ATON=$($PSQL "select atomic_number from elements where name = '$1'")
    fi
  fi
  # query and print info
  ELE=$($PSQL "select * from elements where atomic_number = '$ATON'")
  PROP=$($PSQL "select * from properties where atomic_number = '$ATON'")
  ETYPID=$($PSQL "select type_id from properties where atomic_number = '$ATON'")
  ETYP=$($PSQL "select type from types where type_id = '$ETYPID'")
  IFS="|"
  echo "$ELE|$PROP|$ETYP" | while read ENUM ESYM ENAM ENUM EMAS EMEL EBOI ETY ETYN
  do
    echo "The element with atomic number "$ENUM" is "$ENAM" ("$ESYM"). It's a "$ETYN", with a mass of "$EMAS" amu. "$ENAM" has a melting point of "$EMEL" celsius and a boiling point of "$EBOI" celsius."
  done
fi