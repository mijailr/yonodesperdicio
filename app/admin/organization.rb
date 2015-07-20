ActiveAdmin.register Organization do
  permit_params :name, :description, :zipcode, :address, :image

show do |organization|
    attributes_table do
      row :name
      row :description
      row :zipcode
      row :address
      row :image do
        organization.image? ? image_tag(organization.image.url, height: '100') : content_tag(:span, "No image yet")
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :zipcode
      f.input :address
      f.input :image, :as => :file, :hint => f.article.image_tag(f.object.image.url(:thumb))
      # Will preview the image when the object is edited
    end
    f.actions
  end

end
