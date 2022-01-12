require 'rails_helper'

describe "delete a gallery process" do
  before(:each) do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    click_on 'Sign up'
    fill_in 'user[username]', :with => "mellowmorgan"
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    fill_in 'Password confirmation', :with => "help1234"
    click_on "Sign up"
    click_on 'Sign Out'
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    click_on "Log in"
    click_on 'View My Galleries'
    click_on 'Add a gallery'
    fill_in 'gallery[name]', :with => "catpics"
    click_on 'Create Gallery'    
  end
  it "should delete a gallery for a user" do
    visit '/'
    click_on 'View My Galleries'
    click_on 'catpics'
    click_on 'Delete Gallery'  
    expect(page).to have_content "Gallery successfully deleted."
  end
end