class Crowded < ApplicationRecord
  belongs_to :business_hour, dependent: :destroy
end
