class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create

    @comment = Comment.new({
      commentable_type: params[:commentable_type],
      commentable_id: params[:id],
      body: params[:body],
      user: current_user
    })

    if @comment.save
      if @comment.commentable_type == 'Ad' && @comment.commentable.user != current_user
        CommentsMailer.create(params[:id], params[:body]).deliver_later
      end
    end

    path = if params[:commentable_type] == 'Ad'
      ad_path(params[:id])
    elsif params[:commentable_type] == 'Idea'
      idea_path(params[:id])
    elsif params[:commentable_type] == 'Article'
      if params[:article_category] == 'noticia'
        noticia_path(params[:id])
      elsif params[:article_category] == 'iniciativa'
        iniciativa_path(params[:id])
      end
    end

    redirect_to(path, notice: t('nlt.comments.flash_ok'))
  end

end
