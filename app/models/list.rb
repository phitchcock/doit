class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  enum visibility: %w(closed viewable open)


  scope :visible, ->(user){where('')}
end