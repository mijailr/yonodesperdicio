# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

texts = Text.create([{code: 'faq'}, {title: 'Preguntas frecuentes'}, {body: 'aquitextocompleto'}])
texts = Text.create([{code: 'legal'}, {title: 'Información legal'}, {body: 'aquitextocompleto'}])
texts = Text.create([{code: 'funciona'}, {title: 'Cómo funciona'}, {body: 'aquitextocompleto'}])
articles = Article.create([{title: 'Consejos para hacer una compra responsable'}, {category: 'noticias'}, {body: 'textocompleto'}, {published_at: '14 de julio de 2015 15:05'}, {image_file_name: 'Elefante_en_agua.jpg'}])
articles = Article.create([{title: 'Segunda noticia'}, {category: 'destacada'}, {body: 'textocompleto'}, {published_at: '15 de julio de 2015 12:07'}, {image_file_name: 'imagen8.jpg'}])
ideas = Idea.create([{title: 'Fresas refrescamtes'}, {category: 'receta'}, {body: 'textocompleto'}, {user_id: '1'}, {published_at: '15 de julio de 2015 12:07'}, {image_file_name: 'fresas.png'}])
organizations = Organization.create([{name: 'Prosalus'}, {description: 'textocompleto'}, {zip: '28011'}, {address: 'C/ María Panes, 4'}, {image_file_name: 'logo-prosalus.png'}])