ActiveAdmin.register Organization do
  permit_params :name, :description, :zipcode, :address
end
