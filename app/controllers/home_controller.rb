class HomeController < ApplicationController
  def index
    set_menu('inicio')
    @noticia = Article.where(category: 'noticia').where("published_at < ?", Time.now).order('published_at ASC').last
    @idea = Idea.where("published_at < ?", Time.now).order('published_at ASC').last
  end

  # listado de noticias
  def noticias
    set_menu('noticias')
    @noticias = Article.where(category: 'noticia').where("published_at < ?", Time.now).order('published_at DESC').page(params[:page]).per(10)
  end

  # una noticia
  def noticia
    set_menu('noticias')
    @noticia = Article.where("published_at < ?", Time.now).find(params[:id])
  end

  # listado de iniciativas
  def iniciativas_sociales
    set_menu('iniciativas')
    @iniciativas = Article.where(category: 'iniciativa').where("published_at < ?", Time.now).order('published_at DESC').page(params[:page]).per(10)
    #@iniciativas = @articles.group_by { |t| t.category.name }
  end

  # una iniciativa
  def iniciativa
    set_menu('iniciativas')
    @iniciativa = Article.where(category: 'iniciativa').where("published_at < ?", Time.now).find(params[:id])
  #  @iniciativa = Article.where(:category => { :name => 'iniciativa' }).find(params[:id])
  end

  # listado de ideas
  def ideas
    set_menu('ideas')
    category = params[:category]
    if category.present?
      set_submenu(category)
      @ideas = Idea.where(category: category).where("published_at < ?", Time.now).order('published_at DESC').page(params[:page]).per(10)
    else
      @ideas = Idea.order('created_at ASC').where("published_at < ?", Time.now).page(params[:page]).per(10)
    end
  end

  # una idea
  def idea
    set_menu('ideas')
    @idea = Idea.where("published_at < ?", Time.now).find(params[:id])
    set_submenu(@idea.category.pluralize)
  end

  #listado de organizaciones
  def organizations 
    @organizations = Organization.order('name').page(params[:page]).per(10)
    set_menu('compartir')
    set_submenu('organizaciones')
  end

  # una organizacion	
  def organization
    @organization = Organization.find(params[:id])
    set_menu('compartir')
    set_submenu('organizaciones')
  end

end
