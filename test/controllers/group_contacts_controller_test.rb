require 'test_helper'

class GroupContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get group_contacts_new_url
    assert_response :success
  end

  test "should get create" do
    get group_contacts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get group_contacts_destroy_url
    assert_response :success
  end

end
