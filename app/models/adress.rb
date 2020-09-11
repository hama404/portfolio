class Adress < ApplicationRecord
  include JpPrefecture
  include Countries
  belongs_to :parlor, dependent: :destroy
  has_many :assets, as: :assetable
  has_many :infos, class_name: :Infomation, as: :infoable
  has_many :business_hours
  validates :name, presence: true
  jp_prefecture :prefecture_code, method_name: :pref

  ## method
  def self.search(q)
    return Adress.all if q.blank?
    Adress.where(['name LIKE ?', "%#{q}%"])
  end

  ## detail
  def adress
    return unless state.present? && city.present? && address1.present? && address2.present?
    state + city + address1 + address2
  end

  def zipcode_jp
    return unless (zipcode.present? && country_code.present?) && (country_code == 81)
    "〒" + zipcode.to_s.insert(3, "-")
  end

  def news
    if infos.first
      news = infos.first.notice
      news.split("\n")
    else
      ["nothig"]
    end
  end

  def country
    c = ISO3166::Country.find_country_by_country_code(country_code)
    c.name
  end
end
