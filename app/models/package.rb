class Package < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  belongs_to :category
  has_and_belongs_to_many :products

  has_many :pictures, :as => :imageable

  has_many :order_lines, :as => :package_or_product

end
