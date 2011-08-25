require 'test_helper'

class MargenopsControllerTest < ActionController::TestCase
  setup do
    @margenop = margenops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:margenops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create margenop" do
    assert_difference('Margenop.count') do
      post :create, :margenop => @margenop.attributes
    end

    assert_redirected_to margenop_path(assigns(:margenop))
  end

  test "should show margenop" do
    get :show, :id => @margenop.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @margenop.to_param
    assert_response :success
  end

  test "should update margenop" do
    put :update, :id => @margenop.to_param, :margenop => @margenop.attributes
    assert_redirected_to margenop_path(assigns(:margenop))
  end

  test "should destroy margenop" do
    assert_difference('Margenop.count', -1) do
      delete :destroy, :id => @margenop.to_param
    end

    assert_redirected_to margenops_path
  end
end
