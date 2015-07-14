class Article < ActiveRecord::Base
  validates :title, :body, :published_at, presence: true

  before_validation(on: :create) do
    self.published_at = Time.now
  end
end
