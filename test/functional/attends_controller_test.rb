require 'test_helper'

class AttendsControllerTest < ActionController::TestCase
  setup do
    @attend = attends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attend" do
    assert_difference('Attend.count') do
      post :create, attend: @attend.attributes
    end

    assert_redirected_to attend_path(assigns(:attend))
  end

  test "should show attend" do
    get :show, id: @attend.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attend.to_param
    assert_response :success
  end

  test "should update attend" do
    put :update, id: @attend.to_param, attend: @attend.attributes
    assert_redirected_to attend_path(assigns(:attend))
  end

  test "should destroy attend" do
    assert_difference('Attend.count', -1) do
      delete :destroy, id: @attend.to_param
    end

    assert_redirected_to attends_path
  end
end
