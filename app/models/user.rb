class User < ApplicationRecord
  has_many :galleries, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :username_is_present

  def username_is_present
    if self.username.blank?
      errors.add(:base, "Username must be set")
    end
  end
end
