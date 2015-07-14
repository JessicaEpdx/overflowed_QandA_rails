require 'rails_helper'

describe 'adding an answer path' do
  it 'will add an answer to a question and display on same page', js: true do
    user = User.create({username: 'MommaMia', password:'whoayes', password_confirmation:'whoayes', email:'Momma@mia.com'})
    category = Category.create(:name => "Period Facts")
    question = Question.create(title: 'How many periods?', description:'In my lifetime?', category_id:category.id, user_id: user.id)
    answer = Answer.new
    visit '/log-in'
    fill_in 'username', :with => 'MommaMia'
    fill_in 'password', :with => 'whoayes'
    click_on 'Log in'
    visit '/questions'
    click_on 'How many periods?'
    click_on "Answer this Question"
    fill_in 'answer_description', :with => '200 if you are lucky.'
    click_on 'Answer!'
    expect(page).to have_content '200 if you are lucky.'
  end

  it 'will add an answer to a question and display on same page', js: true do
    user = User.create({username: 'MommaMia', password:'whoayes', password_confirmation:'whoayes', email:'Momma@mia.com'})
    category = Category.create(:name => "Period Facts")
    question = Question.create(title: 'How many periods?', description:'In my lifetime?', category_id:category.id, user_id: user.id)
    answer = Answer.new
    visit '/log-in'
    fill_in 'username', :with => 'MommaMia'
    fill_in 'password', :with => 'whoayes'
    click_on 'Log in'
    visit '/questions'
    click_on 'How many periods?'
    click_on "Answer this Question"
    fill_in 'answer_description', :with => '200 if you are lucky.'
    click_on 'Answer!'
    expect(page).to have_content '200 if you are lucky.'
  end
end
