ActiveAdmin.register Idea do

  permit_params :title, :body, :category, :published_at, :user_id, :image

  show do |idea|
    attributes_table do
      row :user
      row :category
      row :title
      row :body
      row :image do
        idea.image? ? image_tag(idea.image.url, height: '100') : content_tag(:span, "No image yet")
      end
      row :published_at
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :category
      f.input :title
      f.input :body
      f.input :image, :as => :file, :hint => f.article.image_tag(f.object.image.url(:thumb))
      # Will preview the image when the object is edited
      f.input :published_at
    end
    f.actions
  end
end
