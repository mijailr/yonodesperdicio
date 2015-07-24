# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

texts = Text.create([{code: 'faq'}, {code: 'legal'}, {code: 'funciona'}])
articles = Article.create([{title: 'Consejos para hacer una compra responsable'}, {title: 'Segunda noticia'}])
ideas = Idea.create([{title: 'Fresas refrescamtes'}])
organizations = Organization.create([{name: 'Prosalus'}])