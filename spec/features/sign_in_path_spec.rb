require 'rails_helper'

describe 'sign in form path' do
  it 'validates user and password, shows user navbar' do
    User.create({username: 'MommaMia', password:'whoayes', password_confirmation:'whoayes', email:'Momma@mia.com'})
    visit '/log-in'
    fill_in 'username', :with => 'MommaMia'
    fill_in 'password', :with => 'whoayes'
    click_on 'Log in'
    expect(page).to have_content 'MommaMia'
  end
  it 'gives error on bad login' do
    visit '/log-in'
    fill_in 'username', :with => 'MommaMia'
    fill_in 'password', :with => 'whoayes'
    click_on 'Log in'
    expect(page).to have_content 'Uh oh, problems.'
  end
end
