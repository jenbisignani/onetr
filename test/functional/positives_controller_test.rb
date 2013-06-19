require 'test_helper'

class PositivesControllerTest < ActionController::TestCase
  setup do
    @positive = positives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:positives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create positive" do
    assert_difference('Positive.count') do
      post :create, positive: { description: @positive.description, name: @positive.name }
    end

    assert_redirected_to positive_path(assigns(:positive))
  end

  test "should show positive" do
    get :show, id: @positive
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @positive
    assert_response :success
  end

  test "should update positive" do
    put :update, id: @positive, positive: { description: @positive.description, name: @positive.name }
    assert_redirected_to positive_path(assigns(:positive))
  end

  test "should destroy positive" do
    assert_difference('Positive.count', -1) do
      delete :destroy, id: @positive
    end

    assert_redirected_to positives_path
  end
end
