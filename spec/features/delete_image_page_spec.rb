require 'rails_helper'

describe "delete image process" do
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
  it "should delete the picture in a gallery" do
    visit '/'
    click_on 'View My Galleries'
    click_on 'Add a gallery'
    fill_in 'gallery[name]', :with => "catpics"
    attach_file 'gallery[image]', 'app/assets/images/image.png'
    click_on 'Create Gallery'
    click_on 'catpics'
    click_on 'Remove Image'
    expect(page).to have_content "Image successfully deleted."
  end
end