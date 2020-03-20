require 'test_helper'

class GroupControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get group_name:string_url
    assert_response :success
  end

end
