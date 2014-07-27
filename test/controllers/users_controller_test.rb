require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get reg" do
    get :new
    assert_response :success
  end

end
