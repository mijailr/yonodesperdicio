json.woeid_id  @woeid
json.woeid_name WoeidHelper.convert_woeid_name(@woeid)[:full]
json.ads @ads do |ad|
  json.id ad.id
  json.title ad.title
  json.body ad.body
  json.user_id ad.user_id
  json.woeid_code ad.woeid_code
  json.created_at ad.created_at
  json.image_file_name ad.image_file_name
  json.type ad.type
  json.type_string ad.type_string
  json.status ad.status
  json.status_string ad.status_string
end
