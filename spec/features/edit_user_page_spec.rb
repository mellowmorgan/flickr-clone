require 'rails_helper'

describe "edit user process" do
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
  it "will edit the users information" do
    visit '/'
    click_on 'Edit Account'
    fill_in 'user[username]', :with => "mellowmorgan2"
    fill_in 'Email', :with => "morgan.waites2@gmail.com"
    fill_in 'Password', :with => "newhelp1234"
    fill_in 'Password confirmation', :with => "newhelp1234"
    fill_in 'Current password', :with => "help1234"
    click_on "Update"
    expect(page).to have_content "Your account has been updated successfully."
  end
end