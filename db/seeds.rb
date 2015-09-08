# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Text.create code: 'faq', body: "lalala"
Text.create code: 'legal', body: "lalala"
Text.create code: 'links', body: "lalala"
Text.create code: 'funciona', body: "lalala"

4.times do 
	Article.create title: "Lo que sea", 
	               category: "iniciativa",
	               body: "Una introduccion",
	               tag_list: "tag1, tag2"

	Article.create title: "Otra", 
	               category: "noticia",
	               body: "Una introduccion",
	               tag_list: "tag1, tag2"
end