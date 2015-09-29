require 'test_helper'
require 'minitest/pride'
require 'user.rb'

class Test < Minitest::Test

def test_classes_exist
  assert User
end

def test_classes_take_parameters
  assert User.new("julemagne")
end

def test_followers_count
  julie=User.new("julemagne")
  assert_equal 6, julie.followers
end

def test_name
  julie=User.new("julemagne")
  assert_equal "Julie David", julie.name
end

def test_user_name
  julie=User.new("julemagne")
  assert_equal "julemagne", julie.user_name
end

def test_work
  julie=User.new("julemagne")
  assert_equal nil, julie.work
end

def test_location
  julie=User.new("julemagne")
  assert_equal nil, julie.location
end

def test_joined_date
  julie=User.new("julemagne")
  assert_equal "2014-01-22T15:11:02Z", julie.joined_date
end

def test_profile_picture_url
  julie=User.new("julemagne")
  assert_equal "2014-01-22T15:11:02Z", julie.profile_picture
end

def test_starred
  julie=User.new("julemagne")
  assert_equal "2014-01-22T15:11:02Z", julie.starred
end

def test_following
  julie=User.new("julemagne")
  assert_equal "2014-01-22T15:11:02Z", julie.following
end

def test_organizations
  julie=User.new("julemagne")
  assert_equal "2014-01-22T15:11:02Z", julie.organizations
end

end
