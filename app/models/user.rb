class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  
  # redirect_to new_profile_url if sign_in_count == 1
  has_many :comments
  has_many :posts
  has_many :drinks
  has_many :likes
  has_many :l_drinks, through: :likes, source: :drink
end
