class HomeController < ApplicationController
  def index
    @noticia = Article.order('created_at ASC').last
    @idea = Idea.order('created_at ASC').last
  end

  # listado de noticias
  def noticias
    @noticias = Article.order('created_at ASC')
  end

  # una noticia
  def noticia
    @noticia = Article.find(params[:id])
  end

  #listado de recetas
  def recetas
    @recetas = Idea.where(category: 'recetas')
  end

  def ideas_conservacion
    @ideas_conservacion = Idea.where(category: 'conservacion')
  end
end
