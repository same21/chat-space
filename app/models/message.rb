class Message < ApplicationRecord
  belongs to user
  belongs to group
end
