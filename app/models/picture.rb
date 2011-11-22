class Picture < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  belongs_to :imageable, :polymorphic => true

end
