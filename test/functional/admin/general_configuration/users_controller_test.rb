require 'test_helper'

class Admin::GeneralConfiguration::UsersControllerTest < ActionController::TestCase
  setup do
    @admin_general_configuration_user = admin_general_configuration_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_general_configuration_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should save admin_general_configuration_user" do
    assert_difference('Admin::GeneralConfiguration::User.count') do
      post :save, :admin_general_configuration_user => @admin_general_configuration_user.attributes
    end

    assert_redirected_to admin_general_configuration_user_path(assigns(:admin_general_configuration_user))
  end

  test "should show admin_general_configuration_user" do
    get :show, :id => @admin_general_configuration_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_general_configuration_user.to_param
    assert_response :success
  end

  test "should update admin_general_configuration_user" do
    put :update, :id => @admin_general_configuration_user.to_param, :admin_general_configuration_user => @admin_general_configuration_user.attributes
    assert_redirected_to admin_general_configuration_user_path(assigns(:admin_general_configuration_user))
  end

  test "should destroy admin_general_configuration_user" do
    assert_difference('Admin::GeneralConfiguration::User.count', -1) do
      delete :destroy, :id => @admin_general_configuration_user.to_param
    end

    assert_redirected_to admin_general_configuration_users_path
  end
end
