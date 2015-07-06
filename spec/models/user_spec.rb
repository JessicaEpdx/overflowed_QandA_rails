require 'rails_helper'

describe User do
  it {should have_many :answers}

  it 'creates a user' do
    user = FactoryGirl.create(:user)
    expect(User.all).to include(user)
  end

  it 'errors if signup does not include username and email' do
    user = FactoryGirl.build(:user, username: "", email: "")
    expect(user.valid?).to eq(false)
  end

  it 'errors if signup password is blank' do
    user = FactoryGirl.build(:user, password: "", password_confirmation:"")
    expect(user.valid?).to eq(false)
  end

end
