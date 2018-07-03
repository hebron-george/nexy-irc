class UserLevel < ActiveRecord::Base
  validates :title, presence: true
  validates :level, presence: true
end