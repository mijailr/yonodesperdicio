class HomeController < ApplicationController
  def index
    set_menu('inicio')
    @noticia = Article.where(category: 'noticia').
                      where("published_at < ?", Time.now).
                      order('published_at ASC').last
    @idea = Idea.where("published_at < ?", Time.now).
                 order('published_at ASC').last
  end

  # listado de noticias
  def noticias
    set_menu('noticias')
    if params[:tag].present?
      @noticias = Article.where(category: 'noticia').
                          where("published_at < ?", Time.now).
                          tagged_with(params[:tag]).
                          order('published_at DESC').
                          page(params[:page]).per(10)
    else
      @noticias = Article.where(category: 'noticia').
                          where("published_at < ?", Time.now).
                          order('published_at DESC').
                          page(params[:page]).per(10)
    end
    @noticias_destacadas = Article.where(category: 'noticia').
                                   where("published_at < ?", Time.now).
                                   where(pin: true).
                                   order('published_at DESC').limit(5)
    @noticias_archivo = Article.where(category: 'noticia').
                                where("published_at < ?", Time.now).
                                order('published_at DESC').limit(3)
  end

  # una noticia
  def noticia
    set_menu('noticias')
    @noticia = Article.where(category: 'noticia').
                       where("published_at < ?", Time.now).
                       includes(comments: :user).
                       friendly.find(params[:id])
  end

  # listado de iniciativas
  def iniciativas_sociales
    set_menu('iniciativas')
    if params[:tag].present?
      @iniciativas = Article.where(category: 'iniciativa').
                             where("published_at < ?", Time.now).
                             tagged_with(params[:tag]).
                             order('published_at DESC').
                             page(params[:page]).per(10)
    else
      @iniciativas = Article.where(category: 'iniciativa').
                             where("published_at < ?", Time.now).
                             order('published_at DESC').
                             page(params[:page]).per(10)
    end

    @iniciativas_destacadas = Article.where(category: 'iniciativa').
                                      where("published_at < ?", Time.now).
                                      where(pin: true).order('published_at DESC').limit(5)
    @iniciativas_archivo = Article.where(category: 'iniciativa').
                                   where("published_at < ?", Time.now).
                                   order('published_at DESC').limit(3)
  end

  # una iniciativa
  def iniciativa
    set_menu('iniciativas')
    @iniciativa = Article.where(category: 'iniciativa').
                          where("published_at < ?", Time.now).
                          includes(comments: :user).
                          #friendly.find(params[:id])
                          find(params[:id])
  end



  # listado de ideas
  def ideas
    set_menu('ideas')
    category = params[:category]
    if category.present?
      set_submenu(category)
      @ideas = Idea.where(category: category).
                    where("published_at < ?", Time.now).
                    order('published_at DESC').
                    includes(:user).
                    page(params[:page]).per(10)
    else
      @ideas = Idea.order('created_at ASC').
                    where("published_at < ?", Time.now).
                    includes(:user).
                    page(params[:page]).per(10)
    end
  end

  def ideas_tag
    set_menu('ideas')
    tag = params[:tag]
    @ideas = Idea.where("published_at < ?", Time.now).
                  tagged_with(tag).
                  order('published_at DESC').
                  includes(:user).
                  page(params[:page]).per(10)
    render :ideas
  end

  # una idea
  def idea
    set_menu('ideas')
    @idea = Idea.where("published_at < ?", Time.now).
                 includes(comments: :user).
                 #friendly.find(params[:id])
                 find(params[:id])
    set_submenu(@idea.category.pluralize)
  end

  #listado de organizaciones
  def organizations
    @organizations = Organization.order('name').
                                  page(params[:page]).per(10)
    set_menu('compartir')
    set_submenu('organizaciones')
  end

  # una organizacion
  def organization
    @organization = Organization.
                                #friendly.find(params[:id])
                                find(params[:id])
    set_menu('compartir')
    set_submenu('organizaciones')
  end

  # listado de alimentos
  def particulares
    @alimentos = Ad.give.available.includes(:user).page(params[:page])
  end


end
