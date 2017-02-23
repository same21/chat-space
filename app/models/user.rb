class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :users_groups
 has_many :messages
 has_many :groups, through: :users_groups
 accepts_nested_attributes_for :users_groups
end
