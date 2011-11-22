class OrderLine < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  belongs_to :order
  belongs_to :package_or_product, :polymorphic => true
  #belongs_to :product, :foreign_key => :package_or_product_id

end
