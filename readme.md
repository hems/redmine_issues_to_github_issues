# Importing redmine issues to Github


## About

This is simple script to import redmine issues to github, it was created during [jamoma](http://www.jamoma.org) 2013 workshop @ Albi, France

Requirements are:

 - Ruby
 - Redmine CSV export of the tasks ( all columns + description )

## Instructions

- Export redmine as CSV

- Save on csv/file_name.csv

- Map your users on "classes/users.rb"

- Set your repository address and CSV file name @ "_import.rb"

- Run ```ruby _import.rb```

## Atributions

Initially i got a script from this [gist](https://gist.github.com/visnup/1117145),
[this one](: https://gist.github.com/robotarmy/2257596) worth a look as well

## Recomendations

- Create an empty repository and test the script before playing with your real repository

## Improvements

- Use redmine [API](http://www.redmine.org/wiki/1/Rest_api) to query for information instead of exporting list of CSV

## Licence

free

Good luck!