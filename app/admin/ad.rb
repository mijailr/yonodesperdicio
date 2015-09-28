ActiveAdmin.register Ad do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :status, :title, :user, :body, :grams, :expiration_date, :pick_up_date, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :status
    column "Image" do |ad|
      link_to image_tag(ad.image.url(:thumb)), content_admin_ad_path(ad)
    end
    column :title
    column :grams
    column :user
    column :pick_up_date
    column :expiration_date

    actions
  end


  show do |ad|
    attributes_table do
      row :status
      row :user
      row :title
      row :body
      row :pick_up_date
      row :expiration_date
      row :grams
      row :image do
        ad.image? ? image_tag(ad.image.url, height: '100') : content_tag(:span, "No image yet")
      end
      row :created_at
    end
  end

  filter :user
  filter :pick_up_date
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :status
      f.input :title
      f.input :body      
      f.input :grams
      f.input :pick_up_date
      f.input :expiration_date
      f.input :image, :as => :file, :hint => f.article.image_tag(f.object.image.url(:thumb))
      f.input :created_at
    end
    f.actions
  end
end
