class Task < ActiveRecord::Base
  belongs_to :list
  #belongs_to :user
  validates :name, presence: true


  def deletion_time
    created_at + 7.days
  end
end