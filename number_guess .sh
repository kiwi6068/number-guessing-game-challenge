#!/bin/bash

echo -e "\nNumber Guessing Game\n"
psql="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
secret_number=$(( $RANDOM % 1000 + 1 ))

#echo $secret_number

echo "Enter your username:"
read player_name

while [[ ${#player_name} -gt 23 ]]
do
echo "Enter your username:"
read player_name
done
#echo $player_name

player_id=$($psql "SELECT player_id FROM players WHERE name = '$player_name'")

if [[ -n $player_id ]];then

player_games=$($psql "SELECT COUNT(game_id) FROM games WHERE player_id=$player_id")
best_game=$($psql "SELECT MIN(guess_count) FROM games WHERE player_id=$player_id")
insert_game=$($psql "INSERT INTO games(player_id,guess_count)VALUES($player_id,null)")

echo "Welcome back, $player_name! You have played $player_games games, and your best game took $best_game guesses."

else
echo "Welcome, $player_name! It looks like this is your first time here."

insert_player=$($psql "INSERT INTO players(name) VALUES('$player_name')")
player_id=$($psql "SELECT player_id FROM players WHERE name = '$player_name'")
insert_game=$($psql "INSERT INTO games(player_id,guess_count) VALUES($player_id,null)")

fi

echo "Guess the secret number between 1 and 1000:"
read -p "Enter your guess: " guess

count=1
pattern="[a-z]+"
while [[ $secret_number -ne $guess ]]
do
if [[ "$guess" =~ $pattern ]]; then
((count++))
echo "That is not an integer, guess again:"
read -p "Enter your guess: " guess

elif [[ $secret_number -lt $guess ]]; then
((count++))
echo "It's lower than that, guess again:"
read -p "Enter your guess: " guess

elif [[ $secret_number -gt $guess ]]; then
((count++))
echo "It's higher than that, guess again:"
read -p "Enter your guess: " guess


fi
done

game_id=$($psql "SELECT game_id FROM games WHERE player_id=$player_id")

guess_count=$($psql "UPDATE games SET guess_count = $count WHERE game_id = $game_id")

echo -e "You guessed it in $count tries. The secret number was $secret_number. Nice job!" 
