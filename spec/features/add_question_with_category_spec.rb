require 'rails_helper'

describe 'adding a question with a category path' do
  it "errors if you don't choose a category" do
  user = FactoryGirl.create(:user)
  visit '/log-in'
  fill_in 'username', :with => 'billyjewel'
  fill_in 'password', :with => 'bigtampons'
  click_on 'Log in'
  visit new_question_path
  fill_in "question_title", :with => "New Question"
  fill_in "question_description", :with => "New Description"
  click_on "Create Question"
  expect(page).to have_content "You must choose a category."
  end

  it "adds a question" do
  user = FactoryGirl.create(:user)
  Category.create(name:"Birth Control")
  visit '/log-in'
  fill_in 'username', :with => 'billyjewel'
  fill_in 'password', :with => 'bigtampons'
  click_on 'Log in'
  visit new_question_path
  fill_in "question_title", :with => "New Question"
  fill_in "question_description", :with => "New Description"
  select 'Birth Control'
  click_on "Create Question"
  expect(page).to have_content "New Question"
  end
end
