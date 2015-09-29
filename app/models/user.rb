class User

  def initialize(username)
    @username = username
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

  # private def get_response
  #   file = File.join(Rails.root, 'test','models','json_github','user.json')
  #   JSON.parse(File.read(file))
  # end
  private def get_response
    key = ENV['GITHUB_TOKEN']
    HTTParty.get("https://api.github.com/?access_token=#{"GITHUB_TOKEN"}")
  end

end
