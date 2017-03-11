class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, presence: true

  def to_json
    { body: self[:body], user_name: self.user.name, time: self[:created_at].strftime("%Y/%m/%d %H:%M:%S") }
  end
end
