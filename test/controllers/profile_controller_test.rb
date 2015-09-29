require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
