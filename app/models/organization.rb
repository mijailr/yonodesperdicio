class Organization < ActiveRecord::Base
  validates :name, :description, :zipcode, :address, presence: true
end
