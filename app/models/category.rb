class Category < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  belongs_to :sup_category, :class_name => 'Category'
  has_many :sub_categories, :class_name => 'Category'

  has_many :products
  has_many :packages

end
