require 'test_helper'

class PresmargenControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get procesa" do
    get :procesa
    assert_response :success
  end

end
