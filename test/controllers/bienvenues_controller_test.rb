require 'test_helper'

class BienvenuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bienvenues_index_url
    assert_response :success
  end

end
