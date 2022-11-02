class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user 
  belongs_to :burden
  has_one :order  
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :detail

  end 
   
    validates :price, presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
    validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :burden_id, numericality: { other_than: 1, message: "can't be blank" }



end

