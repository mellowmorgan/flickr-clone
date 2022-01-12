require 'rails_helper'

describe "update gallery process" do
  before(:each) do
    @user = User.create!({username:"me",email:"me@me.com",password:"help123",password_confirmation:"help123"})
    @gallery = Gallery.create!({name:"gallery of cats", user_id:@user.id})
    @user1 = User.create!({username:"mellowmorgan",email:"morgan.waites@gmail.com",password:"help1234",password_confirmation:"help1234"})
  end
  it "should update a gallery name for a user" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "me@me.com"
    fill_in 'Password', :with => "help123"
    click_on "Log in"
    click_on 'View My Galleries'
    click_on 'gallery of cats'
    click_on 'Edit Gallery'
    fill_in 'gallery[name]', :with => "catpics"
    attach_file 'gallery[image]', 'app/assets/images/image.png'
    click_on 'Update Gallery'
    expect(page).to have_content "Gallery successfully updated!"
  end
  it "should show error if unauthorized user" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "morgan.waites@gmail.com"
    fill_in 'Password', :with => "help1234"
    click_on "Log in"
    click_on "gallery of cats"
    click_on "Edit Gallery"
    expect(page).to have_content "You are not authorized to access this page."
  end
  it "should show error bad image upload" do
    visit '/'
    click_on 'Sign-In/Sign-Up'
    fill_in 'Email', :with => "me@me.com"
    fill_in 'Password', :with => "help123"
    click_on "Log in"
    click_on 'View My Galleries'
    click_on 'gallery of cats'
    click_on 'Edit Gallery'
    fill_in 'gallery[name]', :with => ""
    attach_file 'gallery[image]', 'app/assets/images/image.png'
    click_on 'Update Gallery'
    expect(page).to have_content "There was an error in updating your Gallery!"
  end
end