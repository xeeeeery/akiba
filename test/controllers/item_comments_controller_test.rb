require 'test_helper'

class ItemCommentsControllerTest < ActionController::TestCase
  setup do
    @item_comment = item_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_comment" do
    assert_difference('ItemComment.count') do
      post :create, item_comment: { body: @item_comment.body, user_id: @item_comment.user_id }
    end

    assert_redirected_to item_comment_path(assigns(:item_comment))
  end

  test "should show item_comment" do
    get :show, id: @item_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_comment
    assert_response :success
  end

  test "should update item_comment" do
    patch :update, id: @item_comment, item_comment: { body: @item_comment.body, user_id: @item_comment.user_id }
    assert_redirected_to item_comment_path(assigns(:item_comment))
  end

  test "should destroy item_comment" do
    assert_difference('ItemComment.count', -1) do
      delete :destroy, id: @item_comment
    end

    assert_redirected_to item_comments_path
  end
end
