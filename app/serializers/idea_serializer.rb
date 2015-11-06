class IdeaSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :category, :title, :introduction, :ingredients, :body, :image, :tag_list
  has_one :user
end
