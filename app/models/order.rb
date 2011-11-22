class Order < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  belongs_to :user
  belongs_to :delivery_address, :class_name => 'Address'

  has_many :order_lines

  belongs_to :order_status
  has_many :order_histories

  accepts_nested_attributes_for :order_lines

  #===========================================================================#
  #===   VALIDATIONS
  #===========================================================================#
  validates_presence_of :user, :reference
  validates_uniqueness_of :reference

  #===========================================================================#
  #===   CALLBACKS
  #===========================================================================#
  before_validation :create_reference

  def create_reference
    self.reference = SecureRandom.random_number(1000000)
  end

  #===========================================================================#
  #===   PUBLIC
  #===========================================================================#

end
