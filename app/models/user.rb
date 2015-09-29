require 'httparty'
require 'byebug'
class User

  def initialize(name, response)
    @name = name
    @repos = response
  end



  def pull_repo_info
    repo_array = []
    @repos.each do |repo|
      repo_array << {
        name: repo["name"],
        description: repo["description"],
        #updated_at: format_updated_time(repo["updated_at"]),
        language: repo["language"],
        stargazers_url: repo["stargazers_url"],
        stargazers_count: repo["stargazers_count"],
        forks_url: repo["forks_url"],
        forks_count: repo["forks_count"],
        html_url: repo["html_url"]
      }
    end
    repo_array
  end

  private

    def self.get_repos(user)
      #HTTParty.get("https://api.github.com/users/#{user}/repos")
      file = "./test/json/results.json"
      JSON.parse(File.read(file))
    end

#     def format_updated_time(updated)
#       updated = Time.parse(updated)
#       right_now = Time.now
#
#       if updated.strftime("%m") == right_now.strftime("%m")
#
#     end
end
