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

  # listado de iniciativas
  def iniciativas
    @iniciativas = Article.find_by(category: 'iniciativa').order('created_at ASC').last
    #@iniciativas = Article.where(:category => { :name => 'iniciativa' }).order('created_at ASC').last
    #@iniciativas = @articles.group_by { |t| t.category.name }
  end

  # una iniciativa
  def iniciativa
    @iniciativa = Article.find_by(category: 'iniciativa').find(params[:id])
  #  @iniciativa = Article.where(:category => { :name => 'iniciativa' }).find(params[:id])
  end

  # listado de ideas
  def ideas
    @ideas = Idea.order('created_at ASC')
  end

  # una idea
  def idea
    @idea = Idea.find(params[:id])
  end

  #listado de organizaciones
  def organizations 
    @organizations = Organization.order('name')
  end

  # una organizacion	
  def organization
    @organization = Organization.find(params[:id])
  end

end
