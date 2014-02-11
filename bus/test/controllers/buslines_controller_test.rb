require 'test_helper'

class BuslinesControllerTest < ActionController::TestCase
  setup do
    @busline = buslines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buslines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create busline" do
    assert_difference('Busline.count') do
      post :create, busline: { busdayofweek_id: @busline.busdayofweek_id, card_price: @busline.card_price, company: @busline.company, line: @busline.line, money_price: @busline.money_price, number: @busline.number, time_to_back: @busline.time_to_back, time_to_go: @busline.time_to_go }
    end

    assert_redirected_to busline_path(assigns(:busline))
  end

  test "should show busline" do
    get :show, id: @busline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @busline
    assert_response :success
  end

  test "should update busline" do
    patch :update, id: @busline, busline: { busdayofweek_id: @busline.busdayofweek_id, card_price: @busline.card_price, company: @busline.company, line: @busline.line, money_price: @busline.money_price, number: @busline.number, time_to_back: @busline.time_to_back, time_to_go: @busline.time_to_go }
    assert_redirected_to busline_path(assigns(:busline))
  end

  test "should destroy busline" do
    assert_difference('Busline.count', -1) do
      delete :destroy, id: @busline
    end

    assert_redirected_to buslines_path
  end
end
