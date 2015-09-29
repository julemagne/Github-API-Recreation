class User

  def initialize(login)
    @login = login
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

  private def get_response
    file = File.join(Rails.root, 'test','models','json_github','user.json')
    JSON.parse(File.read(file))
  end
  # private def get_response
  #   key = ENV['GITHUB_KEY']
  #   HTTParty.get("damenate:#{key} https://api.github.com/users/#{@login}")
  # end

end
