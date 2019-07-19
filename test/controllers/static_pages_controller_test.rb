require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get static_pages_signin_url
    assert_response :success
  end

end
