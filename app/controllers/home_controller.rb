class HomeController < ApplicationController
  def index
    set_menu('inicio')
    @noticia = Article.order('created_at ASC').last
    @idea = Idea.order('created_at ASC').last
  end

  # listado de noticias
  def noticias
    set_menu('noticias')
    @noticias = Article.where(category: 'noticia').order('created_at ASC').page(params[:page]).per(10)
  end

  # una noticia
  def noticia
    set_menu('noticias')
    @noticia = Article.find(params[:id])
  end

  # listado de iniciativas
  def iniciativas_sociales
    set_menu('iniciativas')
    @iniciativas = Article.where(category: 'iniciativa').order('created_at ASC').page(params[:page]).per(10)
    #@iniciativas = @articles.group_by { |t| t.category.name }
  end

  # una iniciativa
  def iniciativa
    set_menu('iniciativas')
    @iniciativa = Article.find_by(category: 'iniciativa').find(params[:id])
  #  @iniciativa = Article.where(:category => { :name => 'iniciativa' }).find(params[:id])
  end

  # listado de ideas
  def ideas
    set_menu('ideas')
    @ideas = Idea.order('created_at ASC').page(params[:page]).per(10)
  end

  # una idea
  def idea
    set_menu('ideas')
    @idea = Idea.find(params[:id])
  end

  #listado de organizaciones
  def organizations 
    @organizations = Organization.order('name').page(params[:page]).per(10)
  end

  # una organizacion	
  def organization
    @organization = Organization.find(params[:id])
  end

end
