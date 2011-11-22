class Supplier < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  has_many :products

  has_one :address, :as => :addressable
  has_one :contact, :as => :contactable

end
