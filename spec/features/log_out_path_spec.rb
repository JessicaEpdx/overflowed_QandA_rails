require 'rails_helper'

describe 'log out path' do
  it 'ends the session' do
    User.create({username: 'MommaMia', password:'whoayes', password_confirmation:'whoayes', email:'Momma@mia.com'})
    visit '/log-in'
    fill_in 'username', :with => 'MommaMia'
    fill_in 'password', :with => 'whoayes'
    click_on 'Log in'
    click_on 'Log Out'
    expect(page).to have_content "You're out of here." 
  end
end
