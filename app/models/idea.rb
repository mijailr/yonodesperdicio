class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, :body, :user_id, :published_at, presence: true

  before_validation(on: :create) do
    self.published_at = Time.now
  end
end
