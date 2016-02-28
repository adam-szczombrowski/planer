require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create :user }

  it "is invalid without an email" do
    expect(user).to be_valid
  end
  it "is invalid without a name" do
    user.name = nil
    expect(user).to_not be_valid
  end
  it "is invalid without password" do
    user.password = nil
    expect(user).to_not be_valid
  end
end
