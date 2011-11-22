class Basket < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  belongs_to :user
  has_many :order_lines, :as => :basket_or_order

end
