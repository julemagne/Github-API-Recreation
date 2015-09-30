require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get profile" do
    get :result
    assert_response :success
  end

end
