class Idea < ActiveRecord::Base

  CATEGORIES = ['trucos', 'recetas']
  
  belongs_to :user

  validates :title, :body, :user_id, :published_at, presence: true

  before_validation(on: :create) do
    self.published_at = Time.now
  end

  has_attached_file :image, styles: {thumb: "100x100>", medium: "400x230#", large: "530x300>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_size :image, :in => 0.megabytes..1.megabytes
end
