require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get loginask" do
    get :loginask
    assert_response :success
  end

  test "should get loginvalidate" do
    get :loginvalidate
    assert_response :success
  end

end
