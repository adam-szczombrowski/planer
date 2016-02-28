class Task < ActiveRecord::Base
  belongs_to :user

  CATEGORIES = ['C1', 'C2', 'C3', 'C4']
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
