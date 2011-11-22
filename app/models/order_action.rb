class OrderAction < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  has_many :order_histories
  has_many :orders, :through => :order_histories

end
