require 'test_helper'

class RubricLineItemsControllerTest < ActionController::TestCase
  setup do
    @rubric_line_item = rubric_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rubric_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rubric_line_item" do
    assert_difference('RubricLineItem.count') do
      post :create, rubric_line_item: { description: @rubric_line_item.description, name: @rubric_line_item.name, rubric_id: @rubric_line_item.rubric_id }
    end

    assert_redirected_to rubric_line_item_path(assigns(:rubric_line_item))
  end

  test "should show rubric_line_item" do
    get :show, id: @rubric_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rubric_line_item
    assert_response :success
  end

  test "should update rubric_line_item" do
    put :update, id: @rubric_line_item, rubric_line_item: { description: @rubric_line_item.description, name: @rubric_line_item.name, rubric_id: @rubric_line_item.rubric_id }
    assert_redirected_to rubric_line_item_path(assigns(:rubric_line_item))
  end

  test "should destroy rubric_line_item" do
    assert_difference('RubricLineItem.count', -1) do
      delete :destroy, id: @rubric_line_item
    end

    assert_redirected_to rubric_line_items_path
  end
end
