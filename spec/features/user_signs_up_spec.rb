require 'spec_helper'

#As a user, I should be able to sign up for a free account by providing a user name, password and email address.
feature 'user signs up' do
  scenario 'with valid email and password' do
    visit    new_user_registration_path
    fill_in 'Email', with: 'valid@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(User.count).to eq 1
  end

  scenario 'without email nor password' do
    visit    new_user_registration_path
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end
end