require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_index_url
    assert_response :success
  end

  test "should get update" do
    get students_update_url
    assert_response :success
  end

  test "should get destroy" do
    get students_destroy_url
    assert_response :success
  end
end
