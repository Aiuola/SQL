#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from games.csv into wordcup database

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # if this is not the first line
  if [[ $YEAR != "year" ]]
  then
    # get the winner id
    W_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    
    # winner id is not found
    if [[ -z $W_ID ]]
    then
      # insert new team
      INSERT_WTEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      # print out the results if everything went well
      if [[ $INSERT_WTEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted new team: $WINNER
      fi

      # get the id of the new team
      W_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # get the opponent id
    O_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # opponent id is not found
    if [[ -z $O_ID ]]
    then
      # insert new team
      INSERT_OTEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      # print out the results if everything went well
      if [[ $INSERT_OTEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted new team: $OPPONENT
      fi

      # get the id of the new team
      O_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # insert into games
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
      VALUES($YEAR, '$ROUND', $W_ID, $O_ID, $W_GOALS, $O_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted new game: $YEAR, $ROUND, $W_ID, $O_ID, $W_GOALS, $O_GOALS
    fi
  fi
done
