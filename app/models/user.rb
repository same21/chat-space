class User < ApplicationRecord

 has many users_groups
 has many messages
 has many groups, through: :users_groups
end
