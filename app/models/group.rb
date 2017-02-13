class Group < ApplicationRecord
  has many :users_groups
  has many :users, through: :users_groups
  has many :messages
end
