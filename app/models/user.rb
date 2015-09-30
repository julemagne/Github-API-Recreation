class User

  def initialize(input) #input is params[:name]
    @username = input
    @response = get_response
    @repos = get_repos(input)
  end

  def profile_picture
      @response["avatar_url"]
  end

  def name
    @response["name"]
  end

  def user_name
    @response["login"]
  end

  def work
    @response["company"]
  end

  def location
    @response["location"]
  end

  def joined_date
   raw_date=@response["created_at"]

   month=raw_date[5..6]

   months_array = ["January", "February", "March", "April", "May", "June", "July", "August", "Septemer", "October", "November", "December"]

   case month
   when "01"
       month = months_array[0]
   when "02"
       month = months_array[1]
   when "03"
       month = months_array[2]
   when "04"
       month = months_array[3]
   when "05"
       month = months_array[4]
   when "06"
       month = months_array[5]
   when "07"
       month = months_array[6]
   when "08"
       month = months_array[7]
   when "09"
       month = months_array[8]
   when "10"
       month = months_array[9]
   when "11"
       month = months_array[10]
   when "12"
       month = months_array[11]
   else
       "???"
   end
   "Joined on "+month+" "+raw_date[8..9]+", "+raw_date[0..3]
 end

  def followers
    @response["followers"]
  end

  def starred
    @response["starred_url"]
  end

  def following
    @response["following"]
  end

  def organizations
    @response["organizations_url"]
  end

  def pull_repo_info
    repo_array = []
    begin
      @repos.each do |repo|
        repo_array << {
          name: repo["name"],
          description: repo["description"],
          updated_at: format_updated_time(repo["pushed_at"]),
          language: repo["language"],
          stargazers_url: repo["stargazers_url"],
          stargazers_count: repo["stargazers_count"],
          forks_url: repo["forks_url"],
          forks_count: repo["forks_count"],
          html_url: repo["html_url"],
          sort_field: repo["pushed_at"]
        }
      end
      repo_array.sort_by{|hash| hash[:sort_field]}.reverse
    rescue
      ["An error has occured. Please try again later."]
    end
  end

  private

  def get_response
    key=ENV['GITHUB_CLIENT_ID']
    response=HTTParty.get("https://api.github.com/users/#{@username}", headers: {
      "GITHUB_USERNAME" => "#{key}",
      "User-Agent" => "GITHUB_USERNAME"
    })
  end
    def get_repos(user)
      key=ENV['GITHUB_CLIENT_ID']
      HTTParty.get("https://api.github.com/users/#{user}/repos"), headers: {
        "GITHUB_USERNAME" => "#{key}",
        "User-Agent" => "GITHUB_USERNAME"
      }
      # file = "./test/json/results.json"
      # JSON.parse(File.read(file))
    end

    def format_updated_time(updated)
      update_time = Time.parse(updated)
      updated = time_hash(update_time)
      current = time_hash(Time.now)

      #Begin MONSTROUS if statement
      if updated[:year] == current[:year]
        if updated[:month] == current[:month]
          if updated[:day] == current[:day]
            if updated[:hour] == current[:hour]
              if updated[:minute] == current[:minute]
                #Minutes are equal
                difference = current[:second] - updated[:second]
                return "Updated #{difference} seconds ago" unless difference == 1
                return "Updated a second ago"
              else
                #Hours are equal
                difference = current[:minute] - updated[:minute]
                return "Updated #{difference} minutes ago" unless difference == 1
                return "Updated a minute ago"
              end
            else
              #Days are equal
              difference = current[:hour] - updated[:hour]
              return "Updated #{difference} hours ago" unless difference == 1
              return "Updated an hour ago"
            end
          else
            #Months are equal
            difference = current[:day] - updated[:day]
            return "Updated #{difference} days ago" unless difference == 1
            return "Updated a day ago"
          end
        else
          #Years are equal
          "Updated on #{update_time.strftime("%b")} #{updated[:day]}"
        end
    else
      "Updated on #{update_time.strftime("%b")} #{updated[:day]}, #{updated[:year]}"
    end
  end

    def time_hash(time)
      {
          year: time.strftime("%Y").to_i,
          month: time.strftime("%m").to_i,
          day: time.strftime("%e").to_i,
          hour: time.strftime("%H").to_i,
          minute: time.strftime("%M").to_i,
          second: time.strftime("%S").to_i
      }
    end
end
