class User < ApplicationRecord
    self.primary_key = :user_id
    has_many :posts, foreign_key: :user_id
    validates :user_id, presence: true
end
