#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -q -c "



# display services menu
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

echo "Which service would you like to book? Enter the number of choice:"

GETSERVICES=$($PSQL "select service_id, name from services;")

echo "$GETSERVICES" | while read SERVICE_ID BAR SERVICE_NAME
do
  echo "$SERVICE_ID) $SERVICE_NAME"
done

# read choice
read SERVICE_ID_SELECTED
# check if choice is in services table
if [[ -z $($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED") ]]
then
  MAIN_MENU "Not a valid choice, try again"
else
  echo "Please enter your phone number."
  read CUSTOMER_PHONE
  if [[ -z $($PSQL "select phone from customers where phone = '$CUSTOMER_PHONE'") ]]
  then
    echo "Please enter your name."
    read CUSTOMER_NAME
    $PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
  fi
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
  echo "Please enter your desired appointment time."
  read SERVICE_TIME
  $PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"
  
  if [[ -z $CUSTOMER_NAME ]]
  then
    CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
  fi
  SELECTED_SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  echo "I have put you down for a $SELECTED_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}

MAIN_MENU




