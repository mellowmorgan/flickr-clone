require 'rails_helper'

describe "shows gallery" do
  before(:each) do
    @user = User.create!({username:"me",email:"me@me.com",password:"help123",password_confirmation:"help123"})
    @gallery = Gallery.create!({name:"catpics", user_id:@user.id})
    @user1 = User.create!({username:"mellowmorgan",email:"morgan.waites@gmail.com",password:"help1234",password_confirmation:"help1234"})
  end
  it "shows gallery" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "me@me.com"
    fill_in 'Password', :with => "help123"
    click_on "Log in"
    click_on "catpics"
    expect(page).to have_content "catpics"
  end
end 