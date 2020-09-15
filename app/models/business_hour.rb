class BusinessHour < ApplicationRecord
  belongs_to :address, dependent: :destroy
  has_many :crowdeds
end
