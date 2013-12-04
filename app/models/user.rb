class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :github, :twitter]
  
  USER_TYPE = {:seller => 'Seller', :buyer => 'Buyer'} 
  DEFAULT_USER_IMAGE  = "/assets/default_user_image.png"
  MOBILE_MIN_SIZE = 10
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :gender, :mobile, :dob, :user_type, :country, :state, :city, :address, :zip_code, :pictures_attributes
  attr_accessible :provider, :uid
 
  #validates_presence_of :first_name, :last_name, :mobile, :city, :country, :state, :address, :zip_code
  #validates_length_of :mobile, :minimum => MOBILE_MIN_SIZE
  
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures
  
  has_many :property_details, dependent: :destroy
  
  has_many :buyer_profiles, dependent: :destroy
  
  has_many :agreements, dependent: :destroy
  
  
  def username
    "#{self.first_name} #{self.last_name}" 
  end
  
  def self.find_for_facebook_oauth(provider, uid, first_name, email, signed_in_resource=nil)
    user = User.where(:provider => provider, :uid => uid).first
    unless user
      user = User.create(:first_name => name,
                     :provider => provider,
                     :uid => uid,
                     :email => email,
                     :password => Devise.friendly_token[0,20]
                     )

    end
    return user
  end
  
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
        user = User.create(first_name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
            )
    end
    user
  end
  
  def self.find_for_github_auth(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
        user = User.create(first_name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
            )
    end
    user
  end
  
  def self.find_for_twitter_auth(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
        user = User.create(first_name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
            )
    end
    user
  end
end
