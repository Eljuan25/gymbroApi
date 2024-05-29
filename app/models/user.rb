class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :recoverable, :rememberable, :validatable, :database_authenticatable
  
  has_one_attached :avatar
  validate :correct_avatar_mime_type

  private 

  def correct_avatar_mime_type
    if avatar.attached? && !document.conent_type.in?(%w(image/jpeg image/png))
      errors.add(:avatar, 'must be jpg, png, ')
    end
  end
end
