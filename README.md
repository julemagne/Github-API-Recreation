<p align="center">
<img src="http://i.imgur.com/NWjLTGM.gif" width=225>
</p>
<h1 align="center">GitHub Profile Page</h1>

## Description
In this assignment we have built a Rails application that consumes information from GitHub's API and then presents it back to the user on their own views. Here the user can see the view in the application and it will show them a page that looks just like their own GitHub repositories page.

## Teamwork Makes the Dream Work
Just like this example of Octocats, we also worked together. As a class we divided GitHub APIs and worked on pulling different data and in the end merged out branches.
<p align="center">
<img src="http://i.imgur.com/31Ase1Y.jpg" width=500>
</p>

## GitHub API code
One of the teams was assigne the GitHub User API and below is an example of the code that was written to pull data from that particular hash:
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

Below is an example of some of the HTML code that was written in the views file:
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
