require 'test_helper'

class VentesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ventes_index_url
    assert_response :success
  end

  test "should get show" do
    get ventes_show_url
    assert_response :success
  end

  test "should get new" do
    get ventes_new_url
    assert_response :success
  end

  test "should get create" do
    get ventes_create_url
    assert_response :success
  end

  test "should get edit" do
    get ventes_edit_url
    assert_response :success
  end

  test "should get update" do
    get ventes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ventes_destroy_url
    assert_response :success
  end

end
