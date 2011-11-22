class Product < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  belongs_to :supplier

  belongs_to :category
  has_and_belongs_to_many :packages
  has_many :order_lines, :as => :package_or_product

  has_many :pictures, :as => :imageable

  #===========================================================================#
  #===   VALIDATIONS
  #===========================================================================#
  validates_presence_of :reference, :name, :price, :stocks
  validates_uniqueness_of :reference

  #===========================================================================#
  #===   CALLBACKS
  #===========================================================================#
  before_validation :create_reference, :create_label

  def create_reference
    self.reference = SecureRandom.random_number(1000000)
  end

  def create_label
    self.label = self.name
  end

end
