class Parlor < ApplicationRecord
  belongs_to :category
  has_many :addresses
  has_many :assets, as: :assetable
  has_many :infos, class_name: :Infomation, as: :infoable
  validates :name, presence: true
end
