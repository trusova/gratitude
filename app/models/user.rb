class User < ActiveRecord::Base

  after_initialize :default_values

def update_with_password(params={}) 
  if params[:password].blank? 
    params.delete(:password) 
    params.delete(:password_confirmation) if 
    params[:password_confirmation].blank? 
  end 
  update_attributes(params) 
end 


  private
    def default_values
      self.reminder ||= 1
    end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :cached_slug, :reminder, :email, :password, :password_confirmation, :remember_me
  has_many :authorizations
  has_many :blessings
  has_many :subdomains, :dependent => :destroy 
  validates :name, :email, :presence => true
  validates_uniqueness_of :email, :case_sensitive => false
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true

end
