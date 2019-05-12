require "application_system_test_case"

class EasyPostsTest < ApplicationSystemTestCase
  setup do
    @easy_post = easy_posts(:one)
  end

  test "visiting the index" do
    visit easy_posts_url
    assert_selector "h1", text: "Easy Posts"
  end

  test "creating a Easy post" do
    visit easy_posts_url
    click_on "New Easy Post"

    fill_in "Address", with: @easy_post.address
    click_on "Create Easy post"

    assert_text "Easy post was successfully created"
    click_on "Back"
  end

  test "updating a Easy post" do
    visit easy_posts_url
    click_on "Edit", match: :first

    fill_in "Address", with: @easy_post.address
    click_on "Update Easy post"

    assert_text "Easy post was successfully updated"
    click_on "Back"
  end

  test "destroying a Easy post" do
    visit easy_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Easy post was successfully destroyed"
  end
end
