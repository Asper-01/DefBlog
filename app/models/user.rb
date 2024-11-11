class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id
  has_one_attached :avatar
  def admin?
    admin
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
