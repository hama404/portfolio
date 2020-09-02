class Asset < ApplicationRecord
  belongs_to :assetable, dependent: :destroy, polymorphic: true
  has_attached_file :photo, styles: { medium: "300x300#", thumb: "100x100>" },
                            default_url: "parlors/parlor_default.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
