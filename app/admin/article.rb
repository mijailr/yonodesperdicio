ActiveAdmin.register Article do

  permit_params :title, :body, :video, :category, :published_at, :image

  # index as: :grid, columns: 5 do |article|
  #   link_to image_tag(article.image.url, height: '100'), admin_article_path(article)
  # end

  index do
    selectable_column
    column :category
    column "Image" do |article|
       link_to image_tag(article.image.url(:thumb)), admin_article_path(article)
    end
    column "Title" do |article|
      link_to article.title, admin_article_path(article)
    end
    column :published_at
    column :created_at
    column :updated_at
    actions
  end

  show do |article|
    attributes_table do
      row :category
      row :title
      row :body
      row :image do
        article.image? ? image_tag(article.image.url, height: '100') : content_tag(:span, "No image yet")
      end
      row :video
      row :published_at
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :category, as: :select, collection: Article::CATEGORIES
      f.input :title
      f.input :body
      f.input :image, :as => :file, :hint => f.article.image_tag(f.object.image.url(:thumb))
      # Will preview the image when the object is edited
      f.input :video
      f.input :published_at
    end
    f.actions
  end
end