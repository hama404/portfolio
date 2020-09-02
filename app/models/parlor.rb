class Parlor < ApplicationRecord
  belongs_to :category
  has_many :adresses
  has_many :assets, as: :assetable
  has_many :infos, class_name: :Infomation, as: :infoable
end
