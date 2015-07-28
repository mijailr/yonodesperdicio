class Organization < ActiveRecord::Base
  validates :name, :description, :zipcode, :address, :email, :phone, :website, presence: true

  has_attached_file :image, styles: {thumb: "100x100>", medium: "400x230#", large: "530x300>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_size :image, :in => 0.megabytes..1.megabytes
end