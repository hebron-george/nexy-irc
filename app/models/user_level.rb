class UserLevel < ActiveRecord::Base
  validates :title, presence: true
  validates :level, presence: true

  has_many :users
end
