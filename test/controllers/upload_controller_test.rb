require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest
  test "should get newfile" do
    get upload_newfile_url
    assert_response :success
  end

end
