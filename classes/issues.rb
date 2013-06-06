class Issues

  def initialize( repository, csv_file, milestones )
    @repository = repository
    @csv_file   = csv_file
    @milestones = milestones
  end

  def create
    CSV.foreach @csv_file, :headers => true do | entry |

      # TODO: format the title properly, will we use the "Project" field?
      body[:title] = entry[ "Subject" ]
      body[:body]  = entry[ "Description" ]

      if entry[ "Assignee" ] != '' 
        body[:assignee] = map_user entry["Assignee"]
      end

      if entry[ "Target version" ] != ''
        body[:milestone] = @milestones.name_to_id( entry[ "Target version" ] )
      end

      body[:labels] = @entry_to_tags( entry )

      puts "Adding issue   " + "#{body[:title]}".purple
      puts "  assigning to " + "#{body[:assignee]}".orange if body[:assignee]
      puts "  tags         " + "#{tags.join(',')}".blue

      issue = GitHub.post '/repos/hems/testing_github_api/issues', :body => JSON.generate(body), :headers => {"User-Agent" => "Jamoma issues migration"}

      puts "  + added".green

      ap issue

      comment = GitHub.post "/repos/hems/testing_github_api/issues/#{issue.parsed_response['number']}/comments", :body => JSON.generate(body), :headers => {"User-Agent" => "Jamoma issues migration"}

      puts "Added comment"

      puts "  + added".green

      ap comment

      break

    end
  end

  def entry_to_tags( entry )
    tags = Array.new

    if entry["Branch"] != ''
      tags.push "branch:#{entry["Branch"]}"
    end

    if entry["Tracker"] != ''
      tags.push entry["Tracker"]
    end

    if entry["Priority"] != ''
      tags.push entry["Priority"]
    end

    if entry["Category"] != ''
      tags.push entry["Category"]
    end

    tags
  end

end