require 'rails_helper'

describe "add gallery process" do
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
  end
  it "should add a gallery for a user" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    click_on "Log in"
    click_on 'View My Galleries'
    click_on 'Add a gallery'
    fill_in 'gallery[name]', :with => "catpics"
    click_on 'Create Gallery'
    expect(page).to have_content "Gallery successfully added!"
  end
end