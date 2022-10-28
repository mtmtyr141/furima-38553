class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates  :name
          validates :birthday
         
         
          validates :firstname, format: { with: /\A[あ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
          validates :lastname,  format: { with: /\A[あ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
          validates :firstname_kana, format: { with: /\A[ァ-ヶー-]+\z/, message: "is invalid. Input full-width katakana characters."}
          validates :lastname_kana, format: { with: /\A[ァ-ヶー-]+\z/, message: "is invalid. Input full-width katakana characters."}

          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half-width characters.' }
         end
         
         has_many :items
         has_many :orders


end
