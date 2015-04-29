# As a user, I want to be able to sign up for a new account
require 'spec_helper'
require 'rails_helper'

feature 'New user signs up' do
  scenario 'with invalid username and password' do
    visit root_path
    first(:link,  "Sign up").click

    fill_in 'user[email]', with: 'noatsign'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button "Sign up"

    expect(User.all.count).to eq(0)
  end

  scenario 'with valid username and password' do
    visit root_path
    first(:link,  "Sign up").click

    fill_in 'user[email]', with: "test@example.com"
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_button 'Sign up'

    user = User.find_by_email("test@example.com")

    expect(user.confirmed_at).to be(nil)
    expect(User.all.count).to eq(1)
  end
end

feature 'User sign in' do
  scenario 'user supplies valid credentials' do
    user = User.new(
    :email => 'test@example.com',
    :password => 'password'
    )
    user.skip_confirmation!
    user.save

    visit root_path
    click_link "Sign in"
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'user supplies invalid credentials' do
    user = User.new(
    :email => 'username@example.com',
    :password => 'password'
    )
    user.skip_confirmation!
    user.save

    visit root_path
    click_link "Sign in"
    fill_in 'user_email', with: 'invalid@bogus.com'
    fill_in 'user_password', with: 'WrongPassword'
    click_button 'Log in'

    expect(page).to have_content("Invalid email or password.")
  end
end

feature 'User sign out' do
  scenario 'user signs in and then signs out' do
    user = User.new(
      :email => 'test@example.com',
      :password => 'password'
    )
    user.skip_confirmation!
    user.save

    visit root_path
    click_link "Sign in"
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    click_link "signout"

    expect(page).to have_content('Signed out successfully.')
  end
end
