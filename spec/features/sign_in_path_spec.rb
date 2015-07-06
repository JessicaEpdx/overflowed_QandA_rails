require 'rails_helper'

describe 'sign in form path' do
  it 'validates user and password, shows user navbar' do
    visit '/log-in'
    click_on 'Post some LINX'
    fill_in 'Video url', :with => 'https://www.youtube.com/watch?v=aKdV5FvXLuI'
    fill_in 'Title', :with => 'D-RAD droppin bombs!'
    fill_in 'Description', :with => 'Un. Real.'
    click_on 'Create Post'
    expect(page).to have_content 'D-RAD'
  end
end
