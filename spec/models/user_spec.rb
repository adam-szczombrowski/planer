require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
  end
  it "is invalid without an email" do
    @user.should be_valid
  end
  it "is invalid without a name" do
    @user.name = nil
    @user.should_not be_valid
  end
  it "is invalid without password" do
    @user.password = nil
    @user.should_not be_valid
  end
end
