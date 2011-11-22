class Company < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  has_one :address, :as => :addressable
  has_one :contact, :as => :contactable
  has_one :picture, :as => :imageable

  accepts_nested_attributes_for :contact, :address, :picture

  #===========================================================================#
  #===   VALIDATIONS
  #===========================================================================#
  validates_presence_of :name

end
