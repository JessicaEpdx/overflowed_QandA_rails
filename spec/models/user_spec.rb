require 'rails_helper'

describe User do
  it 'creates a user' do
    user = FactoryGirl.create(:user)
    expect(User.all).to include(user)
  end
end
