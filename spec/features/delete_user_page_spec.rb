
describe "cancel account process" do

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

  it "deletes user's account" do
    visit "/"
    click_link "Edit Account"
    click_on "Cancel my account"
    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end
end