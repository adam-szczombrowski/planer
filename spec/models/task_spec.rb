require 'rails_helper'
require 'factory_girl_rails'


RSpec.describe Task, type: :model do
  let(:task) { FactoryGirl.create (:task) }

  it "has a valid factory" do
    expect(task).to be_valid
  end

  it "is invalid without name" do
    task.name = nil
    expect(task).to_not be_valid
  end

  it "is invalid without description" do
    task.description = nil
    expect(task).to_not be_valid
  end

  it "is invalid without category" do
    task.category = nil
    expect(task).to_not be_valid
  end

  it "is invalid with wrong category" do
    task.category = "C5"
    expect(task).to_not be_valid
  end
end
