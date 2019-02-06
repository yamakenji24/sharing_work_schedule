require 'test_helper'

class ShiftControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shift_index_url
    assert_response :success
  end

end
