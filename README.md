<p align="center">
<img src="http://i.imgur.com/NWjLTGM.gif" width=225>
</p>
<h1 align="center">GitHub Profile Page</h1>

## Description
For this assignment, we built a Rails application that consumes information from GitHub's API and then presents it back to the user on their own views. Here, the user can see the view in the application and it will show them a page that looks just like their own GitHub repositories page.

## Teamwork Makes the Dream Work
Just like this example of Octocats, we also worked together. As a class, we divided GitHub APIs and worked on pulling different data. In the end, we merged our branches.
<p align="center">
<img src="http://i.imgur.com/31Ase1Y.jpg" width=500>
</p>

## GitHub API code
One of the teams was assigned the GitHub User API. Below is an example of the code that was written to pull data from that particular hash:
```ruby
class User

  def initialize(username)
    @username = username
    @response = get_response
  end

  def joined_date
    @response["created_at"]
  end

  def profile_picture
    @response["avatar_url"]
  end
```    


Below is an example of some of the HTML code that was written in the profile views file:
```html
 <form class="navbar-form" role="search">
        <div class="form-group">
          <input class="form-control" placeholder="Search Cathub" type="text">
        </div>
      </form>
      <ul class="nav-links">
        <li><a href="">Pull Requests</a></li>
        <li><a href="">Issues</a></li>
        <li><a href="">Gist</a></li>
        <li><a href=""></li>
      </ul>
```

## Test Driven Development
A critical part of the learning process is to continue our practice with Test Driven Development(TDD). Below is an example of some of our tests:
```ruby
def test_user_name
  julie=User.new("julemagne")
  assert_equal "julemagne", julie.user_name
end

def test_followers_count
  julie=User.new("julemagne")
  assert_equal 6, julie.followers
end

def test_joined_date
  julie=User.new("julemagne")
  assert_equal "January 22, 2014", julie.joined_date
end
```


### Contributors
The project was an excellent learning experience in which we practiced merging repositories and pair-programming. As a team, we performed sprints every two hours, followed by stand-ups, and divvied out tasks accordingly. Below is a list of of the contributors:
- David Bernheisel
- Julie David
- Doug Bryant
- Blake Strickland
- Tyler Rockwell
- Renee Quijano
- Josh McKelvey
- Ryan Graham
- Da-Me Kim
- Anthony Ellis
