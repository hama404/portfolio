class Parlor < ApplicationRecord
  belongs_to :category
  has_many :adresses
  has_many :assets, as: :imageable
  has_many :business_hours
end
