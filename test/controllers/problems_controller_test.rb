require "test_helper"

class ProblemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get problems_new_url
    assert_response :success
  end

  test "should get create" do
    get problems_create_url
    assert_response :success
  end

  test "should get index" do
    get problems_index_url
    assert_response :success
  end
end
