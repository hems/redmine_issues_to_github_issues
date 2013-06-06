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
require './classes/issues'
require './classes/users'


# script vars
REPO = "/repos/hems/testing_github_api"
FILE = "csv/max_issues.csv"


puts "Redmine to Github issues".green
puts

  milestones = Milestones.new( REPO, FILE )

  # create milestones in github in case they don't exist
  # milestones.create()

  # fetch all milestones from github ( needed to link tasks into milestones )
  milestones.fetch()

puts

puts

  issues    = Issues.new( REPO, FILE, milestones )
  issues.create()

puts


puts "job is done! enjoy!".purple