class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :price
    validates :detail
    validates :state-id
    validates :area_id
    validates :category_id
    validates :day_id
    validates :burden_id


end
