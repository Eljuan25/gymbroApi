class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :recoverable, :rememberable, :validatable, :database_authenticatable

  

 has_one_attached :avatar

end
