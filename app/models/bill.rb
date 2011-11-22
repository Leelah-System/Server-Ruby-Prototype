class Bill < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  belongs_to :order
  belongs_to :billing_address, :class_name => 'Address'

end
