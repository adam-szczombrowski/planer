require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe User, type: :model do
  it "is invalid without an email" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end
  it "is invalid without password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
end
