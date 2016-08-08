class Product < ActiveRecord::Base
  validates :name, presence:true
  validates :stock, numericality: {greater_than_or_equal_to: 0}
  validates_length_of :description, minimum: 5, maximum: 50
  validates_format_of :price, with: /\A\d+(?:\.\d{0,2})?\z/, numericality: {greater_than: 0}

  #use self. because this is a class method, not just a method for a particular instance
  def self.promoted
    where promoted: true
  end

end
