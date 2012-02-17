require 'test_helper'

class BlessingsControllerTest < ActionController::TestCase
  setup do
    @gratitude = blessings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blessings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blessing" do
    assert_difference('Blessing.count') do
      post :create, :blessing => @gratitude.attributes
    end

    assert_redirected_to blessing_path(assigns(:blessing))
  end

  test "should show blessing" do
    get :show, :id => @gratitude.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gratitude.to_param
    assert_response :success
  end

  test "should update blessing" do
    put :update, :id => @gratitude.to_param, :blessing => @gratitude.attributes
    assert_redirected_to blessing_path(assigns(:blessing))
  end

  test "should destroy blessing" do
    assert_difference('Blessing.count', -1) do
      delete :destroy, :id => @gratitude.to_param
    end

    assert_redirected_to blessings_path
  end
end
