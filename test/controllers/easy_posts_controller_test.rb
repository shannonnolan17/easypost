require 'test_helper'

class EasyPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @easy_post = easy_posts(:one)
  end

  test "should get index" do
    get easy_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_easy_post_url
    assert_response :success
  end

  test "should create easy_post" do
    assert_difference('EasyPost.count') do
      post easy_posts_url, params: { easy_post: { address: @easy_post.address } }
    end

    assert_redirected_to easy_post_url(EasyPost.last)
  end

  test "should show easy_post" do
    get easy_post_url(@easy_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_easy_post_url(@easy_post)
    assert_response :success
  end

  test "should update easy_post" do
    patch easy_post_url(@easy_post), params: { easy_post: { address: @easy_post.address } }
    assert_redirected_to easy_post_url(@easy_post)
  end

  test "should destroy easy_post" do
    assert_difference('EasyPost.count', -1) do
      delete easy_post_url(@easy_post)
    end

    assert_redirected_to easy_posts_url
  end
end
