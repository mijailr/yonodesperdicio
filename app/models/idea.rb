class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, :body, :user_id, :published_at, presence: true

  before_validation(on: :create) do
    self.published_at = Time.now
  end

  has_attached_file :image, styles: {thumb: "200x300>", medium: "400x400>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_size :image, :in => 0.megabytes..1.megabytes
end
