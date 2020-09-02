class Infomation < ApplicationRecord
  belongs_to :infoable, dependent: :destroy, polymorphic: true
end
