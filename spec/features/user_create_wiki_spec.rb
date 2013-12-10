require 'spec_helper'
#As a user, I want to be able to create wiki pages using Markdown syntax.
feature "user create a wiki using markdown syntax" do

  scenario "user create a wiki" do
    user = FactoryGirl.create :user
    visit new_user_session_path
  
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Sign in'
    
    visit wikis_path
    expect(page).to have_content "My wikis"
     
    find_link('edit').visible?
    find_link('delete').visible?
    find_link('export').visible?

    click_on "New Wiki"
    visit new_wiki_path
    
    fill_in 'Title', :with => "Historia"
    fill_in 'Body', :with => "America fue descubierta un 12 de Octubre"

    click_on 'Save'

    save_and_open_page




  end
end
  