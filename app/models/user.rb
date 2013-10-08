class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :avatar, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :gender, :mobile, :dob, :user_type, :country, :state, :city, :address, :zip_code, :pictures_attributes
  # attr_accessible :title, :body
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :mobile
  validates_length_of :mobile, :minimum => 10
  validates_presence_of :city
  validates_presence_of :country
  validates_presence_of :state
  validates_presence_of :address
  validates_presence_of :zip_code
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  has_many :property_details
  
end
