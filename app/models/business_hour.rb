class BusinessHour < ApplicationRecord
  belongs_to :parlor, dependent: :destroy
  has_many :crowdeds
end
