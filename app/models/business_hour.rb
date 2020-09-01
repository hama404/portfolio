class BusinessHour < ApplicationRecord
  belongs_to :adress, dependent: :destroy
  has_many :crowdeds
end
