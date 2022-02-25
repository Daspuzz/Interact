require "test_helper"

class StaticPages3ControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get static_pages3_contact_url
    assert_response :success
  end

  test "should get help" do
    get static_pages3_help_url
    assert_response :success
  end
end
