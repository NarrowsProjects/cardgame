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

  test "should display errors" do
    User.create(username: "taken_username", password: "Ab1@")

    username = "valid_name"
    password = "Ab1@"

    invalid_users = [
      { username: "", password:, expected_error: "Please provide a username" },
      { username:, password: "", expected_error: "Please provide a password" },
      { username: "Way_to_long_username", password:, expected_error: "Username must be at most 15 characters long" },
      { username:, password: "Way_to_long_password", expected_error: "Password must be at most 15 characters long" },
      { username: "srt", password:, expected_error: "Username must be at least 4 characters long" },
      { username: "taken_username", password:, expected_error: "Username is already taken" },
      { username:, password: "aaaa",
        expected_error: "Password must include at least one uppercase letter, one lowercase letter, one number, and one special character"
      }
    ]

    invalid_users.each do |user|
      visit new_user_path

      fill_in "Password", with: user[:password]
      fill_in "Username", with: user[:username]
      click_on "Create Account"

      assert_text user[:expected_error]
    end
  end
end
