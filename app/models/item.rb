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
    validates :price
    validates :category_id,     numericality: { other_than: 1 }
    validates :status_id,       numericality: { other_than: 1 }
    validates :bearer_id,       numericality: { other_than: 1 }
    validates :region_id,       numericality: { other_than: 1 }
    validates :delivar_at_id,   numericality: { other_than: 1 }
    validates :user
  end

  has_one_attached :image
  belongs_to :user
  has_one :order
end
