require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = build(:user)
  end

  test "should create user" do
    visit new_user_path

    fill_in "Password", with: @user.password
    fill_in "Username", with: @user.username
    click_on "Create Account"

    assert_text "User was successfully created"
    assert_text "Player #{@user.username}"
  end
end
