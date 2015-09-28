class Idea < ActiveRecord::Base

  CATEGORIES = ['trucos', 'recetas']

  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, :category, :introduction, :body, :user_id, :published_at, presence: true

  #validates :title, length: {minimum: 5, maximum: 100}
  #validates :introduction, length: {minimum: 10, maximum: 200}
  #validates :body, length: {minimum: 30, maximum: 500}

  before_validation(on: :create) do
    self.published_at = Time.now
  end

  has_attached_file :image,
                    styles: {thumb: "100x100>",
                             medium: "400x225#",
                             fourthree: "400x300#",
                             large: "600x337.5>"},
                    :default_url => "propias/d_brick_:style.png"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_size :image, :in => 0.megabytes..1.megabytes

  acts_as_taggable # Alias for acts_as_taggable_on :tags

  #extend FriendlyId
  #friendly_id :title, use: :slugged

end
