# As an user I want to be able to upgrade my account from a free plan to a paid 
#(premium) plan so that I can create private wikis.

require 'spec_helper'

feature "user upgrade account to a premium plan" do
  scenario "user submit payment information" do
    user = FactoryGirl.create :user
    visit new_user_session_path
  
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Sign in'

    visit wikis_path
    click_on "Upgrade account"
  end
end