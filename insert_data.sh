#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "create table temp(year int not null, round varchar not null, winner varchar not null, opponent varchar not null, winner_goals int not null, opponent_goals int not null);"

# import csv data into temp
$PSQL "\copy temp from './games.csv' delimiter ',' csv header;"

# import teams data from temp to teams
$PSQL "insert into teams(name) select distinct(winner) from temp;"
$PSQL "insert into teams(name) select distinct(opponent) from temp on conflict do nothing;"

# add columns for games
$PSQL "alter table temp add column winner_id int not null default '123', add column opponent_id int not null default '123';"


# insert winner and oppo id's into temp
$PSQL "update temp set winner_id = (select team_id from teams where temp.winner = teams.name), opponent_id = (select team_id from teams where temp.opponent = teams.name);"

# import games data from temp
$PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) select year, round, winner_id, opponent_id, winner_goals, opponent_goals from temp;"

# drop temp
$PSQL "drop table temp;"