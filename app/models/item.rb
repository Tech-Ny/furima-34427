class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :bearer
  belongs_to :region
  belongs_to :delivar_at

  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range or invalid' }
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :bearer_id
    validates :region_id
    validates :delivar_at_id
  end

  has_one_attached :image
  belongs_to :user
  has_one :order
end
