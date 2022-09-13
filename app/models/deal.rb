class Deal < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  belongs_to :user, foreign_key: "user_id"
end
