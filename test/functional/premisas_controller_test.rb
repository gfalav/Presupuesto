require 'test_helper'

class PremisasControllerTest < ActionController::TestCase
  setup do
    @premisa = premisas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premisas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premisa" do
    assert_difference('Premisa.count') do
      post :create, :premisa => @premisa.attributes
    end

    assert_redirected_to premisa_path(assigns(:premisa))
  end

  test "should show premisa" do
    get :show, :id => @premisa.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @premisa.to_param
    assert_response :success
  end

  test "should update premisa" do
    put :update, :id => @premisa.to_param, :premisa => @premisa.attributes
    assert_redirected_to premisa_path(assigns(:premisa))
  end

  test "should destroy premisa" do
    assert_difference('Premisa.count', -1) do
      delete :destroy, :id => @premisa.to_param
    end

    assert_redirected_to premisas_path
  end
end
