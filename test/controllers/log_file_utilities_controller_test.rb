require 'test_helper'

class LogFileUtilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log_file_utility = log_file_utilities(:one)
  end

  test "should get index" do
    get log_file_utilities_url
    assert_response :success
  end

  test "should get new" do
    get new_log_file_utility_url
    assert_response :success
  end

  test "should create log_file_utility" do
    assert_difference('LogFileUtility.count') do
      post log_file_utilities_url, params: { log_file_utility: { directory: @log_file_utility.directory } }
    end

    assert_redirected_to log_file_utility_url(LogFileUtility.last)
  end

  test "should show log_file_utility" do
    get log_file_utility_url(@log_file_utility)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_file_utility_url(@log_file_utility)
    assert_response :success
  end

  test "should update log_file_utility" do
    patch log_file_utility_url(@log_file_utility), params: { log_file_utility: { directory: @log_file_utility.directory } }
    assert_redirected_to log_file_utility_url(@log_file_utility)
  end

  test "should destroy log_file_utility" do
    assert_difference('LogFileUtility.count', -1) do
      delete log_file_utility_url(@log_file_utility)
    end

    assert_redirected_to log_file_utilities_url
  end
end
