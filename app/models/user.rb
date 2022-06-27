class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
