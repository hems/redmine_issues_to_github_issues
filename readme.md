# Importing redmine issues to Github issues


## About

This is simple script to import redmine issues to github, it was created during [jamoma](http://www.jamoma.org) 2013 workshop @ Albi, France

Requirements are:

 - Ruby
 - Github account
 - Redmine CSV export of the tasks

## Instructions

- Export redmine as CSV
	~> you might want to convert to UTF encoding, although not sure if all cases need that

- Save on same folder as ruby script

- Set your username and password @ "classes/github.rb"

- Set your repository address and CSV file name @ "_import.rb"

- Run ```ruby _import.rb```

## Atributions

Initially i got a "hacky script" from this gist: https://gist.github.com/visnup/1117145 and then i tweaked around till it fit.

I think this one worth a look as well: https://gist.github.com/robotarmy/2257596

## Recomendations

- Create an empty repository and have a ready on the script before playing with your real repository otherwise you might end up messing things around ( :

## Next Steps

- Use redmine [API](http://www.redmine.org/wiki/1/Rest_api) to query for information instead of exporting list of CSV

## Licence

Do whatever you want, the way you want. If you do something cool and want to feel proud, do a pull request ( :

Good luck!