class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :recoverable, :rememberable, :validatable, :database_authenticatable
  
  has_one_attached :avatar
  validate :correct_avatar_mime_type

  def correct_avatar_mime_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
      errors.add(:avatar, 'must be a JPEG or PNG')
    end
  end
end