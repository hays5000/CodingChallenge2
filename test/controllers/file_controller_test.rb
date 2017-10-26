require 'test_helper'

class FileControllerTest < ActionDispatch::IntegrationTest
  test "should get path:string" do
    get file_path:string_url
    assert_response :success
  end

end
