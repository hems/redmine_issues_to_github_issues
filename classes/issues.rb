class Issues

  def initialize( repository, csv_file, milestones )
    @repository = repository
    @csv_file   = csv_file
    @milestones = milestones
  end

  def create

    index = 0
    succesfully_added = 0

    CSV.foreach @csv_file, encoding: "ISO8859-1", :headers => true do | entry |

      body =  {
        :title => entry[ "Subject" ],
        :body  => entry[ "Description" ]
      }

      if entry[ "Assignee" ] != ''
        body[:assignee] = Users.by_assignee( entry["Assignee"] ) 
      end

      if entry[ "Target version" ] != ''
        body[:milestone] = @milestones.name_to_id( entry[ "Target version" ] ) 
      end

      tags = entry_to_tags( entry )

      body[:labels] = tags if tags.length

      # ap body

      puts "  Adding issue: " + "#{body[:title]}".purple
      puts "      assignee: " + "#{body[:assignee]}".red if body[:assignee]
      puts "          tags: " + "#{tags.join(',')}".blue if tags.length

      if false
        issue = GitHub.post "#{REPO}/issues", 
          :body => JSON.generate(body), 
          :headers => {"User-Agent" => "Jamoma issues migration"}

        if issue.has_key?("errors")

          ap issue

          puts " - not added".red

        else

          puts "+ added".green

          succesfully_added += 1

        end
      end

      # comment = GitHub.post "/repos/hems/testing_github_api/issues/#{issue.parsed_response['number']}/comments", :body => JSON.generate(body), :headers => {"User-Agent" => "Jamoma issues migration"}

      # puts "Added comment"

      # puts "  + added".green

      # ap comment

      index += 1

    end

    puts 
    puts "Runned through " + "#{index}".purple + " issues, added " + "#{succesfully_added}".green + " failed " + "#{succesfully_added - index}".red
  end

  def entry_to_tags( entry )

    tags = Array.new

    if entry["Branch"] != ''
      tags.push "branch:#{entry["Branch"]}"
    end

    if entry["Tracker"] != ''
      tags.push entry["Tracker"].downcase.gsub(/ /, "_")
    end

    if entry["Priority"] != '' and entry["Priority"] != 'Normal'
      tags.push "p:#{entry["Priority"].downcase.gsub(/ /, "_")}"
    end

    if entry["Category"] != ''
      tags.push entry["Category"]
    end

    tags

  end

end