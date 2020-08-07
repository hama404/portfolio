class Adress < ApplicationRecord
  include JpPrefecture
  include Countries
  belongs_to :parlor, dependent: :destroy
  has_many :assets, as: :imageable
  jp_prefecture :prefecture_code, method_name: :pref

  def country
    c = ISO3166::Country.find_country_by_country_code(country_code)
    c.name
  end
end
