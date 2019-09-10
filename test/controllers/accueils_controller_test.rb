require 'test_helper'

class AccueilsControllerTest < ActionDispatch::IntegrationTest
  test "should get accueil" do
    get accueils_accueil_url
    assert_response :success
  end

end
