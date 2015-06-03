require 'test_helper'

class EmailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get standard" do
    get :standard
    assert_response :success
  end

  test "should get delayed" do
    get :delayed
    assert_response :success
  end

end
