ActiveAdmin.register Organization do
  permit_params :name, :description, :zipcode, :address, :phone, :email, :website, :image

  index do
    selectable_column
    column :id
    #column "Image" do |organization|
     # link_to image_tag(organization.image.url(:thumb)), admin_organization_path(organization)
    #end
    column "Title" do |organization|
      link_to organization.name, content_admin_organization_path(organization)
    end
    column :zipcode
    column :address
    column :phone
    column :email
    column :website
    column :published_at
    column :created_at
    column :updated_at
    actions
  end

show do |organization|
    attributes_table do
      row :id
      row :slug
      row :name
      row :description
      row :zipcode
      row :address
      row :phone
      row :email
      row :website
      #row :image do
       # organization.image? ? image_tag(organization.image.url, height: '100') : content_tag(:span, "No image yet")
      #end
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
      f.input :phone
      f.input :email
      f.input :website
      #f.input :image, :as => :file, :hint => f.article.image_tag(f.object.image.url(:thumb))
      # Will preview the image when the object is edited
    end
    f.actions
  end

end
