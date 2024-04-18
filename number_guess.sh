#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -q -t --no-align -c"

echo "Enter your username:"
read USERNAME
if [[ -z $($PSQL "select username from accounts where username = '$USERNAME'") ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "insert into accounts(username, total_games, best_guess) values('$USERNAME', 0, 0)"
  BESTGUESS=$($PSQL "select best_guess from accounts where username = '$USERNAME'")
else
  DBUSERNAME=$($PSQL "select username from accounts where username = '$USERNAME'")
  TOTALGAMES=$($PSQL "select total_games from accounts where username = '$USERNAME'")
  BESTGUESS=$($PSQL "select best_guess from accounts where username = '$USERNAME'")
  echo "Welcome back, $DBUSERNAME! You have played $TOTALGAMES games, and your best game took $BESTGUESS guesses."
fi

# generate random number
min=0
max=1000
TOBEGUESSED=$(($RANDOM%($max-$min+1)+$min))

# create guess counter variable
NUMBERGUESSES=0

echo "Guess the secret number between 1 and 1000:"
MAIN_MENU() {
if [[ $1 ]]
then
  echo -e "\n$1"
fi
read GUESS
((NUMBERGUESSES++))

if ! [[ "$GUESS" =~ ^[0-9]+$ ]]
then
  MAIN_MENU "That is not an integer, guess again:"
elif [[ $GUESS -gt $TOBEGUESSED ]]
then
  MAIN_MENU "It's lower than that, guess again:"
elif [[ $GUESS -lt $TOBEGUESSED ]]
then
  
  MAIN_MENU "It's higher than that, guess again:"
elif [[ $GUESS == $TOBEGUESSED ]]
then
  $PSQL "update accounts set total_games = total_games + 1 where username = '$USERNAME';"
  if [[ $BESTGUESS == 0 ]]
  then
    $PSQL "update accounts set best_guess = $NUMBERGUESSES where username = '$USERNAME';"
  elif [[ $NUMBERGUESSES -lt $BESTGUESS ]]
  then
    $PSQL "update accounts set best_guess = $NUMBERGUESSES where username = '$USERNAME';"
  fi
  echo "You guessed it in $NUMBERGUESSES tries. The secret number was $TOBEGUESSED. Nice job!"
fi
}

MAIN_MENU