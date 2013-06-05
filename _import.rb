#!/usr/bin/env ruby

# requiring gears
require 'rubygems'
require 'csv'
require 'json'

require './github'

# requiring data
require './users'


# script vars
REPO = "/repos/hems/testing_github_api/"
FILE = "max_issues.csv"


#
# ~~~ collect milestones from csv file and push to github
#

milestones = Hash.new

CSV.foreach FILE, :headers => true do | row |

  if row["Target version"] != ''
    milestones[row["Target version"]] = true
  end

end

# push to github

puts "Creating milestones"

milestones.each do | milestone, unused_value |

  body = Hash.new
  body[:title] = milestone

  puts " - #{body[:title]}"

  # TODO: post to github and check the respose status

  # response = GitHub.post "#{REPO}/milestones", :body => JSON.generate(body), :headers => {"User-Agent" => "Jamoma issues migration"}
  # response.status

  puts "   OK"

  

end

puts

#
# ~~~~ Add issues to repository
#

puts "Creating issues"

CSV.foreach FILE, :headers => true do |row|

  body = Hash.new

  # TODO: format the title properly, will we use the "Project" field?
  body[:title] = row["Subject"]
  body[:body]  = row['Description']

  if row["Assignee"] != '' 
    body[:assignee] = map_user row["Assignee"]
  end

  if row["Target version"] != ''
    body[:milestone] = row["Target version"]
  end


  # 
  # Creating tags for Tracker / Priority / Category / Branch
  # 

  tags = Array.new

  if row["Branch"] != ''
    tags.push "branch:#{row["Branch"]}"
  end

  if row["Tracker"] != ''
    tags.push row["Tracker"]
  end

  if row["Priority"] != ''
    tags.push row["Priority"]
  end

  if row["Category"] != ''
    tags.push row["Category"]
  end


  if tags.length
    body[:labels] = tags
  end

  puts " - #{body[:title]}"
  puts "   to ~> : #{body[:assignee]}" if body[:assignee]
  puts "   tags: #{tags.join(',')}"



  # issue = GitHub.post '/repos/hems/testing_github_api/issues', :body => JSON.generate(body), :headers => {"User-Agent" => "Jamoma issues migration"}

  # GitHub.post "/repos/hems/testing_github_api/issues/#{issue.parsed_response['number']}/comments", :body => JSON.generate(body), :headers => {"User-Agent" => "Jamoma issues migration"}

  # p "Created #{body[:title]}"

  puts "   OK"

end