class Milestones

  @repository = nil
  @csv_file   = nil

  @milestones = nil

  def initialize( repository, csv_file )
    @repository = repository
    @csv_file   = csv_file
  end

  def create
    @milestones = Hash.new

    CSV.foreach @csv_file, :headers => true do | entry |

      if entry[ "Target version" ] != ''
        @milestones[ entry["Target version"] ] = nil
      end

    end

    # adds milestones alphabetically
    @milestones.keys.sort.each do | milestone |
      body = { :title => milestone }

      puts "Adding milestone: " + "#{milestone}".purple

      response = GitHub.post "#{REPO}/milestones", :body => JSON.generate(body), :headers => {"User-Agent" => "Jamoma issues migration"}

      if response.has_key?("errors")

        response["errors"].each do | error |
          puts " - #{error["code"]}".red
        end

      else

        puts "+ added".green

      end

      # save milestone id

      @milestones[ milestone ] = response[ "id" ]

    end

  end

  def name_to_id( name )
    @milestones[ name ]
  end

end