require 'test_helper'

class AchatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get achats_index_url
    assert_response :success
  end

  test "should get show" do
    get achats_show_url
    assert_response :success
  end

  test "should get new" do
    get achats_new_url
    assert_response :success
  end

  test "should get create" do
    get achats_create_url
    assert_response :success
  end

  test "should get edit" do
    get achats_edit_url
    assert_response :success
  end

  test "should get update" do
    get achats_update_url
    assert_response :success
  end

  test "should get destroy" do
    get achats_destroy_url
    assert_response :success
  end

end
