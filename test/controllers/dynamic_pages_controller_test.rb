require 'test_helper'

class DynamicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get dynamic_pages_top_url
    assert_response :success
  end

end
