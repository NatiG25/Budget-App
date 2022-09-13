class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  has_many :deals, foreign_key: "user_id"

    validates :name, presence: true
  
    ROLES = %i[admin default].freeze
  
    def is?(requested_role)
      role == requested_role.to_s
    end
end
