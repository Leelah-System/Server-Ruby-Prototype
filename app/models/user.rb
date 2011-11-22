class User < ActiveRecord::Base

  #===========================================================================#
  #===   ASSOCIATIONS
  #===========================================================================#
  has_many :addresses, :as => :addressable
  has_many :contacts, :as => :contactable

  has_one :basket
  has_many :orders

  has_many :user_histories
  has_and_belongs_to_many :user_roles


  #===========================================================================#
  #===   VALIDATIONS
  #===========================================================================#
  validates_presence_of :first_name, :last_name, :email, :login, :password
  validates_uniqueness_of :login
  validates_length_of :password, :minimum => 4

  #===========================================================================#
  #===   CALLBACKS
  #===========================================================================#
  before_create :init_token, :init_salt

  #===========================================================================#
  #===   PUBLIC
  #===========================================================================#

  # Static method to verify if user can authenticate with login and password
  #
  # Return *user* if can authenticate else *nil*
  def self.authenticate(login, password)
    includes(:user_roles).find_by_login_and_password(login, password)
  end

  # Check if user has admin roles
  def has_admin_roles?
    user_roles.each { |role| return true if role.is_admin_role? }

    false
  end

  def as_json(options={})
    super(
      :include => {
        :user_roles => {
          :except => [:user_id, :user_role_id]
        }
      },
      :except => [:password, :salt, :reference_client]
    )
  end

  #===========================================================================#
  #===   PROTECTED
  #===========================================================================#
  protected

  # Create *token* for new user
  def init_token
    self.token = SecureRandom.hex(64) if self.token.blank?
  end

  # Create *salt* for new user
  def init_salt
    self.salt = SecureRandom.hex(25) if self.salt.blank?
  end



end
