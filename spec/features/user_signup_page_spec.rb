require 'rails_helper'

describe "user signup process" do
  it "signs user up when all fields entered" do 
    visit '/'
    click_on 'Sign-In/Sign-Up'
    click_on 'Sign up'
    fill_in 'user[username]', :with => "mellowmorgan"
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    fill_in 'Password confirmation', :with => "help1234"
    click_on "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end