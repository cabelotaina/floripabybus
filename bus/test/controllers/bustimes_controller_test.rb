require 'test_helper'

class BustimesControllerTest < ActionController::TestCase
  setup do
    @bustime = bustimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bustimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bustime" do
    assert_difference('Bustime.count') do
      post :create, bustime: { label: @bustime.label, time: @bustime.time }
    end

    assert_redirected_to bustime_path(assigns(:bustime))
  end

  test "should show bustime" do
    get :show, id: @bustime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bustime
    assert_response :success
  end

  test "should update bustime" do
    patch :update, id: @bustime, bustime: { label: @bustime.label, time: @bustime.time }
    assert_redirected_to bustime_path(assigns(:bustime))
  end

  test "should destroy bustime" do
    assert_difference('Bustime.count', -1) do
      delete :destroy, id: @bustime
    end

    assert_redirected_to bustimes_path
  end
end
