class Post < ApplicationRecord
    belongs_to :user, primary_key: :user_id, foreign_key: :user_id
    validates :user, presence: true
end
