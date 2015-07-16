json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :title, :content, :CP, :address
  json.url organization_url(organization, format: :json)
end
