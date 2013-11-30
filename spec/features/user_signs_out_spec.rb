require 'spec_helper'
# As a user, I want to be able to sign in and out of the Blocipedia.
feature "User sign out" do

  scenario "user want to end the session" do
    visit new_user_session_path
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_on 'Sign in'
    save_and_open_page
    click_link 'Sign out'

  end
    
  #expect(page).to have_content 'Welcome! You have sign in succesfully'
end