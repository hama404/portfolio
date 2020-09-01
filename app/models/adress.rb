class Adress < ApplicationRecord
  include JpPrefecture
  include Countries
  belongs_to :parlor, dependent: :destroy
  has_many :assets, as: :imageable
  has_many :business_hours
  jp_prefecture :prefecture_code, method_name: :pref

  def zipcode_jp
    if country_code == 81
      "〒" + zipcode.to_s.insert(3, "-")
    else
      nil
    end
  end

  def adress
    state + city + address1 + address2
  end

  def country
    c = ISO3166::Country.find_country_by_country_code(country_code)
    c.name
  end
end
