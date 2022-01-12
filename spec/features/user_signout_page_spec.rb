require 'rails_helper'

describe "user signout process" do
  before(:each) do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    click_on 'Sign up'
    fill_in 'user[username]', :with => "mellowmorgan"
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    fill_in 'Password confirmation', :with => "help1234"
    click_on "Sign up"
  end
  it "signs user out" do
    visit '/'
    click_on 'Sign Out'
    expect(page).to have_content "Signed out successfully."
  end
end