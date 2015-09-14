# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Text.create code: "faq", 
            title: "Preguntas frecuentes", 
            body: "lalala"
Text.create code: "legal", 
            title: "Información legal", 
            body: "lalala"
Text.create code: "links", 
            title: "Links intersantes", 
            body: "* [Prosalus](http://prosalus.es)

* [Derecho a la alimentación](http://derechoalimentacion.org)

* [Nolotiro](http://nolotiro.org)"
Text.create code: "funciona", 
            title: "Cómo funciona", 
            body: "Antes de tirar piensa que nuestros excedentes pueden utilizarse en otras casas y son necesarios para otras personas.

Te proponemos formar parte de una red que colabora en la reducción del desperdicio de alimentos compartiendo aquello que no vas a consumir.

Sigue estos pasos:"

4.times do 
    Article.create title: "Una iniciativa", 
                   category: "iniciativa",
                   body: "El cuerpo de la iniciativa",
                   tag_list: "tag1, tag2"

    Article.create title: "Una noticia", 
                   category: "noticia",
                   body: "El cuerpo de la noticia",
                   tag_list: "tag1, tag2"
end


3.times do 
    Organization.create name: "Una organización", 
                        description: "blablabla",
                        zipcode: "28012",
                        address: "Rue 13 del Percebe, Teruel",
                        phone: "555555555",
                        email: "organization@organization.org",
                        website: "http://organization.org"
end

4.times do 
    Idea.create title: "Una receta", 
                user_id: "1",
                category: "recetas",
                introduction: "Una introducción",
                ingredients: "*Huevos *Harina *Leche",
                body: "El cuerpo de la receta"

    Idea.create title: "Un truco",
                user_id: "1",
                category: "trucos",
                introduction: "Una introducción",
                body: "El cuerpo del truco"
end