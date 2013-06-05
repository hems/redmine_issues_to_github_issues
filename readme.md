# Importing redmine issues to Github issues


# About

This is a simple script to import redmine tasks to github, it was created during [jamoma](http://www.jamoma.org) 2013 workshop @ Albi, France

Requirements are:

 - Ruby
 - Github account
 - Redmine CSV export of the tasks

 # Instructions

  - Export redmine as CSV
  	~> you might want to convert to UTF encoding, although not sure if all cases need that

  - Save on same folder as ruby script

  - Set your username and password @ "github.rb"

  - Set your repository address and CSV file name @ "_import.rb"

  - Run ```ruby _import.rb```

# Instructions