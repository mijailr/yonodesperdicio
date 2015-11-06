class AdSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title, :body, :status,
      :grams, :expiration_date, :pick_up_date,
      :comments_enabled, :image,
      :zipcode, :city, :province,
      :food_category
  has_one :user
end
