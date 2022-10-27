class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates  :name
         validates :birthday
         validates :firstname
         validates :lastname
         validates :firstname_kana
         validates :lastname_kana
         end


         has_many :items
         has_many :orders


end
