require 'rails_helper'

describe "delete a gallery process" do
  before(:each) do
    @user = User.create!({username:"me",email:"me@me.com",password:"help123",password_confirmation:"help123"})
    @gallery = Gallery.create!({name:"catpics", user_id:@user.id})
    @user1 = User.create!({username:"mellowmorgan",email:"morgan.waites@gmail.com",password:"help1234",password_confirmation:"help1234"})
  end
  it "should delete a gallery for a user" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "me@me.com"
    fill_in 'Password', :with => "help123"
    click_on "Log in"
    click_on 'View My Galleries'
    click_on 'catpics'
    click_on 'Delete Gallery'  
    expect(page).to have_content "Gallery successfully deleted."
  end
  it "should throw error for unauthorized user" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    click_on "Log in"
    click_on 'catpics'
    click_on 'Delete Gallery'  
    expect(page).to have_content "You are not authorized to delete this gallery."
  end
end