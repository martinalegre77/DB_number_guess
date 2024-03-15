#!/bin/bash

echo "Enter your username:"
read NAME

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"

# comprobar si existe el usuario
USUARIO=$($PSQL "SELECT user_name, games_played, best_game FROM users WHERE user_name = '$NAME'")
# si no existe
if [[ -z $USUARIO ]]
then
  echo -e "Welcome, $NAME! It looks like this is your first time here."
  # crear usuario en DB
  INSERT_USER=$($PSQL "INSERT INTO users(user_name, games_played, best_game) VALUES('$NAME', 0, 0)")
# si existe mostrar los datos
else
  echo "$USUARIO" | while read USER BAR GAMES BAR BEST
  do
    echo -e "Welcome back, $NAME! You have played $GAMES games, and your best game took $BEST guesses."
  done
fi

# obtener id
USUARIO_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$NAME'")
BEST=$($PSQL "SELECT best_game FROM users WHERE user_id = $USUARIO_ID")

# INICIO JUEGO 
echo "Guess the secret number between 1 and 1000:"
SECRET_NUMBER=$((RANDOM%1000+1))
GUESSES=0
read NUMBER_USER

while [[ $NUMBER_USER != $SECRET_NUMBER ]]
do
  # (( GUESSES++ ))
  # comprobar si se ingresó un numero
  if [[ $NUMBER_USER =~ ^[0-9]+$ ]]
  then
    # aumentar $GUESSES
    (( GUESSES++ ))
    # comprobar si es menor
    if [[ $NUMBER_USER < $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
  else
    # no ingresó un numero
    echo "That is not an integer, guess again:"
  fi
  read NUMBER_USER
done

# adivina el numero
(( GUESSES++ ))
if [[ $NUMBER_USER == $SECRET_NUMBER ]]
then
  echo -e "\nYou guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  # guardar datos en DB
  if (( $BEST > $GUESSES || $BEST == 0 ))
  then
    REGISTER_GAME=$($PSQL "UPDATE users SET games_played=games_played+1, best_game=$GUESSES WHERE user_id=$USUARIO_ID")
  else
    REGISTER_GAME=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE user_id=$USUARIO_ID")
  fi
fi
