class Group < ApplicationRecord
    validates :name, presence: true
    belongs_to :user, foreign_key: "user_id"
    has_and_belongs_to_many :deals
end
