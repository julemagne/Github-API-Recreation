class User

def initialize(input) #input is params[:name]
  @username = input
  @response = get_response
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
    @response["created_at"]
  end

  def followers
    @response["followers"]
  end

  def starred
    @response[""]
  end

  def following
    @response["following"]
  end

  def organizations
    @response["organizations_url"]
  end

private

def get_response
  key=ENV['GITHUB_CLIENT_ID']
  response=HTTParty.get("https://api.github.com/users/#{@username}", headers: {
    "GITHUB_USERNAME" => "#{key}",
    "User-Agent" => "GITHUB_USERNAME"
  })
  #JSON.parse(response.to_s)
end



end
