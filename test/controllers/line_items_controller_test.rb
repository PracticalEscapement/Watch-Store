require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get line_items_index_url
    assert_response :success
  end

  test "should get create" do
    get line_items_create_url
    assert_response :success
  end

  test "should get delete" do
    get line_items_delete_url
    assert_response :success
  end
end
