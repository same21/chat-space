class UsersGroup < ApplicationRecord
  belongs to group
  belongs to user
end
