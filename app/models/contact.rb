class Contact

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :email, :message

  validates :email, presence: true
  validates :message, presence: true

  validates_format_of :email, :with => /@/
  validates_length_of :message, :maximum => 1000
  validates_length_of :message, :minimum => 20

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
