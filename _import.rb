#!/usr/bin/env ruby

# requiring gears
require 'rubygems'
require 'csv'
require 'json'
require 'ap'
require 'colorize'

# requiring tools and maping
require './classes/github'
require './classes/milestones'

require './import/users_map'


# script vars
REPO = "/repos/hems/testing_github_api"
FILE = "csv/max_issues.csv"


puts "Redmine to Github issues".green
puts

milestones = Milestones.new( REPO, FILE )
milestones.create()

issues    = Issues.new( REPO, FILE, milestones )
milestones.create()



puts "job is done! enjoy!".purple