# As an user I want to be able to upgrade my account from a free plan to a paid 
#(premium) plan so that I can create private wikis.

require 'spec_helper'

feature "user upgrade account to a premium plan" do
  scenario "user upgrade account", :js => true do
    user = FactoryGirl.create :user
    visit new_user_session_path
  
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'

    #visit wikis_path
    #save_and_open_page

    #click_button "Upgrade account"

    #save_and_open_page

    visit new_charge_path
    click_button "Pay with Card"

    #fill_in '[email]', :with => 'persona@example.com'

    

    fill_in "Card number", :with => "4242424242424242"
    #fill_in 'user_cvc', :with => '123'
    #fill_in 'user_mm/yy', :with => '11/14'
    
    
    click_button 'Pay $5.00'

  end

  scenario "without signing-in" do
    visit wikis_path

    expect( page ).to have_content 'You need to sign in or sign up before continuing.'

    expect( page ).to have_content 'Sign in'
  end

  
end