class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  USER_TYPE = {:seller => 'Seller', :buyer => 'Buyer'} 
  DEFAULT_USER_IMAGE  = "/assets/default_user_image.png"
  MOBILE_MIN_SIZE = 10
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :gender, :mobile, :dob, :user_type, :country, :state, :city, :address, :zip_code, :pictures_attributes
  # attr_accessible :title, :body
  
  validates_presence_of :first_name, :last_name, :mobile, :city, :country, :state, :address, :zip_code
 
  validates_length_of :mobile, :minimum => MOBILE_MIN_SIZE
  
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures
  
  has_many :property_details, dependent: :destroy
  
  has_many :buyer_profiles, dependent: :destroy
  
  has_many :agreements, dependent: :destroy
  
  def username
    "#{self.first_name} #{self.last_name}" 
  end
end
