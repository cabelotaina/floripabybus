require 'test_helper'

class BusdayofweeksControllerTest < ActionController::TestCase
  setup do
    @busdayofweek = busdayofweeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:busdayofweeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create busdayofweek" do
    assert_difference('Busdayofweek.count') do
      post :create, busdayofweek: { bustime_id: @busdayofweek.bustime_id, day: @busdayofweek.day, direction: @busdayofweek.direction }
    end

    assert_redirected_to busdayofweek_path(assigns(:busdayofweek))
  end

  test "should show busdayofweek" do
    get :show, id: @busdayofweek
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @busdayofweek
    assert_response :success
  end

  test "should update busdayofweek" do
    patch :update, id: @busdayofweek, busdayofweek: { bustime_id: @busdayofweek.bustime_id, day: @busdayofweek.day, direction: @busdayofweek.direction }
    assert_redirected_to busdayofweek_path(assigns(:busdayofweek))
  end

  test "should destroy busdayofweek" do
    assert_difference('Busdayofweek.count', -1) do
      delete :destroy, id: @busdayofweek
    end

    assert_redirected_to busdayofweeks_path
  end
end
