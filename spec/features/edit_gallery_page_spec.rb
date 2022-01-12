require 'rails_helper'

describe "update gallery process" do
  before(:each) do
    @user = User.create!({username:"me",email:"me@me.com",password:"help123",password_confirmation:"help123"})
    @gallery = Gallery.create!({name:"gallery of cats", user_id:@user.id})
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
    click_on 'Update Gallery'
    expect(page).to have_content "Gallery successfully updated!"
  end
end