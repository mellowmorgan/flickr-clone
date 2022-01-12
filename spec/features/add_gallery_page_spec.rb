require 'rails_helper'

describe "add gallery process" do
  before(:each) do
    @user = User.create!({username:"me",email:"me@me.com",password:"help123",password_confirmation:"help123"})
    @gallery = Gallery.create!({name:"catpics", user_id:@user.id})
    @user1 = User.create!({username:"mellowmorgan",email:"morgan.waites@gmail.com",password:"help1234",password_confirmation:"help1234"})
  end
  it "should add a gallery for a user" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    click_on "Log in"
    click_on 'View My Galleries'
    click_on 'Add a gallery'
    fill_in 'gallery[name]', :with => "catpictures"
    attach_file 'gallery[image]', 'app/assets/images/image.png'
    click_on 'Create Gallery'
    expect(page).to have_content "Gallery successfully added!"
  end
  it "give error message to unauthorized user trying to add gallery" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    click_on "Log in"
    click_on "catpics"
    click_on "me@me.com"
    click_on "Add a gallery"
    expect(page).to have_content "You are not authorized to access this page."
  end
end
