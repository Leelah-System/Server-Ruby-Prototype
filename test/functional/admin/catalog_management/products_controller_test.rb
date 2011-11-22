require 'test_helper'

class Admin::CatalogManagement::ProductsControllerTest < ActionController::TestCase
  setup do
    @admin_catalog_management_product = admin_catalog_management_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_catalog_management_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_catalog_management_product" do
    assert_difference('Admin::CatalogManagement::Product.count') do
      post :create, :admin_catalog_management_product => @admin_catalog_management_product.attributes
    end

    assert_redirected_to admin_catalog_management_product_path(assigns(:admin_catalog_management_product))
  end

  test "should show admin_catalog_management_product" do
    get :show, :id => @admin_catalog_management_product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_catalog_management_product.to_param
    assert_response :success
  end

  test "should update admin_catalog_management_product" do
    put :update, :id => @admin_catalog_management_product.to_param, :admin_catalog_management_product => @admin_catalog_management_product.attributes
    assert_redirected_to admin_catalog_management_product_path(assigns(:admin_catalog_management_product))
  end

  test "should destroy admin_catalog_management_product" do
    assert_difference('Admin::CatalogManagement::Product.count', -1) do
      delete :destroy, :id => @admin_catalog_management_product.to_param
    end

    assert_redirected_to admin_catalog_management_products_path
  end
end
