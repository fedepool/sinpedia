require 'spec_helper'
# As a user, I want to be able to sign in and out of the Blocipedia.
feature "User signs out" do

  scenario "user want to end the session" do
    user = FactoryGirl.create :user
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Sign in'
    
   

    click_link 'Sign out'

    expect(page).to have_content "Signed out successfully"
  end

  scenario "without signing-in" do
    visit wikis_path

    expect( page ).to have_content 'You need to sign in or sign up before continuing.'

    expect( page ).to have_content 'Sign in'
  end
    
  
end